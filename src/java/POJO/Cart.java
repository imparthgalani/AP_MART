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
public class Cart {

    int cart_id;
    int user_id;
    int shop_product_id;
    int quantity;
    int shop_id;
    String shop_name;
    String product_name;
    int mrp;
    int discount_mrp;
    int cart_quantity;
    int product_quantity;
    String product_image;
    int discount;
    int net_weigth;
    String unit;

    public Cart(int user_id, int shop_product_id, int quantity) {
        this.user_id = user_id;
        this.shop_product_id = shop_product_id;
        this.quantity = quantity;
    }

    public int getNet_weigth() {
        return net_weigth;
    }

    public void setNet_weigth(int net_weigth) {
        this.net_weigth = net_weigth;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
    
    public int getShop_id() {
        return shop_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getMrp() {
        return mrp;
    }

    public void setMrp(int mrp) {
        this.mrp = mrp;
    }

    public int getDiscount_mrp() {
        return discount_mrp;
    }

    public void setDiscount_mrp(int discount_mrp) {
        this.discount_mrp = discount_mrp;
    }

    public int getCart_quantity() {
        return cart_quantity;
    }

    public void setCart_quantity(int cart_quantity) {
        this.cart_quantity = cart_quantity;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public Cart() {
    }

    public int getCart_id() {
        return cart_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
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

}
