/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.user;

import dal.AccountDAO;
import dal.CategoryDAO;
import dal.ProducerDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Dell
 */
@MultipartConfig
@WebServlet(name="UserProfileServlet", urlPatterns={"/userProfile"})
public class UserProfileServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserProfileServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
                            + items.get(0).getQuantity() ;
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
                response.sendRedirect("userProfile");
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        } else if (action == null) {
            request.getRequestDispatcher("views/user/profile-user.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String gender_raw = request.getParameter("gender");
        int gender;
        try {
            gender = Integer.parseInt(gender_raw);
        } catch (NumberFormatException e) {
            gender = -1;
            System.out.println(e + "gender");
        }
        
        Part file = request.getPart("avatar");

        String imageFileName = file.getSubmittedFileName(); // lấy ra file ảnh đã chọn

        System.out.println("selected image file name : " + imageFileName);

        String uploadPath = "D:/MyProject/project/web/userFE/images/" + imageFileName; 

        System.out.println("UploadPath: " + uploadPath);
        try {   
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (IOException e) {
            System.out.println(e);
        }
        
        HttpSession session = request.getSession();
        Account a = (Account)session.getAttribute("account");
        if (!firstName.equals(a.getPro().getFirstName()) && firstName != null) {
            a.getPro().setFirstName(firstName);
        }
        if (!lastName.equals(a.getPro().getLastName()) && lastName != null) {
            a.getPro().setLastName(lastName);
        }
        if (!country.equals(a.getPro().getCountry()) && country != null) {
            a.getPro().setCountry(country);
        }
        if (!address.equals(a.getPro().getAddress()) && address != null) {
            a.getPro().setAddress(address);
        }
        if (Date.valueOf(birthday) != a.getPro().getBirthday() && birthday != null) {
            a.getPro().setBirthday(Date.valueOf(birthday));
        }
        if (!phone.equals(a.getPro().getPhone()) && phone != null) {
            a.getPro().setPhone(phone);
        }
        if (gender != a.getPro().getGender() && gender != -1) {
            a.getPro().setGender(gender);
        }
        if (!email.equals(a.getEmail()) && email != null) {
            a.setEmail(email);
        }
        if(imageFileName != null && !imageFileName.equals("")){
            a.getPro().setAvatar("userFE/images/" +imageFileName);
        }
        if (session.getAttribute("account")!=null) {
            session.removeAttribute("account");
        }
        
        session.setAttribute("account", a);
        AccountDAO acc = new AccountDAO();
        acc.changeProfile(a);
        response.sendRedirect("userHome");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
