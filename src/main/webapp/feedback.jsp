<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />
    
<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />






    <div class="feedback-container">
        
        <img src="https://files.cdn-files-a.com/uploads/10008872/2000_6745a9f728851.png?width=1600" width="800">
        <form>
            <!-- Question 1 -->
            <div class="section">
                <label for="cinema-experience">1. How's the ABC Cinema Experience?</label>
                <div class="rating-buttons">
                    <button type="button" value="1">Very Bad</button>
                    <button type="button" value="2">Bad</button>
                    <button type="button" value="3">Good</button>
                    <button type="button" value="4">Very Good</button>
                    <button type="button" value="5">Excellent</button>
                </div>
            </div>

            <!-- Question 2 -->
            <div class="section">
                <label for="staff-services">2. How's the Staff Services?</label>
                <div class="rating-buttons">
                    <button type="button" value="1">Very Bad</button>
                    <button type="button" value="2">Bad</button>
                    <button type="button" value="3">Good</button>
                    <button type="button" value="4">Very Good</button>
                    <button type="button" value="5">Excellent</button>
                </div>
            </div>

            <!-- Question 3 -->
            <div class="section">
                <label for="overall-review">3. Your Overall Review</label>
                <textarea id="overall-review" name="overall-review" rows="4" placeholder="Write your review here..."></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="submit-btn">Submit Feedback</button>
        </form>

    </div>
    






<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />