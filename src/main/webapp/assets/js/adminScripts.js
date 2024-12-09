////////////////////////////////////
/// ADMIN DASHBOARD Main Scripts ///
////////////////////////////////////

// Make accordions function properly - II
$(document).ready(function () {
    // Toggle details when clicking the item for Bookings and Emails sections
    $('.booking-item, .email-item').on('click', function () {
        var $details = $(this).find('.booking-details, .email-details');
        var $otherDetails = $('.booking-details, .email-details').not($details);
        
        if ($(this).hasClass('open')) {
            $details.slideUp();
            $(this).removeClass('open');
        } else {
            $otherDetails.slideUp();
            $('.booking-item, .email-item').removeClass('open');
            $details.slideDown();
            $(this).addClass('open');
        }
    });
});

// Sidebar controls
function handleAnchorLinks() {
    const sidebarLinks = $('#sidebar a[href^="#"]');
    const offset = -40; // Adjusting the position

    // Function to toggle active state on sidebar links based on scroll position
    function toggleActiveState() {
        const sections = $('.anchor');

        $(window).on('scroll', () => {
            let current = '';

            sections.each(function() {
                const sectionTop = $(this).offset().top;
                const sectionHeight = $(this).outerHeight();
                if ($(window).scrollTop() >= sectionTop - sectionHeight / 3) {
                    current = $(this).attr('name');
                }
            });

            sidebarLinks.removeClass('active').filter(`[href="#${current}"]`).addClass('active');
        });
    }

    // Function to handle smooth scrolling to anchor links
    function scrollToAnchor(anchor) {
        const target = $(`[name=${anchor}]`);
        if (target.length) {
            const targetPosition = target.offset().top - offset;
            $('html, body').scrollTop(targetPosition);
        }
    }

    // Invoke the toggleActiveState function
    toggleActiveState();

    // Smooth scroll on anchor link click
    sidebarLinks.on('click', function(e) {
        e.preventDefault();
        const href = $(this).attr('href');
        const anchor = href.substring(1);
        scrollToAnchor(anchor);
    });
}
// Invoke the function when the DOM is fully loaded
$(document).ready(function() {
    handleAnchorLinks();
});


// search and scroll 
$(document).ready(function () {
    // search on Enter key press
    $('#searchInput').keypress(function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            performSearch();
        }
    });

    // Defining the search
    function performSearch() {
        var searchText = $('#searchInput').val();
        searchText = searchText ? searchText.trim().toLowerCase() : '';
        
        if (searchText !== '') {
            var $matchingElements = $('#main-content').find('*').filter(function () {
                return $(this).text().toLowerCase().indexOf(searchText) !== -1;
            });

            if ($matchingElements.length > 0) {
                $('html, body').animate({
                    scrollTop: $matchingElements.first().offset().top + -100
                }, 1000);
            } else {
                alert("Couldn't find a match.");
            }
        } else {
            alert('Sorry, the search field is empty!');
        }
    }

    $('.search-btn').on('click', function(e) {
        e.preventDefault();
        performSearch(); // Calling to search
    });
});





////////////////////////////////////
/// ADMIN DASHBOARD Overview Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Movies Scripts ///
////////////////////////////////////
document.addEventListener('DOMContentLoaded', () => {
            const modal = document.getElementById('add-movie-modal');
            const form = document.getElementById('add-movie-form');
            const addMovieCards = document.querySelectorAll('.add-movie-card');
            const closeBtn = modal.querySelector('.close-btn');
            let currentGallery = null;
            let isEditing = false;
            let editingCard = null;

            addMovieCards.forEach(card => {
                card.addEventListener('click', () => {
                    currentGallery = card.parentNode;
                    const releaseDateInput = form.querySelector('#release-date');
                    releaseDateInput.style.display = card.dataset.modal === 'coming-soon' ? 'block' : 'none';
                    modal.style.display = 'flex';
                });
            });

            closeBtn.addEventListener('click', () => {
                modal.style.display = 'none';
                form.reset();
                isEditing = false;
                editingCard = null;
            });

            form.addEventListener('submit', (e) => {
                e.preventDefault();
                const name = form['movie-name'].value;
                const language = form['language'].value;
                const genre = form['genre'].value;
                const releaseDate = form['release-date']?.value;
                const imageFile = form['movie-image'].files[0];

                if (!imageFile) {
                    alert('Please select an image.');
                    return;
                }

                const reader = new FileReader();
                reader.onload = function (event) {
                    if (isEditing && editingCard) {
                        editingCard.style.backgroundImage = `url('${event.target.result}')`;
                        const details = editingCard.querySelector('.details');
                        details.innerHTML = `<strong>${name}</strong><br>${language}<br>${genre}${releaseDate ? `<br>${releaseDate}` : ''}`;
                        modal.style.display = 'none';
                        form.reset();
                        isEditing = false;
                        editingCard = null;
                        return;
                    }

                    const newMovieCard = document.createElement('div');
                    newMovieCard.classList.add('movie-card');
                    newMovieCard.style.backgroundImage = `url('${event.target.result}')`;

                    const details = document.createElement('div');
                    details.classList.add('details');
                    details.innerHTML = `<strong>${name}</strong><br>${language}<br>${genre}${releaseDate ? `<br>${releaseDate}` : ''}`;

                    const actions = document.createElement('div');
                    actions.classList.add('actions');
                    actions.innerHTML = `<i class="fa-solid fa-pen-to-square" data-action="edit"></i><i class="fa-solid fa-trash" data-action="delete"></i>`;

                    actions.querySelector('[data-action="edit"]').addEventListener('click', () => {
                        isEditing = true;
                        editingCard = newMovieCard;
                        form['movie-name'].value = name;
                        form['language'].value = language;
                        form['genre'].value = genre;
                        form['release-date'].value = releaseDate || '';
                        modal.style.display = 'flex';
                    });

                    actions.querySelector('[data-action="delete"]').addEventListener('click', () => {
                        newMovieCard.remove();
                    });

                    newMovieCard.appendChild(details);
                    newMovieCard.appendChild(actions);
                    currentGallery.insertBefore(newMovieCard, currentGallery.querySelector('.add-movie-card'));

                    modal.style.display = 'none';
                    form.reset();
                };
                reader.readAsDataURL(imageFile);
            });
        });



////////////////////////////////////
/// ADMIN DASHBOARD Reservations Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Payments Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Feedbacks Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Inquiries Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Users Scripts ///
////////////////////////////////////
 // Add New User Form Toggle
    const addUserButton = document.querySelector('.add-user-btn');
    const addUserForm = document.querySelector('.add-user-form');
    const addUserSubmit = document.querySelector('#addUserSubmit');
    const clearForm = document.querySelector('#clearForm');
    const userTableBody = document.querySelector('#userTableBody');

    let isEditMode = false; // Track if in Edit Mode
    let editingRow = null; // Track which row is being edited

    addUserButton.addEventListener('click', () => {
        addUserForm.style.display = addUserForm.style.display === 'block' ? 'none' : 'block';
        clearForm.click(); // Clear the form on toggle
        isEditMode = false; // Reset edit mode
        addUserSubmit.textContent = 'Add User'; // Reset button text
    });

    // Clear Form
    clearForm.addEventListener('click', () => {
        document.getElementById('userId').value = '';
        document.getElementById('userName').value = '';
        document.getElementById('userEmail').value = '';
        document.getElementById('userPhoto').value = '';
    });

    // Add or Save User Functionality
    addUserSubmit.addEventListener('click', () => {
        const userId = document.getElementById('userId').value;
        const userName = document.getElementById('userName').value;
        const userEmail = document.getElementById('userEmail').value;
        const userPhoto = document.getElementById('userPhoto').files[0];

        if (userId && userName && userEmail) {
            const reader = new FileReader();
            reader.onload = function () {
                if (isEditMode && editingRow) {
                    // Update existing row
                    const profilePic = editingRow.querySelector('.profile-pic');
                    if (userPhoto) {
                        profilePic.src = reader.result;
                    }
                    editingRow.children[0].textContent = userId;
                    editingRow.children[1].innerHTML = `<img src="${profilePic.src}" alt="Profile Pic" class="profile-pic"> ${userName}`;
                    editingRow.children[2].textContent = userEmail;

                    // Reset state
                    editingRow = null;
                    isEditMode = false;
                    addUserSubmit.textContent = 'Add User';
                } else {
                    // Add new row
                    const newRow = document.createElement('tr');
                    newRow.innerHTML = `
                        <td>${userId}</td>
                        <td><img src="${reader.result}" alt="Profile Pic" class="profile-pic"> ${userName}</td>
                        <td>${userEmail}</td>
                        <td>N/A</td>
                        <td>
                            <button class="edit-btn"><i class="fa-solid fa-user-pen"></i></button>
                            <button class="delete-btn"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    `;

                    // Add Delete Functionality
                    newRow.querySelector('.delete-btn').addEventListener('click', function () {
                        this.parentElement.parentElement.remove();
                    });

                    // Add Edit Functionality
                    newRow.querySelector('.edit-btn').addEventListener('click', function () {
                        editUser(newRow);
                    });

                    userTableBody.appendChild(newRow);
                }

                addUserForm.style.display = 'none'; // Hide the form
                clearForm.click(); // Clear the form
            };

            if (userPhoto) {
                reader.readAsDataURL(userPhoto);
            } else if (isEditMode && editingRow) {
                reader.onload(); // Update without changing the photo
            }
        } else {
            alert('Please fill in all fields');
        }
    });

    // Function to Handle Edit Button Click
    function editUser(row) {
        editingRow = row; // Set the row being edited
        isEditMode = true; // Enable edit mode
        addUserSubmit.textContent = 'Save Changes'; // Update button text

        // Pre-fill form with row data
        document.getElementById('userId').value = row.children[0].textContent;
        document.getElementById('userName').value = row.children[1].textContent.trim();
        document.getElementById('userEmail').value = row.children[2].textContent;

        // Show form
        addUserForm.style.display = 'block';
    }

    // Add Delete Functionality to Existing Rows
    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function () {
            this.parentElement.parentElement.remove();
        });
    });

    // Add Edit Functionality to Existing Rows
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function () {
            editUser(this.parentElement.parentElement);
        });
    });



////////////////////////////////////
/// ADMIN DASHBOARD Main Carousel Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Mini Carousel Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Testimonials Scripts ///
////////////////////////////////////




////////////////////////////////////
/// ADMIN DASHBOARD Gallery Scripts ///
////////////////////////////////////



