<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.ajogious.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
h2 {
	font-size: 30px;
}

</style>
<title>User Profile</title>
</head>
<body>
	<%
	// Check if the user is authenticated
	User user = (User) session.getAttribute("user");
	if (user == null) {
		// If not authenticated, redirect to the login page
		response.sendRedirect("user_login.jsp");
		return; // Stop processing further
	}
	%>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">User Dashboard</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">>
				<form class="navbar-nav ms-auto nav-link ms-2" action="UserLogout" method="post">
					<button type="submit" class="btn btn-danger">Sign Out</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container mt-3">
		<h2>
			Welcome back,
			<%=user.getFullName()%>!
		</h2>
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
	<div class="container col-md-8">
		<%
		if (user.isActive()) {
		%>
		<table class="table table-bordered caption-top">
			<caption class="display-4">User Profile</caption>
			<tbody>
				<tr>
					<th>Full Name</th>
					<td><%=user.getFullName()%></td>
				</tr>
				<tr>
					<th>Username</th>
					<td><%=user.getUsername()%></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><%=user.getEmail()%></td>
				</tr>
				<tr>
					<th>Phone Number</th>
					<td><%=user.getPhoneNumber()%></td>
				</tr>
				<tr>
					<th>State</th>
					<td><%=user.getState()%></td>
				</tr>
				<tr>
					<th>LGA</th>
					<td><%=user.getLga()%></td>
				</tr>
				<tr>
					<th>Gender</th>
					<td><%=user.getGender()%></td>
				</tr>
				<tr>
					<th>Date Of Birth</th>
					<td><%=user.getDateOfBirth()%></td>
				</tr>
				<tr>
					<th>Address</th>
					<td><%=user.getAddress()%></td>
				</tr>
				<tr>
					<th>Registration Date</th>
					<td><%=user.getRegistrationDate()%></td>
				</tr>
				<tr>
					<th>Account Active</th>
					<td><%=user.isActive() ? "Active" : "Inactive"%></td>
				</tr>
				<tr>
					<th>Expiration Date</th>
					<td><%=user.getAccountExpiring()%></td>
				</tr>
				<tr>
					<th>Role</th>
					<td><%=user.getRole()%></td>
				</tr>
			</tbody>
		</table>
		<%
		} else {
		%>
		<div class="alert alert-danger" role="alert">Account expired.</div>
		<%
		}
		%>
	</div>

	<script>
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
