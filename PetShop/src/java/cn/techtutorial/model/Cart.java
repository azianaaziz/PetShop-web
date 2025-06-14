package cn.techtutorial.model;

public class Cart {
    private String productCode;
    private String name;
    private double price;
    private String image;
    private int quantity;
    private String category;

    public Cart() {
        
    }
    
    public Cart(String productCode, String name, double price, String image, int quantity, String category) {
        this.productCode = productCode;
        this.name = name;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.category = category;
    }
    
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    

   
}