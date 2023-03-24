package model;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;


public class Order {
    private int orderID;
    private double total;
    private Date createAt;
    private Account account;
    public Order() {
    }

    public Order(int orderID, double total, Date createAt, Account account) {
        this.orderID = orderID;
        this.total = total;
        this.createAt = createAt;
        this.account = account;
    }


    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
    
    public String getPriceFormat(){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(total);
    }
    
    public String getDate() {
        java.util.Date utilDate = new java.util.Date(createAt.getTime());
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
        return f.format(utilDate);
    }
    
    
    
}
