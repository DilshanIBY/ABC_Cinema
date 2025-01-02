<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>
<%@ page import="java.io.*, java.util.*, com.paypal.api.payments.*, com.paypal.base.rest.*" %>
<%@ page import="controllers.PaymentController" %>
<%@ page import="controllers.TheaterController" %>
<%@ page import="utils.DatabaseConnection" %>
<%@ page import="utils.DatabaseUtils" %>
<%@ page import="models.Theater" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<%
    // Fetch user details from session
    Integer userId = (Integer) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");

    if (userId == null || userName == null) {
        response.sendRedirect("login-register.jsp"); // Redirect to the login page
        return;
    }
%>

<%
    // Database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    // Variables
    String movieId = request.getParameter("movie_id");
    String movieTitle = "Unknown Movie"; // Default value if not found

    try {
        // Establish connection
        conn = DatabaseConnection.getConnection();

        // SQL query to fetch the movie title based on movie_id
        String query = "SELECT title FROM movies WHERE movie_id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, Integer.parseInt(movieId)); // Bind the movie_id

        // Execute query
        rs = stmt.executeQuery();

        // Retrieve movie title if found
        if (rs.next()) {
            movieTitle = rs.getString("title");
        } else {
            movieTitle = "Movie Not Found";
        }

    } catch (Exception e) {
        e.printStackTrace();
        movieTitle = "Error Occurred";
    } finally {
        // Close resources
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }
%>
    
<!-- Head Section -->
<jsp:include page="temps/head.jsp" />

<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />
    


<div id="reservation">
    <main class="container">
        <div class="page-layout d-flex">
            
            <!-- Main content -->
            <div class="maincontent" data-aos="fade-up" data-aos-delay="200">
                <!-- Theaters Section -->
                <section class="glass-effect p-4 mb-4" data-aos="fade-up">
                    <h2 class="gold-text mb-4 text-center">Select Theater</h2>
                    <div class="theaters-slider swiper" data-aos="fade-up" data-aos-delay="100">
                        <div class="swiper-wrapper">
                            <%
                                TheaterController theaterController = new TheaterController();
                                List<Theater> theaters = theaterController.getAllTheaters();

                                if (theaters != null && !theaters.isEmpty()) {
                                    for (Theater theater : theaters) {
                            %>
                            <div class="swiper-slide">
                                <div class="theater-card card bg-transparent border-gold">
                                    <img src="<%= theater.getImageUrl() %>" class="card-img-top theater-img" alt="<%= theater.getName() %>">
                                    <div class="card-body text-center">
                                        <p class="card-text small"><%= theater.getSeatingCapacity() %> seats</p>
                                        <p class="card-text"><%= theater.getLocation() %></p>
                                        <button class="theater-slot btn btn-outline-warning mt-2"
                                            onclick="selectTheater('<%= theater.getName() %>', <%= theater.getSeatingCapacity() %>, <%= theater.getTheaterId() %>)">
                                            <%= theater.getName() %>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                } else {
                            %>
                            <p>No theaters available.</p>
                            <%
                                }
                            %>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </section>

                <!-- Dates Section -->
                <section id="dateSection" class="glass-effect p-4 mb-4">
                    <h2 class="gold-text mb-4">Select Date</h2> 
                    <div class="d-flex flex-wrap" id="dateSlots"></div> 
                </section>

                <!-- Times Section -->
                <section id="timeSection" class="glass-effect p-4 mb-4" data-aos="fade-up">
                    <h2 class="gold-text mb-4">Show Times</h2> 
                    <div class="d-flex flex-wrap"> 
                        <div class="time-slot" onclick="selectTime(this)">10:30 AM</div> 
                        <div class="time-slot" onclick="selectTime(this)">1:15 PM</div> 
                        <div class="time-slot" onclick="selectTime(this)">4:00 PM</div> 
                        <div class="time-slot" onclick="selectTime(this)">7:30 PM</div> 
                        <div class="time-slot" onclick="selectTime(this)">10:45 PM</div> 
                    </div> 
                </section>

                <!-- Seats Section -->
                <section id="seatsSection" class="glass-effect p-4 mb-4" data-aos="fade-up" data-aos-delay="100"> 
                    <h2 class="gold-text mb-4">Select Seats</h2> 
                    <div class="screen mb-4"><p>SCREEN</p></div> 
                    <div class="text-center"> 
                        <div class="seat-container d-flex flex-wrap justify-content-center"></div> 
                    </div> 
                </section>
            </div>
            
            <!-- Sidebar -->
            <div class="booking-summary-sidebar glass-effect p-4" data-aos="fade-up" data-aos-delay="200">
                <!-- Hidden Form Section -->
                <form id="paymentForm" action="ProcessPayment" method="post">
                    <input type="hidden" name="reservationId" value="">
                    <input type="hidden" name="userId" value="<%= userId %>">
                    <input type="hidden" name="movieId" value="<%= movieId %>">
                    <input type="hidden" name="theaterId" value="">
                    <input type="hidden" name="seatNumbers" value="">
                    <input type="hidden" name="amount" value="">
                </form>

                <!-- My Ticket Section -->
                <div class="booking-summary-sidebar glass-effect p-4" data-aos="fade-up" data-aos-delay="200">
                    <h2 class="gold-text mb-4">My Ticket</h2>
                    <div class="row">
                        <p>Movie: <span id="selectedMovie"></span><%= movieTitle %></p>
                        <p>Theater: <span id="selectedTheater"></span></p>
                        <p>Date: <span id="selectedDate"></span></p>
                        <p>Time: <span id="selectedTime"></span></p>
                        <p>Seats: <span id="selectedSeats"></span></p>
                        <p>Price: <span id="totalPrice"></span></p>
                        <button class="confirm-bk btn btn-outline-warning" onclick="confirmBooking()">
                            <i class="fab fa-paypal"></i>&nbsp;&nbsp;&nbsp;Book & Pay with PayPal
                        </button>
                    </div>
                </div>
            </div>

            
        </div>
    </main> 
</div>




<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />