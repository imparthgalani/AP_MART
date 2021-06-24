/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Cart;
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
public class CartDAO {

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

    public static void insert(Cart obj) throws FileNotFoundException, SQLException {

        Connection con = getConnection();

        try {
            String sql = "INSERT INTO cart (user_id,shop_product_id,quantity) " + "VALUES (?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getUser_id());
            st.setInt(2, obj.getShop_product_id());
            st.setInt(3, obj.getQuantity());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }

    public static int count(int user_id) throws FileNotFoundException, SQLException {

        int count = 0;

        try (Connection con = getConnection()) {
            String sql = "SELECT COUNT(cart.user_id) FROM cart JOIN shop_product ON shop_product.shop_product_id = cart.shop_product_id JOIN shop ON shop.shop_id = shop_product.shop_id WHERE TIME_FORMAT(NOW(), '%H:%i:%s') between shop.opening_time and shop.closing_time AND shop.status = \"Open\" AND shop_product.quantity !='0' AND cart.user_id = ?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        }

        return count;
    }

    /*public static List<Wishlist> ViewWishlistProduct(int user_id) throws FileNotFoundException{  
        List<Wishlist> list=new ArrayList<Wishlist>();  
          
        try{  
            Connection con = WishlistDAO.getConnection();
            String sql = "select * from wishlist where user_id=?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,user_id);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Wishlist obj=new Wishlist();
                
                obj.setWishlist_id(rs.getInt(1));
                obj.setUser_id(rs.getInt(2));
                obj.setShop_product_id(rs.getInt(3));
                
                list.add(obj);
            }
        }  
        catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
         } 

        return list;  
    }*/
    public static Cart getCartProduct(int user_id, int shop_product_id) throws FileNotFoundException, SQLException {

        Cart obj = new Cart();
        Connection con = getConnection();
        try {
            String sql = "select * from cart where user_id=? and shop_product_id=?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, shop_product_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                obj.setCart_id(rs.getInt(1));
                obj.setUser_id(rs.getInt(2));
                obj.setShop_product_id(rs.getInt(3));
                obj.setQuantity(rs.getInt(4));
            }
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }

        return obj;
    }

    public static void removCart(int user_id, int shop_product_id) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {

            String sql = "delete from cart where user_id=? and shop_product_id=?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, shop_product_id);

            st.executeUpdate();

        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
    }

    public static void update(Cart obj) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {
            String sql = "update cart set quantity = ? where user_id=? and shop_product_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getQuantity());
            st.setInt(2, obj.getUser_id());
            st.setInt(3, obj.getShop_product_id());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }

    public static void cartValueHigh() throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {
            String sql = "UPDATE cart JOIN shop_product ON shop_product.shop_product_id = cart.shop_product_id SET cart.quantity = shop_product.quantity WHERE cart.quantity > shop_product.quantity";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }

    public static List<Cart> viewCartShop(int user_id) throws SQLException {

        
        List<Cart> list = new ArrayList<Cart>();
        Connection con = getConnection();
        try {
            String sql = "SELECT shop.shop_id,shop.name FROM cart JOIN shop_product ON shop_product.shop_product_id = cart.shop_product_id JOIN shop ON shop.shop_id = shop_product.shop_id WHERE TIME_FORMAT(NOW(), '%H:%i:%s') between shop.opening_time and shop.closing_time AND shop.status = \"Open\" AND shop_product.quantity !='0' AND cart.user_id = ? group by shop.shop_id having count(*) >= 1";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart obj = new Cart();
                
                obj.setShop_id(rs.getInt(1));
                obj.setShop_name(rs.getString(2));
                
                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }
        


        return list;
    }

    public static List<Cart> viewCartData(int user_id,int shop_id) throws SQLException {
        
        System.out.println(shop_id);
        
        List<Cart> list = new ArrayList<Cart>();
        Connection con = getConnection();
        try {
            String sql = "SELECT shop_product.shop_product_id,product.name,shop_product.mrp,shop_product.discount_mrp,cart.quantity,shop_product.quantity,product.image,ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.net_weigth, shop_product.unit FROM cart JOIN shop_product ON shop_product.shop_product_id = cart.shop_product_id JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id WHERE TIME_FORMAT(NOW(), '%H:%i:%s') between shop.opening_time and shop.closing_time AND shop.status = \"Open\" AND shop_product.quantity !='0' AND cart.user_id = ? AND shop.shop_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, shop_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart obj = new Cart();

                obj.setShop_product_id(rs.getInt(1));
                obj.setProduct_name(rs.getString(2));
                obj.setMrp(rs.getInt(3));
                obj.setDiscount_mrp(rs.getInt(4));
                obj.setCart_quantity(rs.getInt(5));
                obj.setProduct_quantity(rs.getInt(6));
                obj.setProduct_image(rs.getString(7));
                obj.setDiscount(rs.getInt(8));
                obj.setNet_weigth(rs.getInt(9));
                obj.setUnit(rs.getString(10));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }
    
    public static void deleteAllCartUser(int user_id) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {

            String sql = "DELETE cart.* FROM cart JOIN shop_product ON shop_product.shop_product_id = cart.shop_product_id JOIN shop ON shop.shop_id = shop_product.shop_id WHERE TIME_FORMAT(NOW(), '%H:%i:%s') between shop.opening_time and shop.closing_time AND shop.status = \"Open\" AND shop_product.quantity !='0' AND cart.user_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);

            st.executeUpdate();

        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
    }
}
