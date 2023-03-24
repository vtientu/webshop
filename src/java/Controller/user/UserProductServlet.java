/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.user;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author Dell
 */
@WebServlet(name="UserProductServlet", urlPatterns={"/product"})
public class UserProductServlet extends HttpServlet {
   
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
            out.println("<title>Servlet UserProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProductServlet at " + request.getContextPath () + "</h1>");
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
        
        String id_raw = request.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(id_raw);
            request.setAttribute("product", pd.getProductbyProductID(id));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("views/user/review-product.jsp").forward(request, response);
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
        String url = request.getRequestURL() + "?" + request.getQueryString();
        response.sendRedirect(url);
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
