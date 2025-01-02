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

<!-- NAVIGATION -->
<div class="navbar">
        <div class="row">
                <div class="column column-30 col-site-title"><a href="#" class="site-title float-left">ABC CINEMA</a></div>
                <div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
                        <input id="searchInput" type="text" name="search" value="" placeholder="Search..." />
                </div>
                <div class="column column-30">
                        <div class="user-section"><a href="#">
                                <img src="<%= userPhoto != null ? userPhoto : "assets/img/testimonials/testimonials-2.jpg" %>" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto" />
                                <div class="username">
                                        <h4><%= userName %></h4>
                                        <p>Administrator</p>
                                </div>
                        </a></div>
                </div>
        </div>
</div>