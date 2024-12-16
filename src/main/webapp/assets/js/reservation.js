////////////////////////////////////
/////// RESERVATIONS Scripts ///////
////////////////////////////////////

AOS.init(); 
 
let selectedSeats = { standard: 0, premium: 0 }; 
let selectedDate = ''; 
let selectedTime = ''; 
let selectedTheater = ''; 
const prices = { 
    Platinum: { standard: 500, premium: 800 }, 
    Gold: { standard: 500, premium: 800 } 
}; 

// Add date slots dynamically 
function addDates() { 
    const dateSlots = document.getElementById('dateSlots'); 
    const today = new Date(); 
    for (let i = 0; i < 7; i++) { 
        const date = new Date(today); 
        date.setDate(today.getDate() + i); 
        const dateSlot = document.createElement('div'); 
        dateSlot.className = 'date-slot'; 
        dateSlot.innerText = date.toDateString(); 
        dateSlot.onclick = () => selectDate(dateSlot, date.toDateString()); 
        dateSlots.appendChild(dateSlot); 
    } 
} 

function selectDate(dateElement, date) { 
    document.querySelectorAll('.date-slot').forEach(item => item.classList.remove('selected')); 
    dateElement.classList.add('selected'); 
    selectedDate = date; 
    document.getElementById('selectedDate').innerText = selectedDate; 
} 

function selectTime(timeElement) { 
    document.querySelectorAll('.time-slot').forEach(item => item.classList.remove('selected')); 
    timeElement.classList.add('selected'); 
    selectedTime = timeElement.innerText; 
    document.getElementById('selectedTime').innerText = selectedTime; 
} 

function selectTheater(theater) { 
    selectedTheater = theater; 
    document.getElementById('selectedTheater').innerText = selectedTheater; 
    generateSeats(theater); 
} 

function generateSeats(theater) { 
    const seatContainer = document.querySelector('.seat-container'); 
    seatContainer.innerHTML = ''; 
    const rows = theater === 'Platinum' ? 5 : 7; 
    const cols = theater === 'Platinum' ? 7 : 10; 

    for (let row = 0; row < rows; row++) { 
        for (let col = 0; col < cols; col++) { 
            const seatType = getSeatType(theater, row, col); 
            const seat = document.createElement('div'); 
            seat.classList.add('seat'); 
            seat.classList.add(seatType + '-seat'); 
            seat.onclick = () => toggleSeat(seat, seatType); 
            seatContainer.appendChild(seat); 
        } 
    } 
} 

function getSeatType(theater, row, col) { 
    if (theater === 'Platinum') { 
        return col < 3 ? 'premium' : 'standard'; 
    } else if (theater === 'Gold') { 
        return row < 2 ? 'premium' : 'standard'; 
    } 
    return 'standard'; 
} 

function toggleSeat(seat, seatType) { 
    if (seatType !== 'standard' && seatType !== 'premium') { 
        console.warn('Invalid seat type selected.'); 
        return; 
    } 

    if (seat.classList.contains('selected')) { 
        seat.classList.remove('selected'); 
        selectedSeats[seatType]--; 
    } else { 
        seat.classList.add('selected'); 
        selectedSeats[seatType]++; 
    } 
    updateBookingSummary(); 
} 

function updateBookingSummary() { 
    const totalSeats = selectedSeats.standard + selectedSeats.premium; 
    const totalPrice = selectedSeats.standard * prices[selectedTheater].standard + 
        selectedSeats.premium * prices[selectedTheater].premium; 
    document.getElementById('selectedSeats').innerText = `Standard: 
${selectedSeats.standard}, Premium: ${selectedSeats.premium}`; 
    document.getElementById('totalPrice').innerText = `LKR ${totalPrice}`; 
} 

function confirmBooking() { 
    const totalSeats = selectedSeats.standard + selectedSeats.premium; 
    if (totalSeats === 0 || !selectedDate || !selectedTime || !selectedTheater) { 
        alert("Please complete all selections (date, time, theater, and seats) before confirming."); 
        return; 
    } 

    let seatDetails = `Standard: ${selectedSeats.standard}\nPremium: 
${selectedSeats.premium}`; 
    let totalPrice = selectedSeats.standard * prices[selectedTheater].standard + 
        selectedSeats.premium * prices[selectedTheater].premium; 

    let confirmationMessage = ` 
        Booking Summary: 
        Date: ${selectedDate} 
        Theater: ${selectedTheater} 
        Time: ${selectedTime} 
        Seats Selected:\n${seatDetails} 
        Total Price: LKR ${totalPrice} 

        Do you want to confirm your booking?`; 

    let confirm = window.confirm(confirmationMessage); 

    if (confirm) { 
        showPaymentPopup(); 
    } else { 
        alert("Your booking has been cancelled."); 
    } 
} 

// Show payment popup 
function showPaymentPopup() { 
    document.getElementById('paymentPopup').classList.add('show'); 
} 

// Handle checkout action 
function checkout() { 
    alert('Payment Successful! Your booking is confirmed.'); 
    hidePaymentPopup(); 
} 

// Cancel payment action 
function cancelPayment() { 
    hidePaymentPopup(); 
    alert('Payment has been cancelled.'); 
} 

// Hide payment popup 
function hidePaymentPopup() { 
    document.getElementById('paymentPopup').classList.remove('show'); 
} 

// Initialize the date slots 
addDates();