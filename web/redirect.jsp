<%-- 
    Document   : index
    Created on : Jun 15, 2025, 3:09:15 AM
    Author     : hidayah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="0; URL=<%=request.getContextPath()%>/admin?action=list">
        <title>JSP Page</title>
        
    </head>
    <body>
        <jsp:include page="navAdmin.jsp" />
        <h1>Redirecting...</h1>
        <!-- If the redirect does not happen automatically, provide a manual link -->
        <p>Click <a href="<%= request.getContextPath() %>/admin?action=list">here</a> if you are not redirected.</p>
        <jsp:include page="footer.jsp" />
    </body>
</html>