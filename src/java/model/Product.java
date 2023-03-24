/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 *
 * @author Dell
 */
public class Product {
    private int productID;
    private String productName;
    private double price;
    private int quantity;
    private String meters;
    private String color;
    private String wattage;
    private String chip;
    private String nguondien;
    private String nhietdomau;
    private int loiday;
    private String kichthuoc;
    private String tuoitho;
    private String dienap;
    private String chiutai;
    private String image;
    private int baohanh;
    private Date productcreatetime;
    private Category cate;
    private Producer prod;

    public Product() {
    }

    public Product(int productID, String productName, double price, int quantity, String meters, String color, String wattage, String chip, String nguondien, String nhietdomau, int loiday, String kichthuoc, String tuoitho, String dienap, String chiutai, String image, int baohanh, Date productcreatetime, Category cate, Producer prod) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.meters = meters;
        this.color = color;
        this.wattage = wattage;
        this.chip = chip;
        this.nguondien = nguondien;
        this.nhietdomau = nhietdomau;
        this.loiday = loiday;
        this.kichthuoc = kichthuoc;
        this.tuoitho = tuoitho;
        this.dienap = dienap;
        this.chiutai = chiutai;
        this.image = image;
        this.baohanh = baohanh;
        this.productcreatetime = productcreatetime;
        this.cate = cate;
        this.prod = prod;
    }

    public Product(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMeters() {
        return meters;
    }

    public void setMeters(String meters) {
        this.meters = meters;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getWattage() {
        return wattage;
    }

    public void setWattage(String wattage) {
        this.wattage = wattage;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public String getNguondien() {
        return nguondien;
    }

    public void setNguondien(String nguondien) {
        this.nguondien = nguondien;
    }

    public String getNhietdomau() {
        return nhietdomau;
    }

    public void setNhietdomau(String nhietdomau) {
        this.nhietdomau = nhietdomau;
    }

    public int getLoiday() {
        return loiday;
    }

    public void setLoiday(int loiday) {
        this.loiday = loiday;
    }

    public String getKichthuoc() {
        return kichthuoc;
    }

    public void setKichthuoc(String kichthuoc) {
        this.kichthuoc = kichthuoc;
    }

    public String getTuoitho() {
        return tuoitho;
    }

    public void setTuoitho(String tuoitho) {
        this.tuoitho = tuoitho;
    }

    public String getDienap() {
        return dienap;
    }

    public void setDienap(String dienap) {
        this.dienap = dienap;
    }

    public String getChiutai() {
        return chiutai;
    }

    public void setChiutai(String chiutai) {
        this.chiutai = chiutai;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getBaohanh() {
        return baohanh;
    }

    public void setBaohanh(int baohanh) {
        this.baohanh = baohanh;
    }

    public Date getProductcreatetime() {
        return productcreatetime;
    }

    public void setProductcreatetime(Date productcreatetime) {
        this.productcreatetime = productcreatetime;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public Producer getProd() {
        return prod;
    }

    public void setProd(Producer prod) {
        this.prod = prod;
    }
    
    public String getPriceFormat(){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(price);
    }
    
    public String getDate() {
        java.util.Date utilDate = new java.util.Date(productcreatetime.getTime());
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(utilDate);
    }
    
    
    
    
}
