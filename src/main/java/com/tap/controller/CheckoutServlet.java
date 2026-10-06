package com.tap.controller;

import java.io.IOException;

import com.tap.DAO.OrderItemDAO;
import com.tap.DAO.OrderTableDAO;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.DAOImpl.OrderTableDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final double DELIVERY_FEE = 40.0;

    @Override
    protected void doGet(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        // User not logged in
        if (user == null) {
            session.setAttribute("afterLogin", "checkout");

            resp.sendRedirect(
                    req.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get cart
        Cart cart = (Cart) session.getAttribute("myCart");

        // Cart empty
        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(
                    req.getContextPath() + "/cart"
            );
            return;
        }

        // Show checkout page
        req.getRequestDispatcher("/checkout.jsp")
           .forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req,
                           HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        // Login check
        if (user == null) {
            session.setAttribute("afterLogin", "checkout");

            resp.sendRedirect(
                    req.getContextPath() + "/login.jsp"
            );
            return;
        }

        // Get cart
        Cart cart = (Cart) session.getAttribute("myCart");

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(
                    req.getContextPath() + "/cart"
            );
            return;
        }

        // Calculate final amount
        double itemTotal = cart.getTotal();
        double totalAmount = itemTotal + DELIVERY_FEE;

        // =========================
        // 1. INSERT INTO OrderTable
        // =========================

        OrderTable order = new OrderTable(
                user.getId(),
                cart.getRestaurantId(),
                totalAmount,
                "PENDING",
                "CASH"
        );

        OrderTableDAO orderTableDAO =
                new OrderTableDAOImpl();

        int orderId =
                orderTableDAO.addOrderTable(order);

        // Check order creation
        if (orderId <= 0) {
            req.setAttribute(
                    "error",
                    "Unable to place order. Please try again."
            );

            req.getRequestDispatcher("/checkout.jsp")
               .forward(req, resp);

            return;
        }


        // =========================
        // 2. INSERT INTO OrderItem
        // =========================

        OrderItemDAO orderItemDAO =
                new OrderItemDAOImpl();

        for (CartItem cartItem : cart.getItems()) {

            OrderItem orderItem =
                    new OrderItem(
                            orderId,
                            cartItem.getMenu().getMenuId(),
                            cartItem.getQuantity(),
                            cartItem.getSubtotal()
                    );

            orderItemDAO.addOrderItem(orderItem);
        }


        // =========================
        // 3. CLEAR CART
        // =========================

        session.removeAttribute("myCart");


        // =========================
        // 4. GO TO CONFIRMATION
        // =========================

        resp.sendRedirect(
                req.getContextPath()
                + "/order-confirmation.jsp?orderId="
                + orderId
        );
    }
}