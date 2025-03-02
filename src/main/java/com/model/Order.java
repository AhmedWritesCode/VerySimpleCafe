package com.model;

import java.io.Serializable;

public class Order implements Serializable {
    private int set1Quantity;
    private int set2Quantity;
    private String drink1;
    private String drink2;

    // Constructor
    public Order() {
    }

    // Getters and Setters
    public int getSet1Quantity() {
        return set1Quantity;
    }

    public void setSet1Quantity(int set1Quantity) {
        this.set1Quantity = set1Quantity;
    }

    public int getSet2Quantity() {
        return set2Quantity;
    }

    public void setSet2Quantity(int set2Quantity) {
        this.set2Quantity = set2Quantity;
    }

    public String getDrink1() {
        return drink1;
    }

    public void setDrink1(String drink1) {
        this.drink1 = drink1;
    }

    public String getDrink2() {
        return drink2;
    }

    public void setDrink2(String drink2) {
        this.drink2 = drink2;
    }

    // Calculate total price based on selections
    public double calculateTotalPrice() {
        double total = 0;
        if (set1Quantity > 0) {
            if (drink1.equals("coffee")) {
                total += set1Quantity * 10.00;
            } else if (drink1.equals("milo")) {
                total += set1Quantity * 13.00;
            }
        }

        if (set2Quantity > 0) {
            if (drink2.equals("coffee")) {
                total += set2Quantity * 11.00;
            } else if (drink2.equals("milo")) {
                total += set2Quantity * 15.00;
            } else if (drink2.equals("lemon tea")) {
                total += set2Quantity * 12.00;
            }
        }
        return total;
    }
}