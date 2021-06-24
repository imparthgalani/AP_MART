/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.ShopDAO.getConnection;
import POJO.ShopProduct;
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
public class ShopProductDAO {

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

    public static void insert(ShopProduct obj) throws FileNotFoundException, SQLException {
        Connection con = getConnection();

        try {
            String sql = "INSERT INTO shop_product (shop_id, product_id, mrp, discount_mrp, net_weigth, unit, quantity) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getShop_id());
            st.setInt(2, obj.getProduct_id());
            st.setInt(3, obj.getMrp());
            st.setInt(4, obj.getDiscount_mrp());
            st.setInt(5, obj.getNet_weigth());
            st.setString(6, obj.getUnit());
            st.setInt(7, obj.getQuantity());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }

    public static List<ShopProduct> viewShopData(int shop_id) throws SQLException {
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.shop_id, shop_product.product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop_product.quantity, product.name FROM shop_product JOIN product ON product.product_id = shop_product.product_id WHERE shop_product.shop_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setShop_id(rs.getInt(2));
                obj.setProduct_id(rs.getInt(3));
                obj.setMrp(rs.getInt(4));
                obj.setDiscount_mrp(rs.getInt(5));
                obj.setNet_weigth(rs.getInt(6));
                obj.setUnit(rs.getString(7));
                obj.setQuantity(rs.getInt(8));
                obj.setProduct_name(rs.getString(9));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static void delete(int shop_product_id) throws SQLException {
        Connection con = getConnection();
        try {
            String sql = "delete from shop_product where shop_product_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);

            st.executeUpdate();

            con.close();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
    }

    public static void deleteShopProduct(int shop_id) throws SQLException {
        Connection con = getConnection();
        try {
            String sql = "delete from shop_product where shop_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_id);

            st.executeUpdate();

            con.close();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
    }

    public static ShopProduct viewShopProductData(int shop_product_id) throws SQLException {

        ShopProduct obj1 = new ShopProduct();

        Connection con = getConnection();

        try {

            String sql = "select * from shop_product where shop_product_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                obj1.setShop_product_id(rs.getInt(1));
                obj1.setShop_id(rs.getInt(2));
                obj1.setProduct_id(rs.getInt(3));
                obj1.setMrp(rs.getInt(4));
                obj1.setDiscount_mrp(rs.getInt(5));
                obj1.setNet_weigth(rs.getInt(6));
                obj1.setUnit(rs.getString(7));
                obj1.setQuantity(rs.getInt(8));
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return obj1;
    }

    public static void update(ShopProduct obj) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {
            String sql = "update shop_product set shop_id=?, product_id=?, mrp=?, discount_mrp=?, net_weigth=?, unit=?, quantity=? where shop_product_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getShop_id());
            st.setInt(2, obj.getProduct_id());
            st.setInt(3, obj.getMrp());
            st.setInt(4, obj.getDiscount_mrp());
            st.setInt(5, obj.getNet_weigth());
            st.setString(6, obj.getUnit());
            st.setInt(7, obj.getQuantity());
            st.setInt(8, obj.getShop_product_id());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }

    public static List<ShopProduct> viewDataAddNewProducts() throws SQLException {
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image,shop_product.quantity,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id ORDER BY shop_product.shop_product_id DESC LIMIT 20";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setQuantity(rs.getInt(9));
                obj.setOpening_time(rs.getString(10));
                obj.setClosing_time(rs.getString(11));
                obj.setShop_status(rs.getString(12));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static List<ShopProduct> viewDataMaxDiscount() throws SQLException {
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.quantity,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id ORDER BY ROUND(100-shop_product.discount_mrp/shop_product.mrp*100) DESC LIMIT 20";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setDiscount(rs.getInt(9));
                obj.setQuantity(rs.getInt(10));
                obj.setOpening_time(rs.getString(11));
                obj.setClosing_time(rs.getString(12));
                obj.setShop_status(rs.getString(13));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static ShopProduct viewSingalShopProductData(int shop_product_id) throws SQLException {

        ShopProduct obj = new ShopProduct();

        Connection con = getConnection();

        try {

            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, product.description, categories.name, shop.shop_id, categories.categories_id,shop_product.quantity,shop.opening_time,shop.closing_time ,shop.status,product.product_id FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id JOIN categories ON categories.categories_id = product.category_id WHERE shop_product.shop_product_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setProduct_description(rs.getString(9));
                obj.setCategory_name(rs.getString(10));
                obj.setShop_id(rs.getInt(11));
                obj.setCategory_id(rs.getInt(12));
                obj.setQuantity(rs.getInt(13));
                obj.setOpening_time(rs.getString(14));
                obj.setClosing_time(rs.getString(15));
                obj.setShop_status(rs.getString(16));
                obj.setProduct_id(rs.getInt(17));
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return obj;
    }
    
    public static List<ShopProduct> viewAllDataProducts(String popularity) throws SQLException {
  
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.quantity,shop_product.shop_id,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id "+popularity;
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setDiscount(rs.getInt(9));
                obj.setQuantity(rs.getInt(10));
                obj.setShop_id(rs.getInt(11));
                obj.setOpening_time(rs.getString(12));
                obj.setClosing_time(rs.getString(13));
                obj.setShop_status(rs.getString(14));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }
    
    public static List<ShopProduct> viewProductData(int product_id,String popularity) throws SQLException {
  
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.quantity,shop_product.shop_id,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id WHERE product.product_id = ? " + popularity;
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setDiscount(rs.getInt(9));
                obj.setQuantity(rs.getInt(10));
                obj.setShop_id(rs.getInt(11));
                obj.setOpening_time(rs.getString(12));
                obj.setClosing_time(rs.getString(13));
                obj.setShop_status(rs.getString(14));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

  

    public static List<ShopProduct> viewMostDeliverdProducts() throws SQLException {
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.quantity,shop_product.shop_id,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id ORDER BY RAND() LIMIT 20 ";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setDiscount(rs.getInt(9));
                obj.setQuantity(rs.getInt(10));
                obj.setShop_id(rs.getInt(11));
                obj.setOpening_time(rs.getString(12));
                obj.setClosing_time(rs.getString(13));
                obj.setShop_status(rs.getString(14));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static List<ShopProduct> viewCategoriesDataProduct(int categories_id, String popularity) throws SQLException {
       
        System.out.println("DAO start2");
        
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.quantity,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id  WHERE product.category_id = ? " + popularity;
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, categories_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setDiscount(rs.getInt(9));
                obj.setQuantity(rs.getInt(10));
                obj.setOpening_time(rs.getString(11));
                obj.setClosing_time(rs.getString(12));
                obj.setShop_status(rs.getString(13));

                list.add(obj);
            }
            
            System.out.println("DAO Close2");
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static List<ShopProduct> viewShopsDataProduct(int shop_id, String popularity) throws SQLException {
       
        System.out.println("DAO start2");
        
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.quantity,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id  WHERE shop.shop_id = ? " + popularity;
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setDiscount(rs.getInt(9));
                obj.setQuantity(rs.getInt(10));
                obj.setOpening_time(rs.getString(11));
                obj.setClosing_time(rs.getString(12));
                obj.setShop_status(rs.getString(13));

                list.add(obj);
            }
            
            System.out.println("DAO Close2");
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static List<ShopProduct> ViewWishlistData(int user_id,String popularity) throws SQLException {
  
        List<ShopProduct> list = new ArrayList<ShopProduct>();

        Connection con = getConnection();

        try {
            String sql = "SELECT shop_product.shop_product_id, shop_product.mrp, shop_product.discount_mrp, shop_product.net_weigth, shop_product.unit, shop.name, product.name, product.image, ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),shop_product.quantity,shop_product.shop_id,shop.opening_time,shop.closing_time ,shop.status FROM shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN product ON product.product_id = shop_product.product_id JOIN wishlist ON wishlist.shop_product_id = shop_product.shop_product_id WHERE wishlist.user_id = ? "+popularity;
            System.out.println(sql);
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShopProduct obj = new ShopProduct();

                obj.setShop_product_id(rs.getInt(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setNet_weigth(rs.getInt(4));
                obj.setUnit(rs.getString(5));
                obj.setShop_name(rs.getString(6));
                obj.setProduct_name(rs.getString(7));
                obj.setProduct_image(rs.getString(8));
                obj.setDiscount(rs.getInt(9));
                obj.setQuantity(rs.getInt(10));
                obj.setShop_id(rs.getInt(11));
                obj.setOpening_time(rs.getString(12));
                obj.setClosing_time(rs.getString(13));
                obj.setShop_status(rs.getString(14));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static ShopProduct ProductById(int product_id) throws SQLException {

        ShopProduct obj1 = new ShopProduct();

        Connection con = getConnection();

        try {

            String sql = "select * from shop_product where product_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                obj1.setShop_product_id(rs.getInt(1));

            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return obj1;
    }
    
    public static void StockChangeDecrease(int user_id) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {
            String sql = "UPDATE shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN cart ON cart.shop_product_id = shop_product.shop_product_id SET shop_product.quantity = shop_product.quantity - cart.quantity WHERE TIME_FORMAT(NOW(), '%H:%i:%s') between shop.opening_time and shop.closing_time AND shop.status = \"Open\" AND shop_product.quantity !='0' AND cart.user_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Metho
    }
    
    
    public static void StockChangeIncrease(int user_id) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {
            String sql = "UPDATE shop_product JOIN shop ON shop.shop_id = shop_product.shop_id JOIN cart ON cart.shop_product_id = shop_product.shop_product_id SET shop_product.quantity = shop_product.quantity - cart.quantity WHERE TIME_FORMAT(NOW(), '%H:%i:%s') between shop.opening_time and shop.closing_time AND shop.status = \"Open\" AND shop_product.quantity !='0' AND cart.user_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Metho
    }
    
}
