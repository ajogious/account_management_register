package com.ajogious.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ajogious.dao.UserDAO;
import com.ajogious.model.User;

@WebServlet("/user_registration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// userdao initialization
	UserDAO userDAO = new UserDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieving user input
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

		try {
			
			boolean userNameExists = userDAO.usernameExists(username);
			if (userNameExists) {
				request.setAttribute("username", "Username already exist");
				request.getRequestDispatcher("/user_registration.jsp").forward(request, response);
				return;
			}
			
			boolean emailExists = userDAO.emailExists(email);
			if (emailExists) {
				request.setAttribute("email", "Email already exist");
				request.getRequestDispatcher("/user_registration.jsp").forward(request, response);
				return;
			}
			
			boolean phoneNumExists = userDAO.phoneNumberExists(phoneNumber);
			if (phoneNumExists) {
				request.setAttribute("phoneNumber", "Phone Number already exist");
				request.getRequestDispatcher("/user_registration.jsp").forward(request, response);
				return;
			}

			// Creating User object
			User user = new User(username, fullName, phoneNumber, dateOfBirth, state, email, gender, lga, password,
					address);

			// inserting user registration to database
			userDAO.insertUser(user);

			request.setAttribute("success", "Registration Successful");
			request.getRequestDispatcher("/user_registration.jsp").forward(request, response);
		} catch (Exception ex) {
			request.setAttribute("error", "Something went wrong!");
			request.getRequestDispatcher("/error_page.jsp").forward(request, response);
		}

	}
}
