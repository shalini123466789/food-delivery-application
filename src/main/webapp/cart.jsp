<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="com.tap.model.Menu"%>
<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Your Cart - FoodApp</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: #fff4df;
    color: #111;
}


/* ================= NAVBAR ================= */

.navbar {
    height: 72px;
    background: #ffd84d;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 38px;
}

.logo {
    font-size: 32px;
    font-weight: 800;
}

.logo .food {
    color: #111;
}

.logo .app {
    color: #ff512b;
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
    color: #ff512b;
}


/* ================= MAIN ================= */

.container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 55px 25px 70px;
}


/* ================= TITLE ================= */

.title {
    margin-bottom: 32px;
}

.title h1 {
    font-size: 46px;
    font-weight: 800;
    margin-bottom: 8px;
}

.title p {
    color: #777;
    font-size: 18px;
}


/* ================= CART ITEM ================= */

.cart-item {
    background: white;

    border-radius: 18px;

    padding: 24px 26px;

    margin-bottom: 18px;

    display: flex;
    align-items: center;
    justify-content: space-between;

    box-shadow: 0 5px 18px rgba(0,0,0,0.07);

    transition: 0.2s;
}

.cart-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 22px rgba(0,0,0,0.10);
}


/* ITEM DETAILS */

.item-details {
    display: flex;
    align-items: center;
    justify-content: space-between;

    width: 70%;
}

.item-left {
    display: flex;
    align-items: center;
}

.item-img {
    width: 70px;
    height: 70px;
    object-fit: cover;
    border-radius: 12px;
    margin-right: 16px;
    flex-shrink: 0;
}

.item-details h3 {
    font-size: 21px;
    margin: 0;
}

.item-price {
    font-size: 18px;
    font-weight: 700;
    color: #111;
}


/* ================= QUANTITY ================= */

.quantity-box {
    display: flex;
    align-items: center;
    gap: 12px;

    background: #fff3ed;

    padding: 8px 10px;

    border-radius: 12px;
}

.quantity-box form {
    margin: 0;
    padding: 0;
}

.quantity-btn {
    width: 38px;
    height: 38px;

    border: none;
    border-radius: 9px;

    background: #ff512b;
    color: white;

    font-size: 22px;
    font-weight: 700;

    cursor: pointer;

    transition: 0.2s;
}

.quantity-btn:hover {
    background: #e84420;
    transform: scale(1.05);
}

.quantity {
    min-width: 25px;

    text-align: center;

    font-size: 18px;
    font-weight: 700;
}


/* ================= BILL ================= */

.bill {
    background: white;

    border-radius: 18px;

    padding: 28px;

    margin-top: 30px;

    box-shadow: 0 5px 18px rgba(0,0,0,0.07);
}

.bill h2 {
    font-size: 24px;
    margin-bottom: 20px;
}

.bill-row {
    display: flex;
    justify-content: space-between;

    padding: 12px 0;

    color: #666;

    font-size: 16px;
}

.total {
    border-top: 1px solid #ddd;

    margin-top: 8px;

    padding-top: 20px;

    display: flex;
    justify-content: space-between;

    font-size: 21px;
    font-weight: 800;
}


/* ================= CHECKOUT ================= */

.checkout-btn {
    display: block;

    margin-top: 22px;

    padding: 16px;

    background: #ff512b;

    color: white;

    text-align: center;

    text-decoration: none;

    border-radius: 12px;

    font-size: 17px;
    font-weight: 700;

    transition: 0.2s;
}

.checkout-btn:hover {
    background: #e84420;
    transform: translateY(-1px);
}


/* ================= CONTINUE ================= */

.continue {
    display: inline-block;

    margin-top: 25px;

    color: #ff512b;

    text-decoration: none;

    font-weight: 700;

    font-size: 16px;
}

.continue:hover {
    text-decoration: underline;
}


/* ================= EMPTY CART ================= */

.empty-cart {
    background: white;

    border-radius: 20px;

    padding: 85px 30px;

    text-align: center;

    box-shadow: 0 5px 18px rgba(0,0,0,0.07);
}

.empty-cart h2 {
    font-size: 30px;
    margin-bottom: 10px;
}

.empty-cart p {
    color: #777;
    font-size: 17px;
    margin-bottom: 25px;
}


/* ================= MOBILE ================= */

@media (max-width: 700px) {

    .navbar {
        padding: 0 18px;
    }

    .nav-links {
        gap: 13px;
    }

    .nav-links a {
        font-size: 14px;
    }

    .container {
        padding: 35px 18px;
    }

    .title h1 {
        font-size: 36px;
    }

    .cart-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
    }

    .item-details {
        width: 100%;
    }

    .quantity-box {
        align-self: flex-end;
    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">

        <span class="food">Food</span><span class="app">App</span>

    </div>


    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/restaurant">
            Restaurants
        </a>


        <a href="<%= request.getContextPath() %>/cart">
            🛒 Cart
        </a>


        <%
            User loggedInUser =
                (User) session.getAttribute("loggedInUser");

            if (loggedInUser == null) {
        %>

            <a href="<%= request.getContextPath() %>/login.jsp">
                Login
            </a>

        <%
            } else {
        %>

            <a href="<%= request.getContextPath() %>/logout">
                Logout
            </a>

        <%
            }
        %>

    </div>

</div>


<%

Cart cart =
    (Cart) session.getAttribute("myCart");


if (cart == null ||
    cart.getItems() == null ||
    cart.getItems().isEmpty()) {

%>


<!-- ================= EMPTY CART ================= -->

<div class="container">

    <div class="title">

        <h1>Your Cart</h1>

        <p>
            Review your items and proceed to checkout
        </p>

    </div>


    <div class="empty-cart">

        <h2>
            Your cart is empty 🛒
        </h2>

        <p>
            Add some delicious food to your cart.
        </p>


        <a
            href="<%= request.getContextPath() %>/restaurant"
            class="continue">

            ← Continue Shopping

        </a>

    </div>

</div>


<%

} else {

    double total = 0;

%>


<!-- ================= CART CONTENT ================= -->

<div class="container">


    <div class="title">

        <h1>Your Cart</h1>

        <p>
            Review your items and proceed to checkout
        </p>

    </div>


<%

for (CartItem cartItem : cart.getItems()) {

    Menu menu = cartItem.getMenu();

    int quantity = cartItem.getQuantity();

    double itemTotal =
        menu.getPrice() * quantity;

    total += itemTotal;

%>


<!-- ================= CART ITEM ================= -->

<div class="cart-item">


    <div class="item-details">

        <div class="item-left">

            <%
                if (menu.getImagePath() != null
                        && !menu.getImagePath().isEmpty()) {
            %>

                <img
                    class="item-img"
                    src="<%= request.getContextPath() %>/images/<%= menu.getImagePath() %>"
                    alt="<%= menu.getItemName() %>"
                    onerror="this.style.display='none';">

            <%
                }
            %>

            <h3>
                <%= menu.getItemName() %>
            </h3>

        </div>


        <!-- ONLY TOTAL PRICE -->

        <div class="item-price">

            ₹<%= String.format("%.2f", itemTotal) %>

        </div>

    </div>



    <!-- ================= QUANTITY ================= -->

    <div class="quantity-box">


        <!-- MINUS -->

        <form
            action="<%= request.getContextPath() %>/cart"
            method="post">

            <input
                type="hidden"
                name="action"
                value="update">


            <input
                type="hidden"
                name="menuId"
                value="<%= menu.getMenuId() %>">


            <input
                type="hidden"
                name="quantity"
                value="<%= quantity - 1 %>">


            <input
                type="hidden"
                name="restaurantId"
                value="<%= menu.getRestaurantId() %>">

            <input
                type="hidden"
                name="redirect"
                value="cart">


            <button
                type="submit"
                class="quantity-btn">

                −

            </button>

        </form>



        <!-- QUANTITY -->

        <span class="quantity">

            <%= quantity %>

        </span>



        <!-- PLUS -->

        <form
            action="<%= request.getContextPath() %>/cart"
            method="post">

            <input
                type="hidden"
                name="action"
                value="update">


            <input
                type="hidden"
                name="menuId"
                value="<%= menu.getMenuId() %>">


            <input
                type="hidden"
                name="quantity"
                value="<%= quantity + 1 %>">


            <input
                type="hidden"
                name="restaurantId"
                value="<%= menu.getRestaurantId() %>">

            <input
                type="hidden"
                name="redirect"
                value="cart">


            <button
                type="submit"
                class="quantity-btn">

                +

            </button>

        </form>


    </div>


</div>


<%

}

%>


<!-- ================= BILL SUMMARY ================= -->

<div class="bill">

    <h2>
        Bill Summary
    </h2>


    <div class="bill-row">

        <span>
            Item Total
        </span>

        <span>
            ₹<%= String.format("%.2f", total) %>
        </span>

    </div>


    <div class="total">

        <span>
            To Pay
        </span>

        <span>
            ₹<%= String.format("%.2f", total) %>
        </span>

    </div>


    <a
        href="<%= request.getContextPath() %>/checkout"
        class="checkout-btn">

        Proceed to Checkout

    </a>

</div>


<a
    href="<%= request.getContextPath() %>/restaurant"
    class="continue">

    ← Continue Shopping

</a>


</div>


<%

}

%>


</body>

</html>