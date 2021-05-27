/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

/**
 *
 * @author Ankit Chauhan
 */
public class User {
    
    int user_id;
    String full_name;
    String email;
    String phone;
    String password;
    String image;
    String address;
    String type;

    public User(int user_id, String full_name, String email, String phone, String password, String image, String address, String type) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.image = image;
        this.address = address;
        this.type = type;
    }
    
    
    public User(String full_name, String email, String phone, String password, String image, String address, String type) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.image = image;
        this.address = address;
        this.type = type;
    }

    public User() {
    }

        public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
      
    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    
}
