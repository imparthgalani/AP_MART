/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.ProductDAO.getConnection;
import POJO.Shop;
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
public class ShopDAO {
    
     public static Connection getConnection() throws SQLException{  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver"); 
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root"; 
            con = (Connection) DriverManager.getConnection(mysqlURL);
        }catch(ClassNotFoundException | SQLException e){System.out.println(e);}  
        return con;  
    }
    
     public static void insert(Shop obj) throws FileNotFoundException, SQLException{
        
         Connection con = getConnection();
         
         try {
            String sql = "INSERT INTO shop (shop_owner_id,name,email,phone,location,opening_time,closing_time,status,address,image) "+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1,obj.getShop_owner_id());
            st.setString(2,obj.getName());
            st.setString(3,obj.getEmail());
            st.setString(4,obj.getPhone());
            st.setString(5,obj.getLocation());
            st.setString(6,obj.getOpening_time());
            st.setString(7,obj.getClosing_time());
            st.setString(8,obj.getStatus());
            st.setString(9,obj.getAddress());
            st.setString(10,obj.getImage());
            
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
     
    public static List<Shop> viewDataRandom() throws SQLException{  
        List<Shop> list = new ArrayList<Shop>();
        
        Connection con = getConnection();
        
        try{  
            String sql = "SELECT shop.shop_id,shop.shop_owner_id,shop.name, shop.email, shop.phone, shop.location, shop.opening_time, shop.closing_time, shop.status, shop.address,shop.image,user.full_name,user.image FROM shop JOIN user ON user.user_id = shop.shop_owner_id ORDER BY RAND()";
            java.sql.PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Shop obj=new Shop();
                
                obj.setShop_id(rs.getInt(1));
                obj.setShop_owner_id(rs.getInt(2));
                obj.setName(rs.getString(3));
                obj.setEmail(rs.getString(4));
                obj.setPhone(rs.getString(5));
                obj.setLocation(rs.getString(6));
                obj.setOpening_time(rs.getString(7));
                obj.setClosing_time(rs.getString(8));
                obj.setStatus(rs.getString(9));
                obj.setAddress(rs.getString(10));
                obj.setImage(rs.getString(11));
                obj.setShop_owner_name(rs.getString(12));
                obj.setShop_owner_image(rs.getString(13));
                
                
                list.add(obj);
            }
        }  
        catch(SQLException e){
        }  
        finally
        {
             con.close();
        }

        return list;  
    }
    
    public static List<Shop> viewData() throws SQLException{  
        List<Shop> list=new ArrayList<Shop>();  
          Connection con = getConnection();
        try{  
            String sql = "SELECT shop.shop_id,shop.shop_owner_id,shop.name, shop.email, shop.phone, shop.location, shop.opening_time, shop.closing_time,shop.status, shop.address,shop.image,user.full_name,user.image FROM shop JOIN user ON user.user_id = shop.shop_owner_id";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Shop obj=new Shop();
                
                obj.setShop_id(rs.getInt(1));
                obj.setShop_owner_id(rs.getInt(2));
                obj.setName(rs.getString(3));
                obj.setEmail(rs.getString(4));
                obj.setPhone(rs.getString(5));
                obj.setLocation(rs.getString(6));
                obj.setOpening_time(rs.getString(7));
                obj.setClosing_time(rs.getString(8));
                obj.setStatus(rs.getString(9));
                obj.setAddress(rs.getString(10));
                obj.setImage(rs.getString(11));
                obj.setShop_owner_name(rs.getString(12));
                obj.setShop_owner_image(rs.getString(13));
                
                
                list.add(obj);
            }
        }  
        catch(SQLException e){
        }  
        finally
        {
             con.close();
        }

        return list;  
    }
    
     public static Shop viewData(int shop_id) throws SQLException{  
        
        Shop obj=new Shop();
        Connection con = getConnection();
        
        try{  
            String sql = "SELECT * FROM shop WHERE shop_id=?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,shop_id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){ 
                obj.setShop_owner_id(rs.getInt(2));
                obj.setName(rs.getString(3));
                obj.setEmail(rs.getString(4));
                obj.setPhone(rs.getString(5));
                obj.setLocation(rs.getString(6));
                obj.setOpening_time(rs.getString(7));
                obj.setClosing_time(rs.getString(8));
                obj.setStatus(rs.getString(9));
                obj.setAddress(rs.getString(10));
                obj.setImage(rs.getString(11));
            }
        }  
        catch(SQLException e){
        } 
        finally
        {
             con.close();
        }

        return obj;  
    }
     
    public static Shop viewDataUserShop(int user_id) throws SQLException{  
        
        Shop obj=new Shop();
        
        Connection con = getConnection();
        
        try{  
            String sql = "SELECT * FROM shop WHERE shop_owner_id=?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,user_id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){ 
                obj.setShop_id(rs.getInt(1));
                obj.setShop_owner_id(rs.getInt(2));
                obj.setName(rs.getString(3));
                obj.setEmail(rs.getString(4));
                obj.setPhone(rs.getString(5));
                obj.setLocation(rs.getString(6));
                obj.setOpening_time(rs.getString(7));
                obj.setClosing_time(rs.getString(8));
                obj.setStatus(rs.getString(9));
                obj.setAddress(rs.getString(10));
                obj.setImage(rs.getString(11));
            }
        }  
        catch(SQLException e){
        } 
        finally
        {
             con.close();
        }

        return obj;  
    }
    
    public static void delete(int shop_id) throws SQLException
    {
        Connection con = getConnection();
        
        try {
            String sql = "delete from shop where shop_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,shop_id);  
              
            st.executeUpdate();
            
            con.close();  
        }
        catch (SQLException sqle) {
            System.err.println("Error with connection:" + sqle);
        }
        finally
        {
             con.close();
        }
    }
    
    public static void update(Shop obj) throws FileNotFoundException, SQLException{
        Connection con = getConnection();
        
        try {
            String sql = "update shop set shop_owner_id=?, name=?, email=?, phone=?, location=?, opening_time=?, closing_time=?, status=?, address=?, image=?  where shop_id =?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,obj.getShop_owner_id());
            st.setString(2,obj.getName());
            st.setString(3,obj.getEmail());
            st.setString(4,obj.getPhone());
            st.setString(5,obj.getLocation());
            st.setString(6,obj.getOpening_time());
            st.setString(7,obj.getClosing_time());
            st.setString(8,obj.getStatus());
            st.setString(9,obj.getAddress());
            st.setString(10,obj.getImage());
            st.setInt(11,obj.getShop_id());
 
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
