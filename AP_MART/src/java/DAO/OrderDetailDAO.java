/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.DeliveryDetailDAO.getConnection;
import POJO.DeliveryDetail;
import POJO.OrderDetail;
import com.mysql.jdbc.Connection;
import java.io.FileNotFoundException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ankit Chauhan
 */
public class OrderDetailDAO {

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

    public static void insert(int order_id,int user_id) throws FileNotFoundException, SQLException {

        Connection con = getConnection();

        try {
            String sql = "INSERT INTO order_detail (order_id,shop_id,user_id,shop_product_id,quantity) SELECT ? ,shop_product.shop_id, cart.user_id,cart.shop_product_id,cart.quantity FROM cart JOIN shop_product ON shop_product.shop_product_id = cart.shop_product_id JOIN shop ON shop.shop_id = shop_product.shop_id WHERE TIME_FORMAT(NOW(), '%H:%i:%s') between shop.opening_time and shop.closing_time AND shop.status = \"Open\" AND shop_product.quantity !='0' AND cart.user_id = ?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,order_id);
            st.setInt(2,user_id);

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        } finally {
            con.close();
        }
        //Method Ends Here
    }

}
