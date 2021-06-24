/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ankit Chauhan
 */

package POJO;

public class CancelOrder {
    int order_list_id;
    int shop_product_id;
    String reason;
    String comment;

    public CancelOrder() {
    }

    public CancelOrder(int order_list_id, int shop_product_id, String reason, String comment) {
        this.order_list_id = order_list_id;
        this.shop_product_id = shop_product_id;
        this.reason = reason;
        this.comment = comment;
    }

    
    
    public int getOrder_list_id() {
        return order_list_id;
    }

    public void setOrder_list_id(int order_list_id) {
        this.order_list_id = order_list_id;
    }

    public int getShop_product_id() {
        return shop_product_id;
    }

    public void setShop_product_id(int shop_product_id) {
        this.shop_product_id = shop_product_id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
}
