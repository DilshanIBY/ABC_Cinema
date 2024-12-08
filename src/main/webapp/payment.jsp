<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>

<% // BACKEND IMPORTS %>
<% // Import Related Models & Controllers... %>

<!-- Head Section -->
<%--<jsp:include page="temps/head.jsp" />--%>

<!-- Navigation -->
<%--<jsp:include page="temps/navbar.jsp" />--%>
    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Payment Gateway Form Design using HTML and CSS | Codehal</title>
    <link rel="stylesheet" href="assets/css/paymentstyle.css">
</head>

<body>

    <div class="container">
        <form action="">
            <div class="row">
                <div class="column">
                    <h3 class="title">Billing Address</h3>
                    <div class="input-box">
                        <span>Full Name *</span>
                        <input type="text" >
                    </div>
                    <div class="input-box">
                        <span>Email </span>
                        <input type="email" placeholder="example@example.com">
                    </div>
                    <div class="input-box">
                        <span>Address </span>
                        <input type="text" >
                    </div>
                    <div class="input-box">
                        <span>City </span>
                        <input type="text" >
                    </div>

                    <div class="flex">
                        <div class="input-box">
                            <span>Contact *</span>
                            <input type="text" >
                        </div>
                        <!-- <div class="input-box">
                            <span>Zip Code :</span>
                            <input type="number" placeholder="123 456">
                        </div> -->
                    </div>
                </div>

                <div class="column">
                    <h3 class="title">Payment</h3>
                    <div class="input-box">
                        <span>Cards Accepted :</span>
                        <!-- <div id="card_type_selection" class="ol group field-card_type ">
                            <div class="li">
                                <input type="radio" name="card_type" id="card_type_001" value="001">
                                <label for="card_type_001">Visa</label>
                            </div>
                            <div class="li">
                                <input type="radio" name="card_type" id="card_type_002" value="002">
                                <label for="card_type_002">Mastercard</label>
                            </div>
                    </div> -->
                        <img src="assets/images/master.png" alt="">
                    
                        <img src="assets/images/vassaa.png" alt="">
                    
                        
                    </div>
                    <div class="input-box">
                        <span>Holder Name *</span>
                        <input type="text" >
                    </div>
                    <div class="input-box">
                        <span>Card Number *</span>
                        <input type="text" >
                    </div>
                    <div class="input-box">
                        <span>Expiration Month *</span>
                        <input type="text" >
                    </div>
                
                    <div class="flex">
                        <div class="input-box">
                            <span>Expiration Year *</span>
                            <input type="text" >
                        </div>
                        <div class="input-box">
                            <span>CVV *</span>
                            <input type="text" >
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn">Submit</button>
        </form>
    </div>

</body>

</html>
    






<!-- Chat Bot -->
<%--<jsp:include page="temps/chatbot.jsp" />--%>
                
                
<!-- Footer -->
<%--<jsp:include page="temps/footer.jsp" />--%>