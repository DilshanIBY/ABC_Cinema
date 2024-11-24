<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Theaters</title>
  <link rel="stylesheet" href="assets/css/styles.css">
  
 
  <!--Google Fonts and Icons-->
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Round|Material+Icons+Sharp|Material+Icons+Two+Tone"
      rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    
    
</head>
<body>
<!--<header>

    <a href="#" class="logo">ABC Cinema</a>

    <nav class="navbar">
        <a class="active" href="">HOME</a>
        <a href="#about">Booking summary</a>
        <a href="#menu">Theater</a>
        <a href="#home">seat Reservation</a>
    </nav>

    <div class="icons">
        <i class="fas fa-bars" id="menu-bars"></i>
        <i class="fas fa-search" id="search-icon"></i>
        <a href="#" class="fas fa-heart"></a>
        <a href="#" class="fas fa-shopping-cart"></a>
    </div>

</header>
    -->
    
    
    
    
    
<!--    This code is theater part start-->
<!--  <header>
    <div class="header-content">
      <h1>Discover Our Theaters</h1>
      <p>Experience entertainment like never before!</p>
    </div>
  </header>-->
  <main>
    <section class="theater-list" class="menu">
      <!-- Dynamic content inserted by JavaScript -->
    </section>
  </main>
<!--  <footer>
    <p>© 2024 Our Theaters Location. Designed by : Raheem Ihsaan .</p>
  </footer>-->
  
  <!--    This code is theater part end-->
  
  <!--    This code is seat part start-->
   <section class="section-gallery" id="home">
    <h2>Seat Reservation</h2>
    <div class="gallery-container">
      <div class="center">
      <div class="tickets">
        <div class="ticket-selector" >
          <div class="head">
<!--            <div class="title" >Movie Name</div>-->
          </div>
          <div class="seats">
            <div class="status">
              <div class="item">Available</div>
              <div class="item">Booked</div>
              <div class="item">Selected</div>
            </div>
            <div class="all-seats">
              <input type="checkbox" name="tickets" id="s1" />
              <label for="s1" class="seat booked"></label>
            </div>
          </div>
          <div class="timings">
            <div class="dates">
              <input type="radio" name="date" id="d1" checked />
              <label for="d1" class="dates-item">
                <div class="day">Sun</div>
                <div class="date">11</div>
              </label>
              <input type="radio" id="d2" name="date" />
              <label class="dates-item" for="d2">
                <div class="day">Mon</div>
                <div class="date">12</div>
              </label>
              <input type="radio" id="d3" name="date" />
              <label class="dates-item" for="d3">
                <div class="day">Tue</div>
                <div class="date">13</div>
              </label>
              <input type="radio" id="d4" name="date" />
              <label class="dates-item" for="d4">
                <div class="day">Wed</div>
                <div class="date">14</div>
              </label>
              <input type="radio" id="d5" name="date" />
              <label class="dates-item" for="d5">
                <div class="day">Thu</div>
                <div class="date">15</div>
              </label>
              <input type="radio" id="d6" name="date" />
              <label class="dates-item" for="d6">
                <div class="day">Fri</div>
                <div class="date">16</div>
              </label>
              <input type="radio" id="d7" name="date" />
              <label class="dates-item" for="d7">
                <div class="day">Sat</div>
                <div class="date">17</div>
              </label>
            </div>
            <div class="times">
              <input type="radio" name="time" id="t1" checked />
              <label for="t1" class="time">11:00</label>
              <input type="radio" id="t2" name="time" />
              <label for="t2" class="time"> 14:30 </label>
              <input type="radio" id="t3" name="time" />
              <label for="t3" class="time"> 18:00 </label>
              <input type="radio" id="t4" name="time" />
              <label for="t4" class="time"> 21:30 </label>
            </div>
          </div>
        </div>
        <div class="price">
          <div class="total">
            <span> <span class="count">0</span> Tickets </span>
            <div class="amount">0</div>
          </div>
          <button type="button">Book Now</button>
        </div>
      </div>
    </div>
    </div>
  </section>
  
  
  
  <section class="section-gallery" id="about"><!--
-->    <h2 class="name">Booking Summary</h2><!--
    <div class="gallery-container">-->
      
         <section class="movie-details">
      <h2>Movie Details</h2>
      <p><strong>Movie Title:</strong> The Great Adventure</p>
      <p><strong>Showtime:</strong> 7:30 PM</p>
      <p><strong>Seats:</strong> A5, A6, A7</p>
    </section>

    <section class="pricing">
      <h2>Pricing Breakdown</h2>
      <ul>
        <li>Ticket Price: Rs.800 x 3 seats = Rs.1800</li>
        <li><strong>Total:</strong> Rs,</li>
      </ul>
    </section>

    <section class="payment-info">
      <h2>Payment Info</h2>
      <p><strong>Payment Method:</strong> Credit Card (Visa)</p>
      <p><strong>Transaction ID:</strong> 1234567890</p>
    </section>

    <button class="confirm-btn">Confirm Booking</button>
  </main>

<!--  <footer>
    <p>&copy; 2024 Liberty By Scope Cinemas. All Rights Reserved.</p>
  </footer>-->
        
        
    </div>
  </section>
  
  
  
  <script src="assets/js/script.js"></script>
  <!--    This code is seat part end-->
</body>
</html>

