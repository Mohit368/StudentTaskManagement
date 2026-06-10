<%
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/validation.js"></script>
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3>Student Registration</h3>
                </div>

                <div class="card-body">

                    <% if ("exists".equals(error)) { %>
                        <div class="alert alert-warning">
                            This email is already registered. Please login instead.
                        </div>
                    <% } else if ("failed".equals(error)) { %>
                        <div class="alert alert-danger">
                            Registration failed. Please try again.
                        </div>
                    <% } %>

                    <form name="registerForm" action="register" method="post" onsubmit="return validateRegisterForm()">

                        <div class="mb-3">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" placeholder="Enter Name" required>
                        </div>

                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Enter Email" required>
                        </div>

                        <div class="mb-3">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter Password" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>

                    <p class="mt-3 text-center">
                        Already registered? <a href="login.jsp">Login here</a>
                    </p>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>