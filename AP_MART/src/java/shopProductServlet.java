/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.ShopProductDAO;
import POJO.ShopProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ankit Chauhan
 */
@WebServlet(urlPatterns = {"/shopProductServlet"})
@MultipartConfig
public class shopProductServlet extends HttpServlet {

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
            
            String shop_product_id1 = request.getParameter("shop_product_id");
            String shop_id1 = request.getParameter("shop_id");
            String product_id1 = request.getParameter("product_id");
            String mrp1 = request.getParameter("mrp");
            String discount_mrp1 = request.getParameter("discount_mrp");
            String quantity1 = request.getParameter("quantity");
            String net_weigth1 = request.getParameter("net_weigth");
            String unit = request.getParameter("unit");

            
            int shop_id = Integer.parseInt(shop_id1);
            
            out.println(shop_product_id1);
            
            //add shop product
            if(shop_product_id1.equals("0"))
            {
                int product_id = Integer.parseInt(product_id1);
                int mrp = Integer.parseInt(mrp1);
                int discount_mrp = Integer.parseInt(discount_mrp1);
                int quantity = Integer.parseInt(quantity1);
                int net_weigth = Integer.parseInt(net_weigth1);

                ShopProduct obj = new ShopProduct(shop_id,product_id,mrp,discount_mrp,net_weigth,unit,quantity);

                ShopProductDAO.insert(obj);
            }
            //delete shop product
            else if(mrp1 != null)
            {
                int shop_product_id = Integer.parseInt(shop_product_id1);
                int product_id = Integer.parseInt(product_id1);
                int mrp = Integer.parseInt(mrp1);
                int discount_mrp = Integer.parseInt(discount_mrp1);
                int quantity = Integer.parseInt(quantity1);
                int net_weigth = Integer.parseInt(net_weigth1);
                
                ShopProduct obj = new ShopProduct(shop_product_id,shop_id,product_id,mrp,discount_mrp,net_weigth,unit,quantity);
                ShopProductDAO.update(obj);
                
            }
            //edit shop product
            else
            {
                int shop_product_id = Integer.parseInt(shop_product_id1);
                ShopProductDAO.delete(shop_product_id);
            }
            
            
            if (request.getParameter("user") != null) {
                response.sendRedirect("./ap-shopowner/shop_products.jsp?shop_id="+shop_id);
            } else {
                response.sendRedirect("./ap-admin/shop_products.jsp?shop_id="+shop_id);
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
            Logger.getLogger(shopProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(shopProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
