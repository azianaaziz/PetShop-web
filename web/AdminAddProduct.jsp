<%-- 
    Document   :
    Created on : Jun 15, 2024, 2:00:17 AM
    Author     : FAQIHAH
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add-product.css">
</head>
<body>
    
    <h1>Add New Product</h1>
    <form method="post" action="<%=request.getContextPath()%>/admin?action=insert" enctype="multipart/form-data">
        <div class="form-row">
            <label for="product_code">Product Code:</label>
            <input type="text" id="product_code" name="product_code" required>
        </div>
        <div class="form-row">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-row">
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
        </div>
        <div class="form-row">
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required>
        </div>
        <div class="form-row">
            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required>
        </div>
        <input type="submit" value="Submit" class="button-primary">
        <input type="reset" value="Reset" class="button-secondary">
        <button type="button" onclick="history.back();" class="button-secondary">Back</button>
    </form>
</body>
</html>




