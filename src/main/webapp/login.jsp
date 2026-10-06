<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Login - FoodApp</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #fff4df;
    color: #111;
    min-height: 100vh;
}


/* =========================
   NAVBAR
========================= */

.navbar {
    height: 72px;
    background: #ffd84d;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 42px;

    border-bottom: 1px solid rgba(0,0,0,0.05);
}

.logo {
    font-size: 32px;
    font-weight: 800;
    color: #111;
    letter-spacing: -1.5px;
}

.logo span {
    color: #ff4d22;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 34px;
}

.nav-links a {
    text-decoration: none;
    color: #111;
    font-size: 16px;
    font-weight: 600;

    transition: 0.2s;
}

.nav-links a:hover {
    color: #ff4d22;
}


/* =========================
   PAGE
========================= */

.login-page {
    min-height: calc(100vh - 72px);

    display: flex;
    justify-content: center;
    align-items: center;

    padding: 55px 30px;

    position: relative;
    overflow: hidden;
}


/* Decorative circles */

.login-page::before {
    content: "";
    position: absolute;

    width: 220px;
    height: 220px;

    background: rgba(255,216,77,0.35);

    border-radius: 50%;

    top: 40px;
    left: -90px;
}

.login-page::after {
    content: "";
    position: absolute;

    width: 180px;
    height: 180px;

    background: rgba(255,77,34,0.08);

    border-radius: 50%;

    right: -60px;
    bottom: 30px;
}


/* =========================
   MAIN CARD
========================= */

.login-wrapper {
    width: 100%;
    max-width: 1050px;

    min-height: 610px;

    background: #fff;

    border-radius: 28px;

    overflow: hidden;

    display: grid;

    grid-template-columns: 44% 56%;

    box-shadow:
        0 20px 60px rgba(0,0,0,0.12);

    position: relative;

    z-index: 2;
}


/* =========================
   LEFT FOOD PANEL
========================= */

.food-panel {

    position: relative;

    background:
        linear-gradient(
            rgba(0,0,0,0.35),
            rgba(0,0,0,0.55)
        ),
        url("images/menu1.jpeg");

    background-size: cover;
    background-position: center;

    padding: 55px 45px;

    color: white;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
}


.food-panel-content {
    max-width: 330px;
}

.food-panel h1 {
    font-size: 48px;
    line-height: 1.05;

    margin-bottom: 22px;

    font-weight: 800;
}

.food-panel h1 span {
    color: #ffd84d;
}

.food-panel p {
    font-size: 18px;
    line-height: 1.6;

    color: rgba(255,255,255,0.9);
}


/* Food benefits */

.benefits {
    display: flex;
    flex-direction: column;
    gap: 18px;
}

.benefit {
    display: flex;
    align-items: center;
    gap: 14px;
}

.benefit-icon {
    width: 45px;
    height: 45px;

    border-radius: 50%;

    background: white;

    color: #ff4d22;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 20px;
}

.benefit-text {
    font-size: 15px;
    font-weight: 600;
}


/* =========================
   LOGIN FORM SIDE
========================= */

.form-panel {

    padding: 65px 70px;

    display: flex;
    flex-direction: column;
    justify-content: center;
}

.form-panel h2 {
    font-size: 38px;

    margin-bottom: 10px;

    font-weight: 800;
}

.form-subtitle {
    color: #777;

    font-size: 16px;

    margin-bottom: 35px;
}


/* =========================
   ERROR MESSAGE
========================= */

.error-message {

    background: #fff0ed;

    color: #d93616;

    border: 1px solid #ffc8bc;

    padding: 12px 15px;

    border-radius: 10px;

    margin-bottom: 20px;

    font-size: 14px;

    font-weight: 600;
}


/* =========================
   INPUT
========================= */

.input-group {
    margin-bottom: 20px;
}

.input-group label {

    display: block;

    font-size: 14px;

    font-weight: 600;

    margin-bottom: 8px;

    color: #333;
}

.input-box {
    position: relative;
}

.input-box span {
    position: absolute;

    left: 16px;
    top: 50%;

    transform: translateY(-50%);

    font-size: 17px;

    color: #888;
}

.input-box input {

    width: 100%;

    height: 54px;

    border: 1px solid #ddd;

    border-radius: 12px;

    padding: 0 16px 0 48px;

    font-size: 15px;

    outline: none;

    transition: 0.2s;

    background: #fff;
}

.input-box input:focus {

    border-color: #ff5722;

    box-shadow:
        0 0 0 3px rgba(255,87,34,0.12);
}


/* =========================
   LOGIN BUTTON
========================= */

.login-btn {

    width: 100%;

    height: 55px;

    border: none;

    border-radius: 14px;

    background: #ff512f;

    color: white;

    font-size: 17px;

    font-weight: 700;

    cursor: pointer;

    margin-top: 8px;

    transition: 0.2s;

    box-shadow:
        0 8px 20px rgba(255,81,47,0.25);
}

.login-btn:hover {

    background: #e94322;

    transform: translateY(-1px);
}


/* =========================
   SIGNUP
========================= */

.signup-text {

    text-align: center;

    margin-top: 25px;

    color: #777;

    font-size: 15px;
}

.signup-text a {

    color: #ff4d22;

    font-weight: 700;

    text-decoration: none;
}

.signup-text a:hover {
    text-decoration: underline;
}


/* =========================
   BACK
========================= */

.back-link {

    display: block;

    text-align: center;

    margin-top: 18px;

    color: #777;

    text-decoration: none;

    font-size: 14px;

    font-weight: 500;
}

.back-link:hover {
    color: #ff4d22;
}


/* =========================
   RESPONSIVE
========================= */

@media (max-width: 850px) {

    .login-wrapper {
        grid-template-columns: 1fr;
        max-width: 550px;
    }

    .food-panel {
        min-height: 300px;
        padding: 40px;
    }

    .food-panel h1 {
        font-size: 38px;
    }

    .benefits {
        display: none;
    }

    .form-panel {
        padding: 45px 35px;
    }
}


@media (max-width: 600px) {

    .navbar {
        padding: 0 20px;
    }

    .logo {
        font-size: 27px;
    }

    .nav-links {
        gap: 15px;
    }

    .nav-links a {
        font-size: 14px;
    }

    .login-page {
        padding: 25px 15px;
    }

    .login-wrapper {
        border-radius: 20px;
    }

    .food-panel {
        min-height: 250px;
        padding: 30px;
    }

    .food-panel h1 {
        font-size: 32px;
    }

    .form-panel {
        padding: 35px 25px;
    }

    .form-panel h2 {
        font-size: 30px;
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

        <a href="<%= request.getContextPath() %>/restaurant">
            Restaurants
        </a>

        <a href="<%= request.getContextPath() %>/cart">
            🛒 Cart
        </a>

        <a href="<%= request.getContextPath() %>/login.jsp">
            Login
        </a>

    </div>

</div>


<!-- =========================
     LOGIN PAGE
========================= -->

<div class="login-page">

    <div class="login-wrapper">


        <!-- LEFT SIDE -->

        <div class="food-panel">

            <div class="food-panel-content">

                <h1>
                    Good Food<br>
                    <span>Better Mood</span>
                </h1>

                <p>
                    Login to explore your favorite restaurants
                    and order delicious food.
                </p>

            </div>


            <div class="benefits">

                <div class="benefit">

                    <div class="benefit-icon">
                        🍴
                    </div>

                    <div class="benefit-text">
                        Wide variety of restaurants
                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        🚴
                    </div>

                    <div class="benefit-text">
                        Fast & reliable delivery
                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        ❤️
                    </div>

                    <div class="benefit-text">
                        Best food at your fingertips
                    </div>

                </div>

            </div>

        </div>


        <!-- RIGHT SIDE -->

        <div class="form-panel">

            <h2>
                Welcome Back!
            </h2>

            <p class="form-subtitle">
                Login to your FoodApp account
            </p>


            <!-- ERROR MESSAGE -->

            <%
                String error =
                    (String) request.getAttribute("error");

                if (error != null) {
            %>

                <div class="error-message">
                    <%= error %>
                </div>

            <%
                }
            %>


            <!-- LOGIN FORM -->

            <form
                action="<%= request.getContextPath() %>/login"
                method="post">


                <!-- EMAIL -->

                <div class="input-group">

                    <label>
                        Email Address
                    </label>

                    <div class="input-box">

                        <span>✉</span>

                        <input
                            type="email"
                            name="email"
                            placeholder="Enter your email"
                            required>

                    </div>

                </div>


                <!-- PASSWORD -->

                <div class="input-group">

                    <label>
                        Password
                    </label>

                    <div class="input-box">

                        <span>🔒</span>

                        <input
                            type="password"
                            name="password"
                            placeholder="Enter your password"
                            required>

                    </div>

                </div>


                <!-- LOGIN -->

                <button
                    type="submit"
                    class="login-btn">

                    Login

                </button>


            </form>


            <!-- SIGNUP -->

            <div class="signup-text">

                Don't have an account?

                <a href="<%= request.getContextPath() %>/signup.jsp">
                    Sign Up
                </a>

            </div>


            <!-- BACK -->

            <a
                href="<%= request.getContextPath() %>/restaurant"
                class="back-link">

                ← Back to Restaurants

            </a>

        </div>

    </div>

</div>


</body>

</html>