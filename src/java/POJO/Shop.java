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
public class Shop {
    
    int shop_id;
    int shop_owner_id ;
    String name;
    String email;
    String phone;
    String location;
    String opening_time;
    String closing_time;
    String status;
    String address;
    String image;
    String shop_owner_name;
    String shop_owner_image;

    public Shop(int shop_owner_id, String name, String email, String phone, String location, String opening_time, String closing_time,String status, String address,  String image) {
        this.shop_owner_id = shop_owner_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.location = location;
        this.opening_time = opening_time;
        this.closing_time = closing_time;
        this.status = status;
        this.address = address;
        this.image = image;
    }

    public Shop(int shop_id, int shop_owner_id, String name, String email, String phone, String location, String opening_time, String closing_time,String status, String address, String image) {
        this.shop_id = shop_id;
        this.shop_owner_id = shop_owner_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.location = location;
        this.opening_time = opening_time;
        this.closing_time = closing_time;
        this.status = status;
        this.address = address;
        this.image = image;
    }
    
    

    public Shop() {
    }

    public int getShop_id() {
        return shop_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getShop_owner_id() {
        return shop_owner_id;
    }

    public void setShop_owner_id(int shop_owner_id) {
        this.shop_owner_id = shop_owner_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }


    public String getOpening_time() {
        return opening_time;
    }

    public void setOpening_time(String opening_time) {
        this.opening_time = opening_time;
    }

    public String getClosing_time() {
        return closing_time;
    }

    public void setClosing_time(String closing_time) {
        this.closing_time = closing_time;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setShop_owner_name(String shop_owner_name) {
        this.shop_owner_name = shop_owner_name;
    }
    
    public String getShop_owner_name() {
        return shop_owner_name;
    }

    public void setShop_owner_image(String shop_owner_image) {
        this.shop_owner_image = shop_owner_image;
    }
    
    public String getShop_owner_image() {
        return shop_owner_image;
    }

}
