<%-- Document : userRegistration Created on : Apr 25, 2024, 7:27:30 PM Author :
Administrator --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>user registration</title>
</head>
<body>
	<!-- Register start -->
	<section
		class="register vh-100 col-lg-10 col-md-12 m-auto bg-light p-5 d-flex align-items-center justify-content-center">
		<div class="container">
			<form class="row g-3 border rounded needs-validation pt-3 px-5 pb-5"
				novalidate method="post" action=user_registration>
				<h2 class="display-6">User Registration</h2>
				<h3 class="display-6 text-success error-message">
					<%
					if (request.getAttribute("successMessage") != null) {
						out.println(request.getAttribute("successMessage"));
					}
					%>
				</h3>

				<div class="col-md-4">
					<label for="validationCustom01" class="form-label">Full
						Name: </label> <input type="text" class="form-control"
						id="validationCustom01" name="fullName"
						placeholder="Enter your full name" required />
					<div class="invalid-feedback">Please input your full name</div>
				</div>
				<div class="col-md-4">
					<label for="validationCustom02" class="form-label">Email: </label>
					<input type="email" class="form-control" id="validationCustom02"
						value="" placeholder="Enter your email" required name="email" />
					<div class="invalid-feedback">Please choose an email</div>
					<div class="text-danger error-message" style="display: none;">
						<%
						if (request.getAttribute("emailError") != null) {
							out.println(request.getAttribute("emailError"));
						}
						%>
					</div>

				</div>
				<div class="col-md-4">
					<label for="validationCustom02" class="form-label">Username:
					</label> <input type="text" class="form-control" id="validationCustom02"
						value="" placeholder="Enter your email" required name="username" />
					<div class="invalid-feedback">Please choose a username</div>
					<div class="text-danger error-message" style="display: none;">

						<%
						if (request.getAttribute("usernameError") != null) {
							out.println(request.getAttribute("usernameError"));
						}
						%>
					</div>

				</div>
				<div class="col-md-4">
					<label for="validationCustom03" class="form-label">Phone
						Number: </label> <input type="text" class="form-control"
						id="validationCustom03" maxlength="11" required
						placeholder="Enter your phone number" name="phoneNumber" />
					<div class="invalid-feedback">Please provide your phone
						number</div>
					<div class="text-danger error-message" style="display: none;">

						<%
						if (request.getAttribute("phoneNumberError") != null) {
							out.println(request.getAttribute("phoneNumberError"));
						}
						%>
					</div>
				</div>
				<div class="col-md-5">
					<label for="validationCustom03" class="form-label">Address:
					</label> <input type="text" class="form-control" id="validationCustom03"
						required placeholder="Enter your address" name="address" />
					<div class="invalid-feedback">Please provide your address</div>
				</div>
				<div class="col-md-3">
					<label for="validationCustom04" class="form-label">Gender:</label>
					<select class="form-select" id="validationCustom04" name="gender"
						required>
						<option selected value="">Choose a gender</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select>
					<div class="invalid-feedback">Please select a gender</div>
				</div>
				<div class="col-md-3">
					<label for="validationCustom05" class="form-label">State: </label>
					<input type="text" class="form-control" id="validationCustom05"
						required placeholder="Enter your state" name="state" />
					<div class="invalid-feedback">Please provide your state</div>
				</div>
				<div class="col-md-3">
					<label for="validationCustom05" class="form-label">LGA: </label> <input
						type="text" class="form-control" id="validationCustom05" required
						placeholder="Enter your LGA" name="lga" />
					<div class="invalid-feedback">Please provide your LGA</div>
				</div>
				<div class="col-md-3">
					<label for="validationCustom05" class="form-label">Date Of
						Birth: </label> <input type="date" class="form-control"
						id="validationCustom05" required name="dob" />
					<div class="invalid-feedback">Please provide your DOB</div>
				</div>
				<div class="col-md-3">
					<label for="validationCustom05" class="form-label">Password:
					</label> <input type="password" class="form-control"
						id="validationCustom05" required placeholder="Choose a password"
						name="password" />
					<div class="invalid-feedback">Please choose a password</div>
				</div>
				<div class="col-12">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="invalidCheck" required /> <label class="form-check-label"
							for="invalidCheck"> Agree to terms and conditions </label>
						<div class="invalid-feedback">You must agree before
							submitting.</div>
					</div>
				</div>
				<div class="col-12">
					<button class="btn btn-primary" type="submit">Submit form</button>
				</div>
				<div class="col-12">
					<p>
						Already have an account? click <a href="userLogin.jsp">here</a>
					</p>
				</div>
			</form>
		</div>
	</section>

	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			const forms = document.querySelectorAll('.needs-validation');

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault();
						event.stopPropagation();
					}

					form.classList.add('was-validated');
				}, false);
			});
		})();
		
		window.onload = function() {
			// Hide all error messages by default
			const errorMessages = document.querySelectorAll(".error-message");

			errorMessages.forEach(function(errorMessage) {
				errorMessage.style.display = "none";
				// Show the error message if present after server-side validation
				var messageText = errorMessage.innerText.trim();
				if (messageText.length > 0) {
					errorMessage.style.display = "block";
					// Hide the error message after 5 seconds
					setTimeout(function() {
						errorMessage.style.display = "none";
					}, 5000); // 5000 milliseconds = 5 seconds
				}
			});
		};
	</script>
</body>
</html>
