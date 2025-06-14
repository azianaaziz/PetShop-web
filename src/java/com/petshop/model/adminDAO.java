/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Aziana
 */
package com.petshop.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class adminDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/petshop";
    private String jdbcUsername = "root"; 
    private String jdbcPassword = "admin"; 

    public adminDAO() {
        // Default constructor
    }

    public boolean validateLogin(String username, String password) {
        String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

                ResultSet resultSet = preparedStatement.executeQuery();
                return resultSet.next(); // Return true if a row is found, indicating valid credentials.
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
