package com.ajogious.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.ajogious.dao.UserDAO;
import com.ajogious.model.User;
import com.ajogious.model.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form parameters
		String username = request.getParameter("username");
		String password = request.getParameter("psw");

		// Create an instance of UserLoginDao
		UserDAO userDao = new UserDAO();

		// Retrieve hashed password from the database
		String hashedPasswordFromDatabase = userDao.getHashedPassword(username);

		if (hashedPasswordFromDatabase != null && userDao.verifyPassword(password, hashedPasswordFromDatabase)) {
			// Passwords match, login successful
			// Retrieve user details
			User user = userDao.getUserDetails(username);

			// Check if the user is an admin
			if (user.isAdmin()) {
				// Set user details as session attribute
				request.getSession().setAttribute("admin", user);

				request.setAttribute("success", "Login Successfully");

				// Redirect to admin page
				response.sendRedirect("adminPage.jsp");
			} else {
				// Set user details as session attribute
				request.getSession().setAttribute("user", user);

				// Set success message
				request.getSession().setAttribute("success", "Login Successfully");

				// Forward to login page
				request.getRequestDispatcher("userProfile.jsp").forward(request, response);
			}
		} else {
			// Invalid username or password, redirect back to login page with error message
			request.setAttribute("errorMessage", "Invalid username or password");
			request.getRequestDispatcher("userLogin.jsp").forward(request, response);
		}
	}
}
