<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<form method = "POST" action = "ReservationController">  
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
           <%  
            String url = "jdbc:mysql://localhost:3306/abc_cinema";
            String user = "root"; 
            String password = ""; 

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            String tname = (String) request.getAttribute("tableName");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM" + tname + "WHERE seat_code IS NOT NULL");
                rs = stmt.executeQuery("SELECT seat_code, status FROM" + tname + "LIMIT 60");
                int dataExist = rs.getInt("count");
                
                if(dataExist > 0){
                    int i = 0;
                    while (rs.next()) {
                        int seatCode = rs.getInt("seat_code");
                        String status = rs.getString("status");
                        String className = status.equals("booked") ? "booked" : "not-booked";
                        String seatValue = "s" + (i + 2);
                       
            %>
            <div class="all-seats">
              <input type="checkbox" name="tickets" value="<%=seatValue%>" />
              <label for="s1" class="<%=className%>"></label>
            </div>
            <%
                    i++;
                }
            }else{
                for (int i = 0; i < 60; i++){
                String seatValue = "s" + (i + 2);
            %>    
            <div class="all-seats">
              <input type="checkbox" name="tickets" value="<%=seatValue%>" />
              <label for="s1" class="not-booked"></label>
            </div>       
            <% }
            }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %> 
          </div>
          <div class="timings">
            <div class="dates">
              <input type="radio" name="date" id="d1" checked />
              <label for="d1" class="dates-item">
                <div class="day">Sun</div>
                <div class="date" name = "moviedate">11</div>
              </label>
              <input type="radio" id="d2" name="date" />
              <label class="dates-item" for="d2">
                <div class="day">Mon</div>
                <div class="date" name = "moviedate">12</div>
              </label>
              <input type="radio" id="d3" name="date" />
              <label class="dates-item" for="d3">
                <div class="day">Tue</div>
                <div class="date" name = "moviedate">13</div>
              </label>
              <input type="radio" id="d4" name="date" />
              <label class="dates-item" for="d4">
                <div class="day">Wed</div>
                <div class="date" name = "moviedate">14</div>
              </label>
              <input type="radio" id="d5" name="date" />
              <label class="dates-item" for="d5">
                <div class="day">Thu</div>
                <div class="date" name = "moviedate">15</div>
              </label>
              <input type="radio" id="d6" name="date" />
              <label class="dates-item" for="d6">
                <div class="day">Fri</div>
                <div class="date" name = "moviedate">16</div>
              </label>
              <input type="radio" id="d7" name="date" />
              <label class="dates-item" for="d7">
                <div class="day">Sat</div>
                <div class="date" name = "moviedate">17</div>
              </label>
            </div>
            <div class="times">
              <input type="radio" name="time" id="t1" checked />
              <label for="t1" class="time" name = "movietime">11:00</label>
              <input type="radio" id="t2" name="time" />
              <label for="t2" class="time" name = "movietime"> 14:30 </label>
              <input type="radio" id="t3" name="time" />
              <label for="t3" class="time" name = "movietime"> 18:00 </label>
              <input type="radio" id="t4" name="time" />
              <label for="t4" class="time" name = "movietime"> 21:30 </label>
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
    <%
        
         Integer sprice = 800;
         Integer foodd = 1200;
        
         Integer seatc = (Integer) request.getAttribute("seatcount");
         String mtime = (String) request.getAttribute("movietime");
         String mdate = (String) request.getAttribute("moviedate");
         String movie = (String) request.getAttribute("movie");
         String[] sseats = (String[]) request.getAttribute("selectedseats");
         
                Integer selseats = 0;
                Integer fprice = 0;
         
            if (sseats != null) {
                 selseats = sseats.length;
                 fprice = selseats * sprice;
            }

            
    %>
         <section class="movie-details">
      <h2>Movie Details</h2>
      <p><strong>Movie Title:</strong> <%=movie%></p>
      <p><strong>Showtime:</strong> <%=mtime%></p>
      <p><strong>Seats:</strong> <%=sseats%></p>
    </section>

    <section class="pricing">
      <h2>Pricing Breakdown</h2>
      <ul>
        <li>Ticket Price: Rs.<%=sprice%> x <%=selseats%> seats = Rs.<%=fprice%></li>
        <li><strong>Total:</strong> Rs.<%=fprice%></li>
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
</form>
  
  
  
  <script src="assets/js/script.js"></script>
  <!--    This code is seat part end-->
</body>
</html>

