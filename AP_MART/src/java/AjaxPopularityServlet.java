/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.CartDAO;
import DAO.ShopProductDAO;
import DAO.WishlistDAO;
import POJO.Cart;
import POJO.ShopProduct;
import POJO.Wishlist;
import Util.ShopStatus;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Parth
 */
@WebServlet(urlPatterns = {"/AjaxPopularityServlet"})
public class AjaxPopularityServlet extends HttpServlet {

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
            
            List<ShopProduct> list = null;
            String shop_id1 = request.getParameter("shop_id");
            String categories_id1 = request.getParameter("categories_id");
            String action = request.getParameter("action");
            String user_id1 = request.getParameter("user_id");
            String cart_qty_hg = request.getParameter("cart_qty_hg");

            int user_id = Integer.parseInt(user_id1);

            String title = null;
            String popularity = null;
            String result = "";

            if (action.equals("0")) {
                popularity = "ORDER BY RAND()";
            } else if (action.equals("1")) {
                popularity = "ORDER BY shop_product.discount_mrp ASC";
            } else if (action.equals("2")) {
                popularity = "ORDER BY shop_product.discount_mrp DESC";
            } else if (action.equals("3")) {
                popularity = "ORDER BY ROUND(100-shop_product.discount_mrp/shop_product.mrp*100) DESC";
            } else if (action.equals("4")) {
                popularity = "ORDER BY ROUND(100-shop_product.discount_mrp/shop_product.mrp*100) ASC";
            }

            if (!categories_id1.equals("null")) {
                list = ShopProductDAO.viewCategoriesDataProduct(Integer.parseInt(categories_id1), popularity);
                title = request.getParameter("categories_name");
            } else if (!shop_id1.equals("null")) {
                list = ShopProductDAO.viewShopsDataProduct(Integer.parseInt(shop_id1), popularity);
                title = request.getParameter("shop_name");
            } else {
                list = ShopProductDAO.viewAllDataProducts(popularity);
                title = "All Products";
            }

            for (ShopProduct e : list) {

                String status1 = ShopStatus.isOpen(e.getOpening_time().trim(), e.getClosing_time().trim());
                String style1 = "";

                if (status1 == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {
                    style1 = "filter: grayscale(100%);";
                }

                Wishlist wishlist_product = WishlistDAO.getWishlistProduct(user_id, e.getShop_product_id());
                String class1 = "";

                if (user_id != 0 && (wishlist_product.getShop_product_id() == e.getShop_product_id())) {
                    class1 = "like-icon liked";
                } else {
                    class1 = "like-icon";
                }

                String status2;

                if (e.getQuantity() == 0) {
                    status2 = "<p><span>Unavailable ( Out Of Stock )</span></p>";
                } else {
                    status2 = "<p><span>Available ( In Stock )</span></p>";
                }

                Cart cart_product = CartDAO.getCartProduct(user_id, e.getShop_product_id());

                String style2 = "";
                if (status1 == "Closed" || e.getShop_status().equals("Closed") || e.getQuantity() == 0) {
                    style2 = "pointer - events:none;";
                }

                int value1;
                if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() <= e.getQuantity())) {
                    value1 = cart_product.getQuantity();
                } else if (user_id != 0 && cart_product.getQuantity() != 0 && (cart_product.getQuantity() > e.getQuantity())) {
                    value1 = e.getQuantity();
                    cart_qty_hg = "yes";
                } else {
                    value1 = 1;
                }

                String class2;
                if (user_id != 0 && (cart_product.getShop_product_id() == e.getShop_product_id())) {
                    class2 = "cart-icon clicked";
                } else {
                    class2 = "cart-icon";
                }

                result = result + "<div class='col-lg-3 col-md-6' id='clear'  style='"+style1+"'>\n"
                        + "                                   <div class='product-item mb-30'>\n"
                        + "                                    <a href='single_product_view.jsp?shop_product_id="+e.getShop_product_id()+"' class='product-img'>\n"
                        + "                                        <img src='images/product/"+e.getProduct_image()+"'>\n"
                        + "                                        <div class='product-absolute-options'>\n"
                        + "                                            <span class='offer-badge-1'>"+e.getDiscount()+"% OFF</span>\n"
                        + "                                            <span class='"+class1+"'  title='wishlist' onclick='wishlist(this)' user_id='"+user_id +"' shop_product_id='"+e.getShop_product_id()+"'</span>\n"
                        + "                                        </div>\n"
                        + "                                    </a>\n"
                        + "                                    <div class='product-text-dt'>\n"
                        +                                           status2
                        + "                                        <p><b>"+e.getShop_name()+"</b></p>\n"
                        + "                                        <h4>"+e.getProduct_name()+"</h4>\n"
                        + "                                        <div class='product-price'>₹<font>"+e.getDiscount_mrp()+"</font> / <small id='weight'>"+e.getNet_weigth()+"</small> <small id='unit'>"+e.getUnit()+"</small><span>₹"+e.getMrp()+"</span></div>\n"
                        + "                                        <div class='qty-cart'>\n"
                        + "                                            <div class='quantity buttons_added' style='"+style2+"'>\n"
                        + "                                                <input type='button'  onclick='cartValueUpdate(this, \"min\")' value='-' class='minus minus-btn'>\n"
                        + "                                                <input type='number' step='1' min='1' max='"+e.getQuantity()+"' name='quantity' value='"+value1+"' class='input-text qty text'/>\n"
                        + "                                                 <input type='button' onclick='cartValueUpdate(this, \"max\")' value='+' class='plus plus-btn'>\n"
                        + "                                            </div>\n"
                        + "                                            <span class='"+class2+"' style='"+style2+"' onclick='cart(this)' user_id='"+user_id+"' shop_product_id='"+e.getShop_product_id()+"' title='Cart'><i class='uil uil-shopping-cart-alt'></i></span>\n"
                        + "                                        </div>\n"
                        + "                                    </div>\n"
                        + "                               </div>\n"
                        + "                           </div>";
            }
            out.println(result);
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
            Logger.getLogger(AjaxPopularityServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AjaxPopularityServlet.class.getName()).log(Level.SEVERE, null, ex);
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
