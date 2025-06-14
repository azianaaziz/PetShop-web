<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%
    User auth = (User) session.getAttribute("auth");
    if(auth == null){
        response.sendRedirect("login.jsp");
        return;
    }

    String paymentMethod = request.getAttribute("paymentMethod") != null ? (String) request.getAttribute("paymentMethod") : "Not specified";
    List<Map<String, Object>> checkoutItems = (List<Map<String, Object>>) session.getAttribute("checkoutItems");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Confirmation</title>
</head>
<body>
    <h2>Payment Successful!</h2>
    <p>Thank you, <%= auth.getName() %>! Your order has been placed using <strong><%= paymentMethod %></strong>.</p>

    <h3>Order Summary:</h3>
    <ul>
        <% if(checkoutItems != null){
            for(Map<String, Object> item : checkoutItems){ %>
                <li><%= item.get("name") %> - Quantity: <%= item.get("quantity") %></li>
        <% } } %>
    </ul>

    <a href="home.jsp">Back to Home</a>
</body>
</html>
