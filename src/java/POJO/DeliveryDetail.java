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
public class DeliveryDetail {
    int delivery_detail_id ;
    String custmore_name;
    String email;
    String phone;
    String alt_phone;
    int delivery_address_id;
    int delivery_time;
    String paymentmethod;

    public DeliveryDetail(int delivery_detail_id, String custmore_name, String email, String phone, String alt_phone, int delivery_address_id, int delivery_time, String paymentmethod) {
        this.delivery_detail_id = delivery_detail_id;
        this.custmore_name = custmore_name;
        this.email = email;
        this.phone = phone;
        this.alt_phone = alt_phone;
        this.delivery_address_id = delivery_address_id;
        this.delivery_time = delivery_time;
        this.paymentmethod = paymentmethod;
    }

    public DeliveryDetail() {
    }

    
    
    public int getDelivery_detail_id() {
        return delivery_detail_id;
    }

    public void setDelivery_detail_id(int delivery_detail_id) {
        this.delivery_detail_id = delivery_detail_id;
    }

    public String getCustmore_name() {
        return custmore_name;
    }

    public void setCustmore_name(String custmore_name) {
        this.custmore_name = custmore_name;
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

    public String getAlt_phone() {
        return alt_phone;
    }

    public void setAlt_phone(String alt_phone) {
        this.alt_phone = alt_phone;
    }

    public int getDelivery_address_id() {
        return delivery_address_id;
    }

    public void setDelivery_address_id(int delivery_address_id) {
        this.delivery_address_id = delivery_address_id;
    }

    public int getDelivery_time() {
        return delivery_time;
    }

    public void setDelivery_time(int delivery_time) {
        this.delivery_time = delivery_time;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }
    
    
}
