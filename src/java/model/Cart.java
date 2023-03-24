/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Dell
 */
public final class Cart {
    List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }
    

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemByID(int ID) {
        for (Item item : items) {
            if (item.getProduct().getProductID() == ID) {
                return item;
            }
        }
        return null;
    }

    public int getQuantityByID(int ID) {
        return getItemByID(ID).getQuantity();
    }

    public double getTotalMoney() {
        double total = 0;
        for (Item item : items) {
            total += item.getTotalMoney();
        }
        return total;
    }
    
    public String getTotalMoneyFormat(){
        Locale vn = new Locale("vi", "VN");
        NumberFormat f = NumberFormat.getInstance(vn);
        return f.format(getTotalMoney());
    }

    public void addItem(Item item) {
        if (getItemByID(item.getProduct().getProductID()) != null) {
            Item addItem = getItemByID(item.getProduct().getProductID());
            addItem.setQuantity(addItem.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }

    public void removeItem(int productID) {
        if (getItemByID(productID) != null) {
            items.remove(getItemByID(productID));
        }
    }

    private Product getProductByID(int ID, List<Product> list) {
        for (Product item : list) {
            if (item.getProductID() == ID) {
                return item;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {

            if (txt != null && txt.length() != 0) {
                String[] itemLines = txt.split("-");

                for (String itemLine : itemLines) {
                    String[] itemDetails = itemLine.split("_");

                    int id = Integer.parseInt(itemDetails[0]);

                    int quantity = Integer.parseInt(itemDetails[1]);

                    Product product = getProductByID(id, list);

                    Item newItem = new Item(product, product.getPrice(), quantity);

                    if (getItemByID(newItem.getProduct().getProductID()) != null) {
                        Item oldItem = getItemByID(newItem.getProduct().getProductID());
                        oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
                    } else {
                        items.add(newItem);
                    }
                }
            }

        } catch (NumberFormatException e) {
            System.out.println(e + "Cart");
        }
    }
}
