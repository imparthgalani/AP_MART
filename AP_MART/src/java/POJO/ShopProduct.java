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
public class ShopProduct {
    int shop_product_id;
    int shop_id;
    int product_id;
    int mrp;
    int discount_mrp;
    int net_weigth;
    String unit; 
    int quantity;
    String shop_name;
    String product_name;
    String product_image;
    int discount;
    String product_description;
    String category_name;
    int category_id;
    String opening_time;
    String closing_time;
    String shop_status;

    public ShopProduct(int shop_id, int product_id, int mrp, int discount_mrp,int net_weigth,String unit, int quantity) {
        this.shop_id = shop_id;
        this.product_id = product_id;
        this.mrp = mrp;
        this.discount_mrp = discount_mrp;
        this.net_weigth=net_weigth;
        this.unit=unit;
        this.quantity = quantity;
    }

    public ShopProduct() {
    }

    public ShopProduct(int shop_product_id, int shop_id, int product_id, int mrp, int discount_mrp, int net_weigth, String unit, int quantity) {
        this.shop_product_id = shop_product_id;
        this.shop_id = shop_id;
        this.product_id = product_id;
        this.mrp = mrp;
        this.discount_mrp = discount_mrp;
        this.net_weigth=net_weigth;
        this.unit=unit;
        this.quantity = quantity;
    }

    public int getShop_product_id() {
        return shop_product_id;
    }

    public void setShop_product_id(int shop_product_id) {
        this.shop_product_id = shop_product_id;
    }

    public String getShop_status() {
        return shop_status;
    }

    public void setShop_status(String shop_status) {
        this.shop_status = shop_status;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
    
    public String getProduct_name() {
        return product_name;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
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

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

   

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
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
    
}
