<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Login - FoodApp</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: #f4f4f7;
    min-height: 100vh;

    display: flex;
    justify-content: center;
    align-items: center;
}


/* ================= LOGIN CONTAINER ================= */

.login-container {

    width: 100%;
    max-width: 420px;

    background: white;

    padding: 35px;

    border-radius: 16px;

    box-shadow: 0 8px 30px rgba(0,0,0,0.10);
}


/* ================= LOGO ================= */

.logo {

    text-align: center;

    margin-bottom: 25px;
}

.logo h1 {

    color: #ff5722;

    font-size: 30px;

    margin-bottom: 5px;
}

.logo p {

    color: #777;

    font-size: 14px;
}


/* ================= HEADING ================= */

.login-container h2 {

    text-align: center;

    color: #222;

    font-size: 22px;

    margin-bottom: 25px;
}


/* ================= FORM ================= */

.form-group {

    margin-bottom: 18px;
}

.form-group label {

    display: block;

    font-size: 14px;

    font-weight: 600;

    color: #444;

    margin-bottom: 7px;
}

.form-group input {

    width: 100%;

    padding: 13px 14px;

    border: 1px solid #ddd;

    border-radius: 8px;

    font-size: 14px;

    outline: none;
}

.form-group input:focus {

    border-color: #ff5722;

    box-shadow: 0 0 0 2px rgba(255,87,34,0.10);
}


/* ================= LOGIN BUTTON ================= */

.login-btn {

    width: 100%;

    padding: 13px;

    background: #ff5722;

    color: white;

    border: none;

    border-radius: 8px;

    font-size: 16px;

    font-weight: 600;

    cursor: pointer;

    margin-top: 5px;
}

.login-btn:hover {

    background: #e64a19;
}


/* ================= SIGNUP ================= */

.signup-link {

    text-align: center;

    margin-top: 20px;

    font-size: 14px;

    color: #777;
}

.signup-link a {

    color: #ff5722;

    text-decoration: none;

    font-weight: 600;
}

.signup-link a:hover {

    text-decoration: underline;
}


/* ================= BACK ================= */

.back-home {

    text-align: center;

    margin-top: 15px;
}

.back-home a {

    color: #777;

    text-decoration: none;

    font-size: 13px;
}

.back-home a:hover {

    color: #ff5722;
}


/* ================= ERROR MESSAGE ================= */

.error-message {

    background: #fff1f0;

    color: #d93025;

    border: 1px solid #ffc7c2;

    padding: 10px;

    border-radius: 7px;

    font-size: 13px;

    margin-bottom: 18px;

    text-align: center;
}

</style>

</head>


<body>


<div class="login-container">


    <!-- LOGO -->

    <div class="logo">

        <h1>FoodApp</h1>

        <p>Delicious food, delivered to you</p>

    </div>


    <h2>Welcome Back</h2>


    <!--
        Later LoginServlet will send an error message
        using request.setAttribute("error", "...");
    -->

    <%
        String error = (String) request.getAttribute("error");

        if (error != null) {
    %>

        <div class="error-message">

            <%= error %>

        </div>

    <%
        }
    %>


    <!-- LOGIN FORM -->

    <form action="<%= request.getContextPath() %>/login"
          method="post">


        <!-- EMAIL -->

        <div class="form-group">

            <label>Email</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

        </div>


        <!-- PASSWORD -->

        <div class="form-group">

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter your password"
                   required>

        </div>


        <!-- LOGIN BUTTON -->

        <button type="submit"
                class="login-btn">

            Login

        </button>


    </form>


    <!-- SIGNUP -->

    <div class="signup-link">

        Don't have an account?

        <a href="Signup.html">
            Create Account
        </a>

    </div>


    <!-- BACK -->

    <div class="back-home">

        <a href="<%= request.getContextPath() %>/restaurant">

            &larr; Back to Restaurants

        </a>

    </div>


</div>


</body>

</html>