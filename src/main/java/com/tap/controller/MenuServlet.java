package com.tap.controller;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(req.getParameter("restaurantId"));

        // Get menu items
        MenuDAO menuDAO = new MenuDAOImpl();

        List<Menu> menuList =
                menuDAO.getMenuByRestaurantId(restaurantId);

        // Get selected restaurant
        RestaurantDAO restaurantDAO =
                new RestaurantDAOImpl();

        Restaurant restaurant =
                restaurantDAO.get(restaurantId);

        // Send data to JSP
        req.setAttribute("menuList", menuList);

        req.setAttribute("restaurant", restaurant);

        RequestDispatcher rd =
                req.getRequestDispatcher("menu.jsp");

        rd.forward(req, resp);
    }
}