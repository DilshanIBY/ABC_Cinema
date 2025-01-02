<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // BACKEND IMPORTS %>
<%@ page import="java.io.*, java.util.*, com.paypal.api.payments.*, com.paypal.base.rest.*" %>
<%@ page import="controllers.PaymentController" %>

<!-- Head Section -->
<jsp:include page="temps/head.jsp" />

<!-- Navigation -->
<jsp:include page="temps/navbar.jsp" />

<div id="payment-container">
    <form action="ProcessPayment" method="post">
        <div class="row">
            <div class="column">
                <h3 class="title">Billing Address</h3>
                <div class="input-box">
                    <span>Full Name *</span>
                    <input type="text" name="fullName" required>
                </div>
                <div class="input-box">
                    <span>Email</span>
                    <input type="email" name="email" placeholder="example@example.com">
                </div>
                <div class="input-box">
                    <span>Address</span>
                    <input type="text" name="address">
                </div>
                <div class="input-box">
                    <span>City</span>
                    <input type="text" name="city">
                </div>
                <div class="flex">
                    <div class="input-box">
                        <span>Contact *</span>
                        <input type="text" name="contact" required>
                    </div>
                </div>
            </div>

            <div class="column">
                <h3 class="title">Payment</h3>
                <div class="input-box">
                    <span>Cards Accepted:</span>
                    <img src="assets/img/payments/master.jpg" alt="">
                    <img src="assets/img/payments/visa.jpg" alt="">
                </div>
                <div class="input-box">
                    <span>Holder Name *</span>
                    <input type="text" name="cardHolder" required>
                </div>
                <div class="input-box">
                    <span>Card Number *</span>
                    <input type="text" name="cardNumber" required>
                </div>
                <div class="input-box">
                    <span>Expiration Month *</span>
                    <input type="text" name="expMonth" required>
                </div>
                <div class="flex">
                    <div class="input-box">
                        <span>Expiration Year *</span>
                        <input type="text" name="expYear" required>
                    </div>
                    <div class="input-box">
                        <span>CVV *</span>
                        <input type="text" name="cvv" required>
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" name="reservationId" value="<%= request.getParameter("reservationId") %>">
        <input type="hidden" name="amount" value="<%= request.getParameter("amount") %>">
        <button class="payment-button" type="submit">Checkout</button> 
        <button class="cancel-button" type="button" onclick="cancelPayment()">Cancel Payment</button>
    </form>
</div>

<!-- Chat Bot -->
<jsp:include page="temps/chatbot.jsp" />

<!-- Footer -->
<jsp:include page="temps/footer.jsp" />
