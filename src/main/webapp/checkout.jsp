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

<title>Checkout - FoodApp</title>

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
    height: 64px;
    background: #ffd84d;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 35px;
}

.logo {
    font-size: 28px;
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
    gap: 25px;
}

.nav-links a {
    text-decoration: none;
    color: #111;
    font-size: 15px;
    font-weight: 600;
}

.nav-links a:hover {
    color: #ff512b;
}


/* ================= MAIN ================= */

.container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 32px 22px 45px;
}


/* ================= PAGE TITLE ================= */

.title {
    margin-bottom: 22px;
}

.title h1 {
    font-size: 38px;
    font-weight: 800;
    margin-bottom: 5px;
}

.title p {
    color: #777;
    font-size: 16px;
}


/* ================= CHECKOUT LAYOUT ================= */

.checkout-layout {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    align-items: start;
}


/* ================= CARD ================= */

.card {
    background: white;

    border-radius: 15px;

    padding: 22px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.06);
}

.card h2 {
    font-size: 22px;
    margin-bottom: 18px;
}


/* ================= FORM ================= */

.form-group {
    margin-bottom: 13px;
}

.form-group label {
    display: block;

    font-size: 14px;
    font-weight: 700;

    margin-bottom: 6px;
}

.form-group input,
.form-group textarea {
    width: 100%;

    padding: 10px 12px;

    border: 1px solid #d5d5d5;

    border-radius: 9px;

    font-size: 14px;

    outline: none;

    font-family: inherit;
}

.form-group input {
    height: 42px;
}

.form-group textarea {
    height: 70px;
    resize: vertical;
}

.form-group input:focus,
.form-group textarea:focus {
    border-color: #ff512b;
}


/* ================= CITY + PINCODE ================= */

.row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
}


/* ================= ORDER ITEM ================= */

.order-item {
    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 12px 0;

    border-bottom: 1px solid #eee;
}

.item-info {
    display: flex;

    align-items: center;

    justify-content: space-between;

    flex: 1;

    margin-right: 15px;
}

.item-left {
    display: flex;
    align-items: center;
}

.item-img {
    width: 55px;
    height: 55px;
    object-fit: cover;
    border-radius: 10px;
    margin-right: 12px;
    flex-shrink: 0;
}

.item-info h3 {
    font-size: 16px;
    font-weight: 700;
}

.item-total {
    font-size: 16px;
    font-weight: 700;
}


/* ================= QUANTITY ================= */

.quantity {
    display: flex;

    align-items: center;

    gap: 8px;

    background: #fff3ed;

    padding: 5px 8px;

    border-radius: 9px;
}

.quantity span {
    min-width: 20px;

    text-align: center;

    font-size: 15px;

    font-weight: 700;
}


/* ================= BILL ================= */

.bill {
    margin-top: 18px;
}

.bill-row {
    display: flex;

    justify-content: space-between;

    padding: 7px 0;

    font-size: 14px;

    color: #555;
}

.total {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-top: 10px;

    padding: 13px 14px;

    background: #fff0bd;

    border-radius: 10px;

    font-size: 19px;

    font-weight: 800;
}


/* ================= PAYMENT ================= */

.payment {
    margin-top: 18px;

    padding: 13px;

    background: #fafafa;

    border: 1px solid #eee;

    border-radius: 10px;
}

.payment-title {
    font-size: 14px;

    font-weight: 700;

    margin-bottom: 5px;
}

.payment-method {
    font-size: 14px;

    color: #555;
}


/* ================= CONFIRM BUTTON ================= */

.confirm-btn {
    width: 100%;

    margin-top: 16px;

    padding: 12px;

    border: none;

    border-radius: 9px;

    background: #ff512b;

    color: white;

    font-size: 15px;

    font-weight: 700;

    cursor: pointer;

    transition: 0.2s;
}

.confirm-btn:hover {
    background: #e84420;

    transform: translateY(-1px);
}


/* ================= BACK ================= */

.back-link {
    display: inline-block;

    margin-top: 18px;

    color: #ff512b;

    text-decoration: none;

    font-size: 14px;

    font-weight: 700;
}

.back-link:hover {
    text-decoration: underline;
}


/* ================= ERROR ================= */

.error {
    background: #ffe5e0;

    color: #d93025;

    padding: 10px 12px;

    border-radius: 8px;

    margin-bottom: 15px;

    font-size: 14px;
}


/* ================= MOBILE ================= */

@media (max-width: 750px) {

    .navbar {
        padding: 0 18px;
    }

    .logo {
        font-size: 24px;
    }

    .nav-links {
        gap: 12px;
    }

    .nav-links a {
        font-size: 13px;
    }

    .container {
        padding: 25px 15px 40px;
    }

    .title h1 {
        font-size: 32px;
    }

    .checkout-layout {
        grid-template-columns: 1fr;
    }

    .row {
        grid-template-columns: 1fr;
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

User user =
    (User) session.getAttribute("loggedInUser");

Cart cart =
    (Cart) session.getAttribute("myCart");

if (user == null) {

    response.sendRedirect(
        request.getContextPath() + "/login.jsp"
    );

    return;
}

if (cart == null || cart.isEmpty()) {

    response.sendRedirect(
        request.getContextPath() + "/cart"
    );

    return;
}

double itemTotal = cart.getTotal();

double deliveryFee = 40;

double totalAmount = itemTotal + deliveryFee;

%>


<!-- ================= MAIN ================= -->

<div class="container">


    <!-- ================= TITLE ================= -->

    <div class="title">

        <h1>Checkout</h1>

        <p>
            Please confirm your delivery details and order
        </p>

    </div>


    <%

    String error =
        (String) request.getAttribute("error");

    if (error != null) {

    %>

        <div class="error">
            <%= error %>
        </div>

    <%

    }

    %>


    <!-- ================= CHECKOUT FORM ================= -->

    <form
        action="<%= request.getContextPath() %>/checkout"
        method="post">


        <div class="checkout-layout">


            <!-- ================= DELIVERY DETAILS ================= -->

            <div class="card">

                <h2>
                    Delivery Details
                </h2>


                <!-- FULL NAME -->

                <div class="form-group">

                    <label>
                        Full Name
                    </label>

                    <input
                        type="text"
                        name="fullName"
                        value="<%= user.getName() %>"
                        required>

                </div>


                <!-- PHONE -->

                <div class="form-group">

                    <label>
                        Phone Number
                    </label>

                    <input
                        type="text"
                        name="phone"
                        value="<%= user.getPhone() %>"
                        required>

                </div>


                <!-- ADDRESS -->

                <div class="form-group">

                    <label>
                        Address
                    </label>

                    <textarea
                        name="address"
                        required><%= user.getAddress() %></textarea>

                </div>


                <!-- CITY + PINCODE -->

                <div class="row">

                    <div class="form-group">

                        <label>
                            City
                        </label>

                        <input
                            type="text"
                            name="city"
                            required>

                    </div>


                    <div class="form-group">

                        <label>
                            Pincode
                        </label>

                        <input
                            type="text"
                            name="pincode"
                            required>

                    </div>

                </div>

            </div>



            <!-- ================= ORDER SUMMARY ================= -->

            <div class="card">

                <h2>
                    Order Summary
                </h2>


                <%

                for (CartItem item : cart.getItems()) {

                    Menu menu =
                        item.getMenu();

                    int quantity =
                        item.getQuantity();

                    double subtotal =
                        item.getSubtotal();

                %>


                <!-- ================= ORDER ITEM ================= -->

                <div class="order-item">


                    <div class="item-info">

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

                        <!-- ONLY SUBTOTAL -->

                        <span class="item-total">
                            ₹<%= String.format("%.2f", subtotal) %>
                        </span>

                    </div>


                    <!-- DISPLAY QUANTITY -->

                    <div class="quantity">

                        <span>
                            -
                        </span>

                        <span>
                            <%= quantity %>
                        </span>

                        <span>
                            +
                        </span>

                    </div>


                </div>


                <%

                }

                %>


                <!-- ================= BILL ================= -->

                <div class="bill">


                    <div class="bill-row">

                        <span>
                            Item Total
                        </span>

                        <span>
                            ₹<%= String.format("%.2f", itemTotal) %>
                        </span>

                    </div>


                    <div class="bill-row">

                        <span>
                            Delivery Fee
                        </span>

                        <span>
                            ₹<%= String.format("%.2f", deliveryFee) %>
                        </span>

                    </div>


                    <div class="total">

                        <span>
                            Total
                        </span>

                        <span>
                            ₹<%= String.format("%.2f", totalAmount) %>
                        </span>

                    </div>


                </div>


                <!-- ================= PAYMENT ================= -->

                <div class="payment">

                    <div class="payment-title">
                        Payment Method
                    </div>

                    <div class="payment-method">
                        Cash on Delivery
                    </div>

                </div>


                <!-- ================= CONFIRM ================= -->

                <button
                    type="submit"
                    class="confirm-btn">

                    Confirm Order

                </button>


            </div>


        </div>

    </form>


    <!-- ================= BACK ================= -->

    <a
        href="<%= request.getContextPath() %>/cart"
        class="back-link">

        ← Back to Cart

    </a>


</div>


</body>

</html>