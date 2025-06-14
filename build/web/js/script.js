// Toggle class active hamburger
const navbarNav = document.querySelector(".navbar-nav");

// When click hamburger
document.querySelector("#hamburger-menu").onclick = () => {
  navbarNav.classList.toggle("active");
};

// Toggle class active for search form
const searchForm = document.querySelector(".search-form");
const searchBox = document.querySelector("#search-box");

document.querySelector("#search-button").onclick = (e) => {
  searchForm.classList.toggle("active");
  searchBox.focus();
  e.preventDefault();
};

// Toggle class active for shopping cart
const shoppingCart = document.querySelector(".shopping-cart");
document.querySelector("#shopping-cart-button").onclick = (e) => {
  shoppingCart.classList.toggle("active");
  e.preventDefault();
};

// Tap out of sidebar to hide sidebar
const hamburger = document.querySelector("#hamburger-menu");
const sb = document.querySelector("#search-button");
const sc = document.querySelector("#shopping-cart-button");

document.addEventListener("click", function (e) {
  if (!hamburger.contains(e.target) && !navbarNav.contains(e.target)) {
    navbarNav.classList.remove("active");
  }
  if (!sb.contains(e.target) && !searchForm.contains(e.target)) {
    searchForm.classList.remove("active");
  }
  if (!sc.contains(e.target) && !shoppingCart.contains(e.target)) {
    shoppingCart.classList.remove("active");
  }
});

// Modal box
const itemDetailModal = document.querySelector("#item-detail-modal");
const itemDetailButtons = document.querySelectorAll(".item-detail-button");

itemDetailButtons.forEach((btn) => {
  btn.onclick = (e) => {
    itemDetailModal.style.display = "flex";
    e.preventDefault();
  };
});
// click close modal
document.querySelector(".modal .close-icon").onclick = (e) => {
  itemDetailModal.style.display = "none";
  e.preventDefault();
};

// click outside modal
window.onclick = (e) => {
  if (e.target === itemDetailModal) {
    itemDetailModal.style.display = "none";
  }
};

let popup = document.getElementById("popup");

function openPopup() {
  popup.classList.add("open-popup");
}

function closePopup() {
  popup.classList.remove("open-popup");
}

function closePopupAndNavigate() {
  closePopup();
  window.location.href = home.html;
}

// Shopping cart functionality
let cart = JSON.parse(localStorage.getItem("cart")) || [];

function addToCart(product) {
  const productIndex = cart.findIndex((item) => item.productCode === product.productCode);
  if (productIndex > -1) {
    cart[productIndex].quantity += 1;
  } else {
    cart.push({ ...product, quantity: 1 });
  }
  localStorage.setItem("cart", JSON.stringify(cart));
  renderCartItems();
  showNotification();
  openCart();
}

function renderCartItems() {
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

function isLoggedIn() {
    return document.getElementById('isLoggedIn').value === 'true';
}

function checkout() {
  if (!isLoggedIn()) {
    alert('You need to log in first.');
    return;
  }

  const checkoutItems = JSON.parse(localStorage.getItem("cart")) || [];
  localStorage.setItem("checkoutItems", JSON.stringify(checkoutItems));
  fetch('ProductServlet', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: new URLSearchParams({
      action: 'checkout'
    })
  }).then(response => {
    window.location.href = 'checkout.jsp';
  }).catch(error => console.error('Error:', error));
}
function updateCart(productCode, quantity) {
    fetch('ProductServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            action: 'updateQuantity',
            productCode: productCode,
            quantity: quantity
        })
    }).then(response => response.text())
    .then(data => {
        location.reload();  // This will reload the page to reflect the updated cart
    }).catch(error => console.error('Error:', error));
}


// Attach add to cart event listeners
document.querySelectorAll(".add-to-cart").forEach((btn) => {
  btn.onclick = (e) => {
    const product = JSON.parse(btn.dataset.product);
    addToCart(product);
    e.preventDefault();
  };
});

// Load checkout items from localStorage on checkout.jsp
window.onload = function () {
  if (window.location.pathname.endsWith("checkout.jsp")) {
    const checkoutItems = JSON.parse(localStorage.getItem("checkoutItems")) || [];
    if (checkoutItems.length > 0) {
      const checkoutContainer = document.querySelector(".checkout-items");
      checkoutItems.forEach((item) => {
        const checkoutItem = document.createElement("div");
        checkoutItem.classList.add("checkout-item");
        checkoutItem.innerHTML = `
          <img src="${item.image}" alt="${item.name}">
          <div class="checkout-item-details">
            <h3>${item.name}</h3>
            <p>Price: RM ${item.price.toFixed(2)}</p>
          </div>
          <div class="checkout-item-quantity">
            <p>Quantity: ${item.quantity}</p>
            <p>Subtotal: RM ${(item.price * item.quantity).toFixed(2)}</p>
          </div>
        `;
        checkoutContainer.appendChild(checkoutItem);
      });
      const totalPrice = checkoutItems.reduce((total, item) => total + item.price * item.quantity, 0);
      document.querySelector(".checkout-total h3").innerText = `Total Price: RM ${totalPrice.toFixed(2)}`;
    }
  }
};

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
