/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author MSI
 */
public class Chapter {
    private Comic comic ;
    private String chapname ;
    private int view ;
    private Date publicdate ;
    private int chapid ;

    public Chapter() {
    }

    public Chapter(Comic comic, String chapname, int view, Date publicdate, int chapid) {
        this.comic = comic;
        this.chapname = chapname;
        this.view = view;
        this.publicdate = publicdate;
        this.chapid = chapid;
    }

    public Comic getComic() {
        return comic;
    }

    public void setComic(Comic comic) {
        this.comic = comic;
    }

    public String getChapname() {
        return chapname;
    }

    public void setChapname(String chapname) {
        this.chapname = chapname;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public Date getPublicdate() {
        return publicdate;
    }

    public void setPublicdate(Date publicdate) {
        this.publicdate = publicdate;
    }

    public int getChapid() {
        return chapid;
    }

    public void setChapid(int chapid) {
        this.chapid = chapid;
    }
    
}
