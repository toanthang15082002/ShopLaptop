/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thang
 */
public class Bill {
    private int id;
    private int accID;
    private int amount;

    public Bill() {
    }

    public Bill(int id, int accID, int amount) {
        this.id = id;
        this.accID = accID;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", accID=" + accID + ", amount=" + amount + '}';
    }
    
    
}
