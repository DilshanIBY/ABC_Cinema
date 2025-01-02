<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*, jakarta.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="models.User" %>
<%@ page import="utils.DatabaseConnection" %>
<%@ page import="utils.DatabaseUtils" %>
<%
    // Fetch user details from session
    Integer userId = (Integer) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
    String userPhone = (String) session.getAttribute("userPhone");
    String userEmail = (String) session.getAttribute("userEmail");
    String userPhoto = (String) session.getAttribute("userPhoto");

    if (userId == null || userName == null) {
        response.sendRedirect("login-register.jsp"); // Redirect to the login page
        return;
    }

    // Database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    List<Map<String, String>> bookingHistory = new ArrayList<>();

    try {
        conn = DatabaseConnection.getConnection();

        String query = "SELECT r.reservation_id, r.reservation_date, r.seat_numbers, r.total_price, m.title, m.poster_url, p.payment_status FROM reservations r JOIN movies m ON r.movie_id = m.movie_id LEFT JOIN payments p ON r.reservation_id = p.reservation_id WHERE r.user_id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, userId);
        rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, String> record = new HashMap<>();
            record.put("reservationId", rs.getString("reservation_id"));
            record.put("movieName", rs.getString("title"));
            record.put("posterUrl", rs.getString("poster_url"));
            record.put("reservationDate", rs.getString("reservation_date"));
            record.put("seatNumbers", rs.getString("seat_numbers"));
            record.put("totalPrice", rs.getString("total_price"));
            record.put("paymentStatus", rs.getString("payment_status"));
            bookingHistory.add(record);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<!-- Head Section -->
<jsp:include page="temps/head.jsp" />

<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />

<!-- PROFILE UI -->
<div id="profile-UI">
    <div class="profile-container">
        <div class="avatar-container">
            <img id="avatar" src="<%= userPhoto != null ? userPhoto : "assets/img/testimonials/testimonials-2.jpg" %>" 
                 alt="User Avatar" onclick="openPhotoViewer()">
        </div>
        <div class="upload-icon" onclick="triggerPhotoUpload()">
            <i class="fa-solid fa-plus"></i>
        </div>
        <input type="file" id="uploadPhoto" name="uploadPhoto" style="display: none;">
        <div class="form-group-container">
            <div class="profile-data">
                <span><strong>Name:</strong> <%= userName %></span>
                <span><strong>Contact:</strong> <%= userPhone %></span>
                <span><strong>Email Address:</strong> <%= userEmail %></span>
            </div>
            <button class="edit-profile-button" onclick="window.location.href='userdetails.jsp?user_id=<%= userId %>';">
                Edit Profile
            </button>
            <button class="edit-profile-button" onclick="window.location.href='adminDashboard.jsp?user_id=<%= userId %>';">
                Admin Dashboard
            </button>
        </div>
    </div>
    <div class="history-container">
        <h2>Booking History</h2>
        <div class="history-grid">
            <% for (Map<String, String> record : bookingHistory) { %>
                <div class="cell"><img src="<%= record.get("posterUrl") %>" alt="<%= record.get("movieName") %>"></div>
                <div class="cell"><%= record.get("movieName") %></div>
                <div class="cell date-cell">Booked on: <%= record.get("reservationDate") %></div>
                <div class="cell status-cell status-">
                    <%= record.get("paymentStatus") %>
                </div>
                <div class="cell">
                    <i class="fa-solid fa-trash icon" data-id="<%= record.get("reservationId") %>"></i>
                </div>
            <% } %>
        </div>
    </div>
</div>
        
        
        
        
<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />

<!-- Footer -->
<jsp:include page="temps/footer.jsp" />
