/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ControllerAdmin;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import model.Account;

/**
 *
 * @author Dell
 */
@MultipartConfig
@WebServlet(name = "AdminProfileServlet", urlPatterns = {"/adminProfile"})
public class AdminProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProfileServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("views/admin/profile-admin.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
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

        // lấy ra file ảnh đã chọn
        if (file != null) {
            String imageFileName = file.getSubmittedFileName();
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
            
            if (imageFileName != null && !imageFileName.equals("")) {
            a.getPro().setAvatar("userFE/images/" + imageFileName);
        }
        }

        
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
        
        if (session.getAttribute("account") != null) {
            session.removeAttribute("account");
        }

        session.setAttribute("account", a);
        AccountDAO acc = new AccountDAO();
        acc.changeProfile(a);
        response.sendRedirect("adminHome");
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
