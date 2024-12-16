<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<%@ page import="utils.DatabaseConnection" %>
<%@ page import="utils.DatabaseUtils" %>
<%@ page import="java.sql.*, java.util.*, jakarta.servlet.http.*" %>

<!-- Head Section -->
<jsp:include page="temps/adminHeader.jsp" />
    
<!-- Navigation -->
<jsp:include page="temps/adminNavbar.jsp" />

<!-- Side Menu -->
<jsp:include page="temps/adminSidemenu.jsp" />

<%
// Database connection
Connection conn = DatabaseConnection.getConnection();

// Fetch tables
List<Map<String, String>> menuItems = new ArrayList<>();
List<Map<String, String>> movieItems = new ArrayList<>();
List<Map<String, String>> eventItems = new ArrayList<>();
List<Map<String, String>> userItems = new ArrayList<>();
List<Map<String, String>> tesItems = new ArrayList<>();
List<Map<String, String>> conItems = new ArrayList<>();
List<Map<String, String>> mainItems = new ArrayList<>();
List<Map<String, String>> feedItems = new ArrayList<>();
List<Map<String, String>> imgItems = new ArrayList<>();
List<Map<String, String>> mailItems = new ArrayList<>();
List<Map<String, String>> theaterItems = new ArrayList<>();
List<Map<String, String>> subItems = new ArrayList<>();

try {
//    menuItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM menu");
    movieItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM movies");
//    eventItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM events");
    userItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM users");
    tesItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM testimonials");
//    conItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM contact");
//    mainItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM home");
    feedItems = DatabaseUtils.fetchTableData(conn, "SELECT f.feedback_id, f.user_id, f.rating, f.description, f.created_at, u.name, u.profile_photo FROM feedback f INNER JOIN users u ON f.user_id = u.user_id");
    imgItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM gallery");
    mailItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM inquiries");
    theaterItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM theaters");
    subItems = DatabaseUtils.fetchTableData(conn, "SELECT * FROM subscribers");
} catch (SQLException e) {
    System.out.print("Error: "+e.getMessage());
} finally {
    try {
        if (conn != null) conn.close();
    } catch (SQLException e) {
        System.out.print("Error: "+e.getMessage());
    }
}

%>


<div class="row">

<section id="main-content" class="column column-offset-20">

        <!-- OVERVIEW Section -->
        <a class="anchor" name="overview"></a>
        <div class="row grid-responsive overview">

        </div>
        
        
        

        <!-- MOVIES Section -->
        <a class="anchor" name="movies"></a>
        <div class="row grid-responsive movies">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Movie Management</h3>
                    </div>
                    <div class="card-block">
                        <div class="admin-panel">
                            <main>
                                <!-- Now Showing Section -->
                                <section id="now-showing">
                                    <h2>Now Showing Movies</h2>
                                    <div class="movie-gallery">
                                        <%-- Iterate through movies to display Now Showing --%>
                                        <% for (Map<String, String> movie : movieItems) { %>
                                            <% if ("Now Showing".equals(movie.get("status"))) { %>
                                                <div class="movie-card" style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('<%= movie.get("poster_url") %>'); background-size: cover; background-position: center;">
                                                    <div class="movie-details">
                                                        <h5><%= movie.get("title") %></h5>
<!--                                                    <p><%= movie.get("description") %></p>
-->                                                     <p><strong>Duration:</strong> <%= movie.get("duration") %> mins</p><!--
                                                        <a href="<%= movie.get("trailer_url") %>" target="_blank" class="trailer-link">Watch Trailer</a>-->
                                                    </div>
                                                    <div class="movie-actions">
                                                        <i data-item-name='movie_id' data-item-id='<%= movie.get("movie_id") %>' class='fa fa-edit fa-lg updateBtn button-outline'></i>
                                                        <i data-item-name='movie_id' data-item-id='<%= movie.get("movie_id") %>' class='fa fa-trash fa-lg deleteBtn button-outline'></i>
                                                    </div>
                                                </div>
                                            <% } %>
                                        <% } %>

                                        <!-- Plus Icon for Adding Movies -->
                                        <div class="add-movie-card" data-modal="now-showing">
                                            <i class="fa-solid fa-plus"></i>
                                        </div>
                                    </div>
                                </section>

                                <!-- Coming Soon Section -->
                                <section id="coming-soon">
                                    <h2>Coming Soon Movies</h2>
                                    <div class="movie-gallery">
                                        <%-- Iterate through movies to display Coming Soon --%>
                                        <% for (Map<String, String> movie : movieItems) { %>
                                            <% if ("Coming Soon".equals(movie.get("status"))) { %>
                                                <div class="movie-card" style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('<%= movie.get("poster_url") %>'); background-size: cover; background-position: center;">
                                                    <div class="movie-details">
                                                        <h5><%= movie.get("title") %></h5>
<!--                                                    <p><%= movie.get("description") %></p>-->
                                                        <p><strong>Release:</strong> <%= movie.get("release_date") %></p>
<!--                                                    <a href="<%= movie.get("trailer_url") %>" target="_blank" class="trailer-link">Watch Trailer</a>-->
                                                    </div>
                                                    <div class="movie-actions">
                                                        <i data-item-name='movie_id' data-item-id='<%= movie.get("movie_id") %>' class='fa fa-edit fa-lg updateBtn button-outline'></i>
                                                        <i data-item-name='movie_id' data-item-id='<%= movie.get("movie_id") %>' class='fa fa-trash fa-lg deleteBtn button-outline'></i>
                                                    </div>
                                                </div>
                                            <% } %>
                                        <% } %>

                                        <!-- Plus Icon for Adding Movies -->
                                        <div class="add-movie-card" data-modal="coming-soon">
                                            <i class="fa-solid fa-plus"></i>
                                        </div>
                                    </div>
                                </section>
                            </main>

                            <!-- Add Movie Modal -->
                            <div id="add-movie-modal" class="modal">
                                <div class="modal-content">
                                    <h3>Add New Movie</h3>
                                    <form id="add-movie-form">
                                        <input type="text" id="movie-name" name="movie-name" placeholder="Movie Name" required>
                                        <input type="text" id="language" name="language" placeholder="Language" required>
                                        <input type="text" id="genre" name="genre" placeholder="Genre" required>
                                        <input type="date" id="release-date" name="release-date" placeholder="Release Date">
                                        <input type="file" id="movie-image" name="movie-image" accept="image/*" required>
                                        <button type="submit" class="submit-btn">Add Movie</button>
                                        <button type="button" class="close-btn">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        
        
        <!-- RESERVATIONS Section -->
        <a class="anchor" name="reservations"></a>
        <div class="row grid-responsive reservations">

        </div>
        
        
        
        
        
        <!-- PAYMENTS Section -->
        <a class="anchor" name="payments"></a>
        <div class="row grid-responsive payments">

        </div>
        
        
        
        
     

        <!-- FEEDBACK Section -->
        <a class="anchor" name="feedback"></a>
        <div class="row grid-responsive feedback">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Feedback Management</h3>
                    </div>
                    <div class="card-block">
                        <div class="admin-panel">
                            <div class="table-wrapper">
                                <table class="feedback-table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Name</th>
                                            <th>Rating</th>
                                            <th>Feedback</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="feedbackTableBody">
                                        <% for (Map<String, String> feedback : feedItems) { %>
                                        <tr>
                                            <td>
                                                <img src="<%= feedback.get("profile_photo") != null ? feedback.get("profile_photo") : "https://via.placeholder.com/40" %>" alt="Profile Pic" class="profile-pic">
                                            </td>
                                            <td><%= feedback.get("name") %></td>
                                            <td><%= feedback.get("rating") %></td>
                                            <td><%= feedback.get("description") %></td>
                                            <td><%= feedback.get("created_at") %></td>
                                            <td>
                                                <button class='updateBtn button-outline' data-item-name='feedback_id' data-item-id='<%= feedback.get("feedback_id") %>'><i class='fa fa-edit fa-lg'></i></button>
                                                <button class='deleteBtn button-outline' data-item-name='feedback_id' data-item-id='<%= feedback.get("feedback_id") %>'><i class='fa fa-trash fa-lg'></i></button>
                                            </td>
                                        </tr>
                                        <% } %>
                                        <!-- New row for adding a new feedback -->
                                        <tr id="newFeedbackRow">
                                            <td class="row-image" id="imageUrlInput20">
                                                <img src="assets/img/icons/placeholder-image-dark.jpg" alt="User Image" id="uploadImage20" class="profile-pic">
                                                <input type="file" id="fileInput20" style="display: none;" accept="image/*">
                                            </td>
                                            <td><input type="text" name="name" placeholder="User Name"></td>
                                            <td><input type="number" name="rating" placeholder="Rating" min="1" max="5"></td>
                                            <td><input type="text" name="description" placeholder="Description"></td>
                                            <td><input type="datetime-local" name="created_at"></td>
                                            <td><button id="addFeedback">Add <i class="fa fa-plus fa-lg"></i></button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        
        
        
        
        
        <!-- INQUIRIES Section -->
        <a class="anchor" name="inquiries"></a>
        <div class="row grid-responsive inquiries">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Inquiry Management</h3>
                    </div>
                    <div class="card-block">
                        <ul class="email-list">
                            <%
                            if (!mailItems.isEmpty()) {
                                for (Map<String, String> item : mailItems) {
                            %>
                            <li class="email-item">
                                <div class="email-header">
                                    <h4><%= item.get("name") %></h4>
                                    <p><%= item.get("email") %></p>
                                    <span><%= item.get("title") %></span>
                                </div>
                                <div class="email-details">
                                    <p><%= item.get("message") %></p><br>
                                </div>
                                <button class='deleteBtn button-outline' data-item-name='inquiry_id' data-item-id='<%= item.get("inquiry_id") %>'>
                                    <i class='fa fa-trash fa-lg'></i>
                                </button>
                            </li>
                            <%
                                }
                            }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        
        
    

        

        <!-- USERS Section -->
        <a class="anchor" name="users"></a>
        <div class="row grid-responsive users">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>User Management</h3>
                    </div>
                    <div class="card-block">
                        <div class="admin-panel">

                            <div class="table-wrapper">
                                <table class="user-table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="userTableBody">
                                        <% for (Map<String, String> user : userItems) { %>
                                        <tr>
                                            <td>
                                                <img src="<%= user.get("profile_photo") != null ? user.get("profile_photo") : "https://via.placeholder.com/40" %>" alt="Profile Pic" class="profile-pic">
                                            </td>
                                            <td><%= user.get("name") %></td>
                                            <td><%= user.get("email") %></td>
                                            <td><%= user.get("phone") %></td>
                                            <td>
                                                <button class='updateBtn button-outline' data-item-name='user_id' data-item-id='<%= user.get("user_id") %>'><i class='fa fa-edit fa-lg'></i></button>
                                                <button class='deleteBtn button-outline' data-item-name='user_id' data-item-id='<%= user.get("user_id") %>'><i class='fa fa-trash fa-lg'></i></button>
                                            </td>
                                        </tr>
                                        <% } %>
                                        <!-- New row for adding a new special item -->
                                        <tr id="newSpecialItemRow">
                                                <td class="row-image" id="imageUrlInput10">
                                                        <img src="assets/img/icons/placeholder-image-dark.jpg" alt="Special Image" id="uploadImage10" class="profile-pic">
                                                        <input type="file" id="fileInput10" style="display: none;" accept="image/*">
                                                </td>
                                                <td><input type="text" name="name" placeholder="Name"></td>
                                                <td><input type="text" name="email" placeholder="Email"></td>
                                                <td><input type="text" name="phone" placeholder="Phone"></td>
                                                <td><button id="addItem">Add <i class="fa fa-plus fa-lg"></i></button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        
        
        <!-- MAIN-CAROUSEL Section -->
        <a class="anchor" name="main-carousel"></a>
        <div class="row grid-responsive main-carousel">

        </div>
        
        
        

        <!-- TESTIMONIALS Section -->
        <a class="anchor" name="testimonials"></a>
        <div class="row grid-responsive testimonials">
                <div class="column">
                        <div class="card">
                                <div class="card-title">
                                        <h3>Testimonials</h3>
                                </div>
                                <div class="card-block">
                                        <div class="testimonial-items">
                                                <%
                                                        if (tesItems != null && !tesItems.isEmpty()) {
                                                                for (Map<String, String> item : tesItems) {
                                                %>
                                                                <div class="testimonial">
                                                                        <div class="testimonial-details">
                                                                                <div class="testimonial-image">
                                                                                        <img src="<%= item.get("Image") %>" alt="Testimonial Image">
                                                                                </div>
                                                                                <div class="testimonial-info">
                                                                                        <input type='text' name='name' placeholder="Name" value='<%= item.get("Name") %>'>
                                                                                        <input type='text' name='occupation' placeholder="Occupation" value='<%= item.get("Occupation") %>'>
                                                                                        <textarea name='quote' placeholder="Quote"><%= item.get("Quote") %></textarea>
                                                                                </div>
                                                                        </div>
                                                                        <div class="testimonial-actions">
                                                                                <button class='updateBtn button-outline' data-item-name='Id' data-item-id='<%= item.get("Id") %>'>
                                                                                        <i class='fa fa-edit fa-lg'></i>
                                                                                </button>
                                                                                <button class='deleteBtn button-outline' data-item-name='Id' data-item-id='<%= item.get("Id") %>'>
                                                                                        <i class='fa fa-trash fa-lg'></i>
                                                                                </button>
                                                                        </div>
                                                                </div>
                                                <%
                                                                }
                                                        }
                                                %>

                                                <!-- New testimonial form for adding a new testimonial -->
                                                <div class="testimonial new-testimonial">
                                                        <div class="testimonial-details">
                                                                <div class="testimonial-image" id="imageUrlInput6">
                                                                        <img src="assets/img/icons/placeholder-image-dark.jpg" alt="Testimonial Image" id="uploadImage6">
                                                                        <input type="file" id="fileInput6" style="display: none;" accept="image/*">
                                                                </div>
                                                                <div class="testimonial-info">
                                                                        <input type="text" name="name" placeholder="Name">
                                                                        <input type="text" name="occupation" placeholder="Occupation">
                                                                        <textarea name="quote" placeholder="Quote"></textarea>
                                                                </div>
                                                        </div>
                                                        <div class="testimonial-actions">
                                                                <button id="addItem">Add <i class="fa fa-plus fa-lg"></i></button>
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>



        
        <!-- GALLERY Section -->
        <a class="anchor" name="gallery"></a>
        <div class="row grid-responsive gallery">
                <div class="column">
                        <div class="card">
                                <div class="card-title">
                                        <h3>Gallery</h3>
                                </div>
                                <div class="card-block">
                                        <div class="gallery-items">
                                                <%
                                                if (imgItems != null && !imgItems.isEmpty()) {
                                                        int itmCount = 1;
                                                        for (Map<String, String> item : imgItems) {
                                                %>
                                                        <div class="gallery-card" id="imageUrlInput5<%= itmCount %>">
                                                                <img src="<%= item.get("Image") %>" alt="Gallery Image">
                                                                <input type="file" id="fileInput5<%= itmCount %>" style="display: none;" accept="image/*" data-item-id="<%= item.get("Id") %>">
                                                                <div class="gallery-actions">
                                                                        <button class="button-outline" id="uploadImage5<%= itmCount %>">
                                                                                <i class="fa fa-cloud-upload fa-lg"></i>
                                                                        </button>
                                                                        <button class="deleteBtn button-outline" data-item-name='Id' data-item-id="<%= item.get("Id") %>">
                                                                                <i class='fa fa-trash fa-lg'></i>
                                                                        </button>
                                                                </div>
                                                        </div>
                                                <%
                                                                itmCount++;
                                                        }
                                                }
                                                %>
                                                <!-- New gallery item form -->
                                                <div class="gallery-card new-gallery-item" id="imageUrlInput0000">
                                                        <img src="" alt="New Gallery Image" style="display: none;">
                                                        <input type="file" id="fileInput0000" style="display: none;" accept="image/*" data-item-id="new-gallery-item">
                                                        <button class="button" id="uploadImage0000">
                                                                Add <i class="fa fa-plus fa-lg"></i>
                                                        </button>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
                                                

                                                
                                                
        <!-- THEATERS Section -->
        <a class="anchor" name="theaters"></a>
        <div class="row grid-responsive theaters">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Theaters</h3>
                    </div>
                    <div class="card-block">
                        <ul class="theater-list">
                            <%
                            if (!theaterItems.isEmpty()) {
                                for (Map<String, String> item : theaterItems) {
                            %>
                                    <li class="theater-item" style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('<%= item.get("image_url") %>'); background-size: cover; background-position: center;">
                                        <div class="theater-header">
                                            <h4><%= item.get("name") %></h4>
                                            <p><%= item.get("location") %></p>
                                        </div>
                                        <div class="theater-details">
                                            <p><strong>Seating Capacity:</strong> <%= item.get("seating_capacity") %></p>
                                        </div>
                                        <button class="deleteBtn button-outline" data-item-name='theater_id' data-item-id='<%= item.get("theater_id") %>'>
                                            <i class="fa fa-trash fa-lg"></i>
                                        </button>
                                    </li>
                            <%
                                }
                            } else {
                            %>
                                <p>No theaters available.</p>
                            <%
                            }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

                                                
         
                                                
        <!-- SUBSCRIBERS Section -->
        <a class="anchor" name="subs"></a>
        <div class="row grid-responsive subscribers">
            <div class="column">
                <div class="card">
                    <div class="card-title">
                        <h3>Subscribers</h3>
                    </div>
                    <div class="card-block">
                        <table>
                            <thead>
                                <tr>
                                    <th>Subscriber</th>
                                    <th>Subscribed Date</th>
                                    <th>Subscribed Time</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (!subItems.isEmpty()) { %>
                                    <% for (Map<String, String> item : subItems) { %>
                                        <tr>
                                            <td><%= item.get("email") %></td>
                                            <td><%= item.get("created_at").split(" ")[0] %></td>
                                            <td><%= item.get("created_at").split(" ")[1] %></td>
                                            <td>
                                                <button class='deleteBtn button-outline' data-item-name='subscription_id' data-item-id='<%= item.get("subscription_id") %>'>
                                                    <i class='fa fa-trash fa-lg'></i>
                                                </button>
                                            </td>
                                        </tr>
                                    <% } %>
                                <% } else { %>
                                    <tr>
                                        <td colspan="4">No subscribers found.</td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        
        
    <!-- Footer -->
    <footer>
        <div id="#log-reg-footer">
                <p class="credit">Powered by <a href="<?php echo $site ?>" target="_blank">ABC CINEMA</a></p>
        </div>
    </footer>        
        
</section>

</div>

<!-- Footer -->
<jsp:include page="temps/adminFooter.jsp" />
