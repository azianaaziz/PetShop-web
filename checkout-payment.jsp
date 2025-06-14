<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    User auth = (User) session.getAttribute("auth");
    if(auth == null){
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    double total = 0.0;

    if(cart_list != null && !cart_list.isEmpty()){
        cn.techtutorial.dao.ProductDao pDao = new cn.techtutorial.dao.ProductDao(cn.techtutorial.connection.DbCon.getConnection());
        List<Cart> cartProduct = pDao.getCartProducts(cart_list);

        for(Cart c : cartProduct){
            total += c.getPrice() * c.getQuantity();
        }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout & Payment</title>
</head>
<body>
    <h2>Checkout & Payment</h2>
    <p>Welcome, <%= auth.getName() %>! Please review your order and select payment method:</p>

    <table border="1">
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Price (RM)</th>
            <th>Quantity</th>
            <th>Subtotal (RM)</th>
        </tr>
        <% for(Cart c : cartProduct){ %>
        <tr>
            <td><%= c.getName() %></td>
            <td><%= c.getCategory() %></td>
            <td>RM <%= dcf.format(c.getPrice()) %></td>
            <td><%= c.getQuantity() %></td>
            <td>RM <%= dcf.format(c.getPrice() * c.getQuantity()) %></td>
        </tr>
        <% } %>
    </table>

    <h3>Total Amount: RM <%= dcf.format(total) %></h3>

    <form action="checkout-payment" method="post">
        <h4>Select Payment Method:</h4>
        <input type="radio" name="paymentMethod" value="Credit Card" required> Credit Card<br>
        <input type="radio" name="paymentMethod" value="Online Banking"> Online Banking<br>
        <input type="radio" name="paymentMethod" value="Cash on Delivery"> Cash on Delivery<br><br>
        <input type="submit" value="Confirm and Pay">
    </form>
</body>
</html>
<%
    } else {
        response.sendRedirect("cart.jsp");
    }
%>
