package com.ajogious.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ajogious.model.User;

public class UserDAO {

    private final String url = "jdbc:mysql://127.0.0.1:3306/account_management_register";
    private final String username = "root";
    private final String password = "password";

    // SQL queries
    private final String insertUserQuery = "INSERT INTO Users (username, full_name, phone_number, date_of_birth, state, email, password, registration_date, is_active, role, address, lga, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String selectUsernameQuery = "SELECT username FROM Users WHERE username = ?";
    private static final String selectEmailQuery = "SELECT email FROM Users WHERE email = ?";
    private static final String selectPhoneNumberQuery = "SELECT phone_number FROM Users WHERE phone_number = ?";

    // Method to check if username exists
    public boolean usernameExists(String username) throws SQLException {
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password);
             PreparedStatement preparedStatement = connection.prepareStatement(selectUsernameQuery)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    // Method to check if email exists
    public boolean emailExists(String email) throws SQLException {
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password);
             PreparedStatement preparedStatement = connection.prepareStatement(selectEmailQuery)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    // Method to check if phone number exists
    public boolean phoneNumberExists(String phoneNumber) throws SQLException {
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password);
             PreparedStatement preparedStatement = connection.prepareStatement(selectPhoneNumberQuery)) {
            preparedStatement.setString(1, phoneNumber);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    // Inserting to create a new user object
    public String insertUser(User user) {
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password)) {
            if (usernameExists(user.getUsername())) {
                return "username";
            }
            if (emailExists(user.getEmail())) {
                return "email";
            }
            if (phoneNumberExists(user.getPhoneNumber())) {
                return "phoneNumber";
            }

            try (PreparedStatement preparedStatement = connection.prepareStatement(insertUserQuery)) {
                preparedStatement.setString(1, user.getUsername());
                preparedStatement.setString(2, user.getFullName());
                preparedStatement.setString(3, user.getPhoneNumber());
                preparedStatement.setString(4, user.getDateOfBirth());
                preparedStatement.setString(5, user.getState());
                preparedStatement.setString(6, user.getEmail());
                preparedStatement.setString(7, user.getPassword());
                preparedStatement.setString(8, user.getRegistrationDate());
                preparedStatement.setBoolean(9, user.isActive());
                preparedStatement.setString(10, user.getRole());
                preparedStatement.setString(11, user.getAddress());
                preparedStatement.setString(12, user.getLga());
                preparedStatement.setString(13, user.getGender());

                preparedStatement.executeUpdate();
                return "success";
            }
        } catch (SQLException e) {
            // Log or handle the exception more gracefully
            return "An error occurred while registering user: " + e.getMessage();
        }
    }
}

