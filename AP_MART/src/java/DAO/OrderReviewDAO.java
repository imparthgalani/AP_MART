/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.CartDAO.getConnection;
import POJO.OrderReview;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ankit Chauhan
 */
public class OrderReviewDAO {
    
    public static com.mysql.jdbc.Connection getConnection() throws SQLException{  
        com.mysql.jdbc.Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver"); 
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root"; 
            con = (com.mysql.jdbc.Connection) DriverManager.getConnection(mysqlURL);
        }catch(ClassNotFoundException | SQLException e){System.out.println(e);}  
        return con;  
    }
    
    public static void insert(OrderReview obj) throws FileNotFoundException, SQLException{
        
         Connection con = getConnection();
         
         try {
            String sql = "INSERT INTO review (user_id,order_list_id,shop_product_id,star,custmore_name,email,message) "+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1,obj.getUser_id());
            st.setInt(2,obj.getOrder_list_id());
            st.setInt(3,obj.getShop_product_id());
            st.setInt(4,obj.getStar());
            st.setString(5,obj.getCustmore_name());
            st.setString(6,obj.getEmail());
            st.setString(7,obj.getMessage());
            
            
            st.executeUpdate();
        }
        catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
         }
         finally
        {
             con.close();
        }
        //Method Ends Here
    }
    
    public static List<OrderReview> viewReviewData(int shop_product_id) throws SQLException {
        List<OrderReview> list = new ArrayList<OrderReview>();

        Connection con = getConnection();

        try {
            String sql = "SELECT review.user_id,review.order_list_id,review.shop_product_id,review.star,review.custmore_name,review.email,review.message,DATE_FORMAT(review.time ,'%M %d, %Y'),user.image FROM `review` JOIN user ON user.user_id = review.user_id WHERE review.shop_product_id = ? AND review.message != ''";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderReview obj = new OrderReview();

                obj.setUser_id(rs.getInt(1));
                obj.setOrder_list_id(rs.getInt(2));
                obj.setShop_product_id(rs.getInt(3));
                obj.setStar(rs.getInt(4));
                obj.setCustmore_name(rs.getString(5));
                obj.setEmail(rs.getString(6));
                obj.setMessage(rs.getString(7));
                obj.setTime(rs.getString(8));
                obj.setImage(rs.getString(9));
                
                list.add(obj);
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return list;
    }
    
    public static int count(int shop_product_id,String condition) throws FileNotFoundException, SQLException {

        int count = 0;

        try (com.mysql.jdbc.Connection con = getConnection()) {
            String sql = "SELECT COUNT(*) FROM review WHERE shop_product_id = ? "+ condition;

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);
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
    
    public static int reviewCount(int shop_product_id,int star) throws FileNotFoundException, SQLException {

        int count = 0;

        try (com.mysql.jdbc.Connection con = getConnection()) {
            String sql = "SELECT ROUND(COUNT(*)/(SELECT COUNT(*) FROM review WHERE shop_product_id = ?)*100) FROM review WHERE review.shop_product_id = ? AND star = ?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);
            st.setInt(2, shop_product_id);
            st.setInt(3, star);
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
    
    public static float avgReviewCount(int shop_product_id) throws FileNotFoundException, SQLException {

        float count = 0;

        try (com.mysql.jdbc.Connection con = getConnection()) {
            String sql = "SELECT CAST(AVG(star) AS DECIMAL(10,1)) FROM review WHERE shop_product_id = ?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getFloat(1);
            }
            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        }

        return count;
    }
    
    public static OrderReview viewReviewUpdateData(int order_list_id,int shop_product_id) throws SQLException {
        
        OrderReview obj = new OrderReview();
        
        Connection con = getConnection();

        try {
            String sql = "SELECT review.user_id,review.order_list_id,review.shop_product_id,review.star,review.custmore_name,review.email,review.message,DATE_FORMAT(review.time ,'%M %d, %Y'),user.image FROM `review` JOIN user ON user.user_id = review.user_id WHERE review.shop_product_id = ? AND review.order_list_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, shop_product_id);
            st.setInt(2, order_list_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                

                obj.setUser_id(rs.getInt(1));
                obj.setOrder_list_id(rs.getInt(2));
                obj.setShop_product_id(rs.getInt(3));
                obj.setStar(rs.getInt(4));
                obj.setCustmore_name(rs.getString(5));
                obj.setEmail(rs.getString(6));
                obj.setMessage(rs.getString(7));
                obj.setTime(rs.getString(8));
                obj.setImage(rs.getString(9));
            }
        } catch (SQLException e) {
        } finally {
            con.close();
        }

        return obj;
    }

    public static void update(OrderReview obj) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {
            String sql = "update review set star=?, custmore_name=?, email=?, message=? where order_list_id=? AND shop_product_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            
            st.setInt(1,obj.getStar());
            st.setString(2,obj.getCustmore_name());
            st.setString(3,obj.getEmail());
            st.setString(4,obj.getMessage());
            st.setInt(5,obj.getOrder_list_id());
            st.setInt(6,obj.getShop_product_id());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }
    
}
