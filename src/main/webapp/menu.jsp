<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<title>FoodApp - Menu</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: #fff3dc;
    color: #111;
}

.navbar {
    height: 74px;
    background: #ffd84d;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 32px;
    position: relative;
    z-index: 20;
}

.logo {
    font-size: 32px;
    font-weight: 800;
    color: #111;
}

.logo span {
    color: #ff4f20;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 30px;
}

.nav-links a {
    text-decoration: none;
    color: #111;
    font-size: 17px;
    font-weight: 600;
}

.nav-links a:hover {
    color: #ff4f20;
}

.profile-container {
    position: relative;
}

.profile-btn {
    width: 42px;
    height: 42px;
    border: none;
    border-radius: 50%;
    background: white;
    font-size: 21px;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0,0,0,0.12);
}

.profile-menu {
    display: none;
    position: absolute;
    right: 0;
    top: 52px;
    width: 220px;
    background: white;
    border-radius: 14px;
    padding: 16px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.18);
    z-index: 100;
}

.profile-menu.show {
    display: block;
}

.profile-name {
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 4px;
}

.profile-email {
    font-size: 13px;
    color: #777;
    margin-bottom: 14px;
}

.logout-btn {
    display: block;
    text-decoration: none;
    background: #ff5722;
    color: white;
    text-align: center;
    padding: 9px;
    border-radius: 8px;
    font-weight: 600;
}

.hero {
    position: relative;
    min-height: 455px;
    background: #ffd84d;
    overflow: hidden;
}

.hero::after {
    content: "";
    position: absolute;
    left: -5%;
    right: -5%;
    bottom: -105px;
    height: 170px;
    background: #fff3dc;
    border-radius: 50% 50% 0 0 / 65% 65% 0 0;
    z-index: 1;
}

.hero-content {
    width: 1200px;
    max-width: calc(100% - 80px);
    margin: auto;
    min-height: 420px;
    display: flex;
    align-items: center;
    gap: 85px;
    position: relative;
    z-index: 5;
}

.dot-pattern {
    position: absolute;
    width: 100px;
    height: 100px;
    background-image: radial-gradient(#e7a52a 2px, transparent 2px);
    background-size: 14px 14px;
    opacity: 0.75;
    z-index: 1;
}

.dot-left {
    left: -125px;
    top: 45px;
}

.dot-right {
    right: -115px;
    bottom: 50px;
}

.hero-image-section {
    position: relative;
    width: 500px;
    flex-shrink: 0;
    display: flex;
    justify-content: center;
}

.hero-image {
    width: 480px;
    height: 350px;
    object-fit: cover;
    border-radius: 28px;
    border: 7px solid white;
    box-shadow: 0 15px 30px rgba(0,0,0,0.12);
    position: relative;
    z-index: 3;
}

.hero-info {
    position: relative;
    z-index: 5;
    flex: 1;
}

.hero-info h1 {
    font-size: 52px;
    line-height: 1.05;
    margin-bottom: 12px;
    font-weight: 800;
}

.hero-subtitle {
    font-size: 22px;
    color: #666;
    margin-bottom: 25px;
}

.badges {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
    margin-bottom: 25px;
}

.badge {
    background: white;
    padding: 11px 20px;
    border-radius: 30px;
    font-size: 16px;
    font-weight: 600;
    box-shadow: 0 5px 12px rgba(0,0,0,0.06);
}

.available-dot {
    display: inline-block;
    width: 12px;
    height: 12px;
    background: #35cf91;
    border-radius: 50%;
    margin-right: 7px;
}

.hero-location {
    font-size: 17px;
    color: #666;
}

.menu-container {
    width: 1000px;
    max-width: calc(100% - 50px);
    margin: 0 auto;
    padding-top: 25px;
    padding-bottom: 70px;
    position: relative;
    z-index: 5;
}

.menu-title {
    font-size: 40px;
    font-weight: 800;
    margin-bottom: 6px;
}

.menu-subtitle {
    color: #777;
    font-size: 17px;
    margin-bottom: 30px;
}

.menu-category-title {
    color: #ff5722;
    font-size: 27px;
    font-weight: 800;
    margin-top: 28px;
    margin-bottom: 12px;
    padding-bottom: 9px;
    border-bottom: 2px solid #ffd0c0;
}

.menu-item {
    background: white;
    border-radius: 20px;
    padding: 18px 20px;
    margin-bottom: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    min-height: 120px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.06);
    transition: 0.2s ease;
}

.menu-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 9px 25px rgba(0,0,0,0.09);
}

.menu-item-left {
    display: flex;
    align-items: center;
    flex: 1;
}

.menu-item-img {
    width: 90px;
    height: 90px;
    object-fit: cover;
    border-radius: 14px;
    margin-right: 18px;
    flex-shrink: 0;
}

.menu-item-info {
    flex: 1;
}

.menu-item-info h4 {
    font-size: 19px;
    margin-bottom: 7px;
    color: #111;
}

.menu-item-info p {
    color: #777;
    font-size: 14px;
    max-width: 600px;
    line-height: 1.5;
    margin-bottom: 8px;
}

.menu-item-price {
    font-size: 17px;
    font-weight: 800;
    color: #111;
}

.add-btn {
    border: none;
    background: #ff5722;
    color: white;
    padding: 12px 24px;
    border-radius: 10px;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.2s;
}

.add-btn:hover {
    background: #e84b1b;
    transform: scale(1.03);
}

.qty-controls {
    display: flex;
    align-items: center;
    gap: 13px;
    background: #fff0eb;
    padding: 6px 9px;
    border-radius: 12px;
}

.qty-controls form {
    margin: 0;
}

.qty-controls button {
    width: 36px;
    height: 36px;
    border: none;
    border-radius: 9px;
    background: #ff5722;
    color: white;
    font-size: 20px;
    font-weight: 700;
    cursor: pointer;
}

.qty-controls button:hover {
    background: #e84b1b;
}

.qty-controls span {
    min-width: 25px;
    text-align: center;
    font-size: 16px;
    font-weight: 700;
}

.empty-state {
    background: white;
    padding: 40px;
    border-radius: 20px;
    text-align: center;
    color: #777;
}

@media (max-width: 900px) {
    .hero { min-height: auto; }
    .hero-content { width: 100%; max-width: 100%; padding: 40px 25px 80px; flex-direction: column; gap: 30px; text-align: center; }
    .hero-image-section { width: 100%; }
    .hero-image { width: min(480px, 90vw); height: 300px; }
    .hero-info h1 { font-size: 38px; }
    .badges { justify-content: center; }
    .dot-left { left: 5px; }
    .dot-right { right: 5px; }
    .menu-item { align-items: flex-start; gap: 20px; }
}

@media (max-width: 600px) {
    .navbar { padding: 0 18px; }
    .logo { font-size: 25px; }
    .nav-links { gap: 12px; }
    .nav-links a { font-size: 14px; }
    .hero-image { height: 240px; }
    .hero-info h1 { font-size: 32px; }
    .menu-title { font-size: 32px; }
    .menu-item { flex-direction: column; align-items: flex-start; }
    .add-btn, .qty-controls { align-self: flex-end; }
}

</style>

</head>

<body>

<div class="navbar">
    <div class="logo">Food<span>App</span></div>
    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/restaurant">Restaurants</a>
        <a href="<%= request.getContextPath() %>/cart">🛒 Cart</a>
        <%
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            if (loggedInUser == null) {
        %>
            <a href="<%= request.getContextPath() %>/login.jsp">Login</a>
        <%
            } else {
        %>
            <div class="profile-container">
                <button class="profile-btn" onclick="toggleProfile()">👤</button>
                <div id="profileMenu" class="profile-menu">
                    <div class="profile-name"><%= loggedInUser.getName() %></div>
                    <div class="profile-email"><%= loggedInUser.getEmail() %></div>
                    <a class="logout-btn" href="<%= request.getContextPath() %>/logout">Logout</a>
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>

<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
%>

<div class="hero">
    <div class="hero-content">
        <div class="dot-pattern dot-left"></div>

        <div class="hero-image-section">
            <img class="hero-image"
                 src="<%= request.getContextPath() %>/images/<%= restaurant.getImagePath() %>"
                 alt="<%= restaurant.getName() %>"
                 onerror="this.style.display='none';">
        </div>

        <div class="hero-info">
            <h1><%= restaurant.getName() %></h1>
            <div class="hero-subtitle"><%= restaurant.getCuisineType() %></div>
            <div class="badges">
                <div class="badge">⭐ <%= restaurant.getRating() %></div>
                <div class="badge">🕒 <%= restaurant.getDeliveryTime() %> mins</div>
                <div class="badge">
                    <span class="available-dot"></span>
                    <%= restaurant.getActive() ? "Open" : "Closed" %>
                </div>
            </div>
            <div class="hero-location">📍 <%= restaurant.getAddress() %></div>
        </div>

        <div class="dot-pattern dot-right"></div>
    </div>
</div>

<div class="menu-container">

    <div class="menu-title">Menu</div>
    <div class="menu-subtitle">Select items to add to your cart</div>

    <%
    List<Menu> menu = (List<Menu>) request.getAttribute("menuList");
    Cart cart = (Cart) session.getAttribute("myCart");

    if (menu == null || menu.isEmpty()) {
    %>
        <div class="empty-state">No menu items available for this restaurant.</div>
    <%
    } else {

        String currentCategory = "";

        for (Menu m : menu) {

            if (!m.getCategory().equals(currentCategory)) {
                currentCategory = m.getCategory();
    %>
                <div class="menu-category-title"><%= currentCategory %></div>
    <%
            }

            int quantity = 0;

            if (cart != null && !cart.isEmpty()) {
                for (CartItem cartItem : cart.getItems()) {
                    if (cartItem.getMenu().getMenuId() == m.getMenuId()) {
                        quantity = cartItem.getQuantity();
                        break;
                    }
                }
            }
    %>

    <div class="menu-item" id="item-<%= m.getMenuId() %>">

        <div class="menu-item-left">

            <%
            if (m.getImagePath() != null && !m.getImagePath().isEmpty()) {
            %>
                <img class="menu-item-img"
                     src="<%= request.getContextPath() %>/images/<%= m.getImagePath() %>"
                     alt="<%= m.getItemName() %>"
                     onerror="this.style.display='none';">
            <%
            }
            %>

            <div class="menu-item-info">
                <h4><%= m.getItemName() %></h4>
                <p><%= m.getDescription() %></p>
                <div class="menu-item-price">₹<%= m.getPrice() %></div>
            </div>

        </div>

        <%
        if (quantity == 0) {
        %>
            <form action="<%= request.getContextPath() %>/cart" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="menuId" value="<%= m.getMenuId() %>">
                <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
                <button type="submit" class="add-btn">Add +</button>
            </form>
        <%
        } else {
        %>
            <div class="qty-controls">

                <form action="<%= request.getContextPath() %>/cart" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="menuId" value="<%= m.getMenuId() %>">
                    <input type="hidden" name="quantity" value="<%= quantity - 1 %>">
                    <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
                    <input type="hidden" name="redirect" value="menu">
                    <button type="submit">−</button>
                </form>

                <span><%= quantity %></span>

                <form action="<%= request.getContextPath() %>/cart" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="menuId" value="<%= m.getMenuId() %>">
                    <input type="hidden" name="quantity" value="<%= quantity + 1 %>">
                    <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
                    <input type="hidden" name="redirect" value="menu">
                    <button type="submit">+</button>
                </form>

            </div>
        <%
        }
        %>

    </div>

    <%
        }
    }
    %>

</div>

<script>
function toggleProfile() {
    document.getElementById("profileMenu").classList.toggle("show");
}

document.addEventListener("click", function(event) {
    const profile = document.querySelector(".profile-container");
    const menu = document.getElementById("profileMenu");
    if (profile && menu && !profile.contains(event.target)) {
        menu.classList.remove("show");
    }
});
</script>

</body>

</html>