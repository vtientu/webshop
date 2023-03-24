/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.user;

import dal.CategoryDAO;
import dal.ProducerDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Cart;
import model.Item;
import model.Producer;
import model.Product;

/**
 *
 * @author Dell
 */
@WebServlet(name = "UserListServlet", urlPatterns = {"/userList"})
public class UserListServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserListServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        ProducerDAO pcd = new ProducerDAO();

        List<Product> listP = pd.getAllProduct();
        Cookie arr[] = request.getCookies();
        String txt = "";

        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt = txt + item.getValue();
                }
            }
        }

        Cart cart = new Cart(txt, listP);
        request.setAttribute("cart", cart);

        String action = request.getParameter("action");
        if (action != null && action.equalsIgnoreCase("delete")) {
            String id_raw = request.getParameter("id");
            try {
                int id = Integer.parseInt(id_raw);
                cart.removeItem(id);

                List<Item> items = cart.getItems();
                txt = "";

                if (items.size() > 0) {
                    txt = items.get(0).getProduct().getProductID() + "_"
                            + items.get(0).getQuantity();
                    if (items.size() > 1) {
                        for (int i = 1; i < items.size(); i++) {
                            txt += "-" + items.get(i).getProduct().getProductID() + "_"
                                    + items.get(i).getQuantity();
                        }
                    }

                }

                Cookie c = new Cookie("cart", txt);
                c.setMaxAge(7 * 24 * 60 * 60);
                response.addCookie(c);
                response.sendRedirect("userList");
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        } else if (action == null) {
            String cid_raw = request.getParameter("cid");
            if (cid_raw != null) {
                int cid;
                try {
                    cid = Integer.parseInt(cid_raw);
                    listP = pd.getProductByCategoryID(cid);
                    request.setAttribute("cid", cid);
                } catch (NumberFormatException e) {
                    System.out.println(e);
                    cid = 0;
                }
                
            }
            List<Producer> listProducer = pcd.getAll();

            String[] pid_raw = request.getParameterValues("pid");

            if (pid_raw != null) {
                int[] pid = new int[pid_raw.length];
                for (int i = 0; i < pid.length; i++) {
                    pid[i] = Integer.parseInt(pid_raw[i]);
                }

                listP = pd.getProductByProducerID(pid);

                boolean[] producerCheck = new boolean[listProducer.size()];
                for (int i = 0; i < producerCheck.length; i++) {
                    if (isProducer(listProducer.get(i).getProducerID(), pid)) {
                        producerCheck[i] = true;
                    } else {
                        producerCheck[i] = false;
                    }
                }
                request.setAttribute("producerCheck", producerCheck);

                String producerS = "";
                for (int i = 0; i < pid.length; i++) {
                    if (i == pid.length - 1) {
                        producerS += pid[i];
                    } else {
                        producerS += pid[i] + "&pid=";
                    }
                }
                request.setAttribute("producerS", producerS);
            }
            
            String search = request.getParameter("search");
            if(search != null){
                listP = pd.getProductBySearch(search);
                request.setAttribute("search", search);
            }
            
            String sort = request.getParameter("sort");
            if(sort != null){
                if(sort.equalsIgnoreCase("sapxeptheoname")){
                    Collections.sort(listP, (Product o1, Product o2) -> {
                        if(o1.getProductName().compareToIgnoreCase(o2.getProductName()) > 0){
                            return 1;
                        }
                        return -1;
                    });
                }
                if(sort.equalsIgnoreCase("sapxeptheogia")){
                    Collections.sort(listP, (Product o1, Product o2) -> {
                        if(o1.getPrice() > o2.getPrice()){
                            return 1;
                        }
                        return -1;
                    });
                }
                request.setAttribute("sort", sort);
            }

            String numberPerPage_raw = request.getParameter("numberPerPage");

            int page, numberPerPage = 9;

            if (numberPerPage_raw != null) {
                numberPerPage = Integer.parseInt(numberPerPage_raw);
            }
            String xpage = request.getParameter("page");

            int size = listP.size();    // số lượng sản phẩm % số lượng sản phẩm trên 1 trang nếu nó chia hết thì => lấy nó còn nếu không thì cộng thêm 1 
            int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }

            int start, end;
            start = (page - 1) * numberPerPage;
            end = Math.min(page * numberPerPage, size);
            List<Product> listByPage = pd.getListByPage(listP, start, end);

            request.setAttribute("page", page);
            request.setAttribute("numberOfPage", numberOfPage);
            request.setAttribute("numberPerPage", numberPerPage);
            request.setAttribute("listByPage", listByPage);
            request.setAttribute("start", start);
            request.setAttribute("end", end);
            request.setAttribute("producer", pcd.getAll());
            request.setAttribute("category", cd.getCategoryID());
            request.setAttribute("totalProduct", listP.size());
            request.getRequestDispatcher("views/user/list-product.jsp").forward(request, response);
        }

    }

    private boolean isProducer(int producer, int[] list) {
        if (list == null) {
            return false;
        } else {
            for (int i = 0; i < list.length; i++) {
                if (list[i] == producer) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productID_raw = request.getParameter("id");
        String quantity = request.getParameter("quantity");

        Cookie arr[] = request.getCookies();

        String txt = "";
        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();
                    item.setMaxAge(0);
                    response.addCookie(item);
                }
            }
        }

        int productID;
        try {
            productID = Integer.parseInt(productID_raw);

        } catch (NumberFormatException e) {
            System.out.println(e);
            productID = 0;
        }
        ProductDAO pd = new ProductDAO();
        List<Product> listP = pd.getAllProduct();

        Cart cartCheck = new Cart(txt, listP);
        Product productCheck = pd.getProductbyProductID(productID);

        if (txt.isEmpty()) {
            txt = productID + "_" + quantity;
        } else if (cartCheck.getItemByID(productCheck.getProductID()) == null) {
            if (txt.isEmpty()) {
                txt = productID + "_" + quantity;
            } else {
                txt = txt + "-" + productID + "_" + quantity;
            }
        } else if (cartCheck.getItemByID(productID).getQuantity() >= productCheck.getQuantity()) {
            // không cộng vào cart nữa
        } else {
            txt = txt + "-" + productID + "_" + quantity;
        }

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(7 * 24 * 60 * 60);
        response.addCookie(c);
        String url = "userList?" + request.getQueryString();
        response.sendRedirect(url);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
