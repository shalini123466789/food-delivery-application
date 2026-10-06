<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Sign Up - FoodApp</title>

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

.signup-page {
    min-height: calc(100vh - 72px);

    display: flex;
    justify-content: center;
    align-items: center;

    padding: 45px 30px;

    position: relative;
    overflow: hidden;
}


/* Decorative circles */

.signup-page::before {
    content: "";

    position: absolute;

    width: 220px;
    height: 220px;

    background: rgba(255,216,77,0.35);

    border-radius: 50%;

    top: 30px;
    left: -90px;
}

.signup-page::after {
    content: "";

    position: absolute;

    width: 180px;
    height: 180px;

    background: rgba(255,77,34,0.08);

    border-radius: 50%;

    right: -60px;
    bottom: 20px;
}


/* =========================
   MAIN CARD
========================= */

.signup-wrapper {

    width: 100%;
    max-width: 1080px;

    min-height: 650px;

    background: white;

    border-radius: 28px;

    overflow: hidden;

    display: grid;

    grid-template-columns: 42% 58%;

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
            rgba(255,77,34,0.75),
            rgba(255,77,34,0.82)
        ),
        url("images/menu1.jpeg");

    background-size: cover;
    background-position: center;

    padding: 50px 42px;

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

    margin-bottom: 20px;

    font-weight: 800;
}

.food-panel h1 span {
    color: #ffd84d;
}

.food-panel p {

    font-size: 17px;

    line-height: 1.6;

    color: rgba(255,255,255,0.95);
}


/* =========================
   BENEFITS
========================= */

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
   FORM PANEL
========================= */

.form-panel {

    padding: 45px 65px;

    display: flex;

    flex-direction: column;

    justify-content: center;
}

.form-panel h2 {

    font-size: 36px;

    font-weight: 800;

    margin-bottom: 8px;
}

.form-subtitle {

    color: #777;

    font-size: 15px;

    margin-bottom: 25px;
}


/* =========================
   ERROR
========================= */

.error-message {

    background: #fff0ed;

    color: #d93616;

    border: 1px solid #ffc8bc;

    padding: 11px 14px;

    border-radius: 10px;

    margin-bottom: 18px;

    font-size: 14px;

    font-weight: 600;
}


/* =========================
   FORM GRID
========================= */

.form-grid {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 16px;
}

.full-width {
    grid-column: 1 / -1;
}


/* =========================
   INPUT
========================= */

.input-group {
    margin-bottom: 2px;
}

.input-group label {

    display: block;

    font-size: 13px;

    font-weight: 600;

    margin-bottom: 7px;

    color: #333;
}

.input-box {

    position: relative;
}

.input-box span {

    position: absolute;

    left: 15px;

    top: 50%;

    transform: translateY(-50%);

    color: #888;

    font-size: 16px;
}

.input-box input {

    width: 100%;

    height: 49px;

    border: 1px solid #ddd;

    border-radius: 11px;

    padding: 0 14px 0 44px;

    font-size: 14px;

    outline: none;

    transition: 0.2s;

    background: white;
}

.input-box input:focus {

    border-color: #ff5722;

    box-shadow:
        0 0 0 3px rgba(255,87,34,0.12);
}


/* =========================
   ADDRESS
========================= */

.address-box {

    position: relative;
}

.address-box span {

    position: absolute;

    left: 15px;

    top: 15px;

    color: #888;

    font-size: 16px;
}

.address-box textarea {

    width: 100%;

    min-height: 75px;

    resize: vertical;

    border: 1px solid #ddd;

    border-radius: 11px;

    padding: 13px 14px 13px 44px;

    font-family: inherit;

    font-size: 14px;

    outline: none;

    transition: 0.2s;
}

.address-box textarea:focus {

    border-color: #ff5722;

    box-shadow:
        0 0 0 3px rgba(255,87,34,0.12);
}


/* =========================
   SIGNUP BUTTON
========================= */

.signup-btn {

    width: 100%;

    height: 53px;

    border: none;

    border-radius: 13px;

    background: #ff512f;

    color: white;

    font-size: 16px;

    font-weight: 700;

    cursor: pointer;

    margin-top: 20px;

    transition: 0.2s;

    box-shadow:
        0 8px 20px rgba(255,81,47,0.25);
}

.signup-btn:hover {

    background: #e94322;

    transform: translateY(-1px);
}


/* =========================
   LOGIN LINK
========================= */

.login-text {

    text-align: center;

    margin-top: 20px;

    color: #777;

    font-size: 14px;
}

.login-text a {

    color: #ff4d22;

    font-weight: 700;

    text-decoration: none;
}

.login-text a:hover {
    text-decoration: underline;
}


/* =========================
   BACK
========================= */

.back-link {

    display: block;

    text-align: center;

    margin-top: 13px;

    color: #777;

    text-decoration: none;

    font-size: 13px;

    font-weight: 500;
}

.back-link:hover {
    color: #ff4d22;
}


/* =========================
   RESPONSIVE
========================= */

@media (max-width: 850px) {

    .signup-wrapper {

        grid-template-columns: 1fr;

        max-width: 560px;
    }

    .food-panel {

        min-height: 280px;

        padding: 40px;
    }

    .food-panel h1 {
        font-size: 38px;
    }

    .benefits {
        display: none;
    }

    .form-panel {
        padding: 40px 35px;
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
        font-size: 13px;
    }

    .signup-page {
        padding: 20px 15px;
    }

    .signup-wrapper {
        border-radius: 20px;
    }

    .food-panel {
        min-height: 230px;

        padding: 30px;
    }

    .food-panel h1 {
        font-size: 32px;
    }

    .form-panel {
        padding: 30px 22px;
    }

    .form-panel h2 {
        font-size: 29px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .full-width {
        grid-column: auto;
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
     SIGNUP PAGE
========================= -->

<div class="signup-page">

    <div class="signup-wrapper">


        <!-- =========================
             LEFT PANEL
        ========================= -->

        <div class="food-panel">

            <div class="food-panel-content">

                <h1>
                    Join FoodApp
                    <br>
                    <span>Today!</span>
                </h1>

                <p>
                    Create an account and enjoy delicious
                    food from your favorite restaurants.
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


        <!-- =========================
             FORM PANEL
        ========================= -->

        <div class="form-panel">

            <h2>
                Create Account
            </h2>

            <p class="form-subtitle">
                Join FoodApp and start your food journey
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


            <!-- =========================
                 SIGNUP FORM
            ========================= -->

            <form
                action="<%= request.getContextPath() %>/signup"
                method="post">


                <div class="form-grid">


                    <!-- NAME -->

                    <div class="input-group">

                        <label>
                            Full Name
                        </label>

                        <div class="input-box">

                            <span>👤</span>

                            <input
                                type="text"
                                name="name"
                                placeholder="Enter your name"
                                required>

                        </div>

                    </div>


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


                    <!-- PHONE -->

                    <div class="input-group">

                        <label>
                            Phone Number
                        </label>

                        <div class="input-box">

                            <span>📞</span>

                            <input
                                type="tel"
                                name="phone"
                                placeholder="Enter phone number"
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
                                placeholder="Create password"
                                required>

                        </div>

                    </div>


                    <!-- ADDRESS -->

                    <div class="input-group full-width">

                        <label>
                            Address
                        </label>

                        <div class="address-box">

                            <span>📍</span>

                            <textarea
                                name="address"
                                placeholder="Enter your address"
                                required></textarea>

                        </div>

                    </div>


                </div>


                <!-- SIGN UP BUTTON -->

                <button
                    type="submit"
                    class="signup-btn">

                    Create Account

                </button>


            </form>


            <!-- LOGIN -->

            <div class="login-text">

                Already have an account?

                <a href="<%= request.getContextPath() %>/login.jsp">
                    Login
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