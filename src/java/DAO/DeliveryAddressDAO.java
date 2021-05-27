/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.DeliveryAddress;
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
public class DeliveryAddressDAO {

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

    public static void insert(DeliveryAddress obj) throws FileNotFoundException, SQLException {

        Connection con = getConnection();
        try {
            String sql = "INSERT INTO delivery_address (user_id, title, flat, street, pincode, locality) " + "VALUES (?, ?, ?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getUser_id());
            st.setString(2, obj.getTitle());
            st.setInt(3, obj.getFlat());
            st.setString(4, obj.getStreet());
            st.setInt(5, obj.getPincode());
            st.setString(6, obj.getLocality());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }
    
    public static List<DeliveryAddress> viewData(int user_id) throws SQLException {
        List<DeliveryAddress> list = new ArrayList<DeliveryAddress>();
        Connection con = getConnection();
        try {
            String sql = "SELECT * FROM delivery_address where user_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DeliveryAddress obj = new DeliveryAddress();

                obj.setDelivery_address_id(rs.getInt(1));
                obj.setUser_id(rs.getInt(2));
                obj.setTitle(rs.getString(3));
                obj.setFlat(rs.getInt(4));
                obj.setStreet(rs.getString(5));
                obj.setPincode(rs.getInt(6));
                obj.setLocality(rs.getString(7));

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
    
     public static void delete(int delivery_address_id) throws SQLException {
        Connection con = getConnection();
        
        try {
            String sql = "delete from delivery_address where delivery_address_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, delivery_address_id);

            st.executeUpdate();
            
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        }
        finally
         {
             con.close();
         }
    }
     
     public static DeliveryAddress viewDataSingle(int delivery_address_id) throws SQLException {

        DeliveryAddress obj = new DeliveryAddress();

        Connection con = getConnection();
        try {
            String sql = "select * from delivery_address where delivery_address_id = ?";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, delivery_address_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                
                obj.setDelivery_address_id(rs.getInt(1));
                obj.setUser_id(rs.getInt(2));
                obj.setTitle(rs.getString(3));
                obj.setFlat(rs.getInt(4));
                obj.setStreet(rs.getString(5));
                obj.setPincode(rs.getInt(6));
                obj.setLocality(rs.getString(7));
                
            }
        } catch (SQLException e) {
        }
        finally
         {
             con.close();
         }

        return obj;
    }
     
    public static void update(DeliveryAddress obj) throws FileNotFoundException, SQLException {
        
        Connection con = getConnection();
        try {
            String sql = "update delivery_address set user_id=?, title=?, flat=?, street=?, pincode=?, locality=? where delivery_address_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

             st.setInt(1, obj.getUser_id());
            st.setString(2, obj.getTitle());
            st.setInt(3, obj.getFlat());
            st.setString(4, obj.getStreet());
            st.setInt(5, obj.getPincode());
            st.setString(6, obj.getLocality());
            st.setInt(7, obj.getDelivery_address_id());

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
}
