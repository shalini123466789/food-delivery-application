<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<%@ page import="com.tap.model.OrderTable"%>
<%@ page import="com.tap.model.OrderItem"%>
<%@ page import="com.tap.model.Menu"%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Orders - FoodApp</title>


<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


/* =========================
   BODY
========================= */

body {

    font-family: Arial, sans-serif;

    min-height: 100vh;

    background:
        radial-gradient(
            circle at 10% 15%,
            #fff1b8,
            transparent 25%
        ),
        radial-gradient(
            circle at 90% 85%,
            #ffe4a3,
            transparent 25%
        ),
        linear-gradient(
            135deg,
            #fffdf7,
            #fff5d6
        );

    color: #333;
}


/* =========================
   NAVBAR
========================= */

.navbar {

    height: 70px;

    background: #ffca28;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 55px;

    box-shadow:
        0 4px 15px rgba(0,0,0,0.08);
}


.logo {

    font-size: 25px;

    font-weight: bold;

    color: #222;
}


.nav-links {

    display: flex;

    gap: 28px;

    align-items: center;
}


.nav-links a {

    text-decoration: none;

    color: #222;

    font-size: 15px;

    font-weight: 600;
}


.nav-links a:hover {

    color: white;
}


/* =========================
   MAIN CONTAINER
========================= */

.container {

    width: 92%;

    max-width: 900px;

    margin: 35px auto 60px;
}


/* =========================
   TITLE
========================= */

.page-title {

    text-align: center;

    margin-bottom: 28px;
}


.page-title h1 {

    font-size: 32px;

    color: #222;

    margin-bottom: 7px;
}


.page-title p {

    font-size: 14px;

    color: #777;
}


/* =========================
   ORDER CARD
========================= */

.order-card {

    background: rgba(255,255,255,0.95);

    border-radius: 20px;

    padding: 22px;

    margin-bottom: 22px;

    box-shadow:
        0 12px 35px rgba(0,0,0,0.08);

    border: 1px solid #f1f1f1;
}


/* =========================
   ORDER HEADER
========================= */

.order-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    padding-bottom: 16px;

    border-bottom: 1px solid #eeeeee;
}


.order-id {

    font-size: 18px;

    font-weight: bold;

    color: #222;
}


.order-date {

    margin-top: 6px;

    font-size: 12px;

    color: #888;
}


/* =========================
   STATUS
========================= */

.status {

    padding: 7px 14px;

    border-radius: 20px;

    background: #fff3cd;

    color: #946c00;

    font-size: 12px;

    font-weight: bold;
}


/* =========================
   ITEMS TITLE
========================= */

.items-title {

    margin-top: 18px;

    margin-bottom: 10px;

    font-size: 15px;

    font-weight: bold;

    color: #333;
}


/* =========================
   ITEM
========================= */

.item {

    display: flex;

    justify-content: space-between;

    align-items: center;

    padding: 13px 0;

    border-bottom: 1px solid #f0f0f0;
}


.item:last-child {

    border-bottom: none;
}


.item-name {

    font-size: 15px;

    font-weight: 600;

    color: #333;
}


.item-quantity {

    margin-top: 5px;

    font-size: 12px;

    color: #888;
}


.item-price {

    font-size: 15px;

    font-weight: bold;

    color: #333;
}


/* =========================
   ORDER FOOTER
========================= */

.order-footer {

    margin-top: 15px;

    padding-top: 15px;

    border-top: 1px solid #eeeeee;

    display: flex;

    justify-content: space-between;

    align-items: center;
}


.payment {

    font-size: 13px;

    color: #777;
}


.payment strong {

    color: #333;
}


.total {

    font-size: 19px;

    font-weight: bold;

    color: #222;
}


/* =========================
   EMPTY ORDERS
========================= */

.empty-orders {

    background: white;

    border-radius: 20px;

    padding: 55px 20px;

    text-align: center;

    box-shadow:
        0 12px 35px rgba(0,0,0,0.08);
}


.empty-icon {

    font-size: 55px;

    margin-bottom: 15px;
}


.empty-orders h2 {

    margin-bottom: 8px;

    color: #333;
}


.empty-orders p {

    color: #888;

    font-size: 14px;

    margin-bottom: 20px;
}


/* =========================
   BUTTON
========================= */

.shop-btn {

    display: inline-block;

    padding: 11px 22px;

    background: #ffca28;

    color: #222;

    text-decoration: none;

    border-radius: 10px;

    font-weight: bold;

    transition: 0.2s;
}


.shop-btn:hover {

    background: #ffb300;

    transform: translateY(-1px);
}


/* =========================
   BOTTOM BUTTON
========================= */

.continue {

    text-align: center;

    margin-top: 30px;
}


/* =========================
   MOBILE
========================= */

@media(max-width:650px) {

    .navbar {

        padding: 0 20px;
    }


    .nav-links {

        gap: 12px;
    }


    .nav-links a {

        font-size: 13px;
    }


    .container {

        width: 94%;
    }


    .order-header {

        align-items: flex-start;

        gap: 10px;
    }


    .order-footer {

        align-items: flex-start;

        gap: 10px;
    }

}

</style>

</head>


<body>


<!-- =========================
     NAVBAR
========================= -->

<div class="navbar">

    <div class="logo">
        🍔 FoodApp
    </div>


    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/restaurant">
            Home
        </a>

        <a href="<%= request.getContextPath() %>/cart">
            Cart
        </a>

        <a href="<%= request.getContextPath() %>/my-orders">
            My Orders
        </a>

    </div>

</div>



<!-- =========================
     MAIN
========================= -->

<div class="container">


    <div class="page-title">

        <h1>My Orders</h1>

        <p>
            View your previous orders and ordered items
        </p>

    </div>



<%

List<OrderTable> orders =
        (List<OrderTable>) request.getAttribute("orders");


Map<Integer, List<OrderItem>> orderItemsMap =
        (Map<Integer, List<OrderItem>>)
        request.getAttribute("orderItemsMap");


Map<Integer, Menu> menuMap =
        (Map<Integer, Menu>)
        request.getAttribute("menuMap");



if (orders == null || orders.isEmpty()) {

%>


<!-- =========================
     NO ORDERS
========================= -->

<div class="empty-orders">

    <div class="empty-icon">
        🍽️
    </div>


    <h2>
        No Orders Yet
    </h2>


    <p>
        You haven't placed any orders yet.
    </p>


    <a
        href="<%= request.getContextPath() %>/restaurant"
        class="shop-btn">

        Browse Restaurants

    </a>

</div>


<%

} else {


    for (OrderTable order : orders) {

%>


<!-- =========================
     ORDER CARD
========================= -->

<div class="order-card">


    <!-- ORDER HEADER -->

    <div class="order-header">


        <div>

            <div class="order-id">

                Order #<%= order.getOrderId() %>

            </div>


            <div class="order-date">

                <%= order.getOrderDate() %>

            </div>

        </div>



        <div class="status">

            <%= order.getStatus() %>

        </div>


    </div>



    <!-- ITEMS TITLE -->

    <div class="items-title">

        Ordered Items

    </div>



<%

        List<OrderItem> items =
                orderItemsMap.get(order.getOrderId());


        if (items != null && !items.isEmpty()) {


            for (OrderItem item : items) {


                Menu menu =
                        menuMap.get(item.getMenuId());


                String itemName = "Food Item";


                double itemTotal = 0;


                if (menu != null) {

                    itemName =
                            menu.getItemName();

                    itemTotal =
                            menu.getPrice()
                            * item.getQuantity();

                }

%>


    <!-- ITEM -->

    <div class="item">


        <div>


            <div class="item-name">

                <%= itemName %>

            </div>


            <div class="item-quantity">

                Quantity:
                <%= item.getQuantity() %>

            </div>


        </div>



        <div class="item-price">

            ₹<%= String.format("%.2f", itemTotal) %>

        </div>


    </div>


<%

            }


        } else {

%>


    <div class="item">


        <div class="item-name">

            No items found

        </div>


    </div>


<%

        }

%>



    <!-- ORDER FOOTER -->

    <div class="order-footer">


        <div class="payment">

            Payment:

            <strong>

                <%= order.getPaymentMethod() %>

            </strong>

        </div>



        <div class="total">

            Total:

            ₹<%= String.format(
                    "%.2f",
                    order.getTotalAmount()
                ) %>

        </div>


    </div>


</div>


<%

    }

%>


<!-- =========================
     CONTINUE SHOPPING
========================= -->

<div class="continue">

    <a
        href="<%= request.getContextPath() %>/restaurant"
        class="shop-btn">

        Continue Shopping

    </a>

</div>


<%

}

%>


</div>


</body>

</html>