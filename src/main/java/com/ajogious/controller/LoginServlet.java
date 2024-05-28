package com.ajogious.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.ajogious.dao.UserDAO;
import com.ajogious.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("psw");

        UserDAO userDao = new UserDAO();
        HttpSession session = request.getSession();

        try {
            // Check login credentials
            User user = userDao.loginUser(username, password);
            if (user != null) {
                // Login successful
                session.setAttribute("user", user);
                session.setAttribute("success", "Login successful");
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect("admin_page.jsp");
                } else {
                    response.sendRedirect("user_page.jsp");
                }
            } else {
                // Login failed
                session.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("user_login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace(); // Log the exception (consider using a logging framework)
            session.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher("error_page.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace(); // Log the exception (consider using a logging framework)
            session.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("error_page.jsp").forward(request, response);
        }
    }
}
