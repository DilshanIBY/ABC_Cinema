<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />







    <div class="error-container">
        <div class="error-page">
            <div class="error-content">
              <div class="marquee">
                <h1>404</h1>
                <p>Oops! The page you're looking for doesn't exist.</p>
                <h1>500</h1>
                <p>Oops! Internal Server Error.</p>
              </div>
              <div class="buttons">
                <a href="/" class="home-btn">Go to Home</a>
                <a href="/contact" class="contact-btn">Contact Support</a>
              </div>
            </div>
        </div>
    </div>
    






<!-- Footer -->
<jsp:include page="temps/footer.jsp" />