package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

    private static final String INSERT_QUERY =
            "INSERT INTO user(name,email,password,phone,address,role,createdDate,lastLoginDate) "
            + "VALUES(?,?,?,?,?,?,?,?)";

    private static final String SELECT_QUERY =
            "SELECT * FROM user WHERE id=?";

    private static final String GET_USER_BY_EMAIL_QUERY =
            "SELECT * FROM user WHERE email=?";

    private static final String UPDATE_QUERY =
            "UPDATE user SET name=?,email=?,password=?,phone=?,address=?,role=?,lastLoginDate=? "
            + "WHERE id=?";

    private static final String DELETE_QUERY =
            "DELETE FROM user WHERE id=?";


    @Override
    public void addUser(User user) {

        Connection con = DBConnection.getConnection();

        try {

            System.out.println("Database connection: " + con);

            PreparedStatement pstmt =
                    con.prepareStatement(INSERT_QUERY);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getRole());

            pstmt.setTimestamp(
                    7,
                    new Timestamp(System.currentTimeMillis())
            );

            pstmt.setTimestamp(
                    8,
                    new Timestamp(System.currentTimeMillis())
            );

            int i = pstmt.executeUpdate();

            System.out.println("INSERT RESULT = " + i);

        } catch (SQLException e) {

            System.out.println("ERROR WHILE INSERTING USER");
            e.printStackTrace();
        }
    }

    @Override
    public User getUser(int id) {

        User user = null;

        Connection con = DBConnection.getConnection();

        try {
            PreparedStatement pstm =
                    con.prepareStatement(SELECT_QUERY);

            pstm.setInt(1, id);

            ResultSet result = pstm.executeQuery();

            user = extractUser(result);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


    // GET COMPLETE USER USING EMAIL
    @Override
    public User getUserEmail(String email) {

        User user = null;

        Connection con = DBConnection.getConnection();

        try {
            PreparedStatement pstm =
                    con.prepareStatement(GET_USER_BY_EMAIL_QUERY);

            pstm.setString(1, email);

            ResultSet result = pstm.executeQuery();

            user = extractUser(result);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


    // Converts database row into User object
    private User extractUser(ResultSet res)
            throws SQLException {

        User user = null;

        if (res.next()) {

            int id = res.getInt("id");

            String name = res.getString("name");

            String email = res.getString("email");

            String password = res.getString("password");

            String phone = res.getString("phone");

            String address = res.getString("address");

            String role = res.getString("role");

            Timestamp createdDate =
                    res.getTimestamp("createdDate");

            Timestamp lastLoginDate =
                    res.getTimestamp("lastLoginDate");


            user = new User(
                    id,
                    name,
                    email,
                    password,
                    phone,
                    address,
                    role,
                    createdDate,
                    lastLoginDate
            );
        }

        return user;
    }


    @Override
    public void updateUser(User user) {

        Connection con = DBConnection.getConnection();

        try {
            PreparedStatement pstm =
                    con.prepareStatement(UPDATE_QUERY);

            pstm.setString(1, user.getName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            pstm.setString(4, user.getPhone());
            pstm.setString(5, user.getAddress());
            pstm.setString(6, user.getRole());

            pstm.setTimestamp(
                    7,
                    new Timestamp(System.currentTimeMillis())
            );

            pstm.setInt(8, user.getId());

            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void deleteUser(int id) {

        Connection con = DBConnection.getConnection();

        try {
            PreparedStatement pstm =
                    con.prepareStatement(DELETE_QUERY);

            pstm.setInt(1, id);

            pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<User> getAllUser() {

        // You have not implemented this method yet.
        return null;
    }
}