/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thang
 */
public class QuantityProductByCategory {
    private String name;
    private String numCate;

    public QuantityProductByCategory() {
    }

    public QuantityProductByCategory(String name, String numCate) {
        this.name = name;
        this.numCate = numCate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumCate() {
        return numCate;
    }

    public void setNumCate(String numCate) {
        this.numCate = numCate;
    }
    
    
}
