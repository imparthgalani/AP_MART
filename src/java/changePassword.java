/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Parth
 */
@WebServlet(urlPatterns = {"/changePassword"})
public class changePassword extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String Email = request.getParameter("email");
            String OldPassword = request.getParameter("OldPassword");
            String Newpass = request.getParameter("passwordnew");
            String conpass = request.getParameter("passwordcon");
            String connurl = "jdbc:mysql://localhost:3306/ap_mart";
            Connection con = null;
            
            String pass = "";
            String email = "";
            
            int user_id = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(connurl, "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from user where email='" + Email + "'");
                while (rs.next()) {
                    user_id = rs.getInt(1);
                    email = rs.getString(3);
                    pass = rs.getString(5);
                }
                System.out.println(user_id + " " + pass);
                if (email.equals(Email) && pass.equals(OldPassword)) {
                    Statement st1 = con.createStatement();
                    int i = st1.executeUpdate("update user set password='" + Newpass + "' where user_id='" + user_id + "'");
                    request.setAttribute("msg", "Password Changed SuccessFully.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/sign_in.jsp");
                    requestDispatcher.forward(request, response);
                    st1.close();
                    con.close();
                } else if(email.equals(Email) && !(pass.equals(OldPassword))) {
                    request.setAttribute("msg", "Your Old Password Is Not Match.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/change_password.jsp");
                    requestDispatcher.forward(request, response);
                }else{
                    request.setAttribute("msg", "Invalid Email & Password.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/change_password.jsp");
                    requestDispatcher.forward(request, response);
                }
            } catch (Exception e) {
                out.println(e);
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
