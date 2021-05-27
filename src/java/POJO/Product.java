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
public class Product {
    
    int product_id;
    int category_id;
    String category_name;
    String name;
    String description;
    String image;

    public Product(int category_id, String name, String description, String image) {
        this.category_id = category_id;
        this.name = name;
        this.description = description;
        this.image = image;
    }

    public Product() {
    }

    public Product(int product_id, int category_id, String name, String description, String image) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.name = name;
        this.description = description;
        this.image = image;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getCategory_name(){
        return category_name;
    }
     
}
