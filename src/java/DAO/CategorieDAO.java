/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Categorie;
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
public class CategorieDAO {
    public static Connection getConnection() throws SQLException{  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver"); 
            String mysqlURL = "jdbc:mysql://localhost:3306/ap_mart?user=root"; 
            con = (Connection) DriverManager.getConnection(mysqlURL);
        }catch(ClassNotFoundException | SQLException e){System.out.println(e);}  
        return con;  
    }
     
    public static void insert(Categorie obj) throws FileNotFoundException, SQLException{
        
        Connection con = getConnection();
        
        try {
            String sql = "INSERT INTO categories (name,image) "+ "VALUES (?, ?)";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1,obj.getName());
            st.setString(2,obj.getImage());
            
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
    
    public static List<Categorie> viewData() throws FileNotFoundException, SQLException{  
        List<Categorie> list=new ArrayList<Categorie>();  
         
        Connection con = getConnection();
        
        try{  
            String sql = "select * from categories";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Categorie obj=new Categorie();
                
                obj.setCategories_id(rs.getInt(1));
                obj.setName(rs.getString(2));
                obj.setImage(rs.getString(3));
 
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
    
    public static Categorie viewData(int category_id) throws SQLException{  
        
        Categorie obj=new Categorie();
        
        Connection con = getConnection();
        
        try{ 
            String sql = "select * from categories where categories_id = ?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1,category_id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                obj.setCategories_id(rs.getInt(1));
                obj.setName(rs.getString(2));
                obj.setImage(rs.getString(3)); 
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
    
    public static void delete(int categories_id) throws SQLException
    {
        
        Connection con = getConnection();
        try {
            String sql = "delete from categories where categories_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,categories_id);  
              
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
     
     public static void update(Categorie obj) throws FileNotFoundException, SQLException{
         
         Connection con = getConnection();
         
         try {
 
           
            String sql = "update categories set name=?, image=? where categories_id=?";

            java.sql.PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,obj.getName());
            st.setString(2,obj.getImage());
            st.setInt(3,obj.getCategories_id());
 
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
