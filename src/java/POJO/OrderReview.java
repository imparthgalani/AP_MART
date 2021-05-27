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
public class OrderReview {
    int user_id;
    int order_list_id;
    int shop_product_id;
    int star;
    String custmore_name;
    String email;
    String message;
    String time;
    String image;

    public OrderReview() {
    }

    public OrderReview(int user_id,int order_list_id, int shop_product_id, int star, String custmore_name, String email, String message) {
        this.user_id = user_id;
        this.order_list_id = order_list_id;
        this.shop_product_id = shop_product_id;
        this.star = star;
        this.custmore_name = custmore_name;
        this.email = email;
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public int getOrder_list_id() {
        return order_list_id;
    }

    public void setOrder_list_id(int order_list_id) {
        this.order_list_id = order_list_id;
    }
    
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getShop_product_id() {
        return shop_product_id;
    }

    public void setShop_product_id(int shop_product_id) {
        this.shop_product_id = shop_product_id;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    
}
