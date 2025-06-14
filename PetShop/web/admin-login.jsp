<%@ page import="com.petshop.model.adminDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // LOGIN LOGIC BEFORE HTML OUTPUT!
    String errorMessage = null;
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        adminDAO dao = new adminDAO();
        boolean isValid = dao.validateLogin(username, password);

        if (isValid) {
            session.setAttribute("user", username);
            response.sendRedirect("redirect.jsp");
            return; // Important to stop further JSP processing!
        } else {
            errorMessage = "Invalid username or password.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin-login.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/img/kucing1.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Admin Panel</h1>
    </header>

    <main>
        <form method="post" action="admin-login.jsp">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>

        <% if(errorMessage != null) { %>
            <p style="color:red;"><%= errorMessage %></p>
        <% } %>
    </main>

    <footer>
        <p>Prepared by Group 8 | Azie-Hidayah-Nurjie-Syuhana.</p>
    </footer>
</body>
</html>
