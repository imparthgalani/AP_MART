/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.CategorieDAO.getConnection;
import POJO.Contact_us;
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
public class Contact_usDAO {
    
    public static Connection getConnection() throws SQLException{  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver"); 
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root"; 
            con = (Connection) DriverManager.getConnection(mysqlURL);
        }catch(ClassNotFoundException | SQLException e){System.out.println(e);}  
        return con;  
    }
     
    public static void insert(Contact_us obj) throws FileNotFoundException, SQLException{
        
        Connection con = getConnection();
        
        try {
            String sql = "INSERT INTO contact_us (full_name,email,subject,message) "+ "VALUES (?, ?, ?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1,obj.getFull_name());
            st.setString(2,obj.getEmail());
            st.setString(3,obj.getSubject());
            st.setString(4,obj.getMessage());
            
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
    
    public static List<Contact_us> viewData() throws SQLException{  
        List<Contact_us> list=new ArrayList<Contact_us>();  

        Connection con = getConnection();
        
        try{
            String sql = "select * from contact_us";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Contact_us obj=new Contact_us();
                
                obj.setContact_us_id(rs.getInt(1));
                obj.setFull_name(rs.getString(2));
                obj.setEmail(rs.getString(3));
                obj.setSubject(rs.getString(4));
                obj.setMessage(rs.getString(5));
 
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
}
