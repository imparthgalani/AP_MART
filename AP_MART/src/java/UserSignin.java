/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.UserDAO;
import POJO.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author parth
 */
@WebServlet(urlPatterns = {"/UserSignin"})
public class UserSignin extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
         

            if (!email.equals(null) && !password.equals(null)) {

                int user_id = UserDAO.getUserId(email);
                User user1;
                user1 = UserDAO.viewData(user_id);
                
                //String Username = user1.getFull_name();
                //out.print(Username);
                //out.println(user1);;
                
                //out.println(user.getPassword());
                
                if (user_id == 0) {
                    
                    request.setAttribute("msg", "Username and Password Invalid. Please try again.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/sign_in.jsp");
                    requestDispatcher.forward(request, response);

                } 
                else if(user1 != null && !password.equals(user1.getPassword()))
                {
                    request.setAttribute("msg", "Password Invalid. Please try again.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/sign_in.jsp");
                    requestDispatcher.forward(request, response);
                }
                else 
                {
                    if (request.getParameter("remember") != null)
                    {

                        String remember = request.getParameter("remember");
                        //System.out.println("remember : " + remember);

                        Cookie cUserName = new Cookie("cookuser", email.trim());
                        Cookie cPassword = new Cookie("cookpass", password.trim());
                        Cookie cRemember = new Cookie("cookrem", remember.trim());

                        cUserName.setMaxAge(60 * 60 * 24 * 7); // 2 Days -> cUserName.setMaxAge(60 * 60 * 24 * 2);
                        cPassword.setMaxAge(60 * 60 * 24 * 7); // 1 Minute 60 Seconds -> cUserName.setMaxAge(1 * 60);
                        cRemember.setMaxAge(60 * 60 * 24 * 7);

                        response.addCookie(cUserName);
                        response.addCookie(cPassword);
                        response.addCookie(cRemember);

                    }
                    
                    
                    
                    

                    if (user1.getType().equals("Customer")) 
                    {
                        HttpSession session = request.getSession();
                        session.setAttribute("customer", user1.getUser_id());
            
                        response.sendRedirect("index.jsp");
                    } else if (user1.getType().equals("admin")) {
                        
                        HttpSession session = request.getSession();
                        session.setAttribute("admin", user1.getUser_id());
                        
                        response.sendRedirect("./ap-admin");

                    } else if (user1.getType().equals("Servicer")) {
                        HttpSession session = request.getSession();
                        session.setAttribute("Servicer", user1.getUser_id());
                        
                        response.sendRedirect("./ap-serviser");

                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("shop_owner", user1.getUser_id());
                        
                        response.sendRedirect("./ap-shopowner");

                    }
                }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserSignin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserSignin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
