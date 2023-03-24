/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
import java.text.SimpleDateFormat;
/**
 *
 * @author Dell
 */
public class Profiles {
    private int accountID;
    private String firstName;
    private String lastName;
    private String avatar;
    private String country;
    private String address;
    private Date birthday;
    private String phone;
    private int gender;

    public Profiles() {
    }

    public Profiles(int accountID, String firstName, String lastName, String avatar, String country, String address, Date birthday, String phone, int gender) {
        this.accountID = accountID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
        this.country = country;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.gender = gender;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }
    
    public String getFullName(){
        return firstName + " " + lastName;
    }
    
    public String getDate() {
        java.util.Date utilDate = new java.util.Date(birthday.getTime());
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(utilDate);
    }
    
}
