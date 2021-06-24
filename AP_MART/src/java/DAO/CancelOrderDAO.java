/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.CancelOrder;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Ankit Chauhan
 */
public class CancelOrderDAO {
    
    public static com.mysql.jdbc.Connection getConnection() throws SQLException{  
        com.mysql.jdbc.Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver"); 
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root"; 
            con = (com.mysql.jdbc.Connection) DriverManager.getConnection(mysqlURL);
        }catch(ClassNotFoundException | SQLException e){System.out.println(e);}  
        return con;  
    }
    
    public static void insert(CancelOrder obj) throws FileNotFoundException, SQLException{
        
         Connection con = getConnection();
         
         try {
            String sql = "INSERT INTO cancel_order (order_list_id,shop_product_id,reason,comment) "+ "VALUES (?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1,obj.getOrder_list_id());
            st.setInt(2,obj.getShop_product_id());
            st.setString(3,obj.getReason());
            st.setString(4,obj.getComment());
            
            
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
    
}
