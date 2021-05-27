/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.DeliveryDetail;
import com.mysql.jdbc.Connection;
import java.io.FileNotFoundException;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Ankit Chauhan
 */
public class DeliveryDetailDAO {
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
    
    public static void insert(DeliveryDetail obj) throws FileNotFoundException, SQLException {

        Connection con = getConnection();

        try {
            String sql = "INSERT INTO delivery_detail (delivery_detail_id,custmore_name,email,phone,alt_phone,delivery_address_id,delivery_time,paymentmethod) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, obj.getDelivery_detail_id());
            st.setString(2, obj.getCustmore_name());
            st.setString(3, obj.getEmail());
            st.setString(4, obj.getPhone());
            st.setString(5, obj.getAlt_phone());
            st.setInt(6, obj.getDelivery_address_id());
            st.setInt(7, obj.getDelivery_time());
            st.setString(8, obj.getPaymentmethod());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }
}
