package com.tap.controller;

import java.io.IOException;

import com.tap.DAO.MenuDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("myCart");

        // ================= ADD =================
        if ("add".equals(action)) {

            MenuDAO dao = new MenuDAOImpl();

            Menu menu = dao.getMenu(menuId);

            if (cart == null) {
                cart = new Cart();
                session.setAttribute("myCart", cart);
            }

            // If item belongs to another restaurant
            if (!cart.isEmpty()
                    && cart.getRestaurantId() != menu.getRestaurantId()) {

                cart.clear();
            }

            cart.addItem(new CartItem(menu, 1));

            // ADD from MENU -> go back to MENU
            resp.sendRedirect(
                    req.getContextPath()
                    + "/menu?restaurantId="
                    + menu.getRestaurantId()
                    + "#item-" + menuId
            );

            return;
        }

        // ================= UPDATE =================
        if ("update".equals(action)) {

            int quantity = Integer.parseInt(
                    req.getParameter("quantity")
            );

            String redirect = req.getParameter("redirect");

            int restaurantId = Integer.parseInt(
                    req.getParameter("restaurantId")
            );

            if (cart != null) {

                if (quantity <= 0) {
                    cart.removeItem(menuId);
                } else {
                    cart.updateItem(menuId, quantity);
                }
            }

            // Decide where to send the user back based on which page submitted the form
            if ("menu".equals(redirect)) {

                resp.sendRedirect(
                        req.getContextPath()
                        + "/menu?restaurantId="
                        + restaurantId
                        + "#item-" + menuId
                );

            } else {

                resp.sendRedirect(
                        req.getContextPath() + "/cart"
                );
            }

            return;
        }

        // ================= REMOVE =================
        if ("remove".equals(action)) {

            if (cart != null) {
                cart.removeItem(menuId);
            }

            // REMOVE from CART -> stay in CART
            resp.sendRedirect(
                    req.getContextPath() + "/cart"
            );

            return;
        }

        // ================= DEFAULT =================
        resp.sendRedirect(
                req.getContextPath() + "/cart"
        );
    }
}