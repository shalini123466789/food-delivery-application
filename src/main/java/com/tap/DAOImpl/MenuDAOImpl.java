package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private static final String INSERT_QUERY =
            "INSERT INTO Menu(" +
            "restaurantId,itemName,description,price,isAvailable,category," +
            "createdAt,updatedAt,deletedAt,imagePath) " +
            "VALUES(?,?,?,?,?,?,?,?,?,?)";

    private static final String SELECT_QUERY =
            "SELECT * FROM Menu WHERE menuId=?";

    private static final String UPDATE_QUERY =
            "UPDATE Menu SET " +
            "restaurantId=?, itemName=?, description=?, price=?, " +
            "isAvailable=?, category=?, imagePath=?, updatedAt=?, deletedAt=? " +
            "WHERE menuId=?";

    private static final String DELETE_QUERY =
            "DELETE FROM Menu WHERE menuId=?";

    private static final String SELECT_BY_RESTAURANT_QUERY =
            "SELECT * FROM Menu WHERE restaurantId=?";


    // =========================
    // ADD MENU
    // =========================

    @Override
    public void addMenu(Menu menu) {

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement pstm =
                    con.prepareStatement(INSERT_QUERY);

            pstm.setInt(1, menu.getRestaurantId());
            pstm.setString(2, menu.getItemName());
            pstm.setString(3, menu.getDescription());
            pstm.setDouble(4, menu.getPrice());
            pstm.setBoolean(5, menu.getisAvailable());
            pstm.setString(6, menu.getCategory());

            pstm.setTimestamp(
                    7,
                    new Timestamp(System.currentTimeMillis())
            );

            pstm.setTimestamp(
                    8,
                    new Timestamp(System.currentTimeMillis())
            );

            pstm.setTimestamp(
                    9,
                    new Timestamp(System.currentTimeMillis())
            );

            // imagePath
            pstm.setString(10, menu.getImagePath());

            int i = pstm.executeUpdate();

            System.out.println(i + " row affected");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // =========================
    // GET MENU BY ID
    // =========================

    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement pstm =
                    con.prepareStatement(SELECT_QUERY);

            pstm.setInt(1, menuId);

            ResultSet res = pstm.executeQuery();

            menu = extractMenu(res);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menu;
    }


    // =========================
    // EXTRACT MENU
    // =========================

    public static Menu extractMenu(ResultSet res)
            throws SQLException {

        Menu menu = null;

        while (res.next()) {

            int menuId = res.getInt(1);

            int restaurantId = res.getInt(2);

            String itemName = res.getString(3);

            String description = res.getString(4);

            double price = res.getDouble(5);

            boolean isAvailable = res.getBoolean(6);

            String category = res.getString(7);

            Timestamp createdAt = res.getTimestamp(8);

            Timestamp updatedAt = res.getTimestamp(9);

            Timestamp deletedAt = res.getTimestamp(10);

            // NEW
            String imagePath = res.getString(11);


            menu = new Menu(
                    menuId,
                    restaurantId,
                    itemName,
                    description,
                    price,
                    isAvailable,
                    category,
                    createdAt,
                    updatedAt,
                    deletedAt,
                    imagePath
            );
        }

        return menu;
    }


    // =========================
    // UPDATE MENU
    // =========================

    @Override
    public void updateMenu(Menu menu) {

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement pstm =
                    con.prepareStatement(UPDATE_QUERY);

            pstm.setInt(1, menu.getRestaurantId());

            pstm.setString(2, menu.getItemName());

            pstm.setString(3, menu.getDescription());

            pstm.setDouble(4, menu.getPrice());

            pstm.setBoolean(5, menu.getisAvailable());

            pstm.setString(6, menu.getCategory());

            // imagePath
            pstm.setString(7, menu.getImagePath());

            pstm.setTimestamp(
                    8,
                    new Timestamp(System.currentTimeMillis())
            );

            pstm.setTimestamp(
                    9,
                    new Timestamp(System.currentTimeMillis())
            );

            pstm.setInt(10, menu.getMenuId());


            int i = pstm.executeUpdate();

            System.out.println(i + " row updated");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // =========================
    // DELETE MENU
    // =========================

    @Override
    public void deleteMenu(int menuId) {

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement pstm =
                    con.prepareStatement(DELETE_QUERY);

            pstm.setInt(1, menuId);

            int i = pstm.executeUpdate();

            System.out.println(i + " row deleted");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // =========================
    // GET ALL MENU
    // =========================

    @Override
    public List<Menu> getAllMenu() {

        List<Menu> menuList = new ArrayList<>();

        String selectAllQuery =
                "SELECT * FROM Menu";

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement pstm =
                    con.prepareStatement(selectAllQuery);

            ResultSet res = pstm.executeQuery();

            while (res.next()) {

                int menuId = res.getInt(1);

                int restaurantId = res.getInt(2);

                String itemName = res.getString(3);

                String description = res.getString(4);

                double price = res.getDouble(5);

                boolean isAvailable = res.getBoolean(6);

                String category = res.getString(7);

                Timestamp createdAt = res.getTimestamp(8);

                Timestamp updatedAt = res.getTimestamp(9);

                Timestamp deletedAt = res.getTimestamp(10);

                // NEW
                String imagePath = res.getString(11);


                Menu menu = new Menu(
                        menuId,
                        restaurantId,
                        itemName,
                        description,
                        price,
                        isAvailable,
                        category,
                        createdAt,
                        updatedAt,
                        deletedAt,
                        imagePath
                );

                menuList.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }


    // =========================
    // GET MENU BY RESTAURANT
    // =========================

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement pstm =
                    con.prepareStatement(
                            SELECT_BY_RESTAURANT_QUERY
                    );

            pstm.setInt(1, restaurantId);

            ResultSet res = pstm.executeQuery();

            while (res.next()) {

                int menuId = res.getInt(1);

                int rId = res.getInt(2);

                String itemName = res.getString(3);

                String description = res.getString(4);

                double price = res.getDouble(5);

                boolean isAvailable = res.getBoolean(6);

                String category = res.getString(7);

                Timestamp createdAt = res.getTimestamp(8);

                Timestamp updatedAt = res.getTimestamp(9);

                Timestamp deletedAt = res.getTimestamp(10);

                // NEW
                String imagePath = res.getString(11);


                Menu menu = new Menu(
                        menuId,
                        rId,
                        itemName,
                        description,
                        price,
                        isAvailable,
                        category,
                        createdAt,
                        updatedAt,
                        deletedAt,
                        imagePath
                );

                menuList.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }
}