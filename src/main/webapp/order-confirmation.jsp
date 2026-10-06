<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String orderId = request.getParameter("orderId");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Order Confirmed - FoodApp</title>

<style>

/* ================= RESET ================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


/* ================= BODY ================= */

body {
    font-family: 'Segoe UI', Arial, sans-serif;

    min-height: 100vh;

    background:
        radial-gradient(
            circle at 15% 75%,
            #ffe2a8 0,
            #ffe2a8 150px,
            transparent 151px
        ),
        radial-gradient(
            circle at 90% 85%,
            #ffd9b5 0,
            #ffd9b5 170px,
            transparent 171px
        ),
        linear-gradient(
            135deg,
            #fff9eb,
            #fff0d2
        );

    color: #111;

    overflow-x: hidden;
}


/* ================= NAVBAR ================= */

.navbar {
    height: 72px;

    background: #ffd84d;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 70px;

    position: relative;

    z-index: 10;

    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.logo {
    font-size: 34px;

    font-weight: 800;

    letter-spacing: -1px;
}

.food {
    color: #111;
}

.app {
    color: #ff512b;
}

.nav-links {
    display: flex;

    align-items: center;

    gap: 32px;
}

.nav-links a {
    text-decoration: none;

    color: #111;

    font-size: 16px;

    font-weight: 700;

    transition: 0.2s;
}

.nav-links a:hover {
    color: #ff512b;
}


/* ================= DECORATIVE BACKGROUND ================= */

.decor {
    position: fixed;

    pointer-events: none;

    z-index: 0;
}


/* LEFT CIRCLE */

.left-circle {
    width: 240px;
    height: 240px;

    left: -110px;
    top: 430px;

    background: #ffe3a6;

    border-radius: 50%;
}

.left-circle::after {
    content: "";

    position: absolute;

    width: 120px;
    height: 120px;

    background: #ffd17d;

    border-radius: 50%;

    left: 110px;
    top: 80px;

    opacity: 0.45;
}


/* RIGHT CIRCLE */

.right-circle {
    width: 270px;
    height: 270px;

    right: -120px;
    bottom: -100px;

    background: #ffd5b0;

    border-radius: 50%;
}


/* ================= DOTS ================= */

.dot {
    width: 26px;
    height: 26px;

    background: #ffb35f;

    border-radius: 50%;

    opacity: 0.55;

    animation: float 4s ease-in-out infinite;
}

.dot-one {
    top: 180px;
    right: 18%;
}

.dot-two {
    top: 500px;
    left: 18%;

    animation-delay: 1s;
}

.dot-three {
    bottom: 100px;
    right: 20%;

    animation-delay: 2s;
}


/* ================= MAIN ================= */

.container {

    min-height: calc(100vh - 72px);

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 30px 20px;

    position: relative;

    z-index: 2;
}


/* ================= CONFIRMATION CARD ================= */

.confirmation-card {

    width: 720px;

    max-width: 100%;

    background: rgba(255,255,255,0.90);

    backdrop-filter: blur(12px);

    -webkit-backdrop-filter: blur(12px);

    border-radius: 24px;

    padding: 34px 40px 32px;

    text-align: center;

    box-shadow:
        0 20px 45px rgba(130,90,30,0.13),
        0 5px 18px rgba(0,0,0,0.05);

    border: 1px solid rgba(255,255,255,0.8);

    position: relative;

    overflow: hidden;

    animation: cardAppear 0.6s ease;
}


/* ================= TOP YELLOW CORNER ================= */

.confirmation-card::before {

    content: "";

    position: absolute;

    width: 120px;
    height: 120px;

    background: #ffc928;

    border-radius: 0 0 100% 0;

    top: -60px;
    left: -60px;

    opacity: 0.95;
}


/* ================= SUCCESS ICON ================= */

.success-icon {

    width: 95px;
    height: 95px;

    margin: 0 auto 18px;

    border-radius: 50%;

    background:
        radial-gradient(
            circle,
            #20b94b 0%,
            #0c9d35 65%,
            #087c2a 100%
        );

    color: white;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 52px;

    font-weight: 800;

    box-shadow:
        0 0 0 12px rgba(63,210,99,0.12),
        0 0 30px rgba(30,180,70,0.28);

    position: relative;

    z-index: 2;

    animation: successPop 0.7s ease;
}


/* ================= ROTATING RING ================= */

.success-icon::after {

    content: "";

    position: absolute;

    inset: -21px;

    border-radius: 50%;

    border: 2px dashed rgba(80,190,80,0.25);

    animation: rotate 12s linear infinite;
}


/* ================= CONFETTI ================= */

.confetti {

    position: absolute;

    width: 9px;
    height: 17px;

    border-radius: 3px;

    z-index: 3;

    animation: confettiFloat 3s ease-in-out infinite;
}

.c1 {
    background: #ff512b;

    top: 75px;
    left: 37%;

    transform: rotate(25deg);
}

.c2 {
    background: #ffc928;

    top: 95px;
    left: 42%;

    transform: rotate(-30deg);
}

.c3 {
    background: #20a04b;

    top: 70px;
    right: 38%;

    transform: rotate(40deg);
}

.c4 {
    background: #ff512b;

    top: 100px;
    right: 33%;

    transform: rotate(-20deg);
}

.c5 {
    background: #ff9f1c;

    top: 82px;
    right: 42%;

    transform: rotate(65deg);
}


/* ================= TITLE ================= */

.confirmation-card h1 {

    font-size: 34px;

    font-weight: 800;

    margin-bottom: 8px;

    letter-spacing: -1px;
}

.confirmation-card h1 span {
    color: #ff512b;
}

.message {

    color: #777;

    font-size: 15px;

    line-height: 1.5;

    margin-bottom: 23px;
}


/* ================= ORDER DETAILS ================= */

.order-box {

    width: 100%;

    background:
        linear-gradient(
            135deg,
            #fff9df,
            #fff2c9
        );

    border: 1px solid #ffe4a0;

    border-radius: 15px;

    padding: 8px 22px;

    margin-bottom: 23px;

    box-shadow:
        inset 0 1px 0 rgba(255,255,255,0.8);
}


/* ================= ORDER ROW ================= */

.order-row {

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 11px 0;

    border-bottom:
        1px solid rgba(210,180,100,0.22);

    font-size: 15px;
}

.order-row:last-child {
    border-bottom: none;
}


/* ================= LABEL ================= */

.order-label {

    color: #666;

    font-weight: 500;

    display: flex;

    align-items: center;

    gap: 10px;
}


/* ================= VALUE ================= */

.order-value {

    font-weight: 800;

    color: #111;
}


/* ================= STATUS ================= */

.status {

    background: #ffe49a;

    color: #e88a00;

    padding: 5px 15px;

    border-radius: 30px;

    font-size: 13px;

    font-weight: 800;
}


/* ================= ICON ================= */

.info-icon {

    width: 31px;
    height: 31px;

    display: flex;

    align-items: center;

    justify-content: center;

    border-radius: 50%;

    background: #ffe4d7;

    color: #ff512b;

    font-size: 15px;

    font-weight: 700;
}


/* ================= BUTTONS ================= */

.buttons {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 15px;
}


.btn {

    display: flex;

    align-items: center;

    justify-content: center;

    gap: 8px;

    min-height: 50px;

    border-radius: 12px;

    text-decoration: none;

    font-size: 15px;

    font-weight: 800;

    transition: all 0.25s ease;
}


/* ================= PRIMARY ================= */

.primary-btn {

    color: white;

    background:
        linear-gradient(
            135deg,
            #ff5a2f,
            #ff3d20
        );

    box-shadow:
        0 9px 18px rgba(255,81,43,0.22);
}

.primary-btn:hover {

    transform: translateY(-3px);

    box-shadow:
        0 13px 25px rgba(255,81,43,0.30);
}


/* ================= SECONDARY ================= */

.secondary-btn {

    color: #ff512b;

    background: #fff4ef;

    border: 1px solid #ffd5c7;
}

.secondary-btn:hover {

    background: #ffe8df;

    transform: translateY(-3px);
}


/* ================= FOOD DECORATIONS ================= */

.food-decoration {

    position: fixed;

    font-size: 65px;

    opacity: 0.80;

    z-index: 1;

    filter:
        drop-shadow(
            0 8px 12px rgba(0,0,0,0.10)
        );

    animation:
        foodFloat 5s ease-in-out infinite;
}

.food-left {

    left: 20px;

    bottom: 20px;

    transform: rotate(-12deg);
}

.food-right {

    right: 15px;

    top: 105px;

    transform: rotate(12deg);

    animation-delay: 1.5s;
}


/* ================= ANIMATIONS ================= */

@keyframes cardAppear {

    from {
        opacity: 0;

        transform:
            translateY(20px)
            scale(0.98);
    }

    to {
        opacity: 1;

        transform:
            translateY(0)
            scale(1);
    }
}


@keyframes successPop {

    0% {
        opacity: 0;

        transform:
            scale(0.5);
    }

    70% {
        transform:
            scale(1.08);
    }

    100% {
        opacity: 1;

        transform:
            scale(1);
    }
}


@keyframes rotate {

    from {
        transform: rotate(0deg);
    }

    to {
        transform: rotate(360deg);
    }
}


@keyframes confettiFloat {

    0%, 100% {
        transform:
            translateY(0)
            rotate(20deg);
    }

    50% {
        transform:
            translateY(-10px)
            rotate(80deg);
    }
}


@keyframes float {

    0%, 100% {
        transform:
            translateY(0);
    }

    50% {
        transform:
            translateY(-12px);
    }
}


@keyframes foodFloat {

    0%, 100% {
        transform:
            translateY(0)
            rotate(-10deg);
    }

    50% {
        transform:
            translateY(-12px)
            rotate(-5deg);
    }
}


/* ================= MOBILE ================= */

@media (max-width: 750px) {

    .navbar {

        padding: 0 20px;

        height: 64px;
    }

    .logo {

        font-size: 27px;
    }

    .nav-links {

        gap: 12px;
    }

    .nav-links a {

        font-size: 13px;
    }

    .container {

        min-height:
            calc(100vh - 64px);

        padding:
            25px 15px;
    }

    .confirmation-card {

        width: 100%;

        padding:
            32px 22px 28px;

        border-radius: 22px;
    }

    .confirmation-card h1 {

        font-size: 28px;
    }

    .message {

        font-size: 14px;
    }

    .success-icon {

        width: 85px;
        height: 85px;

        font-size: 47px;
    }

    .order-box {

        padding:
            7px 15px;
    }

    .order-row {

        font-size: 14px;
    }

    .buttons {

        grid-template-columns: 1fr;

        gap: 10px;
    }

    .food-decoration {

        display: none;
    }
}


/* ================= SMALL MOBILE ================= */

@media (max-width: 450px) {

    .nav-links a:first-child {

        display: none;
    }

    .confirmation-card h1 {

        font-size: 25px;
    }

    .order-row {

        flex-direction: row;
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

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</div>


<!-- ================= BACKGROUND DECORATION ================= -->

<div class="decor left-circle"></div>

<div class="decor right-circle"></div>

<div class="decor dot dot-one"></div>

<div class="decor dot dot-two"></div>

<div class="decor dot dot-three"></div>


<!-- ================= FOOD DECORATION ================= -->

<div class="food-decoration food-left">
    🍕
</div>

<div class="food-decoration food-right">
    🥗
</div>


<!-- ================= MAIN ================= -->

<div class="container">


    <div class="confirmation-card">


        <!-- ================= CONFETTI ================= -->

        <div class="confetti c1"></div>

        <div class="confetti c2"></div>

        <div class="confetti c3"></div>

        <div class="confetti c4"></div>

        <div class="confetti c5"></div>


        <!-- ================= SUCCESS ICON ================= -->

        <div class="success-icon">

            ✓

        </div>


        <!-- ================= TITLE ================= -->

        <h1>

            Order Placed
            <span>Successfully!</span>

        </h1>


        <p class="message">

            Thank you for ordering with FoodApp.<br>

            Your order has been placed successfully.

        </p>


        <!-- ================= ORDER DETAILS ================= -->

        <div class="order-box">


            <!-- ORDER ID -->

            <div class="order-row">

                <div class="order-label">

                    <span class="info-icon">
                        ▣
                    </span>

                    Order ID

                </div>


                <div class="order-value">

                    #<%= orderId %>

                </div>

            </div>


            <!-- PAYMENT METHOD -->

            <div class="order-row">

                <div class="order-label">

                    <span class="info-icon">
                        ₹
                    </span>

                    Payment Method

                </div>


                <div class="order-value">

                    Cash on Delivery

                </div>

            </div>


            <!-- ORDER STATUS -->

            <div class="order-row">

                <div class="order-label">

                    <span class="info-icon">
                        ◷
                    </span>

                    Order Status

                </div>


                <div class="status">

                    Pending

                </div>

            </div>


        </div>


        <!-- ================= BUTTONS ================= -->

        <div class="buttons">


            <a
                href="<%= request.getContextPath() %>/restaurant"
                class="btn primary-btn">

                🛍 Continue Shopping →

            </a>


            <a
                href="<%= request.getContextPath() %>/my-orders"
                class="btn secondary-btn">

                ☷ View My Orders

            </a>


        </div>


    </div>

</div>


</body>

</html>