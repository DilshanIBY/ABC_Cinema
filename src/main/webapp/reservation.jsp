<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />

<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />
    


<div id="reservation">
 
    <main class="container py-5 mt-5"> 
        <section class="glass-effect p-4 mb-4" data-aos="fade-up"> 
            <h2 class="gold-text mb-4">Select Date</h2> 
            <div class="d-flex flex-wrap" id="dateSlots"></div> 
        </section> 
 
        <section class="glass-effect p-4 mb-4" data-aos="fade-up"> 
            <h2 class="gold-text mb-4">Show Times</h2> 
            <div class="d-flex flex-wrap"> 
                <div class="time-slot" onclick="selectTime(this)">10:30 AM</div> 
                <div class="time-slot" onclick="selectTime(this)">1:15 PM</div> 
                <div class="time-slot" onclick="selectTime(this)">4:00 PM</div> 
                <div class="time-slot" onclick="selectTime(this)">7:30 PM</div> 
                <div class="time-slot" onclick="selectTime(this)">10:45 PM</div> 
            </div> 
        </section> 
 
        <section class="glass-effect p-4 mb-4" data-aos="fade-up"> 
            <h2 class="gold-text mb-4">Select Theater</h2> 
            <div class="row"> 
                <div class="col-md-4 mb-3"> 
                    <div class="theater-card card bg-transparent border-gold h-100"> 
                        <div class="card-body"> 
                            <h5 class="card-title gold-text">Platinum Theater</h5> 
                            <p class="card-text">Premium Experience</p> 
                            <div class="theater-features"> 
                                <p>? Dolby Atmos Sound</p> 
                                <p>? 4K Laser Projection</p> 
                                <p>? Reclining Seats</p> 
                            </div> 
                            <button class="btn btn-outline-warning" 
onclick="selectTheater('Platinum')">Select</button> 
                        </div> 
                    </div> 
                </div> 
                <div class="col-md-4 mb-3"> 
                    <div class="theater-card card bg-transparent border-gold h-100"> 
                        <div class="card-body"> 
                            <h5 class="card-title gold-text">Gold Theater</h5> 
                            <p class="card-text">Luxury Experience</p> 
                            <div class="theater-features"> 
                                <p>? Premium Sound System</p> 
                                <p>? Digital Projection</p> 
                            </div> 
                            <button class="btn btn-outline-warning" 
onclick="selectTheater('Gold')">Select</button> 
                        </div> 
                    </div> 
                </div> 
            </div> 
        </section> 
 
        <section class="glass-effect p-4 mb-4" data-aos="fade-up" data-aos-delay="100"> 
            <h2 class="gold-text mb-4">Select Seats</h2> 
            <div class="screen mb-4"></div> 
            <div class="text-center"> 
                <div class="seat-container d-flex flex-wrap justify-content-center"></div> 
            </div> 
            <div class="mt-4"> 
                <div class="d-flex justify-content-center gap-4 flex-wrap"> 
                    <div> 
                        <span class="seat standard-seat d-inline-block"></span> 
                        <span>Standard (LKR 500)</span> 
                    </div> 
                    <div> 
                        <span class="seat premium-seat d-inline-block"></span> 
                        <span>Premium (LKR 800)</span> 
                    </div> 
                </div> 
            </div> 
        </section> 
 
        <section class="glass-effect p-4" data-aos="fade-up" data-aos-delay="200"> 
            <h2 class="gold-text mb-4">Booking Summary</h2> 
            <div class="row"> 
                <div class="col-md-6"> 
                    <p>Selected Date: <span id="selectedDate">Not selected</span></p> 
                    <p>Selected Time: <span id="selectedTime">Not selected</span></p> 
                    <p>Selected Theater: <span id="selectedTheater">Not selected</span></p> 
                    <p>Selected Seats: <span id="selectedSeats">None</span></p> 
                    <p>Total Price: <span id="totalPrice">LKR 0</span></p> 
                </div> 
                <div class="col-md-6 text-end"> 
                    <button class="btn btn-outline-warning" onclick="confirmBooking()">Confirm 
Booking</button> 
                </div> 
            </div> 
        </section> 
    </main> 
 
    <!-- Payment Popup Modal --> 
    <div class="payment-popup" id="paymentPopup"> 
        <div class="payment-popup-header"> 
            <h4 class="gold-text">Order Summary</h4> 
        </div> 
        <div class="payment-form"> 
            <h5 class="gold-text">Payment Method</h5> 
            <select class="form-select mb-4"> 
                <option value="credit">Credit/Debit Card</option> 
                <option value="paypal">PayPal</option> 
                <option value="bank">Bank Transfer</option> 
            </select> 
 
            <button class="payment-button" onclick="checkout()">Checkout</button> 
            <button class="cancel-button" onclick="cancelPayment()">Cancel Payment</button> 
        </div> 
    </div>

</div>




<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />
                
                
<!-- Footer -->
<jsp:include page="temps/footer.jsp" />