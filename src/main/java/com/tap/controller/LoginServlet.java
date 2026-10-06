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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                           HttpServletResponse resp)
            throws ServletException, IOException {

        // Get values from login.jsp
        String email = req.getParameter("email");
        String password = req.getParameter("password");


        // Create DAO object
        UserDAO userDAO = new UserDAOImpl();


        // Find complete User using email
        User user = userDAO.getUserEmail(email);


        // Check whether email exists
        if (user != null) {

            // Check password
            if (user.getPassword().equals(password)) {

                // Login successful
                HttpSession session = req.getSession();

                session.setAttribute(
                        "loggedInUser",
                        user
                );


                // Check where user came from
                String afterLogin =
                        (String) session.getAttribute("afterLogin");


                // User came from checkout
                if ("checkout".equals(afterLogin)) {

                    session.removeAttribute("afterLogin");

                    resp.sendRedirect(
                            req.getContextPath() + "/checkout"
                    );

                } else {

                    // Normal login
                    resp.sendRedirect(
                            req.getContextPath() + "/restaurant"
                    );
                }

            } else {

                // Password incorrect
                req.setAttribute(
                        "error",
                        "Invalid password"
                );

                req.getRequestDispatcher(
                        "/login.jsp"
                ).forward(req, resp);
            }

        } else {

            // Email does not exist
            req.setAttribute(
                    "error",
                    "Email not registered"
            );

            req.getRequestDispatcher(
                    "/login.jsp"
            ).forward(req, resp);
        }
    }
}