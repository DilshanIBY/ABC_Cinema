<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="assets/css/admind.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid d-flex align-items-center">
               <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" 
                         alt="Logo" 
                         width="30" 
                         height="24" 
                         style = "margin-left: 120px;"
                         class="d-inline-block align-text-top me-2">
                    <span>Admin Dashboard</span>
                </a>
             </div>
        </nav>
        <input type="checkbox" id="check" class="d-none">
            <label for="check">
                <i class="fas fa-bars" id="btn"></i>
                <i class="fas fa-times" id="cancel"></i>
        </label>
        <!-- Sidebar -->
        <div class="sidebar">
            <header>Menu</header>
            <ul class="list-unstyled">
                <li><a href="#"><i class="fa-solid fa-gauge"></i> Overview</a></li>
                <li><a href="#"><i class="fa-solid fa-chair"></i>Reservation</a></li>
                <li><a href="#"><i class="fa-regular fa-image"></i> Add Gallery</a></li>
                <li><a href="#"><i class="fa-brands fa-rocketchat"></i> Feedback</a></li>
            </ul>
        </div>

        <section>
            <!-- Main content -->
        </section>
        <div class = "footerbody">    
                <footer class="footer">
                       <div class="container">
                              <div class="row">
                                      <div class="footer-col">
                                              <h4>company</h4>
                                              <ul>
                                                      <li><a href="#">about us</a></li>
                                                      <li><a href="#">our services</a></li>
                                                      <li><a href="#">privacy policy</a></li>
                                                      <li><a href="#">affiliate program</a></li>
                                              </ul>
                                      </div>
                                      <div class="footer-col">
                                              <h4>get help</h4>
                                              <ul>
                                                      <li><a href="#">FAQ</a></li>
                                                      <li><a href="#">Emailing</a></li>
                                                      <li><a href="#">returns</a></li>
                                                      <li><a href="#">payment options</a></li>
                                              </ul>
                                      </div>
                                      <div class="footer-col">
                                              <h4>online Booking</h4>
                                              <ul>
                                                      <li><a href="#">Hollywood</a></li>
                                                      <li><a href="#">Bollywood</a></li>
                                                      <li><a href="#"> kollywood</a></li>
                                                      <li><a href="#">Sinhala</a></li>
                                              </ul>
                                      </div>
                                      <div class="footer-col">
                                              <h4>follow us</h4>
                                              <div class="social-links">
                                                      <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                      <a href="#"><i class="fab fa-twitter"></i></a>
                                                      <a href="#"><i class="fab fa-instagram"></i></a>
                                                      <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                              </div>
                                      </div>
                              </div>
                       </div>
                </footer>
</div> 
    </body>
</html>
