<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>User Registration</title>
</head>
<body>
    <!-- Register start -->
    <section class="register vh-100 col-lg-10 col-md-12 m-auto bg-light p-5 d-flex align-items-center justify-content-center">
        <div class="container">
            <form class="row g-3 border rounded needs-validation pt-3 px-5 pb-5" novalidate method="post" action="user_registration">
                <h2 class="display-6">User Registration</h2>
                <h3 class="display-6 text-success">
                    <%
                    if (request.getAttribute("success") != null) {
                        out.println(request.getAttribute("success"));
                    }
                    %>
                </h3>
                <div class="col-md-4">
                    <label for="fullName" class="form-label">Full Name: </label>
                    <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required value="<%= request.getParameter("fullName") != null ? request.getParameter("fullName") : "" %>"/>
                    <div class="invalid-feedback">Please input your full name</div>
                </div>
                <div class="col-md-4">
                    <label for="email" class="form-label">Email: </label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"/>
                    <div class="text-danger">
                        <%
                        if (request.getAttribute("email") != null) {
                            out.println(request.getAttribute("email"));
                        }
                        %>
                    </div>
                    <div class="invalid-feedback">Please choose an email</div>
                </div>
                <div class="col-md-4">
                    <label for="username" class="form-label">Username: </label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>"/>
                    <div class="text-danger">
                        <%
                        if (request.getAttribute("username") != null) {
                            out.println(request.getAttribute("username"));
                        }
                        %>
                    </div>
                    <div class="invalid-feedback">Please choose a username</div>
                </div>
                <div class="col-md-4">
                    <label for="phoneNumber" class="form-label">Phone Number: </label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" maxlength="11" required placeholder="Enter your phone number" value="<%= request.getParameter("phoneNumber") != null ? request.getParameter("phoneNumber") : "" %>"/>
                    <div class="text-danger">
                        <%
                        if (request.getAttribute("phoneNumber") != null) {
                            out.println(request.getAttribute("phoneNumber"));
                        }
                        %>
                    </div>
                    <div class="invalid-feedback">Please provide your phone number</div>
                </div>
                <div class="col-md-5">
                    <label for="address" class="form-label">Address: </label>
                    <input type="text" class="form-control" id="address" name="address" required placeholder="Enter your address" value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>"/>
                    <div class="invalid-feedback">Please provide your address</div>
                </div>
                <div class="col-md-3">
                    <label for="gender" class="form-label">Gender:</label>
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="">Choose a gender</option>
                        <option value="male" <%= "male".equals(request.getParameter("gender")) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= "female".equals(request.getParameter("gender")) ? "selected" : "" %>>Female</option>
                    </select>
                    <div class="invalid-feedback">Please select a gender</div>
                </div>
                <div class="col-md-3">
                    <label for="state" class="form-label">State: </label>
                    <input type="text" class="form-control" id="state" name="state" required placeholder="Enter your state" value="<%= request.getParameter("state") != null ? request.getParameter("state") : "" %>"/>
                    <div class="invalid-feedback">Please provide your state</div>
                </div>
                <div class="col-md-3">
                    <label for="lga" class="form-label">LGA: </label>
                    <input type="text" class="form-control" id="lga" name="lga" required placeholder="Enter your LGA" value="<%= request.getParameter("lga") != null ? request.getParameter("lga") : "" %>"/>
                    <div class="invalid-feedback">Please provide your LGA</div>
                </div>
                <div class="col-md-3">
                    <label for="dob" class="form-label">Date Of Birth: </label>
                    <input type="date" class="form-control" id="dob" name="dob" required value="<%= request.getParameter("dob") != null ? request.getParameter("dob") : "" %>"/>
                    <div class="invalid-feedback">Please provide your DOB</div>
                </div>
                <div class="col-md-3">
                    <label for="password" class="form-label">Password: </label>
                    <input type="password" class="form-control" id="password" name="password" required placeholder="Choose a password"/>
                    <div class="invalid-feedback">Please choose a password</div>
                </div>
                <div class="col-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="terms" required />
                        <label class="form-check-label" for="terms"> Agree to terms and conditions </label>
                        <div class="invalid-feedback">You must agree before submitting.</div>
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn btn-primary" type="submit">Submit form</button>
                </div>
                <div class="col-12">
                    <p>Already have an account? Click <a href="user_login.jsp">here</a> to log in.</p>
                </div>
            </form>
        </div>
    </section>
    <!-- Register end -->
    <script>
        (function() {
            'use strict';
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
    </script>
</body>
</html>
