<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
h2 {
	font-size: 30px;
}
</style>
<title>Admin Page</title>
</head>
<body>
	<%
	// Check if the user is authenticated
	if (session == null || session.getAttribute("user") == null) {
		// If not authenticated, redirect to the login page
		response.sendRedirect("user_login.jsp");
		return; // Stop processing further
	}
	%>

	<!-- Navigation Bar -->
	<nav class="navbar fixed-top mb-5 navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">Admin Dashboard</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<button class="nav-link btn btn-primary me-2">Admin
							Dashboard</button>
					</li>
					<li class="nav-item">
						<button class="nav-link btn btn-primary me-2" id="adminProfileBtn">
							Admin Profile</button>
					</li>
					<li class="nav-item dropdown">
						<button class="nav-link btn btn-secondary dropdown-toggle"
							id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">Users</button>
						<ul class="dropdown-menu" aria-labelledby="userDropdown">
							<li>
								<button type="button" class="dropdown-item">View all
									Users</button>
							</li>
							<li>
								<button class="dropdown-item">View a User</button>
							</li>
							<li>
								<button class="dropdown-item">View Active Users</button>
							</li>
							<li>
								<button class="dropdown-item">View Expired Users</button>
							</li>
						</ul>
					</li>
				</ul>
				<form class="nav-link ms-2" action="UserLogout" method="post">
					<button type="submit" class="btn btn-danger">Sign Out</button>
				</form>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container mt-3">
		<h2>Welcome back, ${user.fullName}!</h2>
	</div>
	<div class="h5 text-success success-message p-3">
		<%-- Check if success message exists in session and display it --%>
		<%
		String successMessage = (String) session.getAttribute("success");
		if (successMessage != null) {
			out.print(successMessage);
			session.removeAttribute("success");
		}
		%>
	</div>


	<!-- Admin Profile Modal -->
	<div class="modal fade" id="adminProfileModal" tabindex="-1"
		aria-labelledby="adminProfileModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="adminProfileModalLabel">Admin
						Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						<strong>Full Name: </strong>${user.fullName}</p>
					<p>
					<p>
						<strong>Username: </strong>${user.username}</p>
					<p>
						<strong>Email: </strong>${user.email}</p>
					<p>
						<strong>State: </strong>${user.state}</p>
					<p>
						<strong>LGA: </strong>${user.lga}</p>
					<p>
						<strong>Phone Number: </strong>${user.phoneNumber}</p>
					<p>
						<strong>Address: </strong>${user.address}</p>
					<p>
						<strong>Role: </strong>${user.role}</p>
					<p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Bootstrap JS (optional) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- jQuery CDN (required for search functionality) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- JavaScript code for pagination and search -->
	<script>
		document.getElementById('adminProfileBtn').addEventListener(
				'click',
				function() {
					var adminProfileModal = new bootstrap.Modal(document
							.getElementById('adminProfileModal'));
					adminProfileModal.show();
				});

		window.onload = function() {
			// Hide all error messages by default
			const successMessages = document
					.querySelectorAll(".success-message");

			successMessages.forEach(function(successMessage) {
				successMessage.style.display = "none";
				// Show the error message if present after server-side validation
				var messageText = successMessage.innerText.trim();
				if (messageText.length > 0) {
					successMessage.style.display = "block";
					// Hide the error message after 5 seconds
					setTimeout(function() {
						successMessage.style.display = "none";
					}, 5000); // 5000 milliseconds = 5 seconds
				}
			});
		};
	</script>
</body>
</html>
