<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/master.css">
    <style>
        body {
            background-image: url("img/kucing1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
        }

        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: var(--primary);
        }

        .login-container form {
            display: flex;
            flex-direction: column;
        }

        .login-container form .input-group {
            margin-bottom: 15px;
        }

        .login-container form .input-group label {
            display: block;
            margin-bottom: 5px;
            color: var(--bg);
        }

        .login-container form .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-container form button {
            padding: 10px;
            font-size: 18px;
            background-color: var(--primary);
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-container form button:hover {
            background-color: #a6764a;
        }

        .login-container p {
            text-align: center;
            margin-top: 20px;
            color: var(--bg);
        }

        .login-container p a {
            color: var(--primary);
            text-decoration: none;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
        <form action="LoginServlet" method="post">
            <input type="hidden" name="action" value="login">
            <div class="input-group">
                <label for="username" style="color: white;">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password" style="color: white;">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <p style="color: white;">Don't have an account? <a href="registration.jsp">Register here</a></p>
    </div>
</body>
</html>
