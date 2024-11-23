
let seats = document.querySelector(".all-seats");
for (var i = 0; i < 59; i++) {
  let randint = Math.floor(Math.random() * 2);
  let booked = randint === 1 ? "booked" : "";
  seats.insertAdjacentHTML(
    "beforeend",
    '<input type="checkbox" name="tickets" id="s' +
      (i + 2) +
      '" /><label for="s' +
      (i + 2) +
      '" class="seat ' +
      booked +
      '"></label>'
  );
}

let tickets = seats.querySelectorAll("input");

tickets.forEach((ticket) => {
ticket.addEventListener("change", () => {
let amountElement = document.querySelector(".amount");
let countElement = document.querySelector(".count");

// Parse the existing amount, stripping the "Rs." prefix
let amount = parseInt(amountElement.innerHTML.replace("Rs.", "")) || 0;
let count = parseInt(countElement.innerHTML) || 0;

if (ticket.checked) {
count += 1;
amount += 800;
} else {
count -= 1;
amount -= 800;
}

// Update the elements with the formatted values
amountElement.innerHTML = `Rs.${amount}`;
countElement.innerHTML = count;
});
});


// Select the "Buy Tickets" link
const buyTicketLinks = document.querySelectorAll(".btn");

// Add click event listeners to all Buy Ticket links
buyTicketLinks.forEach((link) => {
  link.addEventListener("click", (event) => {
    event.preventDefault(); // Prevent default navigation

    // Retrieve movie data from the link's data attributes
    const movieTitle = link.getAttribute("data-title");
    const movieImage = link.getAttribute("data-image");

    // Store the selected movie details in localStorage
    localStorage.setItem("selectedMovieTitle", movieTitle);
    localStorage.setItem("selectedMovieImage", movieImage);

    // Navigate to the seat booking page
    window.location.href = link.getAttribute("href");
  });
});

// On the Seat Booking Page
if (window.location.pathname.includes("seat.html")) {
  // Retrieve stored movie data from localStorage
  const movieTitle = localStorage.getItem("selectedMovieTitle");
  const movieImage = localStorage.getItem("selectedMovieImage");

  // Update the seat booking page with the selected movie details
  if (movieTitle && movieImage) {
    document.getElementById("movie-name").textContent = movieTitle;
    document.getElementById("movie-image").src = movieImage;
    document.getElementById("movie-image").alt = movieTitle;
  }
}

