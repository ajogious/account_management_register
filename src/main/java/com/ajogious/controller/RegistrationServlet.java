package com.ajogious.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.ajogious.dao.UserDAO;
import com.ajogious.model.User;

@WebServlet("/user_registration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDao = new UserDAO();
	RequestDispatcher dispatcher;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String fullName = request.getParameter("fullName");
		String phoneNumber = request.getParameter("phoneNumber");
		String dateOfBirth = request.getParameter("dob");
		String state = request.getParameter("state");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String lga = request.getParameter("lga");
		String password = request.getParameter("password");
		String address = request.getParameter("address");

		// Perform additional processing (e.g., database insertion, validation, etc.)
		try {

			boolean usernameExists = userDao.usernameExists(username);
			if (usernameExists) {
				request.setAttribute("usernameError", "Username already exist");
				request.getRequestDispatcher("user_registration.jsp").forward(request, response);
				return;
			}

			boolean emailExists = userDao.emailExists(email);
			if (emailExists) {
				request.setAttribute("emailError", "Email already exist");
				request.getRequestDispatcher("user_registration.jsp").forward(request, response);
				return;
			}

			boolean phoneNumberExists = userDao.phoneNumberExists(phoneNumber);
			if (phoneNumberExists) {
				request.setAttribute("phoneNumberError", "Phone Number already exist");
				request.getRequestDispatcher("user_registration.jsp").forward(request, response);
				return;
			}

			// Create a new UserBean object
			User user = new User(username, fullName, phoneNumber, dateOfBirth, state, email, gender, lga, password,
					address);
			userDao.insertUser(user);
			// Respond to the client
			request.setAttribute("successMessage", "Registration Successful");
			request.getRequestDispatcher("user_registration.jsp").forward(request, response);
		} catch (Exception e) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}
}