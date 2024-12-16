<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- BACKEND IMPORTS --%>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*, jakarta.servlet.jsp.*" %>
<%@ page import="java.util.*" %>

<%
    HttpSession Session = request.getSession();
   
    String userName = "User Name"; 
    String contact = "+9476 0455 678"; 
    String emailAddress = "User@gmail.com"; 

    
    List<Map<String, String>> bookingHistory = new ArrayList<>();
    bookingHistory.add(Map.of("movie", "Amaran", "date", "2024-11-20", "status", "Booked", "image", "assets/img/Amaran_2024_poster.jpg"));
    bookingHistory.add(Map.of("movie", "Smile 2", "date", "2024-10-12", "status", "Cancelled", "image", "assets/img/smile 2.jpg"));
    bookingHistory.add(Map.of("movie", "Venom : The Last Dance", "date", "2024-11-12", "status", "Cancelled", "image", "assets/img/venom.jpg"));
    bookingHistory.add(Map.of("movie", "Mandara", "date", "2024-09-08", "status", "Booked", "image", "assets/img/mandara.jpg"));
%>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />

<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />

<!-- PROFILE UI -->
<div id="profile-UI">
    <div class="profile-container">
        <div class="avatar-container">
            <img id="avatar" src="assets/img/ai.avif" alt="User Avatar" onclick="openPhotoViewer()">
        </div>
        <div class="upload-icon" onclick="triggerPhotoUpload()">
            <i class="fa-solid fa-plus"></i>
        </div>
        <input type="file" id="uploadPhoto" name="uploadPhoto" style="display: none;">
        <div class="form-group-container">
            <div class="profile-data">
                <span><strong>Name:</strong> <%= userName %></span>
                <span><strong>Contact:</strong> <%= contact %></span>
                <span><strong>Email Address:</strong> <%= emailAddress %></span>
            </div>
            <button class="edit-profile-button" onclick="window.location.href='userdetails.jsp';">Edit Profile</button>
        </div>
    </div>
    <div class="history-container">
        <h2>Booking History</h2>
        <div class="history-grid">
            <% for (Map<String, String> booking : bookingHistory) { %>
                <div class="cell"><img src="<%= booking.get("image") %>" alt="<%= booking.get("movie") %>"></div>
                <div class="cell"><%= booking.get("movie") %></div>
                <div class="cell date-cell">Booked on: <%= booking.get("date") %></div>
                <div class="cell status-cell status-<%= booking.get("status").toLowerCase() %>"><%= booking.get("status") %></div>
                <div class="cell">
                    <% if ("Booked".equals(booking.get("status"))) { %>
                        <i class="fa-solid fa-trash icon"></i>
                    <% } else { %>
                        <i class="fa-solid fa-share-from-square icon"></i>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>
</div>
        
        
        
        
<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />

<!-- Footer -->
<jsp:include page="temps/footer.jsp" />
