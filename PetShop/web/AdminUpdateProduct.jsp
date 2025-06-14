<%-- 
    Document   : AddminUpdateProduct
    Created on : Jun 24, 2024, 1:34:17 PM
    Author     : FAQIHAH
--%>


<%@page import="com.petshop.model.Product"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/update-product.css">
</head>
<body>
<h1>Update Product</h1>
<%
    Product product = (Product) request.getAttribute("product");
%>
<form action="<%=request.getContextPath()%>/admin" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="product_code" value="<%= product.getProductCode() %>">
    <div>
        <label>Name:</label>
        <input type="text" name="name" value="<%= product.getName() %>" required>
    </div>
    <div>
        <label>Description:</label>
        <textarea name="description" required><%= product.getDescription() %></textarea>
    </div>
    <div>
        <label>Price:</label>
        <input type="text" name="price" value="<%= product.getPrice() %>" required>
    </div>
    <div>
        <label>Current Image:</label>
        <img src="data:image/jpeg;base64,<%= product.getBase64Image() %>" height="100" width="100">
        <label>Update Image:</label>
        <input type="file" name="image">
    </div>
    <div>
        <button type="submit">Update Product</button>
    </div>
</form>
<a href="<%=request.getContextPath()%>/admin?action=list">Cancel</a>
</body>
</html>
