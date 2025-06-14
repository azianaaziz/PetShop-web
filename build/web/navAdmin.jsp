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
    <a href="#" class="navbar-logo">Pet<span>Shop Admin</span></a>
    <div class="navbar-nav">
        <a href="admin-dashboard.jsp">Dashboard</a>
        <a href="AdminAddProduct.jsp">Add Product</a>
        <a href="updateAdoption.jsp">Update Adoption</a>
    </div>
    <div class="navbar-extra">
        <div class="hover-menu">
            <a href="#" id="user-button"><i data-feather="user"></i></a>
            <div class="hover-menu-content">
                <% if (session.getAttribute("adminUsername") == null) { %>
                    <a href="admin-login.jsp">Admin Login</a>
                <% } else { %>
                    <a href="LogoutServlet">Logout</a>
                <% } %>
            </div>
        </div>
        <a href="#" id="hamburger-menu"><i data-feather="menu"></i></a>
    </div>
</nav>
