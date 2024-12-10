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

                
                
                
                
    
    
<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />