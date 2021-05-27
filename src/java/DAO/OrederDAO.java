/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.CartDAO.getConnection;
import DAO.OrderDetailDAO;
import POJO.Cart;
import POJO.Order;
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
public class OrederDAO {

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

    public static void insert(int user_id, int order_id) throws FileNotFoundException, SQLException {

        List<Cart> list9;
        list9 = CartDAO.viewCartShop(user_id);
        for (Cart e : list9) {

            Connection con = getConnection();
            String sql = "INSERT INTO order_list (order_list_id,user_id,order_id,shop_id,delivery_detail_id) " + "VALUES (?, ?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, Integer.parseInt(order_id + "" + e.getShop_id()));
            st.setInt(2, user_id);
            st.setInt(3, order_id);
            st.setInt(4, e.getShop_id());
            st.setInt(5, order_id);

            st.executeUpdate();
            con.close();
        }
        //Method Ends Here
    }

    public static List<Order> getAllOrderListId(int order_id) throws SQLException {

        List<Order> list = new ArrayList<Order>();
        Connection con = getConnection();
        try {
            String sql = "SELECT order_list.order_list_id,shop.name,DATE_FORMAT(order_list.current_time,'%d/%m/%Y') FROM order_list join shop ON shop.shop_id = order_list.shop_id WHERE order_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, order_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order obj = new Order();

                obj.setOrder_list_id(rs.getInt(1));
                obj.setShop_name(rs.getString(2));
                obj.setOrder_plc_time(rs.getString(3));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static List<Cart> viewOrderData(int order_list_id) throws SQLException {
        int status = 0;
        List<Cart> list = new ArrayList<Cart>();
        Connection con = getConnection();
        try {

            String sql = "SELECT product.name,shop_product.mrp,shop_product.discount_mrp,ROUND(100-shop_product.discount_mrp/shop_product.mrp*100),order_detail.quantity,shop_product.shop_product_id FROM `order_list` JOIN order_detail ON order_detail.order_id = order_list.order_id AND order_detail.shop_id = order_list.shop_id LEFT JOIN cancel_order ON cancel_order.shop_product_id = order_detail.shop_product_id JOIN shop_product ON shop_product.shop_product_id = order_detail.shop_product_id join product ON product.product_id = shop_product.product_id WHERE cancel_order.shop_product_id IS null AND order_list.order_list_id = ?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, order_list_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart obj = new Cart();

                obj.setProduct_name(rs.getString(1));
                obj.setMrp(rs.getInt(2));
                obj.setDiscount_mrp(rs.getInt(3));
                obj.setDiscount(rs.getInt(4));
                obj.setCart_quantity(rs.getInt(5));
                obj.setShop_product_id(rs.getInt(6));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    public static int getOrderId() throws SQLException {
        Connection con = getConnection();
        String sql = "SELECT MAX(order_id) FROM order_list";

        java.sql.PreparedStatement st = con.prepareStatement(sql);

        ResultSet rs = st.executeQuery();

        int order_id = 0;

        if (rs.next()) {
            order_id = rs.getInt(1);
        }

        order_id = order_id + 1;

        con.close();

        return order_id;
    }

    public static Order getOrderDetil(int order_id) throws FileNotFoundException, SQLException {

        Order obj = new Order();
        Connection con = getConnection();
        try {
            String sql = "SELECT order_list.order_id,order_list.shop_id,delivery_detail.custmore_name,delivery_detail.phone,delivery_detail.alt_phone,DATE_FORMAT(order_list.current_time,'%h:%i %p - %D %M %Y') As order_plc_time,DATE_FORMAT(DATE_ADD(order_list.current_time, INTERVAL delivery_detail.delivery_time HOUR) , '%h:%i %p - %D %M %Y') As order_time,delivery_detail.delivery_time, delivery_detail.paymentmethod,delivery_address.title,CONCAT('#',delivery_address.flat,' ',delivery_address.street,', ',delivery_address.locality,' - ',delivery_address.pincode) AS order_address FROM order_list JOIN delivery_detail ON delivery_detail.delivery_detail_id = order_list.delivery_detail_id JOIN delivery_address ON delivery_address.delivery_address_id = delivery_detail.delivery_address_id WHERE order_list.order_id = ? group by order_list.order_id having count(*) >= 1";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, order_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                obj.setOrder_id(rs.getInt(1));
                obj.setShop_id(rs.getInt(2));
                obj.setCustmore_name(rs.getString(3));
                obj.setPhone(rs.getString(4));
                obj.setAlt_phone(rs.getString(5));
                obj.setOrder_plc_time(rs.getString(6));
                obj.setOrder_time(rs.getString(7));
                obj.setDelivery_time(rs.getInt(8));
                obj.setPaymentmethod(rs.getString(9));
                obj.setTitle(rs.getString(10));
                obj.setOrder_address(rs.getString(11));
            }
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }

        return obj;
    }

    public static List<Order> getAllTrackingOrderListId(int user_id) throws SQLException {

        List<Order> list = new ArrayList<Order>();
        Connection con = getConnection();
        try {
            String sql = "SELECT order_list.order_list_id,order_list.order_id,shop.name FROM `order_list` JOIN shop ON shop.shop_id = order_list.shop_id WHERE order_list.user_id =? AND order_list.status < 5";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order obj = new Order();

                obj.setOrder_list_id(rs.getInt(1));
                obj.setOrder_id(rs.getInt(2));
                obj.setShop_name(rs.getString(3));

                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }

    /*public static List<Cart> viewTrackingOrderShop(int user_id, int order_id) throws SQLException {

        List<Cart> list = new ArrayList<Cart>();
        Connection con = getConnection();
        try {
            String sql = "SELECT order_list.shop_id,shop.name FROM order_list join shop ON shop.shop_id = order_list.shop_id WHERE order_list.user_id =? AND order_list.order_id = ? AND order_list.status != 5";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, order_id);
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
    }*/
    public static Order getOrderListDetail(int order_list_id) throws SQLException {

        Order obj = new Order();

        Connection con = getConnection();
        String sql = "SELECT order_list.order_id,shop.name, order_list.status,order_list.update_time FROM order_list JOIN shop ON shop.shop_id = order_list.shop_id where order_list.order_list_id =?";

        java.sql.PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, order_list_id);

        ResultSet rs = st.executeQuery();

        int status = 1;

        if (rs.next()) {
            obj.setOrder_id(rs.getInt(1));
            obj.setShop_name(rs.getString(2));
            obj.setStatus(rs.getInt(3));
            obj.setUpadte_time(rs.getString(4));
        }

        con.close();

        return obj;
    }

    public static int getOrderListStatus(int order_list_id) throws SQLException {
        Connection con = getConnection();
        String sql = "SELECT(SELECT COUNT(order_detail.order_detail_id) FROM order_list JOIN order_detail ON order_detail.order_id = order_list.order_id AND order_detail.shop_id = order_list.shop_id WHERE order_list.order_list_id = ?) - (SELECT COUNT(cancel_order.order_list_id) FROM order_list JOIN cancel_order ON cancel_order.order_list_id = order_list.order_list_id WHERE order_list.order_list_id = ?)";

        java.sql.PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, order_list_id);
        st.setInt(2, order_list_id);
        ResultSet rs = st.executeQuery();

        int order_list_status = 0;

        if (rs.next()) {
            order_list_status = rs.getInt(1);
        }

        con.close();

        return order_list_status;
    }

    public static void deleteOrderList(int order_list_id, int shop_product_id, int order_list_status) throws SQLException {
        Connection con = getConnection();

        try {

            String sql;

            if (shop_product_id == 0) {
                sql = "UPDATE `order_list` SET status = 6 WHERE order_list_id = ?";
            } else {
                sql = "UPDATE `order_list` SET status = 6 WHERE " + order_list_status + " = 0 AND order_list_id = ?";
            }
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, order_list_id);

            st.executeUpdate();

            con.close();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
    }

    public static List<Order> getOrderListDetails(String condition) throws FileNotFoundException, SQLException {

        List<Order> list = new ArrayList<Order>();
        Connection con = getConnection();
        try {
            String sql = "SELECT order_list.order_list_id,shop.name,delivery_detail.custmore_name,delivery_detail.phone,DATE_FORMAT(DATE_ADD(order_list.current_time, INTERVAL delivery_detail.delivery_time HOUR) , '%h:%i %p - %D %M %Y') As order_time,CONCAT('#',delivery_address.flat,' ',delivery_address.street,' ',delivery_address.pincode,' ',delivery_address.locality) AS order_address,user.full_name,order_list.status,DATE_FORMAT(order_list.current_time,'%h:%i %p - %D %M %Y') FROM order_list JOIN delivery_detail ON delivery_detail.delivery_detail_id = order_list.delivery_detail_id JOIN delivery_address ON delivery_address.delivery_address_id = delivery_detail.delivery_address_id JOIN shop ON shop.shop_id = order_list.shop_id JOIN user ON user.user_id = order_list.servicer_id " + condition;
            System.out.println(sql);
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order obj = new Order();

                obj.setOrder_list_id(rs.getInt(1));
                obj.setShop_name(rs.getString(2));
                obj.setCustmore_name(rs.getString(3));
                obj.setPhone(rs.getString(4));
                obj.setOrder_time(rs.getString(5));
                obj.setOrder_address(rs.getString(6));
                obj.setServicer_name(rs.getString(7));
                obj.setStatus(rs.getInt(8));
                obj.setOrder_plc_time(rs.getString(9));

                list.add(obj);
            }
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }

        return list;
    }

    public static void upadteStatus(int order_list_id, int status) throws SQLException {
        Connection con = getConnection();

        try {

            String sql;

            sql = "UPDATE `order_list` SET status = ? WHERE order_list_id = ?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, order_list_id);

            st.executeUpdate();

            con.close();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
    }

    public static int orderCount(int user_id) throws SQLException {

        int order_count = 0;
        Connection con = getConnection();
        try {
            String sql = "SELECT COUNT(order_list.order_list_id) FROM `order_list` JOIN shop ON shop.shop_id = order_list.shop_id WHERE order_list.user_id =? AND order_list.status < 5";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                order_count = rs.getInt(1);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return order_count;
    }

    public static void AssignServicer(int order_list_id, int servicer_id) throws SQLException {
        Connection con = getConnection();

        try {

            String sql;

            sql = "UPDATE order_list SET servicer_id = ?  WHERE order_list_id = ?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, servicer_id);
            st.setInt(2, order_list_id);

            st.executeUpdate();

            con.close();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
    }

    public static int statusCount(String condition) throws SQLException {

        int status_count = 0;
        Connection con = getConnection();
        try {
            String sql = "SELECT COUNT(*) FROM order_list " + condition;
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                status_count = rs.getInt(1);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return status_count;
    }
}
