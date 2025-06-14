<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-image: url("img/kucing1.jpg");
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        .confirmation-container {
            text-align: center;
            padding: 20px;
            background-color: black;
            border-radius: 5px;
        }
        .confirmation-container h2 {
            color: #b6895b;
        }
        .confirmation-container button {
            padding: 10px 20px;
            margin-top: 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Thank you for your order!</h2>
        <p>Your order number is: <%= request.getAttribute("orderId") %></p>
        <button onclick="location.href='home.jsp'">Okay</button>
    </div>
</body>
</html>
