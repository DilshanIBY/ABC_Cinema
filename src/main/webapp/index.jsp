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
          <!-- Sample Gallery Item 1 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/kids.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/kids.jpg" class="img-fluid" alt="ABC CINEMA Hall">
              </a>
            </div>
          </div><!-- End gallery item -->

          <!-- Sample Gallery Item 2 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gold-hall.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/gold-hall.jpg" class="img-fluid" alt="Snack Bar at ABC CINEMA">
              </a>
            </div>
          </div><!-- End gallery item -->

          <!-- Sample Gallery Item 3 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/blue-hall.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/blue-hall.jpg" class="img-fluid" alt="Movie Poster Wall">
              </a>
            </div>
          </div><!-- End gallery item -->

          <!-- Sample Gallery Item 4 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/family.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/family.jpg" class="img-fluid" alt="Family Time at ABC CINEMA">
              </a>
            </div>
          </div><!-- End gallery item -->
          
          <!-- Sample Gallery Item 5 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/couple.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/couple.jpg" class="img-fluid" alt="ABC CINEMA Hall">
              </a>
            </div>
          </div><!-- End gallery item -->

          <!-- Sample Gallery Item 6 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/shops.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/shops.jpg" class="img-fluid" alt="Snack Bar at ABC CINEMA">
              </a>
            </div>
          </div><!-- End gallery item -->

          <!-- Sample Gallery Item 7 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/wall.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/wall.jpg" class="img-fluid" alt="Movie Poster Wall">
              </a>
            </div>
          </div><!-- End gallery item -->

          <!-- Sample Gallery Item 8 -->
          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/friends.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="assets/img/gallery/friends.jpg" class="img-fluid" alt="Family Time at ABC CINEMA">
              </a>
            </div>
          </div><!-- End gallery item -->
          
          
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
            <!-- Sample Testimonial Item 1 -->
            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  ABC CINEMA offers a truly immersive movie experience with state-of-the-art facilities. Highly recommend it!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="Kasun Perera">
                <h3>Kasun Perera</h3>
                <h4>Movie Enthusiast</h4>
              </div>
            </div><!-- End testimonial item -->

            <!-- Sample Testimonial Item 2 -->
            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  The seats are so comfortable, and the sound system is outstanding. My family loves coming here!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="Nirmala Silva">
                <h3>Ashen Silva</h3>
                <h4>Frequent Visitor</h4>
              </div>
            </div><!-- End testimonial item -->
            
            <!-- Additional Testimonials -->
            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  ABC CINEMA is the perfect place to hang out with friends! The screens are huge, and the snacks are so tasty. I can't wait for my next movie night!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="Samantha Wijesinghe">
                <h3>Nadini Wijesinghe</h3>
                <h4>College Student</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Watching movies at ABC CINEMA is an epic experience. The 3D visuals are unreal, and the sound quality makes you feel like you're in the movie. It's my favorite spot!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="Ravindu Fernando">
                <h3>Ravindu Fernando</h3>
                <h4>Young Professional</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  I was visiting Sri Lanka and stumbled upon ABC CINEMA. It’s one of the best movie theaters I’ve ever been to—clean, modern, and with amazing service. A must-visit for any movie lover!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="Emily Carter">
                <h3>Emily Carter</h3>
                <h4>Tourist</h4>
              </div>
            </div><!-- End testimonial item -->

            
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section><!-- End Testimonials Section -->

           
                
                
                
    
    
<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />