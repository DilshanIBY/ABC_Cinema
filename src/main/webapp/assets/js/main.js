////////////////////////////////////
//////// HOME PAGE Scripts /////////
////////////////////////////////////

// Initialize Swiper for Now Showing
const nowShowingSwiper = new Swiper('.nowShowingSwiper', {
    slidesPerView: 1,
    spaceBetween: 20,
    loop: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    autoplay: {
        delay: 3000,
        disableOnInteraction: false,
    },
    breakpoints: {
        640: {
            slidesPerView: 2,
        },
        1024: {
            slidesPerView: 3,
        },
        1400: {
            slidesPerView: 4,
        }
    }
});

// Initialize Swiper for Upcoming Movies
const upcomingSwiper = new Swiper('.upcomingSwiper', {
    slidesPerView: 1,
    spaceBetween: 20,
    loop: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    autoplay: {
        delay: 3500,
        disableOnInteraction: false,
    },
    breakpoints: {
        640: {
            slidesPerView: 2,
        },
        1024: {
            slidesPerView: 3,
        },
        1400: {
            slidesPerView: 4,
        }
    }
});









////////////////////////////////////
/// LOGIN-REGISTER PAGE Scripts ////
////////////////////////////////////

function toggleForms() {
    const loginForm = document.getElementById('loginForm');
    const registerForm = document.getElementById('registerForm');

    if (loginForm.style.display === 'none') {
        registerForm.style.display = 'none';
        loginForm.style.display = 'block';
    } else {
        loginForm.style.display = 'none';
        registerForm.style.display = 'block';
    }
}

function togglePassword(button) {
    const input = button.parentElement.querySelector('input');
    const icon = button.querySelector('i');

    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        input.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}










////////////////////////////////////
//////// MOVIES PAGE Scripts ///////
////////////////////////////////////












////////////////////////////////////
/////// RESERVATIONS Scripts ///////
////////////////////////////////////

const theaters = [
  {
    name: "Liberty By Scope Cinemas - Colpetty",
    address: "37A Srimath Anagarika Dharmapala Mawatha, Colombo 00700",
    image: "assets/img/theater1.jpg",
    contact: "0112 325 266",
    description: "Two screens make up the Liberty cineplex, Liberty Lite and well, the main Liberty cinema. Conveniently located in the heart of Colombo, the cinema has a car park, which allows for easy access and also equipped with snack bar and cafetaria. Liberty .",
    owner: "Naveed Cader"
  },
  {
    name: "Scope Cinemas Multiplex - CCC",
    address: "City Centre, 137 Sir James Pieris Mawatha, Colombo 00200",
    image: "assets/img/theater2.jpg",
    contact: "0112 083 064",
    description: "Dedicated toward raising the bar in Sri Lanka’s cinema experience, Scope aims to provide our patrons with all the flare of old-school movie theaters, coupled with state-of-the-art modernity and comfort, consistent with international standards.",
    owner: "Mr. Eranga Jayawansa"
  },
  {
    name: "SkylineRio Cinema",
    address: "WVG2+2M6, Kumaran Ratnam Rd, Colombo 00200",
    image: "assets/img/theater3.jpg",
    contact: "0112 432 170",
    description: "Rio Cinema Theater is a renowned destination for movie enthusiasts, blending classic charm with modern facilities. Established in the early 1980s, it has been a cornerstone of Colombo's cinematic culture. Equipped with state-of-the-art 4K projection and Dolby Atmos sound, Rio offers an unparalleled viewing experience.",
    owner: "Mr. Suresh Fernando"
  },
  // Add more locations (up to 10)
];

const theaterList = document.querySelector(".theater-list");

theaters.forEach(theater => {
  const card = document.createElement("div");
  card.classList.add("theater-card");

  card.innerHTML = `
    <img src="${theater.image}" alt="${theater.name}">
    <div class="theater-card-content">
      <h3>${theater.name}</h3>
      <p><strong>Address:</strong> ${theater.address}</p>
      <p><strong>Contact:</strong> ${theater.contact}</p>
      <p>${theater.description}</p>
      <p><strong>Owner:</strong> ${theater.owner}</p>
      <a href="#">Reserve Now</a>
    </div>
  `;

  theaterList.appendChild(card);
});


//seat js


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

//Booking summary

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











////////////////////////////////////
/////// REGISTER PAGE Scripts ///////
////////////////////////////////////













////////////////////////////////////
//////// LOGIN PAGE Scripts ////////
////////////////////////////////////













////////////////////////////////////
/////// PAYMENT PAGE Scripts ///////
////////////////////////////////////












////////////////////////////////////
/////// FEEDBACK PAGE Scripts ///////
////////////////////////////////////










////////////////////////////////////
//////// PROFILE PAGE Scripts ///////
////////////////////////////////////












////////////////////////////////////
/////// CONTACT US PAGE Scripts /////
////////////////////////////////////











////////////////////////////////////
//////// CHATBOT PAGE Scripts ///////
////////////////////////////////////












////////////////////////////////////
//////// ERROR PAGE Scripts /////////
////////////////////////////////////














