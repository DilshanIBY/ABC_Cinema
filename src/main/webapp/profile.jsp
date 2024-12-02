<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

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
                    <span><strong>Name:</strong> User Name</span>
                    <span><strong>Contact:</strong> +9476 0455 678 </span>
                    <span><strong>Email Address:</strong> User@gmail.com</span>
                </div>
                <button class="edit-profile-button">Edit Profile</button>
            </div>
        </div>
        <div class="history-container">
            <h2>Booking History</h2>
            <div class="history-grid">
                <!-- Example row -->
                <div class="cell"><img src="assets/img/Amaran_2024_poster.jpg" alt="Movie 1"></div>
                <div class="cell">Amaran</div>
                <div class="cell date-cell">Booked on: 2024-11-20</div>
                <div class="cell status-cell status-booked">Booked</div>
                <div class="cell">
                    <i class="fa-solid fa-trash icon"></i>
                </div>

                <div class="cell"><img src="assets/img/smile 2.jpg" alt="Movie 2"></div>
                <div class="cell">Smile 2</div>
                <div class="cell date-cell">Booked on: 2024-10-12</div>
                <div class="cell status-cell status-cancelled">Cancelled</div>
                <div class="cell">
                    <i class="fa-solid fa-share-from-square icon"></i>
                </div>

                <div class="cell"><img src="assets/img/venom.jpg" alt="Movie 3"></div>
                <div class="cell">Venom : The Last Dance</div>
                <div class="cell date-cell">Booked on: 2024-11-12</div>
                <div class="cell status-cell status-booked">Cancelled</div>
                <div class="cell">
                    <i class="fa-solid fa-share-from-square icon"></i>
                </div>

                <div class="cell"><img src="assets/img/mandara.jpg" alt="Movie 4"></div>
                <div class="cell">Mandara</div>
                <div class="cell date-cell">Booked on: 2024-09-08</div>
                <div class="cell status-cell status-booked">Booked</div>
                <div class="cell">
                    <i class="fa-solid fa-trash icon"></i>
                </div>

            </div>
        </div>
    </div>
    






<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />