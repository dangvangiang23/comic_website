/*
 * Copyright(C) 2022, Nguyen The Minh.
 * Code: J1.S.P0071 (150 LOC)
 * Title: Task management program of CCRM project.
 */
package model;

/**
 *
 * @author vietd
 */
public class Account {

    private int accountid;
    private String username;
    private String password;
    private boolean role;

    public Account() {
    }

    public Account(int accountid, String username, String password, boolean role) {
        this.accountid = accountid;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getAccountid() {
        return accountid;
    }

    public void setAccountid(int accountid) {
        this.accountid = accountid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

 
   

}
