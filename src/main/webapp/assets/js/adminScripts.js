////////////////////////////////////
/// ADMIN DASHBOARD Main Scripts ///
////////////////////////////////////


// Make accordions function properly - I
$(document).ready(function () {
    $('.accordion-btn').on('click', function () {
        var $content = $(this).next('.accordion-content');
        
        if ($(this).hasClass('active')) {
            $content.slideUp();
            $(this).removeClass('active');
        } else {
            $('.accordion-content').slideUp();
            $('.accordion-btn').removeClass('active');
            $content.slideDown();
            $(this).addClass('active');
        }
    });
});



// Make accordions function properly - II
$(document).ready(function () {
    // Toggle details when clicking the item for Bookings and Emails sections
    $('.theater-item, .email-item').on('click', function () {
        var $details = $(this).find('.theater-details, .email-details');
        var $otherDetails = $('.theater-details, .email-details').not($details);
        
        if ($(this).hasClass('open')) {
            $details.slideUp();
            $(this).removeClass('open');
        } else {
            $otherDetails.slideUp();
            $('.theater-item, .email-item').removeClass('open');
            $details.slideDown();
            $(this).addClass('open');
        }
    });
});


// Smooth fade-in on sidebar click
$('#sidebar a').click(function (e) {
    e.preventDefault(); // Prevent default link behavior

    // Get the target section by name attribute
    var target = $(this).attr('href').substring(1); // Remove the #
    var section = $('a[name="' + target + '"]').next('.grid-responsive');

    // Check if the section exists
    if (section.length) {
        // Fade out any visible section and fade in the target
        $('.grid-responsive:visible').fadeOut(100, function () {
            section.fadeIn(200);
        });

        // Scroll to the top of the section smoothly
        $('html, body').animate({
            scrollTop: section.offset().top
        }, 1000);
    } else {
        console.error("Target section not found:", target);
    }
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



// Handle image uploads
$(document).ready(function() {
    $('[id^="uploadImage"]').on('click', function() {
        // Get the section ID
        var sectionId = $(this).attr('id').replace('uploadImage', '');
        // Trigger the file input for this section
        $('#fileInput' + sectionId).trigger('click'); 
    });

    $('[id^="fileInput"]').on('change', function(event) {
        // Get table name
        var tableName = $(this).closest('[class*=grid-responsive]').attr('class').split(' ').pop();
        // Get the section ID
        var sectionId = $(this).attr('id').replace('fileInput', '');
        // Get item ID associated with the button
        var itemId = $(this).data('item-id');
        // Pass the variables
        var fieldName = $(this).data('field-name');
        // Pass the variables
        uploadImage(event, sectionId, tableName, fieldName, itemId);
    });
});
function uploadImage(event, sectionId, tableName, fieldName, itemId) {
    var file = event.target.files[0];

    // if Id is undefined, make it empty
    if (typeof itemId === 'undefined') {
        itemId = '';
    }
    // if fieldName is undefined, make it empty
    if (typeof fieldName === 'undefined') {
        fieldName = '';
    }

    // Creating formData object
    var formData = new FormData();
    formData.append('image', file);
    formData.append('itemId', itemId);
    formData.append('fieldName', fieldName);
    formData.append('tableName', tableName);

    // Send an AJAX request to update the database
    $.ajax({
        url: 'http://localhost:8080/ABC_Cinema_Reservation/uploadItem',
        method: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            // Log the response from upload.php
            console.log(response);

            // Update the image src with the response for this section
            $('#imageUrlInput' + sectionId + ' img').attr('src', response);

            // if new-gallery-item, add it
            if (itemId === 'new-gallery-item') {
                // trigger the "add_item" function
                add_item(event);
            }
        },
        error: function(xhr, status, error) {
            // Handle errors
            console.error(xhr.responseText);
        }
    });
}





// DELETE button click actions for all sections
$('.deleteBtn').on('click', function() {
    var itemId = $(this).data('item-id');
    var itemName = $(this).data('item-name');

    // Find the closest parent element with a specific class pattern
    var closestRow = $(this).closest('[class*=grid-responsive]').attr('class'); // Get classes of the closest row element
    var classNames = closestRow.split(' '); // Split the classes into an array
    var tableName = classNames[2]; // Find the last class name

    // Send an AJAX request to delete the item
    $.ajax({
        url: 'http://localhost:8080/ABC_Cinema_Reservation/deleteItem',
        method: 'POST',
        data: {
            item_id: itemId,
            item_name: itemName,
            table_name: tableName
        },
        success: function(response) {
            // Refreshes the page after delete
            location.reload();
        },
        error: function(xhr, status, error) {
            // Handle errors
            console.error(xhr.responseText);
        }
    });
});



// Crop image urls
function getCroppedUrl(imageUrl) {
    var startIndex = imageUrl.indexOf('/img/');
    if (startIndex !== -1) {
        var croppedUrl = imageUrl.substring(startIndex);
        return croppedUrl;
    }
    // Return something indicating that the pattern wasn't found.
    return "";
}



// ADD button click actions for all sections
$('body').on('click', '#addItem', add_item);
// add_item function 
// (we seperete this function from event handler. Because we have to call this function also on new-gallery-item uploads)
function add_item(event) {
    // Find $(this) / clickedElement
    var clickedElement = $(event.currentTarget);
    // Get table name
    var tableName = clickedElement.closest('[class*=grid-responsive]').attr('class').split(' ').pop();
    // Collect data based on the section
    var formData = {};
    // Get the closest element
    var closestRow = clickedElement.closest('[class*=grid-responsive]');

    // Logic to handle different sections
    if (tableName === 'menu') {
        // Collect details
        var name = closestRow.find('input[name="name"]:last').val();
        var type = closestRow.find('input[name="type"]:last').val();
        var ingredients = closestRow.find('textarea[name="ingredients"]:last').val();
        var price = closestRow.find('input[name="price"]:last').val();
        var image = closestRow.find('[id^="imageUrlInput"] img').attr('src');

        // Short the url of the image
        image = getCroppedUrl(image);

        // Creating formData object
        formData = {
            name: name,
            type: type,
            ingredients: ingredients,
            price: price,
            image: image,
            tableName: tableName
        };

    } else if (tableName === 'chefs') {
        var name = closestRow.find('input[name="name"]:last').val();
        var occupation = closestRow.find('input[name="occupation"]:last').val();
        var image = closestRow.find('[id^="imageUrlInput"] img').attr('src');
        var twitter = closestRow.find('input[name="twitter"]:last').val();
        var facebook = closestRow.find('input[name="facebook"]:last').val();
        var instagram = closestRow.find('input[name="instagram"]:last').val();
        var linkedin = closestRow.find('input[name="linkedin"]:last').val();
        
        // Short the url of the image
        image = getCroppedUrl(image);

        // Creating formData object
        formData = {
            name: name,
            occupation: occupation,
            image: image,
            twitter: twitter,
            facebook: facebook,
            instagram: instagram,
            linkedin: linkedin,
            tableName: tableName
        };

    } else if (tableName === 'whyus') {
        // Handle WHYUS section data
        var title = closestRow.find('input[name="title"]:last').val();
        var description = closestRow.find('textarea[name="description"]:last').val();

        // Creating formData object
        formData = {
            title: title,
            description: description,
            tableName: tableName
        };

    } else if (tableName === 'specials') {
        // Collect details for specials section
        var name = closestRow.find('input[name="name"]:last').val();
        var title = closestRow.find('input[name="title"]:last').val();
        var hint = closestRow.find('textarea[name="hint"]:last').val();
        var description = closestRow.find('textarea[name="description"]:last').val();
        var image = closestRow.find('[id^="imageUrlInput"] img').attr('src');

        // Short the url of the image
        image = getCroppedUrl(image);

        // Creating formData object
        formData = {
            name: name,
            title: title,
            hint: hint,
            description: description,
            image: image,
            tableName: tableName
        };

    } else if (tableName === 'events') {
        // Collect details for events
        var name = closestRow.find('input[name="name"]:last').val();
        var price = closestRow.find('input[name="price"]:last').val();
        var topDesc = closestRow.find('textarea[name="top_desc"]:last').val();
        var points = closestRow.find('textarea[name="points"]:last').val();
        var bottomDesc = closestRow.find('textarea[name="bottom_desc"]:last').val();
        var image = closestRow.find('[id^="imageUrlInput"]:last img').attr('src');

        // Short the url of the image
        image = getCroppedUrl(image);

        // Creating formData object
        formData = {
            name: name,
            price: price,
            topDesc: topDesc,
            points: points,
            bottomDesc: bottomDesc,
            image: image,
            tableName: tableName
        };
    
    } else if (tableName === 'testimonials') {
        // Collect details for Testimonials section
        var name = closestRow.find('input[name="name"]:last').val();
        var occupation = closestRow.find('input[name="occupation"]:last').val();
        var quote = closestRow.find('textarea[name="quote"]:last').val();
        var image = closestRow.find('[id^="imageUrlInput"] img').attr('src');

        // Short the url of the image
        image = getCroppedUrl(image);

        // Creating formData object
        formData = {
            name: name,
            occupation: occupation,
            quote: quote,
            image: image,
            tableName: tableName
        };

    } else if (tableName === 'gallery') {
        // Collect details for gallery section
        var image = closestRow.find('[id^="imageUrlInput"]:last img').attr('src');

        alert(image);

        // Short the url of the image
        image = getCroppedUrl(image);

        // Creating formData object
        formData = {
            image: image,
            tableName: tableName
        };
    
    }

    // Send an AJAX request to add a new item
    $.ajax({
        url: 'http://localhost:8080/ABC_Cinema_Reservation/addItem',
        method: 'POST',
        data: formData,
        success: function(response) {
            // Refreshes the page after adding
            location.reload(); 
        },
        error: function(xhr, status, error) {
            // Handle errors
            console.error(xhr.responseText);
        }
    });
};



// UPDATE button click actions for all sections
$('body').on('click', '.updateBtn', function() {
    // Get table name
    var tableName = $(this).closest('[class*=grid-responsive]').attr('class').split(' ').pop();
    // Get item ID associated with the button
    var itemId = $(this).data('item-id');
    // Collect data based on the section
    var formData = {};
    // Get the closest element
    var closestRow = $(this).closest('tr');

    if (tableName === 'menu') {

        // Get image url
        var imageUrl = closestRow.find('td.row-image img').attr('src');
        // Short the url of the image
        image = getCroppedUrl(imageUrl);

        formData = {
            item_id: itemId,
            name: closestRow.find('input[name="name"]').val(),
            type: closestRow.find('select[name="type"]').val(),
            ingredients: closestRow.find('textarea[name="ingredients"]').val(),
            price: closestRow.find('input[name="price"]').val(),
            image: image,
            tableName: tableName
        };

    } else if (tableName === 'chefs') {

        // Update the closest element
        var closestRow = $(this).closest('.chef');
        // Get image url
        var imageUrl = closestRow.find('.chef-details .chef-image img').attr('src');
        // Short the url of the image
        image = getCroppedUrl(imageUrl);

        formData = {
            item_id: itemId,
            name: closestRow.find('input[name="name"]').val(),
            occupation: closestRow.find('input[name="occupation"]').val(),
            image: image,
            twitter: closestRow.find('input[name="twitter"]').val(),
            facebook: closestRow.find('input[name="facebook"]').val(),
            instagram: closestRow.find('input[name="instagram"]').val(),
            linkedin: closestRow.find('input[name="linkedin"]').val(),
            tableName: tableName
        };

    } else if (tableName === 'whyus') {

        formData = {
            item_id: itemId,
            title: closestRow.find('input[name="title"]').val(),
            description: closestRow.find('textarea[name="description"]').val(),
            tableName: tableName
        };

    } else if (tableName === 'specials') {

        // Get image url
        var imageUrl = closestRow.find('td.row-image img').attr('src');
        // Short the url of the image
        image = getCroppedUrl(imageUrl);

        formData = {
            item_id: itemId,
            name: closestRow.find('input[name="name"]').val(),
            title: closestRow.find('input[name="title"]').val(),
            hint: closestRow.find('textarea[name="hint"]').val(),
            description: closestRow.find('textarea[name="description"]').val(),
            image: image,
            tableName: tableName
        };

    } else if (tableName === 'events') {

        // Update the closest element
        var closestRow = $(this).closest('.event-form');
        // Get image url
        var imageUrl = closestRow.find('.gallery-card img').attr('src');
        // Short the url of the image
        image = getCroppedUrl(imageUrl);

        formData = {
            item_id: itemId,
            name: closestRow.find('input[name="name"]').val(),
            price: closestRow.find('input[name="price"]').val(),
            topDesc: closestRow.find('textarea[name="top_desc"]').val(),
            points: closestRow.find('textarea[name="points"]').val(),
            bottomDesc: closestRow.find('textarea[name="bottom_desc"]').val(),
            image: image,
            tableName: tableName
        };

    } else if (tableName === 'testimonials') {

        // Update the closest element
        var closestRow = $(this).closest('.testimonial');
        // Get image url
        var imageUrl = closestRow.find('.testimonial-image img').attr('src');
        // Short the url of the image
        image = getCroppedUrl(imageUrl);

        formData = {
            item_id: itemId,
            name: closestRow.find('input[name="name"]').val(),
            occupation: closestRow.find('input[name="occupation"]').val(),
            quote: closestRow.find('textarea[name="quote"]').val(),
            image: image,
            tableName: tableName
        };

    } else if (tableName === 'home') {

        // Update the closest element
        var closestRow = $(this).closest('.home');

        formData = {
            item_id: itemId,
            heroVideo: closestRow.find('input[name="heroVideo"]').val(),
            heroDesc: closestRow.find('textarea[name="heroDesc"]').val(),
            aboutTopDesc: closestRow.find('textarea[name="aboutTopDesc"]').val(),
            aboutPoints: closestRow.find('textarea[name="aboutPoints"]').val(),
            aboutBottomDesc: closestRow.find('textarea[name="aboutBottomDesc"]').val(),
            tableName: tableName
        };

    } else if (tableName === 'contact') {

        // Update the closest element
        var closestRow = $(this).closest('.contact');

        formData = {
            item_id: itemId,

            contactAddress: closestRow.find('textarea[name="contactAddress"]').val(),
            contactEmail: closestRow.find('input[name="contactEmail"]').val(),
            contactPhone: closestRow.find('input[name="contactPhone"]').val(),
            contactMapLocation: closestRow.find('input[name="contactMapLocation"]').val(),
            contactOpenHours: closestRow.find('textarea[name="contactOpenHours"]').val(),

            contactTwitter: closestRow.find('input[name="contactTwitter"]').val(),
            contactFacebook: closestRow.find('input[name="contactFacebook"]').val(),
            contactInstagram: closestRow.find('input[name="contactInstagram"]').val(),
            contactTiktok: closestRow.find('input[name="contactTiktok"]').val(),
            contactLinkedIn: closestRow.find('input[name="contactLinkedIn"]').val(),

            tableName: tableName
        };

    }



    // Send an AJAX request to update the item
    $.ajax({
        url: 'http://localhost:8080/ABC_Cinema_Reservation/updateItem',
        method: 'POST',
        data: formData,
        success: function(response) {
            // Handle success or refresh the page
            location.reload(); // Refreshes the page after update
        },
        error: function(xhr, status, error) {
            // Handle errors
            console.error(xhr.responseText);
        }
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



