/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.User;
import com.mysql.jdbc.Connection;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ankit Chauhan
 */
public class UserDAO {
    
    public static Connection getConnection() throws SQLException{  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver"); 
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root"; 
            con = (Connection) DriverManager.getConnection(mysqlURL);
        }catch(ClassNotFoundException | SQLException e){System.out.println(e);}  
        return con;  
    }
     
    public static void insert(User obj) throws FileNotFoundException, SQLException{
        
        Connection con = getConnection();
        
        try {
            String sql = "INSERT INTO user (full_name, email, phone, password, image, address, type) "+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,obj.getFull_name());
            st.setString(2,obj.getEmail());
            st.setString(3,obj.getPhone());
            st.setString(4,obj.getPassword());
            st.setString(5,obj.getImage());
            st.setString(6,obj.getAddress());
            st.setString(7,obj.getType());
 
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
    
    public static int getUserId(String email) throws SQLException
    {
        Connection con = getConnection();
        String sql = "select user_id from user where email=?";
        
        java.sql.PreparedStatement st=con.prepareStatement(sql);  
        st.setString(1,email);  
            
        ResultSet rs = st.executeQuery();
        
        int user_id = 0;
        
        if(rs.next())
        {
            user_id = rs.getInt(1);
        }
        
        con.close();
        
        return user_id;
    }
    
    public static List<User> viewData(String type) throws SQLException{  
        List<User> list=new ArrayList<User>();  
          
        Connection con = getConnection();
        
        try{  
            String sql = "select * from user where type = ?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,type);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                User obj=new User();
                
                obj.setUser_id(rs.getInt(1));
                obj.setFull_name(rs.getString(2));
                obj.setEmail(rs.getString(3));
                obj.setPhone(rs.getString(4));
                obj.setPassword(rs.getString(5));
                obj.setImage(rs.getString(6));
                obj.setAddress(rs.getString(7));
                obj.setType(rs.getString(8));
                
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
    
    public static User viewData(int user_id) throws SQLException{  
        
        User obj=new User();
        
        Connection con = getConnection();
        
        try{  
            String sql = "select * from user where user_id = ?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,user_id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                obj.setUser_id(rs.getInt(1));
                obj.setFull_name(rs.getString(2));
                obj.setEmail(rs.getString(3));
                obj.setPhone(rs.getString(4));
                obj.setPassword(rs.getString(5));
                obj.setImage(rs.getString(6));
                obj.setAddress(rs.getString(7));
                obj.setType(rs.getString(8));
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
    
    public static void delete(int user_id) throws SQLException
    {
        Connection con = getConnection();
        
        try {
            String sql = "delete from user where user_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,user_id);  
              
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
   
    public static void update(User obj) throws FileNotFoundException, SQLException{
        
        Connection con = getConnection();
        
        try {
            String sql = "update user set full_name=?, email=?, phone=?, password=?, image=?, address=?, type=? where user_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,obj.getFull_name());
            st.setString(2,obj.getEmail());
            st.setString(3,obj.getPhone());
            st.setString(4,obj.getPassword());
            st.setString(5,obj.getImage());
            st.setString(6,obj.getAddress());
            st.setString(7,obj.getType());
            st.setInt(8,obj.getUser_id());
 
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
    
    /*//Get Username and Password 
    public static User getUser(String email) throws SQLException {
        User obj = null;

        try {

            Connection con = UserDAO.getConnection();
            String sql = "select * from user where email=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);

            ResultSet result = st.executeQuery();

            if (result.next()) {
                obj = new User();
                obj.setUser_id(result.getInt("id"));                
                obj.setEmail(result.getString("email"));
                obj.setPassword(result.getString("password"));
            }

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return obj;
    }*/

    //Get Type
   /* public static User getUserData(String email) throws SQLException {
        User obj = null;

        try {
            Connection con = UserDAO.getConnection();
            String sql = "select * from user where email=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);

            ResultSet result = st.executeQuery();
            if (result.next()) {
                obj = new User();
                obj.setFull_name(result.getString("full_name"));
                obj.setEmail(result.getString("email"));
                obj.setPhone(result.getString("phone"));
                obj.setPassword(result.getString("password"));                 
                obj.setImage(result.getString("image"));
                obj.setAddress(result.getString("address"));
                obj.setType(result.getString("type"));
            }

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return obj;
    }*/

}
