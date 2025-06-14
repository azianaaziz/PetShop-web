package com.petshop.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PetDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/petshop";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_PETS_SQL = "INSERT INTO Pets (name, title, details, image) VALUES (?, ?, ?, ?);";
    private static final String SELECT_ALL_PETS = "SELECT * FROM Pets;";

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

    public void insertPet(User user) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PETS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getTitle());
            preparedStatement.setString(3, user.getDetails());
            preparedStatement.setString(4, user.getImage());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> selectAllPets() {
        List<User> pets = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PETS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                String details = rs.getString("details");
                String image = rs.getString("image");
                pets.add(new User(id, name, title, details, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pets;
    }
}
