<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --main-color: #cda45e;
            --secondary-color: #0c0b09;
            --tertiary-color: #1a1814;
            --black-color: #000000;
        }

        body {
    background-image: url("assets/img/LG.jpg"); /* Use the uploaded image */
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

        .auth-container {
            max-width: 450px;
            width: 100%;
            margin: auto;
        }

        .auth-card {
            background-color: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(205, 164, 94, 0.2);
            border-radius: 15px;
            padding: 2rem;
            animation: fadeIn 0.5s ease-out;
        }

        .auth-title {
            color: var(--main-color);
            font-weight: bold;
            text-align: center;
            margin-bottom: 0.5rem;
        }

        .auth-subtitle {
            color: #888;
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-label {
            color: #ccc;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }

        .form-control {
            background-color: var(--tertiary-color);
            border: 1px solid rgba(205, 164, 94, 0.2);
            color: #fff;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
        }

        .form-control:focus {
            background-color: var(--tertiary-color);
            border-color: var(--main-color);
            box-shadow: none;
            color: #fff;
        }

        .input-group-text {
            background-color: transparent;
            border: none;
            color: #888;
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            z-index: 4;
        }

        .password-toggle {
            position: absolute;
            right: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            z-index: 4;
            color: #888;
            cursor: pointer;
            background: none;
            border: none;
            padding: 0;
            transition: color 0.3s;
        }

        .password-toggle:hover {
            color: #ccc;
        }

        .input-group {
            position: relative;
        }

        .btn-primary {
            background-color: var(--main-color);
            border: none;
            color: var(--secondary-color);
            padding: 0.8rem;
            font-weight: 500;
            width: 100%;
            margin-top: 1rem;
            transition: background-color 0.3s;
        }

        .btn-primary:hover, .btn-primary:focus {
            background-color: rgba(205, 164, 94, 0.9);
        }

        .auth-footer {
            text-align: center;
            color: #888;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }

        .auth-footer a {
            color: var(--main-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .auth-footer a:hover {
            color: rgba(205, 164, 94, 0.8);
        }

        .form-check-input:checked {
            background-color: var(--main-color);
            border-color: var(--main-color);
        }

        .form-check-label {
            color: #888;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 576px) {
            .auth-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    
    <div class="auth-container">
        <div class="auth-card">
           
            <!-- Login Form -->
            <div id="loginForm">
                <h2 class="auth-title">Welcome Back</h2>
                <p class="auth-subtitle">Sign in to continue</p>
                <form>
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
                <form>
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
            const loginForm = document.getElementById('loginForm');
            const registerForm = document.getElementById('registerForm');
            
            if (loginForm.style.display === 'none') {
                registerForm.style.display = 'none';
                loginForm.style.display = 'block';
            } else {
                loginForm.style.display = 'none';
                registerForm.style.display = 'block';
            }
        }

        function togglePassword(button) {
            const input = button.parentElement.querySelector('input');
            const icon = button.querySelector('i');
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>