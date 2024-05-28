<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet" />
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>User Login</title>
</head>
<body class="p-5">
    
    <section
        class="register col-lg-10 col-md-12 m-auto bg-light p-5 d-flex align-items-center justify-content-center">
        <div class="container">
            <form class="row g-3 border rounded needs-validation pt-3 px-5 pb-5"
                novalidate method="post" action="LoginServlet">
                <h2 class="display-6">User Login</h2>

                <div class="col-md-12">
                    <label for="validationCustomUsername" class="form-label">Username:</label>
                    <input type="text" class="form-control"
                        id="validationCustomUsername" aria-describedby="inputGroupPrepend"
                        name="username" required>
                    <div class="invalid-feedback">Please provide your username</div>
                </div>
                <div class="col-md-12">
                    <label for="validationCustom03" class="form-label">Password:</label>
                    <input type="password" class="form-control"
                        id="validationCustom03" name="psw" required maxlength="8">
                    <div class="invalid-feedback">Please provide your password</div>
                </div>
                <div class="col-12 text-danger error-message">
                    <%-- Check if error message exists in session and display it --%>
                    <%
                    String errorMessage = (String) session.getAttribute("errorMessage");
                    if (errorMessage != null) {
                        out.println(errorMessage);
                        session.removeAttribute("errorMessage"); // Clear the error message from session
                    }
                    %>
                </div>
                <div class="col-12">
                    <button class="btn btn-primary" type="submit">Submit form</button>
                </div>
                <div class="col-12">
                    <p>
                        No account yet? click <a href="userRegistration.jsp">here</a>
                    </p>
                </div>
            </form>
        </div>
    </section>

    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function() {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms).forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
