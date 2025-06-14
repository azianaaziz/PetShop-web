<%@page import="cn.techtutorial.model.User"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%-- 
    Document   : index
    Created on : 25 Jun 2024, 2:29:14 am
    Author     : mzhar
--%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}

String url = "jdbc:mysql://localhost:3306/petshop";
String username = "root";
String password = "admin";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    stmt = conn.createStatement();
    String sql = "SELECT * FROM products";
    rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>Pet Shop</title>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container">
        <div class="card-header my-3">All Products</div>
        <div class="row">
            <%
            while (rs.next()) {
                String productCode = rs.getString("product_code");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
            %>
            <div class="col-md-3 my-3">
                <div class="card w-100">
                    <img class="card-img-top" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(rs.getBytes("image")) %>" alt="<%= name %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= name %></h5>
                        <h6 class="price">Price: RM <%= price %></h6>
                        <p class="description"><%= description %></p>
                        <div class="mt-3 d-flex justify-content-between">
                            <a class="btn btn-dark" href="add-to-cart?id=<%= productCode %>">Add to Cart</a>
                            <a class="btn btn-primary" href="order-now?quantity=1&id=<%= productCode %>">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>

<%
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException se) {
        se.printStackTrace();
    }
}
%>
