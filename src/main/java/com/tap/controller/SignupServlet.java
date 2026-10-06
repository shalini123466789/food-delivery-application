package com.tap.controller;

import java.io.IOException;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                           HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");

        UserDAO userDAO = new UserDAOImpl();

        // Check whether email already exists
        User existingUser = userDAO.getUserEmail(email);

        if (existingUser != null) {

            req.setAttribute(
                    "error",
                    "Email already registered. Please login."
            );

            req.getRequestDispatcher("/signup.jsp")
               .forward(req, resp);

            return;
        }

        // Create new customer
        User user = new User(
                name,
                email,
                password,
                phone,
                address,
                "customer"
        );

        // Save user
        userDAO.addUser(user);

        // Fetch the newly created user
        User loggedInUser = userDAO.getUserEmail(email);

        // Create session
        HttpSession session = req.getSession();

        // Store user in session
        session.setAttribute(
                "loggedInUser",
                loggedInUser
        );

        // Directly go to restaurant page
        resp.sendRedirect(
                req.getContextPath() + "/restaurant"
        );
    }
}