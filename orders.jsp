<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
User auth = (User) session.getAttribute("auth");
if (auth == null) {
    response.sendRedirect("login.jsp");
    return;
}
OrderDao orderDao  = new OrderDao(application);
List<Order> orders = orderDao.userOrders(auth.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Orders</title>
</head>
<body>
<h3>Your Orders</h3>
<table border="1">
    <tr>
        <th>Date</th><th>Name</th><th>Category</th><th>Quantity</th><th>Price</th><th>Action</th>
    </tr>
    <% for (Order o : orders) { %>
    <tr>
        <td><%= o.getDate() %></td>
        <td><%= o.getName() %></td>
        <td><%= o.getCategory() %></td>
        <td><%= o.getQuantity() %></td>
        <td><%= dcf.format(o.getPrice()) %></td>
        <td><a href="cancel-order?id=<%= o.getOrderId() %>">Cancel</a></td>
    </tr>
    <% } %>
</table>
</body>
</html>
