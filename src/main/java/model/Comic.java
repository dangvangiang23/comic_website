/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author MSI
 */
public class Comic {
    private int cid ;
    private String cname ;
    private String description ;
    private String cimage;
    private Author author;
    private String status ;
    private ArrayList<Category> categories ;

    public Comic() {
    }

    public Comic(int cid, String cname, String description, String cimage, Author author, String status, ArrayList<Category> categories) {
        this.cid = cid;
        this.cname = cname;
        this.description = description;
        this.cimage = cimage;
        this.author = author;
        this.status = status;
        this.categories = categories;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCimage() {
        return cimage;
    }

    public void setCimage(String cimage) {
        this.cimage = cimage;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<Category> getCategories() {
        return categories;
    }

    public void setCategories(ArrayList<Category> categories) {
        this.categories = categories;
    }

   
   
    
}
