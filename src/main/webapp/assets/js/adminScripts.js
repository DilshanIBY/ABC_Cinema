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



