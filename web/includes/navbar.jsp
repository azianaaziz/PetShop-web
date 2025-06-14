<%@ page import="java.util.List" %>
<%@ page import="cn.techtutorial.model.User" %>
<%
    User auth = (User) session.getAttribute("auth");
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">PawPaw Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
  
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About us</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Shop</a></li>
                <li class="nav-item"><a class="nav-link" href="adoption.jsp">Adoption</a></li>
                <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
                <li class="nav-item"><a class="nav-link" href="tips.jsp">Tips</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Guide</a></li>
                
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">
                        Cart <span class="badge badge-danger">
                            <%= session.getAttribute("cart-list") != null ? ((List)session.getAttribute("cart-list")).size() : 0 %>
                        </span>
                    </a>
                </li>

                <%
                    if (auth != null) {
                %>
                    <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
                <%
                    } else {
                %>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
