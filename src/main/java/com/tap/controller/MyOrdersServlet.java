package com.tap.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.User;
import com.tap.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/my-orders")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // =========================
        // 1. CHECK LOGIN
        // =========================

        User user =
                (User) session.getAttribute("loggedInUser");

        if (user == null) {
            resp.sendRedirect(
                    req.getContextPath() + "/login.jsp"
            );
            return;
        }

        int userId = user.getId();

        // =========================
        // 2. GET USER ORDERS
        // =========================

        List<OrderTable> orders =
                new ArrayList<>();

        String query =
                "SELECT * FROM OrderTable WHERE userId=? "
                + "ORDER BY orderDate DESC";

        Connection con =
                DBConnection.getConnection();

        try {

            PreparedStatement pstm =
                    con.prepareStatement(query);

            pstm.setInt(1, userId);

            ResultSet rs =
                    pstm.executeQuery();

            while (rs.next()) {

                int orderId =
                        rs.getInt(1);

                int orderUserId =
                        rs.getInt(2);

                int restaurantId =
                        rs.getInt(3);

                java.sql.Timestamp orderDate =
                        rs.getTimestamp(4);

                double totalAmount =
                        rs.getDouble(5);

                String status =
                        rs.getString(6);

                String paymentMethod =
                        rs.getString(7);

                OrderTable order =
                        new OrderTable(
                                orderId,
                                orderUserId,
                                restaurantId,
                                orderDate,
                                totalAmount,
                                status,
                                paymentMethod
                        );

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // =========================
        // 3. GET ALL ORDER ITEMS
        // =========================

        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        List<OrderItem> allOrderItems =
                orderItemDAO.getAllOrderItem();

        // =========================
        // 4. MATCH ITEMS WITH ORDERS
        // =========================

        Map<Integer, List<OrderItem>> orderItemsMap =
                new HashMap<>();

        for (OrderTable order : orders) {

            List<OrderItem> items =
                    new ArrayList<>();

            for (OrderItem item : allOrderItems) {

                if (item.getOrderId()
                        == order.getOrderId()) {

                    items.add(item);
                }
            }

            orderItemsMap.put(
                    order.getOrderId(),
                    items
            );
        }

        // =========================
        // 5. GET MENU DETAILS
        // =========================

        Map<Integer, Menu> menuMap =
                new HashMap<>();

        MenuDAOImpl menuDAO =
                new MenuDAOImpl();

        for (OrderItem item : allOrderItems) {

            int menuId =
                    item.getMenuId();

            if (!menuMap.containsKey(menuId)) {

                Menu menu =
                        menuDAO.getMenu(menuId);

                if (menu != null) {
                    menuMap.put(menuId, menu);
                }
            }
        }

        // =========================
        // 6. SEND DATA TO JSP
        // =========================

        req.setAttribute(
                "orders",
                orders
        );

        req.setAttribute(
                "orderItemsMap",
                orderItemsMap
        );

        req.setAttribute(
                "menuMap",
                menuMap
        );

        req.getRequestDispatcher(
                "/my-orders.jsp"
        ).forward(req, resp);
    }
}