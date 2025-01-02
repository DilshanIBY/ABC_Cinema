/* global array */

////////////////////////////////////
/////// RESERVATIONS Scripts ///////
////////////////////////////////////
AOS.init(); 

let theaterId;
let movieId;
let seatIDs;

// Function to scroll to the next section
function scrollToNextSection(sectionId) {
    const section = document.getElementById(sectionId);
    const topOffset = section.getBoundingClientRect().top + window.scrollY - 100;

    window.scrollTo({
        top: topOffset,
        behavior: 'smooth'
    });
}

// Function to handle theater selection
function selectTheater(theaterName, seatingCapacity, theaterID) {
    document.getElementById('selectedTheater').textContent = theaterName;
    theaterId = theaterID;

    loadDateSlots(); // Load dates
    loadSeats(seatingCapacity); // Load seats based on capacity

    // Highlight selected theater button
    const theaterButtons = document.querySelectorAll('.theater-slot');
    theaterButtons.forEach(button => button.classList.remove('selected'));
    event.target.classList.add('selected');

    // Scroll to Date Section
    scrollToNextSection('dateSection');
}


// Function to load date slots dynamically
function loadDateSlots() {
    const dateSlotsContainer = document.getElementById('dateSlots');
    dateSlotsContainer.innerHTML = '';

    // Generate 7 days of dates dynamically
    const today = new Date();
    for (let i = 0; i < 7; i++) {
        const date = new Date();
        date.setDate(today.getDate() + i);
        const formattedDate = date.toISOString().split('T')[0];

        const dateSlot = document.createElement('div');
        dateSlot.classList.add('date-slot');
        dateSlot.textContent = formattedDate;
        dateSlot.onclick = () => selectDate(dateSlot, formattedDate);

        dateSlotsContainer.appendChild(dateSlot);
    }
}

// Function to handle date selection
function selectDate(element, date) {
    document.getElementById('selectedDate').textContent = date;

    // Highlight selected date slot
    const dateSlots = document.querySelectorAll('.date-slot');
    dateSlots.forEach(slot => slot.classList.remove('selected'));
    element.classList.add('selected');

    // Scroll to the "Time Section"
    scrollToNextSection('timeSection');
}

// Function to handle time selection
function selectTime(element) {
    const selectedTime = element.textContent;
    document.getElementById('selectedTime').textContent = selectedTime;

    // Highlight selected time slot
    const timeSlots = document.querySelectorAll('.time-slot');
    timeSlots.forEach(slot => slot.classList.remove('selected'));
    element.classList.add('selected');

    // Scroll to the "Seats Section"
    scrollToNextSection('seatsSection');
}

// Function to load seats dynamically based on patterns and seating capacity
function loadSeats(seatingCapacity) {
    const seatContainer = document.querySelector('.seat-container');
    seatContainer.innerHTML = '';

    // Choose a pattern based on seating capacity
    const pattern = getSeatPattern(seatingCapacity);

    // Create seats based on the selected pattern
    pattern.forEach((row, rowIndex) => {
        const rowContainer = document.createElement('div');
        rowContainer.classList.add('seat-row');

        row.forEach((type, seatIndex) => {
            const seat = document.createElement('div');
            seat.classList.add('seat');

            if (type === ' ') {
                seat.classList.add('no-seat'); // Add 'no-seat' for spaces
            } else {
                // Generate a unique seat ID
                const seatID = `R${rowIndex + 1}S${seatIndex + 1}`;
                seat.dataset.seatId = seatID;

                // Apply seat type (premium or standard)
                seat.classList.add(type === 'P' ? 'premium-seat' : 'standard-seat');
                seat.onclick = () => toggleSeatSelection(seat);
            }

            rowContainer.appendChild(seat);
        });

        seatContainer.appendChild(rowContainer);
    });
}

// Function to select a seat pattern based on seating capacity
function getSeatPattern(capacity) {
    if (capacity === 200) {
        return [
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', 'P', 'P', 'P', ' ', 'P', 'P', 'P', ' ', ' '],
            [' ', ' ', 'P', 'P', 'P', ' ', 'P', 'P', 'P', ' ', ' '],
            [' ', ' ', 'P', 'P', 'P', ' ', 'P', 'P', 'P', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            [' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' '],
            [' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' '],
            [' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            ['S', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', 'S'],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
        ];
    } else if (capacity === 300) {
        return [
            // Row 1-3: Premium seating
            ['P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P'],
            ['P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P'],
            ['P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P'],
            
            // Aisle space
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            
            // Row 4-9: Standard seating
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            
            // Aisle space
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            
            // Row 10-12: Standard seating (back rows)
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S']
        ];
    } else if (capacity === 250) {
        return [    
            [' ', ' ', ' ', 'P', 'P', 'P', ' ', 'P', 'P', 'P', ' ', ' ', ' '],
            [' ', ' ', ' ', 'P', 'P', 'P', ' ', 'P', 'P', 'P', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S']
        ]
    } else if (capacity === 150) {
        return [
            [' ', ' ', ' ', 'P', 'P', ' ', 'P', 'P', ' ', ' ', ' '],
            [' ', ' ', ' ', 'P', 'P', ' ', 'P', 'P', ' ', ' ', ' '],
            [' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' '],
            [' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            [' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' '],
            [' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' '],
            ['P', 'P', ' ', 'P', 'P', ' ', 'P', 'P', ' ', 'P', 'P'],
            ['P', 'P', ' ', 'P', 'P', ' ', 'P', 'P', ' ', 'P', 'P']
        ];
    } else if (capacity === 400) {
        return [
            // Row 1-4: Premium seating with wide aisles
            ['P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P'],
            ['P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P'],
            ['P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P'],
            ['P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P', ' ', 'P', 'P', 'P', 'P'],
            
            // Aisle space
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            
            // Row 5-10: Standard seating
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            
            // Aisle space
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
            
            // Row 11-15: Standard seating (back rows)
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S'],
            ['S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S', ' ', 'S', 'S', 'S', 'S']
        ];
    }
}


// Function to toggle seat selection
function toggleSeatSelection(seat) {
    seat.classList.toggle('selected');
    updateSelectedSeats();

    // Check if any seats are selected
    const selectedSeats = document.querySelectorAll('.seat.selected').length;
    const bookBtn = document.querySelector('.confirm-bk');

    if (selectedSeats > 0) {
        bookBtn.classList.add('appear'); // Show the sidebar
    } else {
        bookBtn.classList.remove('appear'); // Hide the sidebar
    }
}

// Function to update selected seats in the summary
function updateSelectedSeats() {
    const selectedSeats = document.querySelectorAll('.seat.selected');
    const seatCount = selectedSeats.length;
    const totalPrice = Array.from(selectedSeats).reduce((total, seat) => {
        return total + (seat.classList.contains('premium-seat') ? 12 : 8);
    }, 0);

    // Get selected seat IDs as a comma-separated string
    seatIDs = Array.from(selectedSeats).map(seat => seat.dataset.seatId).join(', ');

    document.getElementById('selectedSeats').textContent = seatCount > 0 ? seatCount + ' seat(s)' : 'None';
    document.getElementById('totalPrice').textContent = 'USD ' + totalPrice;
}

// Function to confirm booking
function confirmBooking() {
    const theater = theaterId;
    const date = document.getElementById('selectedDate').textContent;
    const time = document.getElementById('selectedTime').textContent;
    const seats = seatIDs;
    let price = document.getElementById('totalPrice').textContent;

    if (theater === 'Not selected' || date === 'Not selected' || time === 'Not selected' || seats === 'None') {
        alert('Please complete all selections before confirming your booking.');
        return;
    }

    // Remove "USD " from the price
    price = price.replace(/^USD\s*/, ''); // Removes "USD " at the start of the string

    // Generate a unique reservation ID (or fetch from the server if needed)
    const reservationId = Math.floor(Date.now() / 1000); // Example: Generates a unique ID using the timestamp

    // Populate the form fields
    const form = document.getElementById('paymentForm');
    form.querySelector('input[name="reservationId"]').value = reservationId;
    form.querySelector('input[name="theaterId"]').value = theater; 
    form.querySelector('input[name="seatNumbers"]').value = seats;
    form.querySelector('input[name="amount"]').value = price;

    // Submit the form programmatically
    form.submit();
}




// Initialize the page with default data
window.onload = () => {
    loadDateSlots();

    // Get seating capacity dynamically
    const seatingCapacityElement = document.querySelector('.theater-card .card-text.small');
    let seatingCapacity = 0;

    if (seatingCapacityElement) {
        // Extract the number from the text (e.g., "120 seats")
        const capacityText = seatingCapacityElement.textContent.trim();
        const capacityMatch = capacityText.match(/\d+/); // Match digits only
        seatingCapacity = capacityMatch ? parseInt(capacityMatch[0], 10) : 0; // Parse as integer
    }

    // Load seats based on the extracted seating capacity
    loadSeats(seatingCapacity);
};


