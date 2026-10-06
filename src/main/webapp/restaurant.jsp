<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>FoodApp - Order Food Online</title>

<style>

/* =========================
   GLOBAL
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #fff3d8;
    color: #171717;
}

a {
    text-decoration: none;
}


/* =========================
   NAVBAR
========================= */

.navbar {
    height: 58px;
    padding: 0 4.5%;

    display: flex;
    align-items: center;
    justify-content: space-between;

    background: #ffd84f;

    position: relative;
    z-index: 1000;
}

.logo {
    font-size: 27px;
    font-weight: 800;
    color: #171717;
    letter-spacing: -1px;
}

.logo span {
    color: #ff5722;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 24px;
}

.nav-links > a {
    color: #171717;
    font-size: 14px;
    font-weight: 600;
    transition: 0.2s;
}

.nav-links > a:hover {
    color: #f4511e;
}


/* =========================
   PROFILE
========================= */

.profile-container {
    position: relative;
}

.profile-btn {
    width: 38px;
    height: 38px;

    border: none;
    border-radius: 50%;

    background: white;

    font-size: 17px;

    cursor: pointer;

    box-shadow:
        0 3px 9px rgba(0,0,0,0.12);

    transition: 0.2s;
}

.profile-btn:hover {
    transform: scale(1.05);
}

.profile-menu {
    position: absolute;

    top: 47px;
    right: 0;

    width: 230px;

    padding: 18px;

    background: white;

    border-radius: 16px;

    box-shadow:
        0 15px 35px rgba(0,0,0,0.18);

    display: none;
}

.profile-menu.show {
    display: block;
}

.profile-name {
    font-size: 16px;
    font-weight: 700;
}

.profile-email {
    margin-top: 4px;
    font-size: 12px;
    color: #888;
}

.profile-divider {
    height: 1px;
    background: #eeeeee;
    margin: 13px 0;
}

.profile-menu a {
    display: block;
    padding: 8px 0;
    color: #222;
    font-size: 14px;
}

.profile-menu a:hover {
    color: #ff5722;
}

.logout-btn {
    color: #ff5722 !important;
}


/* =========================
   HERO
========================= */

.hero {
    height: 520px;

    position: relative;

    overflow: hidden;

    background-color: #ffd84f;

    background-image:

        radial-gradient(
            circle,
            rgba(210,145,15,0.75) 2px,
            transparent 2.5px
        ),

        radial-gradient(
            circle,
            rgba(210,145,15,0.55) 1.8px,
            transparent 2.3px
        ),

        radial-gradient(
            circle,
            rgba(210,145,15,0.45) 1.5px,
            transparent 2px
        ),

        linear-gradient(
            135deg,
            #ffd84f 0%,
            #ffdc58 55%,
            #ffd34a 100%
        );

    background-size:
        10px 10px,
        9px 9px,
        8px 8px,
        100% 100%;

    background-position:
        6% 76%,
        91% 48%,
        84% 20%,
        0 0;

    background-repeat:
        no-repeat;
}


/* =========================
   HERO SOFT CIRCLE
========================= */

.hero::before {
    content: "";

    position: absolute;

    width: 430px;
    height: 430px;

    right: 12%;
    top: 20px;

    border-radius: 50%;

    background:
        rgba(255,255,255,0.12);
}


/* =========================
   HERO CURVE
========================= */

.hero::after {
    content: "";

    position: absolute;

    width: 125%;
    height: 310px;

    left: -12.5%;
    bottom: -255px;

    background: #fff3d8;

    border-radius: 50%;

    z-index: 4;
}


/* =========================
   HERO CONTENT
========================= */

.hero-content {
    width: 90%;
    max-width: 1200px;

    height: 520px;

    margin: auto;

    display: flex;
    align-items: center;
    justify-content: space-between;

    position: relative;

    z-index: 5;
}


/* =========================
   HERO LEFT
========================= */

.hero-left {
    width: 53%;
    position: relative;
}


/* Decorative dots near search */

.hero-left::before {
    content: "";

    position: absolute;

    width: 50px;
    height: 50px;

    left: -65px;
    bottom: 10px;

    background-image:
        radial-gradient(
            circle,
            #d99516 2px,
            transparent 2.5px
        );

    background-size: 10px 10px;

    opacity: 0.9;

    z-index: 2;
}


/* =========================
   HEADING
========================= */

.hero-left h1 {
    font-size: 56px;

    line-height: 1.03;

    font-weight: 800;

    letter-spacing: -1.8px;

    color: #171717;
}

.hero-left h1 span {
    color: #f4511e;
}


/* =========================
   DESCRIPTION
========================= */

.hero-left p {
    margin-top: 18px;

    font-size: 18px;

    line-height: 1.45;

    color: #686868;
}


/* =========================
   SEARCH
========================= */

.search-box {
    width: 670px;
    max-width: 100%;

    height: 62px;

    margin-top: 28px;

    padding: 5px;

    display: flex;
    align-items: center;

    background: white;

    border-radius: 34px;

    box-shadow:
        0 9px 24px rgba(0,0,0,0.12);
}

.search-icon {
    width: 54px;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 20px;
}

.search-box input {
    flex: 1;

    height: 100%;

    border: none;
    outline: none;

    background: transparent;

    padding: 0 10px;

    font-size: 15px;

    color: #333;
}

.search-box input::placeholder {
    color: #999;
}

.search-box button {
    height: 52px;

    padding: 0 32px;

    border: none;

    border-radius: 28px;

    background: #ff5b1f;

    color: white;

    font-size: 15px;

    font-weight: 700;

    cursor: pointer;

    transition: 0.2s;
}

.search-box button:hover {
    background: #e94d14;
    transform: scale(1.02);
}


/* =========================
   DELIVERY RIDER
========================= */

.delivery-illustration {
    width: 44%;

    height: 420px;

    display: flex;

    align-items: center;
    justify-content: center;

    position: relative;
}

.illustration-circle {
    position: absolute;

    width: 325px;
    height: 325px;

    border-radius: 50%;

    background:
        rgba(255,255,255,0.12);
}

.delivery-illustration img {
    width: 400px;

    max-width: 100%;

    height: auto;

    position: relative;

    z-index: 3;

    object-fit: contain;

    background: transparent;

    filter:
        drop-shadow(
            0 13px 9px rgba(0,0,0,0.08)
        );

    transition:
        transform 0.3s ease;
}

.delivery-illustration img:hover {
    transform: translateY(-5px);
}


/* =========================
   RESTAURANT SECTION
========================= */

.container {
    width: 90%;
    max-width: 1200px;

    margin: auto;

    padding: 35px 0 75px;
}

.section-header {
    margin-bottom: 23px;
}

.section-header h2 {
    font-size: 31px;

    font-weight: 800;

    color: #171717;
}

.section-header p {
    margin-top: 5px;

    font-size: 14px;

    color: #777;
}


/* =========================
   RESTAURANT GRID
========================= */

.card-grid {
    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 22px;
}


/* =========================
   RESTAURANT CARD
========================= */

.rcard {
    background: #ffe89a;

    border-radius: 19px;

    overflow: hidden;

    cursor: pointer;

    border: 1px solid
        rgba(239,172,20,0.22);

    box-shadow:
        0 5px 16px rgba(184,132,15,0.10);

    transition:
        transform 0.25s ease,
        box-shadow 0.25s ease;
}

.rcard:hover {
    transform: translateY(-6px);

    box-shadow:
        0 14px 28px rgba(184,132,15,0.18);
}


/* =========================
   RESTAURANT IMAGE
========================= */

.image-container {
    position: relative;

    height: 185px;

    overflow: hidden;
}

.image-container img {
    width: 100%;
    height: 100%;

    object-fit: cover;

    display: block;

    transition:
        transform 0.35s ease;
}

.rcard:hover .image-container img {
    transform: scale(1.06);
}


/* =========================
   STATUS
========================= */

.status {
    position: absolute;

    top: 12px;
    left: 12px;

    padding: 6px 12px;

    background: white;

    border-radius: 20px;

    color: #222;

    font-size: 12px;

    font-weight: 700;

    box-shadow:
        0 3px 9px rgba(0,0,0,0.13);
}

.status.closed {
    background: #333;
    color: white;
}


/* =========================
   RATING
========================= */

.rating {
    position: absolute;

    left: 12px;
    bottom: 12px;

    padding: 6px 10px;

    border-radius: 7px;

    background: #16a34a;

    color: white;

    font-size: 12px;

    font-weight: 700;
}


/* =========================
   CARD CONTENT
========================= */

.card-content {
    padding: 15px;
}

.card-content h3 {
    font-size: 16px;

    line-height: 1.3;

    margin-bottom: 7px;

    color: #222;
}

.cuisine {
    font-size: 12px;

    color: #777;

    margin-bottom: 10px;
}

.card-info {
    font-size: 12px;

    color: #555;

    margin-bottom: 6px;
}

.address {
    font-size: 11px;

    color: #777;

    white-space: nowrap;

    overflow: hidden;

    text-overflow: ellipsis;
}


/* =========================
   EMPTY STATE
========================= */

.empty-state {
    grid-column: 1 / -1;

    padding: 65px 20px;

    text-align: center;

    background: #ffe89a;

    border-radius: 20px;
}

.empty-state h3 {
    margin-bottom: 8px;
}

.empty-state p {
    color: #777;
}


/* =========================
   RESPONSIVE
========================= */

@media (max-width: 1050px) {

    .hero-left h1 {
        font-size: 47px;
    }

    .delivery-illustration img {
        width: 350px;
    }

    .card-grid {
        grid-template-columns:
            repeat(2, 1fr);
    }
}


@media (max-width: 750px) {

    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        gap: 12px;
    }

    .nav-links > a {
        display: none;
    }

    .hero {
        height: 700px;
    }

    .hero-content {
        height: 700px;

        flex-direction: column;

        justify-content: flex-start;

        padding-top: 50px;
    }

    .hero-left {
        width: 100%;
    }

    .hero-left::before {
        display: none;
    }

    .hero-left h1 {
        font-size: 40px;
    }

    .hero-left p {
        font-size: 16px;
    }

    .search-box {
        width: 100%;
    }

    .delivery-illustration {
        width: 100%;
        height: 290px;
    }

    .illustration-circle {
        width: 240px;
        height: 240px;
    }

    .delivery-illustration img {
        width: 290px;
    }
}


@media (max-width: 500px) {

    .logo {
        font-size: 24px;
    }

    .hero-left h1 {
        font-size: 35px;
    }

    .search-box button {
        padding: 0 20px;
    }

    .card-grid {
        grid-template-columns: 1fr;
    }

    .container {
        width: 92%;
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
        Food<span>App</span>
    </div>


    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/my-orders">
            My Orders
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

            <div class="profile-container">

                <button
                    class="profile-btn"
                    onclick="toggleProfile()">

                    👤

                </button>


                <div
                    class="profile-menu"
                    id="profileMenu">

                    <div class="profile-name">

                        <%= loggedInUser.getName() %>

                    </div>


                    <div class="profile-email">

                        <%= loggedInUser.getEmail() %>

                    </div>


                    <div class="profile-divider"></div>


                    <a href="<%= request.getContextPath() %>/my-orders">
                        📋 My Orders
                    </a>


                    <a
                        class="logout-btn"
                        href="<%= request.getContextPath() %>/logout">

                        ↪ Logout

                    </a>

                </div>

            </div>

        <%

            }

        %>

    </div>

</div>



<!-- =========================
     HERO
========================= -->

<section class="hero">

    <div class="hero-content">


        <div class="hero-left">

            <h1>
                The best <span>food</span><br>
                delivery service
            </h1>


            <p>
                Discover delicious food from<br>
                your favorite restaurants
            </p>


            <div class="search-box">

                <span class="search-icon">
                    🔍
                </span>


                <input
                    type="text"
                    id="searchInput"
                    placeholder="Search restaurants or cuisines...">


                <button
                    onclick="filterRestaurants()">

                    Search

                </button>

            </div>

        </div>



        <div class="delivery-illustration">

            <div class="illustration-circle"></div>


            <img
                src="images/delivery-rider.png"
                alt="Food delivery rider">

        </div>

    </div>

</section>



<!-- =========================
     RESTAURANTS
========================= -->

<div class="container">

    <div class="section-header">

        <h2>
            Restaurants near you
        </h2>

        <p>
            Order from your favorite places
        </p>

    </div>


    <div
        class="card-grid"
        id="restaurantContainer">


        <%

            List<Restaurant> restaurants =
                (List<Restaurant>)
                request.getAttribute("restaurants");


            if (
                restaurants == null ||
                restaurants.isEmpty()
            ) {

        %>

            <div class="empty-state">

                <h3>
                    No restaurants found
                </h3>

                <p>
                    Please check back later.
                </p>

            </div>

        <%

            } else {

                for (
                    Restaurant restaurant :
                    restaurants
                ) {


                    String statusBadge =

                        restaurant.getActive()

                        ?

                        "<div class=\"status\">🟢 Open</div>"

                        :

                        "<div class=\"status closed\">🔴 Closed</div>";

        %>


            <div
                class="rcard"
                data-name="<%= restaurant.getName().toLowerCase() %>"
                data-cuisine="<%= restaurant.getCuisineType().toLowerCase() %>"
                onclick="window.location.href='<%= request.getContextPath() %>/menu?restaurantId=<%= restaurant.getId() %>'">


                <div class="image-container">


                    <img
                        src="images/<%= restaurant.getImagePath() %>"
                        onerror="this.src='images/food-banner.jpg'">


                    <%= statusBadge %>


                    <div class="rating">

                        ⭐ <%= restaurant.getRating() %>

                    </div>

                </div>


                <div class="card-content">


                    <h3>

                        <%= restaurant.getName() %>

                    </h3>


                    <div class="cuisine">

                        <%= restaurant.getCuisineType() %>

                    </div>


                    <div class="card-info">

                        ◷
                        <%= restaurant.getDeliveryTime() %>
                        mins

                    </div>


                    <div class="address">

                        📍
                        <%= restaurant.getAddress() %>

                    </div>

                </div>

            </div>


        <%

                }

            }

        %>


    </div>

</div>



<script>

/* =========================
   SEARCH
========================= */

function filterRestaurants() {

    const term =
        document
        .getElementById("searchInput")
        .value
        .toLowerCase();


    document
        .querySelectorAll(".rcard")
        .forEach(card => {

            const name =
                card.getAttribute("data-name");

            const cuisine =
                card.getAttribute("data-cuisine");


            card.style.display =

                (
                    name.includes(term) ||
                    cuisine.includes(term)
                )

                ? ""
                : "none";

        });
}


document
    .getElementById("searchInput")
    .addEventListener(
        "keyup",
        filterRestaurants
    );


/* =========================
   PROFILE DROPDOWN
========================= */

function toggleProfile() {

    const menu =
        document.getElementById(
            "profileMenu"
        );

    menu.classList.toggle("show");
}


document.addEventListener(
    "click",
    function(event) {

        const container =
            document.querySelector(
                ".profile-container"
            );

        const menu =
            document.getElementById(
                "profileMenu"
            );


        if (
            container &&
            !container.contains(event.target)
        ) {

            menu.classList.remove("show");

        }

    }
);

</script>


</body>

</html>