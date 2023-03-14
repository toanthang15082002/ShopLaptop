/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thang
 */
public class Cart {

    private List<Item> item;

    public Cart() {
        item = new ArrayList<>();
    }

    public Cart(List<Item> item) {
        this.item = item;
    }

    public List<Item> getItem() {
        return item;
    }

    public void setItem(List<Item> item) {
        this.item = item;
    }

    public int getQuantityByID(int id) {
        return getItemByID(id).getQuantity();
    }

    private Item getItemByID(int id) {
        for (Item item : item) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(Item o) {
        if (getItemByID(o.getProduct().getId()) != null) {
            Item item = getItemByID(o.getProduct().getId());
            item.setQuantity(item.getQuantity() + o.getQuantity());
        } else {
            item.add(o);
        }
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            item.remove(getItemByID(id));
        }
    }

    public int getAmount() {
        int amount = 0;
        for (Item item : item) {
            int price = item.getProduct().getPrice();
            amount += (item.getQuantity() * price);
        }
        return amount;
    }

}
