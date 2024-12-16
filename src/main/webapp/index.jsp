<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% // BACKEND IMPORTS %>
<%@ page import="controllers.MovieController" %>
<%@ page import="models.Movie" %>
<%@ page import="controllers.TestimonialController" %>
<%@ page import="models.Testimonial" %>
<%@ page import="controllers.GalleryController" %>
<%@ page import="models.Gallery" %>
<%@ page import="java.util.List" %>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />

<!-- Header Section -->
<header>
    <video autoplay loop muted playsinline class="bg-video">
        <source src="assets/img/hero/cinemography2.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <div class="overlay"></div>
    <div class="logo">ABC CINEMA</div>
    <h1>Experience Magic on the Big Screen</h1>
</header>


<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />
    





    <!-- ======= Movies Section ======= -->
    <div class="movies-container">
        <!-- Fetch movies -->
        <%
            MovieController movieController = new MovieController();
            List<Movie> movies = movieController.getAllMovies();
        %>

        <!-- Now Showing Section -->
        <section>
            <div class="container">
                <h2 class="section-title" data-aos="fade-up">Now Showing</h2>
                <div class="swiper nowShowingSwiper" data-aos="fade-up" data-aos-delay="100">
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
            </div>
        </section>

        <!-- Coming Soon Section -->
        <section>
            <div class="container">
                <h2 class="section-title" data-aos="fade-up">Coming Soon</h2>
                <div class="swiper upcomingSwiper" data-aos="fade-up" data-aos-delay="100">
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
            </div>
        </section>
    </div>


    <!-- ======= Gallery Section ======= -->
    <section id="gallery" class="gallery">
        <div class="container" data-aos="fade-up">
            <div class="section-title">
                <h2>Gallery</h2>
                <p>Memorable Moments at ABC CINEMA</p>
            </div>
        </div>
        <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">
            <div class="row g-0">
                <%
                    GalleryController galleryController = new GalleryController();
                    List<Gallery> galleryItems = galleryController.getAllGalleryItems();

                    if (galleryItems != null && !galleryItems.isEmpty()) {
                        for (Gallery item : galleryItems) {
                %>
                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="<%= item.getImage() %>" class="gallery-lightbox" data-gall="gallery-item">
                                <img src="<%= item.getImage() %>" class="img-fluid" alt="Gallery Image">
                            </a>
                        </div>
                    </div>
                <%
                        }
                    } else {
                %>
                    <p>No gallery items found.</p>
                <%
                    }
                %>
            </div>
        </div>
    </section><!-- End Gallery Section -->

    
    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
        <div class="container" data-aos="fade-up">
            <div class="section-title">
                <h2>Testimonials</h2>
                <p>What our visitors say about ABC CINEMA</p>
            </div>
            <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                <div class="swiper-wrapper">
                    <%
                        TestimonialController testimonialController = new TestimonialController();
                        List<Testimonial> testimonials = testimonialController.getAllTestimonials();

                        if (testimonials != null) {
                            for (Testimonial testimonial : testimonials) {
                    %>
                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <p>
                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                <%= testimonial.getQuote() %>
                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                            </p>
                            <img src="<%= testimonial.getImage() %>" class="testimonial-img" alt="<%= testimonial.getName() %>">
                            <h3><%= testimonial.getName() %></h3>
                            <h4><%= testimonial.getOccupation() %></h4>
                        </div>
                    </div>
                    <%
                            }
                        } else {
                    %>
                    <p>No testimonials available.</p>
                    <%
                        }
                    %>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>



           
                
                
                
    
    
<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />