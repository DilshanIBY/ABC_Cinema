// Example of dynamically displaying booking info in a real-world application
document.addEventListener('DOMContentLoaded', function() {
    const movieTitle = "The Great Adventure";
    const showTime = "7:30 PM";
    const seats = ['A5', 'A6', 'A7'];
    const ticketPrice = 15;
    const numSeats = seats.length;
    const concessions = 12;
  
    // Display booking information dynamically
    document.querySelector('.movie-details p:nth-child(2)').innerText = `Showtime: ${showTime}`;
    document.querySelector('.movie-details p:nth-child(3)').innerText = `Seats: ${seats.join(', ')}`;
    
    const totalPrice = (ticketPrice * numSeats) + concessions;
    document.querySelector('.pricing ul').innerHTML = `
      <li><strong>Ticket Price:</strong> $${ticketPrice} x ${numSeats} seats = $${ticketPrice * numSeats}</li>
      <li><strong>Concessions:</strong> Popcorn and Drinks = $${concessions}</li>
      <li><strong>Total:</strong> $${totalPrice}</li>
    `;
  });
  