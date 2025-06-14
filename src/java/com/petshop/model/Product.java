package com.petshop.model;

import java.util.Base64;

public class Product {
    private String productCode;
    private String name;
    private String description;
    private double price;
    private byte[] image; // Stored as byte[]

    // Constructor
    public Product(String productCode, String name, String description, double price, byte[] image) {
        this.productCode = productCode;
        this.name = name;
        this.description = description;
        this.price = price;
        this.image = image;
    }

    // Empty constructor if needed
    public Product() {}

    // Getters and Setters
    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) { // fixed setter name
        this.image = image;
    }

    // Required for your JSP to display the image
    public String getBase64Image() {
        if (image != null && image.length > 0) {
            return Base64.getEncoder().encodeToString(image);
        } else {
            return ""; // Return empty string if no image
        }
    }

    @Override
    public String toString() {
        return "Product{" +
                "productCode='" + productCode + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", image=" + (image != null ? "[DATA]" : "null") +
                '}';
    }
}
