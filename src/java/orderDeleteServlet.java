/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.CancelOrderDAO;
import DAO.OrederDAO;
import POJO.CancelOrder;
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
@WebServlet(urlPatterns = {"/orderDeleteServlet"})
public class orderDeleteServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            System.out.println("hiii");
            String order_list_id1 = request.getParameter("order_list_id");
            String shop_product_id1 = request.getParameter("shop_product_id");
            String reason = request.getParameter("cancelReson");
            String comment = request.getParameter("message");

            int shop_product_id = Integer.parseInt(shop_product_id1);
            int order_list_id = Integer.parseInt(order_list_id1);
            
            CancelOrder obj = new CancelOrder(order_list_id,shop_product_id,reason,comment);
            
            CancelOrderDAO.insert(obj);
            
            int order_list_status = OrederDAO.getOrderListStatus(order_list_id);
            
            //System.out.println(order_quantity);
            
            if(order_list_status == 0)
            {
                
            }
            
            OrederDAO.deleteOrderList(order_list_id,shop_product_id,order_list_status);
            
            if(shop_product_id == 0 || order_list_status == 0)
            {
                response.sendRedirect("./dashboard_my_orders.jsp");
            }
            else{
                response.sendRedirect("./order_action.jsp?order_list_id="+order_list_id+"&action=delete");
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
            Logger.getLogger(orderDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(orderDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
