<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />
    
<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />







    <div class="contact-container">
        <div class="header">
            <img src="https://files.cdn-files-a.com/uploads/10008872/2000_6745a9f728851.png?width=1600" width="1100">
        </div>
        <div class="contact-section">
            <div class="left-section">
                <h1>Contact Us</h1>
                <h3>We're Here to Help!</h3>
                <p>Got questions, feedback, or need assistance with your bookings? Our dedicated support team is ready to ensure your experience is smooth and enjoyable. Reach out to us using the form below, or explore our FAQs for quick answers. Let's make your journey hassle-free!</p>
                <div class="contact-info">
                    <p><img src="https://static.vecteezy.com/system/resources/thumbnails/009/370/618/small/golden-map-pin-sign-png.png" width="20"> 20+ Cinema Halls</p>
                    <p><img src="https://static.vecteezy.com/system/resources/previews/011/934/418/non_2x/gold-phone-icon-free-png.png" width="20"> +011 2561234, +011 2576892</p>
                    <p><img src="https://static.vecteezy.com/system/resources/thumbnails/050/019/159/small/golden-email-notification-a-shiny-gold-envelope-icon-with-a-glowing-1-notification-symbolizing-an-important-message-perfect-for-marketing-communication-3d-rendering-png.png" width="20">  book@abc-cinema.com</p>
                </div>
            </div>
            <div class="right-section">
                <h2>Your Details</h2>
                <form>
                    <input type="text" name="name" placeholder="Name" required>
                    <input type="email" name="email" placeholder="Email Address" required>
                    <textarea name="comment" rows="5" placeholder="Comment / Questions"></textarea>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
    






<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />