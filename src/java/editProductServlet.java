/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.CategorieDAO;
import DAO.ProductDAO;
import POJO.Categorie;
import POJO.Product;
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
@WebServlet(urlPatterns = {"/editProductServlet"})
@MultipartConfig
public class editProductServlet extends HttpServlet {

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

            String id1 = request.getParameter("id");
            int product_id = Integer.parseInt(id1);

            String file_name = request.getParameter("file_name");

            String name = request.getParameter("name");
            String description = request.getParameter("description");

            String id2 = request.getParameter("category_id");
            int category_id = Integer.parseInt(id2);

            String image;

            if (request.getPart("image") != null && !(request.getPart("image").getSubmittedFileName().isEmpty())) {
                Part part = request.getPart("image");

                image = name + "." + (((part.getContentType()).split("/")[1]).split("\\+"))[0];

                Product obj = new Product(product_id, category_id, name, description, image);

                ProductDAO.update(obj);

                deleteImg(file_name);

                uploadImg(part, image);
            } else {
                int last = file_name.split("\\.").length - 1;

                image = name + "." + (file_name.split("\\.")[last]);

                Product obj = new Product(product_id, category_id, name, description, image);

                ProductDAO.update(obj);

                renameImg(file_name, image);
            }
            if (request.getParameter("user") != null) {
                response.sendRedirect("./ap-shopowner/products.jsp");
            } else {
                response.sendRedirect("./ap-admin/products.jsp");
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
            Logger.getLogger(editProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        String imgrelpath = this.getServletContext().getRealPath("") + File.separator + "images\\product\\";

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
        String imgrelpath = this.getServletContext().getRealPath("") + File.separator + "images\\product\\";

        imgrelpath = imgrelpath.replace("\\build", "") + file_name;

        new File(imgrelpath).delete();
    }

    private void renameImg(String old_name, String new_name) {
        String imgrelpath = this.getServletContext().getRealPath("") + File.separator + "images\\product\\";

        String old_imgrelpath = imgrelpath.replace("\\build", "") + old_name;

        String new_imgrelpath = imgrelpath.replace("\\build", "") + new_name;

        File file1 = new File(old_imgrelpath);

        File file2 = new File(new_imgrelpath);

        file1.renameTo(file2);

    }
}
