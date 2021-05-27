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
public class DeliveryAddress {
    int delivery_address_id;
    int user_id;
    String title;
    int flat;
    String street;
    int pincode;
    String locality;

    public DeliveryAddress(int user_id, String title, int flat, String street, int pincode, String locality) {
        this.user_id = user_id;
        this.title = title;
        this.flat = flat;
        this.street = street;
        this.pincode = pincode;
        this.locality = locality;
    }

    public DeliveryAddress(int delivery_address_id, int user_id, String title, int flat, String street, int pincode, String locality) {
        this.delivery_address_id = delivery_address_id;
        this.user_id = user_id;
        this.title = title;
        this.flat = flat;
        this.street = street;
        this.pincode = pincode;
        this.locality = locality;
    }
    

    public DeliveryAddress() {
    }
    
    public int getDelivery_address_id() {
        return delivery_address_id;
    }

    public void setDelivery_address_id(int delivery_address_id) {
        this.delivery_address_id = delivery_address_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getFlat() {
        return flat;
    }

    public void setFlat(int flat) {
        this.flat = flat;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public int getPincode() {
        return pincode;
    }

    public void setPincode(int pincode) {
        this.pincode = pincode;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }
    
    
}
