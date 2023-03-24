/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ControllerAdmin;

import dal.CategoryDAO;
import dal.ProducerDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;
import model.Category;
import model.Producer;
import model.Product;

/**
 *
 * @author Dell
 */
@MultipartConfig
@WebServlet(name = "AddProduct", urlPatterns = {"/addProduct"})
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("views/admin/add-product.jsp").forward(request, response);
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
        String productName = request.getParameter("productName");
        String categoryID_raw = request.getParameter("categoryID");
        String producerID_raw = request.getParameter("producerID");
        String meters = request.getParameter("meters");
        String Color = request.getParameter("Color");
        String Wattage = request.getParameter("Wattage");
        String Chip = request.getParameter("Chip");
        String nguondien = request.getParameter("nguondien");
        String nhietdo = request.getParameter("nhietdo");
        String loiday_raw = request.getParameter("loiday");
        String kichthuoc = request.getParameter("kichthuoc");
        String tuoitho = request.getParameter("tuoitho");
        String dienap = request.getParameter("dienap");
        String chiutai = request.getParameter("chiutai");
        String baohanh_raw = request.getParameter("baohanh");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        int categoryID = 0, producerID = 0, quantity = 0, baohanh = 0, loiday = 0;
        double price;

        
        
        Part file = request.getPart("image");

        String imageFileName = file.getSubmittedFileName(); // lấy ra file ảnh đã chọn

        System.out.println("selected image file name : " + imageFileName);

        String uploadPath = "D:/MyProject/projectbyDuc/web/userFE/images/products/" + imageFileName;

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
        try {
            categoryID = Integer.parseInt(categoryID_raw);
            producerID = Integer.parseInt(producerID_raw);
            quantity = Integer.parseInt(quantity_raw);
            price = Double.parseDouble(price_raw);
            baohanh = Integer.parseInt(baohanh_raw);
            loiday = Integer.parseInt(loiday_raw);

            CategoryDAO cd = new CategoryDAO();
            ProducerDAO pcd = new ProducerDAO();
            ProductDAO pd = new ProductDAO();
            Category c = cd.getCategoryIDByCategory(categoryID);
            Producer prod = pcd.getProducerByID(producerID);
            
            Product p = new Product(pd.lastProductID() + 1, productName, price, quantity, meters, Color, Wattage, Chip, nguondien, nhietdo, loiday
                    , kichthuoc, tuoitho, dienap, chiutai, "userFE/images/products/"+imageFileName, baohanh, getCurrentDate(), c, prod);
            
            pd.insert(p);
            
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        response.sendRedirect("productList");

    }
    
    public Date getCurrentDate() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
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
