/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.ShopDAO;
import POJO.Shop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import javax.servlet.http.Part;

/**
 *
 * @author Ankit Chauhan
 */
@WebServlet(urlPatterns = {"/editShopServlet"})
@MultipartConfig
public class editShopServlet extends HttpServlet {

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

            String shop_id1 = request.getParameter("shop_id");
            int shop_id = Integer.parseInt(shop_id1);

            String shop_owner_id1 = request.getParameter("shop_owner_id");
            int shop_owner_id = Integer.parseInt(shop_owner_id1);

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            String area = request.getParameter("area");
            String city = request.getParameter("city");
            String location = area + ", " + city;

            String opening_time = request.getParameter("opening_time");
            String closing_time = request.getParameter("closing_time");
            String status = request.getParameter("status");
            String address = request.getParameter("address");

            String file_name = request.getParameter("file_name");

            String image = null;

            if (request.getPart("image") != null && !(request.getPart("image").getSubmittedFileName().isEmpty())) {
                Part part = request.getPart("image");

                image = name + "." + (((part.getContentType()).split("/")[1]).split("\\+"))[0];

                Shop obj = new Shop(shop_id, shop_owner_id, name, email, phone, location, opening_time, closing_time, status, address, image);

                ShopDAO.update(obj);

                deleteImg(file_name);

                uploadImg(part, image);

            } else if (!(file_name.equals("null"))) {
                int last = file_name.split("\\.").length - 1;

                image = name + "." + (file_name.split("\\.")[last]);

                Shop obj = new Shop(shop_id, shop_owner_id, name, email, phone, location, opening_time, closing_time, status, address, image);

                ShopDAO.update(obj);

                renameImg(file_name, image);

            } else {

                Shop obj = new Shop(shop_id, shop_owner_id, name, email, phone, location, opening_time, closing_time, status, address, image);

                ShopDAO.update(obj);
            }

            if (request.getParameter("user") != null) {
                response.sendRedirect("./ap-shopowner/shops.jsp");
            } else {
                response.sendRedirect("./ap-admin/shops.jsp");
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
            Logger.getLogger(editShopServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editShopServlet.class.getName()).log(Level.SEVERE, null, ex);
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

    private String uploadImg(Part part, String filename) throws FileNotFoundException, IOException {

        InputStream in = null;

        if (part != null) {
            in = part.getInputStream();
        }

        // find path of images uploade folder
        String imgrelpath = this.getServletContext().getRealPath("") + File.separator + "images\\shop\\";

        if (!new File(imgrelpath).exists()) {
            return "Path Not Found!";
        }

        imgrelpath = imgrelpath.replace("\\build", "") + filename;

        // upload file into given path
        OutputStream ou = new FileOutputStream(imgrelpath);//imgrelpath+"DB1.png");
        byte[] buf = new byte[5024];
        int len;

        while ((len = in.read(buf)) > 0) {
            ou.write(buf, 0, len);
        }
        in.close();
        ou.close();

        return imgrelpath;
    }

    private void deleteImg(String file_name) {
        String imgrelpath = this.getServletContext().getRealPath("") + File.separator + "images\\shop\\";

        imgrelpath = imgrelpath.replace("\\build", "") + file_name;

        new File(imgrelpath).delete();
    }

    private void renameImg(String old_name, String new_name) {
        String imgrelpath = this.getServletContext().getRealPath("") + File.separator + "images\\shop\\";

        String old_imgrelpath = imgrelpath.replace("\\build", "") + old_name;

        String new_imgrelpath = imgrelpath.replace("\\build", "") + new_name;

        File file1 = new File(old_imgrelpath);

        File file2 = new File(new_imgrelpath);

        file1.renameTo(file2);

    }
}
