<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controllers.UserController" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>

<%
    
    UserController userController = new UserController();
    String message = null;

    try {
        
        if (request.getParameter("loginSubmit") != null) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            
            List<User> users = userController.getAllUsers();
            User loggedInUser = users.stream()
                .filter(u -> u.getEmail().equals(email) && u.getPassword().equals(password))
                .findFirst().orElse(null);

            if (loggedInUser != null) {
                session.setAttribute("user", loggedInUser);
                response.sendRedirect("movies.jsp"); 
                return; 
            } else {
                message = "Invalid email or password.";
            }
        }

        
        if (request.getParameter("registerSubmit") != null) {
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            User newUser = new User();
            newUser.setFullName(fullName);
            newUser.setEmail(email);
            newUser.setPassword(password);
            newUser.setStatus("active");

            if (userController.createUser(newUser)) {
                message = "Account created successfully. Please log in.";
            } else {
                message = "Error creating account. Please try again.";
            }
        }
    } catch (Exception e) {
        message = "An error occurred: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <!--Google Fonts and Icons-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Round|Material+Icons+Sharp|Material+Icons+Two+Tone" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" />
    <!--Stylesheets-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body id="login-register" style="background-image: url('assets/img/LG.jpg')">

  
  
  
  
    
    <div class="auth-container">
        <div class="auth-card">
             <% if (message != null) { %>
                <div class="alert alert-info"><%= message %></div>
            <% } %>
            <!-- Login Form -->
            <div id="loginForm">
                <h2 class="auth-title">Welcome Back</h2>
                <p class="auth-subtitle">Sign in to continue</p>
                <form method="post" action="<%= request.getRequestURI() %>">
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-envelope"></i>
                            </span>
                            <input type="email" class="form-control" placeholder="name@example.com" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-lock"></i>
                            </span>
                            <input type="password" class="form-control" placeholder="????????" required>
                            <button type="button" class="password-toggle" onclick="togglePassword(this)">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="remember">
                            <label class="form-check-label" for="remember">Remember me</label>
                        </div>
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>
                    <button type="submit" class="btn btn-primary">Sign In</button>
                </form>
                <div class="auth-footer">
                    Don't have an account? 
                    <a href="#" onclick="toggleForms()">Sign up</a>
                </div>
            </div>

            <!-- Register Form -->
            <div id="registerForm" style="display: none;">
                <h2 class="auth-title">Create Account</h2>
                <p class="auth-subtitle">Register a new account</p>
                <form method="post" action="<%= request.getRequestURI() %>">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-user"></i>
                            </span>
                            <input type="text" class="form-control" placeholder="John Doe" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-envelope"></i>
                            </span>
                            <input type="email" class="form-control" placeholder="name@example.com" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-lock"></i>
                            </span>
                            <input type="password" class="form-control" placeholder="????????" required>
                            <button type="button" class="password-toggle" onclick="togglePassword(this)">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Create Account</button>
                </form>
                <div class="auth-footer">
                    Already have an account? 
                    <a href="#" onclick="toggleForms()">Sign in</a>
                </div>
            </div>
        </div>
    </div>
        <script>
        function toggleForms() {
            const loginForm = document.getElementById("loginForm");
            const registerForm = document.getElementById("registerForm");
            loginForm.style.display = loginForm.style.display === "none" ? "block" : "none";
            registerForm.style.display = registerForm.style.display === "none" ? "block" : "none";
        }
    </script>






    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>