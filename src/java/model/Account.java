/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class Account {
    private int accountID;
    private String userName;
    private String password;
    private double amount;
    private String email;
    private int role;
    private Profiles pro;

    public Account() {
    }

    public Account(int accountID, String userName, String password, double amount, String email, int role, Profiles pro) {
        this.accountID = accountID;
        this.userName = userName;
        this.password = password;
        this.amount = amount;
        this.email = email;
        this.role = role;
        this.pro = pro;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Profiles getPro() {
        return pro;
    }

    public void setPro(Profiles pro) {
        this.pro = pro;
    }
    
    public String getFullname(){
        return pro.getFirstName() + " "  + pro.getLastName();
    }
}
