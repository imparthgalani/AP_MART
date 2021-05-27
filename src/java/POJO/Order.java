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
public class Order {
    int order_list_id;
    int order_id;
    int shop_id;
    String shop_name;
    String custmore_name;
    String phone;
    String alt_phone;
    String order_time;
    String order_plc_time;
    int delivery_time;
    String paymentmethod;
    String title;
    String order_address;
    int status;
    String servicer_name;
    String upadte_time;

    public Order() {
    }

    public int getOrder_list_id() {
        return order_list_id;
    }

    public String getUpadte_time() {
        return upadte_time;
    }

    public void setUpadte_time(String upadte_time) {
        this.upadte_time = upadte_time;
    }
    
    public String getOrder_plc_time() {
        return order_plc_time;
    }

    public void setOrder_plc_time(String order_plc_time) {
        this.order_plc_time = order_plc_time;
    }

    public String getServicer_name() {
        return servicer_name;
    }

    public void setServicer_name(String servicer_name) {
        this.servicer_name = servicer_name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
    
    public void setOrder_list_id(int order_list_id) {
        this.order_list_id = order_list_id;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }
    
    

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getCustmore_name() {
        return custmore_name;
    }

    public void setCustmore_name(String custmore_name) {
        this.custmore_name = custmore_name;
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

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }
    
    
}
