/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.CategorieDAO;
import DAO.ProductDAO;
import DAO.ShopDAO;
import DAO.ShopProductDAO;
import DAO.UserDAO;
import java.io.File;
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
@WebServlet(urlPatterns = {"/deleteImgServlet"})
public class deleteImgServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String id1 = request.getParameter("id");
            String shop_id1 = request.getParameter("shop_id");
            String type = request.getParameter("type");
            String file_name = request.getParameter("image");
            String shop_file_name = request.getParameter("shop_image");
            String source = request.getParameter("source");

            int id = Integer.parseInt(id1);

            String file_path = null;

            if (type != null) {
                UserDAO.delete(id);

                file_path = "images\\user\\";

                deleteImg(file_name, file_path);

                if (type.equals("Servicer")) {
                    response.sendRedirect("./ap-admin/serviser.jsp");
                } else if (type.equals("Customer")) {
                    response.sendRedirect("./ap-admin/customers.jsp");
                }

            } else if (shop_id1 != null) {
                int shop_id = Integer.parseInt(shop_id1);

                ShopProductDAO.deleteShopProduct(shop_id);

                ShopDAO.delete(shop_id);
                file_path = "images\\shop\\";
                deleteImg(shop_file_name, file_path);

                UserDAO.delete(id);
                file_path = "images\\user\\";
                deleteImg(file_name, file_path);

                response.sendRedirect("./ap-admin/shops.jsp");
            } else if (source.equals("category")) {
                CategorieDAO.delete(id);

                file_path = "images\\category\\";

                deleteImg(file_name, file_path);

                if (request.getParameter("user") != null) {
                    response.sendRedirect("./ap-shopowner/category.jsp");
                } else {
                    response.sendRedirect("./ap-admin/category.jsp");
                }

            } else if (source.equals("product")) {
                ProductDAO.delete(id);
                file_path = "images\\product\\";
                deleteImg(file_name, file_path);

                if (request.getParameter("user") != null) {
                    response.sendRedirect("./ap-shopowner/products.jsp");
                } else {
                    response.sendRedirect("./ap-admin/products.jsp");
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
            Logger.getLogger(deleteImgServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(deleteImgServlet.class.getName()).log(Level.SEVERE, null, ex);
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

    private void deleteImg(String file_name, String file_path) {
        String imgrelpath = this.getServletContext().getRealPath("") + File.separator + file_path;

        imgrelpath = imgrelpath.replace("\\build", "") + file_name;

        new File(imgrelpath).delete();
    }
}
