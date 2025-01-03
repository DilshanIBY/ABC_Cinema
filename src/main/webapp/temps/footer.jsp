    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row">

            <div class="col-lg-3 col-md-6">
              <div class="footer-info">
                <h3>ABC CINEMA</h3>
                <p>No 50/2, Park Street Mews<br>Colombo 02, Sri Lanka<br><br>
                  <strong>Phone: </strong>071-0103793<br>
                  <strong>Email: </strong>contact@abccinema.com<br>
                </p>
                <div class="social-links mt-3">
                  <a href="inquireUs.jsp" class="twitter"><i class="bx bxl-twitter"></i></a>
                  <a href="inquireUs.jsp" class="facebook"><i class="bx bxl-facebook"></i></a>
                  <a href="inquireUs.jsp" class="instagram"><i class="bx bxl-instagram"></i></a>
                  <a href="inquireUs.jsp" class="tiktok"><i class="bx bxl-tiktok"></i></a>
                  <a href="inquireUs.jsp" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                </div>
              </div>
            </div>

            <div class="col-lg-2 col-md-6 footer-links">
              <h4>Useful Links</h4>
              <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="index.jsp">Home</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.jsp#gallery">Gallery</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.jsp#testimonials">Testimonials</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="inquireUs.jsp">Terms of service</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="inquireUs.jsp">Privacy policy</a></li>
              </ul>
            </div>

            <div class="col-lg-3 col-md-6 footer-links">
              <h4>Our Services</h4>
              <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="reservation.jsp">Reservations</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="movies.jsp">Movies</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="profile.jsp">Profile</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="feedback.jsp">Feedback</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="inquireUs.jsp">inquire Us</a></li>
              </ul>
            </div>
              
            <div class="col-lg-4 col-md-6 footer-newsletter" id="newsletter">
                <h4>Our Newsletter</h4>
                <p>Stay connected with ABC CINEMA.<br>
                   Stay updated with the latest movie releases and exclusive deals!</p>
                <form action="subscribe" method="post">
                    <!-- Placeholder dynamically displays the message -->
                    <input 
                        type="email" 
                        name="email" 
                        placeholder="<%= request.getParameter("message") != null ? request.getParameter("message") : "Enter your Email" %>" 
                        required>
                    <input type="submit" value="Subscribe">
                    <input type="hidden" name="current_url" value="<%= request.getRequestURI() %>">
                </form>
            </div>



          </div>
        </div>
      </div>

      <div class="container">
        <div class="copyright">
          &copy; Copyright <strong><span>ABC CINEMA</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          Designed by <a href="https://www.plymouth.ac.uk" target="_blank">Plymouth Computing Students</a>
        </div>
      </div>
    </footer><!-- End Footer -->
    
    <!-- Pre-loader -->
    <div id="preloader"></div>
    
    <!-- Back-To-Top -->
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- jQuery Library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Vendor JS Files -->
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    
    <!-- From CDNs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.js"></script>
    
    <!-- Main JS Files -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/chatBot.js"></script>
    <script src="assets/js/validation.js"></script>
    <script src="assets/js/notification.js"></script>
    <script src="assets/js/reservation.js"></script>

</body>
</html>