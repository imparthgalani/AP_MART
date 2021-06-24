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
public class Contact_us {
    int contact_us_id;
    String full_name;
    String email;
    String subject;
    String message;

    public Contact_us(String full_name, String email, String subject, String message) {
        this.full_name = full_name;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    public int getContact_us_id() {
        return contact_us_id;
    }

    public void setContact_us_id(int contact_us_id) {
        this.contact_us_id = contact_us_id;
    }

    public Contact_us() {
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

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    
}
