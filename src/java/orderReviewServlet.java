/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.OrderReviewDAO;
import POJO.OrderReview;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ankit Chauhan
 */
@WebServlet(urlPatterns = {"/orderReviewServlet"})
public class orderReviewServlet extends HttpServlet {

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
            throws ServletException, IOException, FileNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String user_id1 = request.getParameter("user_id");
            String order_list_id1 = request.getParameter("order_list_id");
            String shop_product_id1 = request.getParameter("shop_product_id");
            String star1 = request.getParameter("star");
            String custmore_name = request.getParameter("custmore_name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
            
            int user_id = Integer.parseInt(user_id1);
            int order_list_id = Integer.parseInt(order_list_id1);
            int shop_product_id = Integer.parseInt(shop_product_id1);
            int star = Integer.parseInt(star1);
            
            OrderReview obj = new OrderReview(user_id,order_list_id,shop_product_id,star,custmore_name,email,message);
            if(request.getParameter("action") == null)
            {
                OrderReviewDAO.insert(obj);
                
            }
            else
            {
                OrderReviewDAO.update(obj);
            }
            response.sendRedirect("./order_action.jsp?order_list_id="+order_list_id+"&action=review");
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
            throws ServletException, IOException, FileNotFoundException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(orderReviewServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            throws ServletException, IOException, FileNotFoundException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(orderReviewServlet.class.getName()).log(Level.SEVERE, null, ex);
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
