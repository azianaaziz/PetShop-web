package cn.techtutorial.model;

public class Order {
    private int orderId;
    private String productCode;
    private int userId;
    private String name;
    private String category;
    private int quantity;
    private double price;
    private String date;
    private String paymentMethod; // ✅ Added to match servlet usage

    public Order() {}

    public Order(int orderId, String productCode, int userId, String name, String category, int quantity, double price, String date, String paymentMethod) {
        this.orderId = orderId;
        this.productCode = productCode;
        this.userId = userId;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
        this.paymentMethod = paymentMethod;
    }

    // Getters and Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public String getProductCode() { return productCode; }
    public void setProductCode(String productCode) { this.productCode = productCode; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
}
