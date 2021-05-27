/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Product;
import com.mysql.jdbc.Connection;
import java.io.FileNotFoundException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ankit Chauhan
 */
public class ProductDAO {

    public static Connection getConnection() throws SQLException {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root";
            con = (Connection) DriverManager.getConnection(mysqlURL);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }

    public static void insert(Product obj) throws FileNotFoundException, SQLException {
        
        Connection con = getConnection();
        try {
            String sql = "INSERT INTO product (category_id, name, description, image) " + "VALUES (?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getCategory_id());
            st.setString(2, obj.getName());
            st.setString(3, obj.getDescription());
            st.setString(4, obj.getImage());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        }
        finally
         {
             con.close();
         }
        //Method Ends Here
    }

    public static List<Product> viewData() throws SQLException {
        List<Product> list = new ArrayList<Product>();
        Connection con = getConnection();
        try {
            String sql = "SELECT product.product_id, product.name, product.description, product.image, categories.name FROM product JOIN categories ON categories.categories_id = product.category_id";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product obj = new Product();

                obj.setProduct_id(rs.getInt(1));
                obj.setName(rs.getString(2));
                obj.setDescription(rs.getString(3));
                obj.setImage(rs.getString(4));
                obj.setCategory_name(rs.getString(5));

                list.add(obj);
            }
        } catch (SQLException e) {
        }
        finally
         {
             con.close();
         }

        return list;
    }

    public static Product viewData(int product_id) throws SQLException {

        Product obj = new Product();

        Connection con = getConnection();
        try {
            String sql = "select * from product where product_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                obj.setProduct_id(rs.getInt(1));
                obj.setCategory_id(rs.getInt(2));
                obj.setName(rs.getString(3));
                obj.setDescription(rs.getString(4));
                obj.setImage(rs.getString(5));
            }
        } catch (SQLException e) {
        }
        finally
         {
             con.close();
         }

        return obj;
    }

    public static void delete(int product_id) throws SQLException {
        Connection con = getConnection();
        
        try {
            String sql = "delete from product where product_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, product_id);

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        }
        finally
         {
             con.close();
         }
    }

    public static void update(Product obj) throws FileNotFoundException, SQLException {
        
        Connection con = getConnection();
        try {
            String sql = "update product set category_id=?, name=?, description=?, image=? where product_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getCategory_id());
            st.setString(2, obj.getName());
            st.setString(3, obj.getDescription());
            st.setString(4, obj.getImage());
            st.setInt(5, obj.getProduct_id());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        }
        finally
         {
             con.close();
         }
        //Method Ends Here
    }

    public static List<Product> getByCategory(int cat_id) throws SQLException {
          List<Product> list = new ArrayList<Product>();

          Connection con = getConnection();
        try {
            String sql = "SELECT product_id, name FROM product WHERE category_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cat_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product obj = new Product();

               obj.setProduct_id(rs.getInt(1));
               obj.setName(rs.getString(2));
                
              
                list.add(obj);
            }
        } catch (SQLException e) {
        }
        finally
        {
             con.close();
        }

        return list;
    }
}
