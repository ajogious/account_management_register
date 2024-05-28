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

    private final String insertUserQuery = "INSERT INTO Users (username, full_name, phone_number, date_of_birth, state, email, password, registration_date, is_active, role, address, lga, gender, acc_expiring_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String selectUsernameQuery = "SELECT username FROM Users WHERE username = ?";
    private static final String selectEmailQuery = "SELECT email FROM Users WHERE email = ?";
    private static final String selectPhoneNumberQuery = "SELECT phone_number FROM Users WHERE phone_number = ?";

    public boolean usernameExists(String username) {
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password);
                PreparedStatement preparedStatement = connection.prepareStatement(selectUsernameQuery)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean emailExists(String email) {
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password);
                PreparedStatement preparedStatement = connection.prepareStatement(selectEmailQuery)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean phoneNumberExists(String phoneNumber) {
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password);
                PreparedStatement preparedStatement = connection.prepareStatement(selectPhoneNumberQuery)) {
            preparedStatement.setString(1, phoneNumber);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

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
            } else {
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
                    preparedStatement.setString(14, user.getAccountExpiring());
                    preparedStatement.executeUpdate();
                    return "success";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "An error occurred while registering user: " + e.getMessage();
        }
    }

    public User loginUser(String username, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE username=?";
        try (Connection connection = DriverManager.getConnection(url, this.username, this.password);
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedHashedPassword = rs.getString("password");
                    if (User.checkPassword(password, storedHashedPassword)) {
                        User user = new User();
                        user.setUsername(username);
                        user.setFullName(rs.getString("full_name"));
                        user.setPhoneNumber(rs.getString("phone_number"));
                        user.setDateOfBirth(rs.getString("date_of_birth"));
                        user.setState(rs.getString("state"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(storedHashedPassword);
                        user.setRegistrationDate(rs.getString("registration_date"));
                        user.setActive(rs.getBoolean("is_active"));
                        user.setRole(rs.getString("role"));
                        user.setAddress(rs.getString("address"));
                        user.setLga(rs.getString("lga"));
                        user.setGender(rs.getString("gender"));
                        user.setAccountExpiring(rs.getString("acc_expiring_date"));
                        return user;
                    }
                }
            }
        }
        return null;
    }
}
