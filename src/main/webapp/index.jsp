<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% // BACKEND IMPORTS %>
<%@ page import="controllers.MovieController" %>
<%@ page import="models.Movie" %>
<%@ page import="java.util.List" %>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />

 <!-- Header Section -->
<header>
    <div class="logo">ABC CINEMA</div>
    <h1>Experience Magic on the Big Screen</h1>
</header>

<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />
    






    <div class="movies-container">
        <!-- Fetch movies -->
        <%
            MovieController movieController = new MovieController();
            List<Movie> movies = movieController.getAllMovies();
        %>

        <!-- Now Showing Section -->
        <section>
            <h2 class="section-title">Now Showing</h2>
            <div class="swiper nowShowingSwiper">
                <div class="swiper-wrapper">
                    <%
                        if (movies != null) {
                            for (Movie movie : movies) {
                                if ("Now Showing".equals(movie.getStatus())) {
                    %>
                        <div class="swiper-slide">
                            <div class="movie-card">
                                <img src="<%= movie.getPosterUrl() %>" alt="<%= movie.getTitle() %>" class="movie-image">
                                <div class="movie-info">
                                    <h3 class="movie-title"><%= movie.getTitle() %></h3>
                                    <div class="movie-meta">
                                        <span class="movie-date">Showing Now</span>
                                    </div>
                                    <button class="book-btn">Book Now</button>
                                </div>
                            </div>
                        </div>
                    <%
                                }
                            }
                        } else {
                    %>
                        <p>No movies available for "Now Showing".</p>
                    <%
                        }
                    %>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>

        <!-- Coming Soon Section -->
        <section>
            <h2 class="section-title">Coming Soon</h2>
            <div class="swiper upcomingSwiper">
                <div class="swiper-wrapper">
                    <%
                        if (movies != null) {
                            for (Movie movie : movies) {
                                if ("Coming Soon".equals(movie.getStatus())) {
                    %>
                        <div class="swiper-slide">
                            <div class="movie-card">
                                <img src="<%= movie.getPosterUrl() %>" alt="<%= movie.getTitle() %>" class="movie-image">
                                <div class="movie-info">
                                    <h3 class="movie-title"><%= movie.getTitle() %></h3>
                                    <div class="movie-meta">
                                        <span class="movie-rating">Coming Soon</span>
                                        <span class="movie-date"><%= movie.getReleaseDate() != null ? movie.getReleaseDate() : "TBD" %></span>
                                    </div>
                                    <button class="book-btn">Notify Me</button>
                                </div>
                            </div>
                        </div>
                    <%
                                }
                            }
                        } else {
                    %>
                        <p>No movies available for "Coming Soon".</p>
                    <%
                        }
                    %>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
    </div>
    <!-- Testimonials Section -->
    <section id="testimonials">
        <h2 class="section-title">What Our Customers Say</h2>
        <div class="swiper testimonialsSwiper">
            <div class="swiper-wrapper">
                <!-- Testimonial 1 -->
                <div class="swiper-slide">
                    <div class="testimonial-card">
                        <img src="assets/img/CU1.jpeg" alt="Customer 1">
                        <p>"The experience at ABC Cinema was magical! The atmosphere was perfect and the movie quality was top-notch!"</p>
                        <h4>John Doe</h4>
                        <p>Movie Enthusiast</p>
                    </div>
                </div>
                <!-- Testimonial 2 -->
                <div class="swiper-slide">
                    <div class="testimonial-card">
                        <img src="assets/img/CU2.jpg" alt="Customer 2">
                        <p>"Best movie experience I've ever had. Comfortable seating and amazing sound quality!"</p>
                        <h4>Jane Smith</h4>
                        <p>Frequent Visitor</p>
                    </div>
                </div>
                <!-- Testimonial 3 -->
                <div class="swiper-slide">
                    <div class="testimonial-card">
                        <img src="assets/img/CU3.jpeg" alt="Customer 3">
                        <p>"ABC Cinema has the best movie screenings in town. The staff is also very friendly and helpful."</p>
                        <h4>Emily Johnson</h4>
                        <p>Local Resident</p>
                    </div>
                </div>
                 <!-- Testimonial 4 -->
                <div class="swiper-slide">
                    <div class="testimonial-card">
                        <img src="assets/img/CU3.jpeg" alt="Customer 4">
                        <p>"ABC Cinema has the best movie screenings in town. The staff is also very friendly and helpful."</p>
                        <h4>Emily Johnson</h4>
                        <p>Local Resident</p>
                    </div>
                </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>
    </section>

    <!-- Gallery Section -->
    <section id="gallery">
        <h2 class="section-title">Our Cinema Gallery</h2>
        <div class="container mx-auto">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                <!-- Gallery Item 1 -->
                <div class="col">
                    <div class="gallery-item">
                        <img src="assets/img/G1.jpeg" alt="Gallery Image 1" class="w-100">
                    </div>
                </div>
                <!-- Gallery Item 2 -->
                <div class="col">
                    <div class="gallery-item">
                        <img src="assets/img/G2.jpeg" alt="Gallery Image 2" class="w-100">
                    </div>
                </div>
                <!-- Gallery Item 3 -->
                <div class="col">
                    <div class="gallery-item">
                        <img src="assets/img/G3.jpg" alt="Gallery Image 3" class="w-100">
                    </div>
                </div>
                <!-- Gallery Item 4 -->
                <div class="col">
                    <div class="gallery-item">
                        <img src="assets/img/G4.jpeg" alt="Gallery Image 4" class="w-100">
                    </div>
                </div>
                <!-- Gallery Item 5 -->
                <div class="col">
                    <div class="gallery-item">
                        <img src="assets/img/G2.jpeg" alt="Gallery Image 5" class="w-100">
                    </div>
                </div>
                <!-- Gallery Item 6 -->
                <div class="col">
                    <div class="gallery-item">
                        <img src="assets/img/G1.jpeg" alt="Gallery Image 6" class="w-100">
                    </div>
                </div>
            </div>
        </div>
    </section>

                
                
                
                
    
    
<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />