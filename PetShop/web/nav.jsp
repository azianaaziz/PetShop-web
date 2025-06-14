<style>
    .hover-menu {
        position: relative;
        display: inline-block;
    }
    .hover-menu-content {
        display: none;
        position: absolute;
        background-color: black;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .hover-menu-content a {
        color: white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .hover-menu:hover .hover-menu-content {
        display: block;
    }

    .cta {
        z-index: 10;
        position: relative;
    }
    .cart-items {
        max-height: 400px;
        overflow-y: auto;
    }
    .cart-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 10px 0;
    }
    .cart-item img {
        width: 50px;
        height: 50px;
        border-radius: 5px;
    }
    .item-detail {
        flex-grow: 1;
        margin-left: 10px;
    }
    .item-price {
        font-size: 14px;
    }
    .item-quantity {
        font-size: 12px;
    }
    .checkout-button {
        background-color: green;
        color: white;
        padding: 10px 20px;
        margin: 10px auto;
        cursor: pointer;
        font-size: 16px;
        border: none;
        border-radius: 5px;
    }
</style>

<nav class="navbar">
    <a href="#" class="navbar-logo">Pet<span>Shop</span></a>
    <div class="navbar-nav">
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About us</a>
        <a href="products.jsp">Shop</a>
        <a href="adoption.jsp">Adoption</a>
        <a href="feedback.jsp">Feedback</a>
        <a href="tips.jsp">Tips</a>
        <a href="contact.jsp">Guide</a>
    </div>
    <div class="navbar-extra">
        <a href="cart.jsp" id="shopping-cart-button"><i data-feather="shopping-bag"></i></a>
        <div class="hover-menu">
            <a href="#" id="user-button"><i data-feather="user"></i></a>
            <div class="hover-menu-content">
                <% if (session.getAttribute("username") == null) { %>
                    <a href="login.jsp">Login</a>
                    <a href="admin-login.jsp">Admin Login</a>
                <% } else { %>
                <a href="ManageInfoServlet">Manage Info</a>
                    <a href="LogoutServlet">Logout</a>
                    
                <% } %>
            </div>
        </div>
        <a href="#" id="hamburger-menu"><i data-feather="menu"></i></a>
    </div>

    <div class="shopping-cart">
        <div class="cart-items">
            <!-- Cart items will be dynamically added here -->
        </div>
        <div class="checkout">
            <button class="checkout-button" onclick="checkout()">Checkout</button>
        </div>
    </div>
</nav>
