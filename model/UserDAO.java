package com.petshop.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/petshop"; 
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    
    private static final String INSERT_USERS_SQL = "INSERT INTO Pets (name, title, details, image) VALUES (?, ?, ?, ?);";
    private static final String SELECT_ALL_USERS = "SELECT * FROM Pets;";
    private static final String SELECT_USER_BY_USERNAME = "SELECT * FROM Users WHERE username = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(User user) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getTitle());
            preparedStatement.setString(3, user.getDetails());
            preparedStatement.setString(4, user.getImage());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                String details = rs.getString("details");
                String image = rs.getString("image");
                users.add(new User(id, name, title, details, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public RegistrationUser getUserByUsername(String username) {
        RegistrationUser user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("fullName");
                String phoneNumber = rs.getString("phoneNumber");
                String password = rs.getString("password");
                String email = rs.getString("email");
                user = new RegistrationUser(id, fullName, phoneNumber, username, password, email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public int saveUser(RegistrationUser user) {
        String INSERT_USER_SQL = "INSERT INTO Users (fullName, phoneNumber, username, password, email) VALUES (?, ?, ?, ?, ?)";
        int result = 0;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getPhoneNumber());
            preparedStatement.setString(3, user.getUsername());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getEmail());
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public int updateUser(RegistrationUser user) {
    String UPDATE_USER_SQL = "UPDATE Users SET fullName = ?, phoneNumber = ?, username = ?, password = ?, email = ? WHERE id = ?";
    int result = 0;
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_SQL)) {
        preparedStatement.setString(1, user.getFullName());
        preparedStatement.setString(2, user.getPhoneNumber());
        preparedStatement.setString(3, user.getUsername());
        preparedStatement.setString(4, user.getPassword());
        preparedStatement.setString(5, user.getEmail());
        preparedStatement.setInt(6, user.getId());
        result = preparedStatement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return result;
}

    public void insertUser(RegistrationUser user) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getPhoneNumber());
            preparedStatement.setString(3, user.getUsername());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public int deleteUserByUsername(String username) {
        String sql = "DELETE FROM users WHERE username = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}



