<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <link rel="shortcut icon" type="image/x-icon" href="img/cougar-clipart-bearcat.png">
    <meta http-equiv="X-UA-Compatible" content="IE-Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pet Shop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,700&display=swap" rel="stylesheet" />
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/master.css"/>
    <style>
        .notification {
            display: none;
            position: fixed;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp" />

    <section class="products" id="products">
        <h2><span>Best </span>Products</h2>
        <p>"Introducing our premier pet product, a meticulously crafted blend of superior nutrition, irresistible taste, and thoughtful design, ensuring your furry companion enjoys the highest quality of care, health, and happiness."</p>
        <div class="row">
            <%
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

                    while (rs.next()) {
                        String productCode = rs.getString("product_code");
                        String name = rs.getString("name");
                        String description = rs.getString("description");
                        double price = rs.getDouble("price");
                        String image = rs.getString("image");

                        out.println("<div class='product-card'>");
                        out.println("<div class='product-icons'>");
                        out.println("<a href='cart.jsp'><i data-feather='shopping-bag'></i></a>");
                        out.println("<a href='#' class='item-detail-button'><i data-feather='eye'></i></a>");
                        out.println("</div>");
                        out.println("<div class='product-image'>");
                        out.println("<img src='data:image/jpeg;base64," + Base64.getEncoder().encodeToString(rs.getBytes("image")) + "' alt='" + name + "' />");
                        out.println("</div>");
                        out.println("<div class='product-content'>");
                        out.println("<h3>" + name + "</h3>");
                        out.println("<div class='product-stars'>");
                        out.println("<i data-feather='star' class='star-full'></i>");
                        out.println("<i data-feather='star' class='star-full'></i>");
                        out.println("<i data-feather='star' class='star-full'></i>");
                        out.println("<i data-feather='star' class='star-full'></i>");
                        out.println("<i data-feather='star'></i>");
                        out.println("</div>");
                        out.println("<div class='product-price'>RM " + price + "</div>");
                        out.println("</div>");
                        out.println("</div>");
                    }
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
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <div class="modal" id="item-detail-modal">
        <div class="modal-container">
            <a href="#" class="close-icon"><i data-feather="x"></i></a>
            <div class="modal-content">
                <img src="img/product1.jpg" alt="Product 1" />
                <div class="product-content">
                    <h3>Product 1</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut quas illum nulla possimus sunt suscipit aliquid unde, cupiditate tempora odio culpa facere, saepe impedit quo!</p>
                    <div class="product-stars">
                        <i data-feather="star" class="star-full"></i>
                        <i data-feather="star" class="star-full"></i>
                        <i data-feather="star" class="star-full"></i>
                        <i data-feather="star" class="star-full"></i>
                        <i data-feather="star"></i>
                    </div>
                    <div class="product-price">RM 500 <span>1000</span></div>
                    <a href="#"><i data-feather="shopping-bag"></i><span>Add to Cart</span></a>
                </div>
            </div>
        </div>
    </div>

    <div class="notification" id="notification">Product added to cart</div>

    <input type="hidden" id="isLoggedIn" value="<%= session.getAttribute("username") != null %>">

<script>
    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', function() {
            const product = JSON.parse(this.dataset.product);
            fetch('ProductServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    action: 'addToCart',
                    productCode: product.productCode,
                    name: product.name,
                    price: product.price,
                    image: product.image,
                    quantity: 1 // Default quantity
                })
            }).then(response => response.text())
            .then(data => {
                addToCart(product);
                showNotification();
                renderCartItems();
                openCart();
            }).catch(error => console.error('Error:', error));
        });
    });

    function showNotification() {
        const notification = document.getElementById('notification');
        notification.style.display = 'block';
        setTimeout(() => {
            notification.style.display = 'none';
        }, 3000);
    }

    function openCart() {
        const shoppingCart = document.querySelector(".shopping-cart");
        shoppingCart.classList.add("active");
    }

    function addToCart(product) {
        const cart = JSON.parse(localStorage.getItem("cart")) || [];
        const productIndex = cart.findIndex((item) => item.productCode === product.productCode);
        if (productIndex > -1) {
            cart[productIndex].quantity += 1;
        } else {
            cart.push({ ...product, quantity: 1 });
        }
        localStorage.setItem("cart", JSON.stringify(cart));
        renderCartItems();
    }

    function renderCartItems() {
        const cart = JSON.parse(localStorage.getItem("cart")) || [];
        const cartContainer = document.querySelector(".shopping-cart .cart-items");
        cartContainer.innerHTML = "";
        cart.forEach((item) => {
            const cartItem = document.createElement("div");
            cartItem.classList.add("cart-item");
            cartItem.innerHTML = `
                <img src="${item.image}" alt="${item.name}" />
                <div class="item-detail">
                    <h3>${item.name}</h3>
                    <div class="item-price">RM ${item.price.toFixed(2)}</div>
                    <div class="item-quantity">
                        <button onclick="updateQuantity('${item.productCode}', -1)">-</button>
                        <input type="number" value="${item.quantity}" readonly>
                        <button onclick="updateQuantity('${item.productCode}', 1)">+</button>
                    </div>
                </div>
                <i data-feather="trash-2" class="remove-item" onclick="removeFromCart('${item.productCode}')"></i>
            `;
            cartContainer.appendChild(cartItem);
        });
        feather.replace();
    }

    function updateQuantity(productCode, change) {
        const cart = JSON.parse(localStorage.getItem("cart")) || [];
        const productIndex = cart.findIndex((item) => item.productCode === productCode);
        if (productIndex > -1) {
            cart[productIndex].quantity += change;
            if (cart[productIndex].quantity < 1) {
                cart[productIndex].quantity = 1;
            }
            localStorage.setItem("cart", JSON.stringify(cart));
            renderCartItems();
        }
    }

    function removeFromCart(productCode) {
        let cart = JSON.parse(localStorage.getItem("cart")) || [];
        cart = cart.filter((item) => item.productCode !== productCode);
        localStorage.setItem("cart", JSON.stringify(cart));
        renderCartItems();
    }

    window.onload = function() {
        renderCartItems();
    };
</script>

<script>
    feather.replace();
</script>
<script src="js/script.js"></script>
</body>
</html>
