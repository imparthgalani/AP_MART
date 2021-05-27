/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Wishlist;
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
public class WishlistDAO {
    
   public static Connection getConnection() throws SQLException{  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver"); 
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root"; 
            con = (Connection) DriverManager.getConnection(mysqlURL);
        }catch(ClassNotFoundException | SQLException e){System.out.println(e);}  
        return con;  
    }
    
     public static void insert(Wishlist obj) throws FileNotFoundException, SQLException{
        
         Connection con = getConnection();
         
         try {
            String sql = "INSERT INTO wishlist (user_id,shop_product_id) "+ "VALUES (?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1,obj.getUser_id());
            st.setInt(2,obj.getShop_product_id());
            
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
     
     public static int count(int user_id) throws FileNotFoundException, SQLException{
       
         int count=0;
        
         Connection con = getConnection();
         
         try {
            String sql = "SELECT COUNT(*) FROM wishlist where user_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,user_id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
            st.executeUpdate();
        }
        catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
         }
         finally
        {
             con.close();
        }
        return count;
    } 
     
    public static List<Wishlist> ViewWishlistProduct(int user_id) throws FileNotFoundException, SQLException{  
        List<Wishlist> list=new ArrayList<Wishlist>();  
         
        Connection con = getConnection();
        
        try{ 
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
        finally
        {
             con.close();
        }

        return list;  
    }
    
    public static Wishlist getWishlistProduct(int user_id,int shop_product_id) throws FileNotFoundException, SQLException{  
        
        Wishlist obj = new Wishlist();
        Connection con = getConnection();
        
        try{  
            String sql = "select * from wishlist where user_id=? and shop_product_id=?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,user_id);
            st.setInt(2,shop_product_id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                
                obj.setWishlist_id(rs.getInt(1));
                obj.setUser_id(rs.getInt(2));
                obj.setShop_product_id(rs.getInt(3));
            }
        }  
        catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
         }
        finally
        {
             con.close();
        }

        return obj;  
    }
    
    public static void removWishlist(int user_id,int shop_product_id) throws FileNotFoundException, SQLException{  
        
        Connection con = getConnection();
        
        try{ 
            String sql = "delete from wishlist where user_id=? and shop_product_id=?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,user_id);
            st.setInt(2,shop_product_id);
            
            st.executeUpdate();
     
        }  
        catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
         } 
        finally
        {
             con.close();
        }
    }
}
