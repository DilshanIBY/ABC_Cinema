<%
// Fetch user details from session
Integer userId = (Integer) session.getAttribute("userId");
String userName = (String) session.getAttribute("userName");
String userPhoto = (String) session.getAttribute("userPhoto");

if (userId == null || userName == null) {
    response.sendRedirect("login-register.jsp"); // Redirect to the login page
    return;
}   
%>

<!-- ======= Header ======= -->
<div id="Nav-header" class="fixed-top d-flex align-items-center">
  <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

    <div class="logo d-flex me-auto me-lg-0">
        <img src="assets/img/icons/logo.png" alt="" class="img-fluid">
        <h1>BC CINEMA</h1>
    </div>
    
    <a href="reservation.jsp?movie_id=1" class="make-reservation-btn scrollto d-none d-lg-flex">Make Reservation</a>

  </div>
</div><!-- End Header -->

<!-- Navigation -->
<nav id="navbar">
    <ul>
        <li><a href="movies.jsp">Movies</a></li>
        <li><a href="index.jsp#gallery">Gallery</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
        <li><a href="inquireUs.jsp">Inquire</a></li>
        <img src="<%= userPhoto != null ? userPhoto : "assets/img/testimonials/testimonials-2.jpg" %>" class="user-logged-img" onclick="window.location.href='profile.jsp';">
    </ul>
</nav>
    