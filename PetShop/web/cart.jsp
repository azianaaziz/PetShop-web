<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%
    List<Cart> cartList = (List<Cart>) session.getAttribute("cart-list");
    if(cartList == null) {
        cartList = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html>
<head><title>Cart</title></head>
<body>
<h3>Your Cart</h3>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Quantity</th>
    </tr>
    <% for(Cart c : cartList) { %>
    <tr>
        <td><%= c.getName() %></td>
        <td><%= c.getCategory() %></td>
        <td><%= c.getPrice() %></td>
        <td><%= c.getQuantity() %></td>
    <td>
        <!-- Increase quantity -->
        <form action="checkout-servlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="increase">
            <input type="hidden" name="productCode" value="<%= c.getProductCode() %>">
            <button type="submit">+</button>
        </form>

        <!-- Decrease quantity -->
        <form action="checkout-servlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="decrease">
            <input type="hidden" name="productCode" value="<%= c.getProductCode() %>">
            <button type="submit">-</button>
        </form>

        <!-- Remove item -->
        <form action="checkout-servlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="remove">
            <input type="hidden" name="productCode" value="<%= c.getProductCode() %>">
            <button type="submit">Remove</button>
        </form>
    </td>

    </tr>
    <% } %>
</table>

<% if(!cartList.isEmpty()) { %>
    <form action="checkout-servlet" method="post">
        <input type="hidden" name="action" value="checkout">
        <input type="submit" value="Checkout All Items">
    </form>

<% } else { %>
    <p>Your cart is empty.</p>
<% } %>

</body>
</html>

