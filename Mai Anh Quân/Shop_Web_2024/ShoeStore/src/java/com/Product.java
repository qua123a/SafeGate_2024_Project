package com;

public class Product {
    private int productID;
    private String productName;
    private String description;
    private double price;
    private String image;

    public Product() {}

    public Product(int productID, String productName, double price, String image) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.image = image;
    }

    // Getters and setters
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
