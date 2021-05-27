/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.CartDAO;
import DAO.DeliveryDetailDAO;
import DAO.OrderDetailDAO;
import DAO.OrederDAO;
import DAO.ShopProductDAO;
import POJO.DeliveryDetail;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ankit Chauhan
 */
@WebServlet(urlPatterns = {"/deliveryDetailServlet"})
public class deliveryDetailServlet extends HttpServlet {

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
            System.out.println("Start1");
            String user_id1 = request.getParameter("user_id");
            String custmore_name = request.getParameter("custmore_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String alt_phone = request.getParameter("alt_phone");
            String delivery_address_id1 = request.getParameter("delivery_address_id");

            String delivery_time1 = request.getParameter("delivery_time");
            String paymentmethod = request.getParameter("paymentmethod");

            int user_id = Integer.parseInt(user_id1);
            int delivery_address_id = Integer.parseInt(delivery_address_id1);
            int delivery_time = Integer.parseInt(delivery_time1);

            int order_id = OrederDAO.getOrderId();

            DeliveryDetail obj = new DeliveryDetail(order_id, custmore_name, email, phone, alt_phone, delivery_address_id, delivery_time, paymentmethod);
            DeliveryDetailDAO.insert(obj);

            OrderDetailDAO.insert(order_id, user_id);

            OrederDAO.insert(user_id, order_id);

            ShopProductDAO.StockChangeDecrease(user_id);

            CartDAO.deleteAllCartUser(user_id);
            
            response.sendRedirect("order_bill.jsp?order_id=" + order_id);

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
            Logger.getLogger(deliveryDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(deliveryDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
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
