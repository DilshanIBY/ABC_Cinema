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

// Navigation line animation 
const nav = document.querySelector("nav");
const navHeight = nav.offsetHeight; // Height of the nav element
const stickyThreshold = 500; // Trigger animation 200px earlier
const stickyPosition = nav.offsetTop - stickyThreshold; // Adjust sticky position by the threshold

// Function to update background size based on scroll position
function updateNavBackgroundSize() {
    const scrollY = window.scrollY;

    if (scrollY >= stickyPosition) {
        // Calculate scroll progress as a percentage of the nav's height
        const scrollProgress = Math.min((scrollY - stickyPosition) / (navHeight + stickyThreshold), 1);

        // Update the background size based on scroll progress
        const backgroundSize = `${scrollProgress * 100}% 1px`;
        nav.style.backgroundSize = `${backgroundSize}, ${backgroundSize}`;
    } else {
        // Reset the animation when scrolling above the adjusted sticky position
        nav.style.backgroundSize = "0% 1px, 0% 1px";
    }
}
// Initialize on page load
updateNavBackgroundSize();
// Add scroll event listener
window.addEventListener("scroll", updateNavBackgroundSize);


// Add Paralex animation to hero section
document.addEventListener('scroll', function () {
    const scrollPosition = window.scrollY;
    const bgVideo = document.querySelector('.bg-video');
    bgVideo.style.transform = `translateY(${scrollPosition * 0.999}px)`; // Adjusts speed (0.5 for slower movement)
});


// Automatically scroll to the newsletter section
document.addEventListener("DOMContentLoaded", function () {
    // Get URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    const message = urlParams.get("message");

    // Check if the message parameter exists
    if (message) {
        const newsletterSection = document.getElementById("newsletter");
        if (newsletterSection) {
            newsletterSection.scrollIntoView({ behavior: "smooth" });
        }
    }
});

(function() {
  "use strict";


  /**
   * Easy selector helper function
   */
  const select = (el, all = false) => {
    el = el.trim()
    if (all) {
      return [...document.querySelectorAll(el)]
    } else {
      return document.querySelector(el)
    }
  }


  /**
   * Easy event listener function
   */
  const on = (type, el, listener, all = false) => {
    let selectEl = select(el, all)
    if (selectEl) {
      if (all) {
        selectEl.forEach(e => e.addEventListener(type, listener))
      } else {
        selectEl.addEventListener(type, listener)
      }
    }
  }


  /**
   * Easy on scroll event listener 
   */
  const onscroll = (el, listener) => {
    el.addEventListener('scroll', listener)
  }


  /**
   * Navbar links active state on scroll
   */
  let navbarlinks = select('#navbar .scrollto', true)
  const navbarlinksActive = () => {
    let position = window.scrollY + 200
    navbarlinks.forEach(navbarlink => {
      if (!navbarlink.hash) return
      let section = select(navbarlink.hash)
      if (!section) return
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        navbarlink.classList.add('active')
      } else {
        navbarlink.classList.remove('active')
      }
    })
  }
  window.addEventListener('load', navbarlinksActive)
  onscroll(document, navbarlinksActive)


  /**
   * Scrolls to an element with header offset
   */
  const scrollto = (el) => {
    let header = select('#header')
    let offset = header.offsetHeight

    let elementPos = select(el).offsetTop
    window.scrollTo({
      top: elementPos - offset,
      behavior: 'smooth'
    })
  }


  /**
   * Toggle .header-scrolled class to #header when page is scrolled
   */
  let selectHeader = select('#header')
  let selectTopbar = select('#topbar')
  if (selectHeader) {
    const headerScrolled = () => {
      if (window.scrollY > 100) {
        selectHeader.classList.add('header-scrolled')
        if (selectTopbar) {
          selectTopbar.classList.add('topbar-scrolled')
        }
      } else {
        selectHeader.classList.remove('header-scrolled')
        if (selectTopbar) {
          selectTopbar.classList.remove('topbar-scrolled')
        }
      }
    }
    window.addEventListener('load', headerScrolled)
    onscroll(document, headerScrolled)
  }


  /**
   * Back to top button
   */
  let backtotop = select('.back-to-top')
  if (backtotop) {
    const toggleBacktotop = () => {
      if (window.scrollY > 100) {
        backtotop.classList.add('active')
      } else {
        backtotop.classList.remove('active')
      }
    }
    window.addEventListener('load', toggleBacktotop)
    onscroll(document, toggleBacktotop)
  }


  /**
   * Mobile nav toggle
   */
  on('click', '.mobile-nav-toggle', function(e) {
    select('#navbar').classList.toggle('navbar-mobile')
    this.classList.toggle('bi-list')
    this.classList.toggle('bi-x')
  })


  /**
   * Mobile nav dropdowns activate
   */
  on('click', '.navbar .dropdown > a', function(e) {
    if (select('#navbar').classList.contains('navbar-mobile')) {
      e.preventDefault()
      this.nextElementSibling.classList.toggle('dropdown-active')
    }
  }, true)


  /**
   * Scrool with ofset on links with a class name .scrollto
   */
  on('click', '.scrollto', function(e) {
    if (select(this.hash)) {
      e.preventDefault()

      let navbar = select('#navbar')
      if (navbar.classList.contains('navbar-mobile')) {
        navbar.classList.remove('navbar-mobile')
        let navbarToggle = select('.mobile-nav-toggle')
        navbarToggle.classList.toggle('bi-list')
        navbarToggle.classList.toggle('bi-x')
      }
      scrollto(this.hash)
    }
  }, true)


  /**
   * Scroll with ofset on page load with hash links in the url
   */
  window.addEventListener('load', () => {
    if (window.location.hash) {
      if (select(window.location.hash)) {
        scrollto(window.location.hash)
      }
    }
  });


  /**
   * Preloader
   */
  let preloader = select('#preloader');
  if (preloader) {
    window.addEventListener('load', () => {
      preloader.remove()
    });
  }


  /**
   * Testimonials slider
   */
  new Swiper('.testimonials-slider', {
    speed: 600,
    loop: true,
    autoplay: {
      delay: 5000,
      disableOnInteraction: false
    },
    slidesPerView: 'auto',
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    },
    breakpoints: {
      320: {
        slidesPerView: 1,
        spaceBetween: 20
      },

      1200: {
        slidesPerView: 3,
        spaceBetween: 20
      }
    }
  });
  
  
    /**
   * Theaters slider
   */
  new Swiper('.theaters-slider', {
    slidesPerView: 'auto',
    spaceBetween: 30,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev'
    },
    pagination: {
      el: '.swiper-pagination',
      clickable: true
    },
    breakpoints: {
      320: {
        slidesPerView: 1,
        spaceBetween: 10
      },
      768: {
        slidesPerView: 2,
        spaceBetween: 20
      },
      1200: {
        slidesPerView: 3,
        spaceBetween: 30
      }
    }
  });



  /**
   * Initiate gallery lightbox 
   */
  const galleryLightbox = GLightbox({
    selector: '.gallery-lightbox'
  });


  /**
   * Animation on scroll
   */
  window.addEventListener('load', () => {
    AOS.init({
      duration: 1000,
      easing: 'ease-in-out',
      once: true,
      mirror: false
    })
  });

})()









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
/////// PAYMENT PAGE Scripts ///////
////////////////////////////////////












////////////////////////////////////
/////// FEEDBACK PAGE Scripts ///////
////////////////////////////////////










////////////////////////////////////
//////// PROFILE PAGE Scripts ///////
////////////////////////////////////
document.addEventListener("DOMContentLoaded", () => {
    const deleteIcons = document.querySelectorAll(".fa-trash.icon");

    deleteIcons.forEach((icon) => {
        icon.addEventListener("click", () => {
            const confirmation = confirm("Are you sure you want to cancel this reservation?");
            if (confirmation) {
                const reservationId = icon.getAttribute("data-id"); // Get reservation ID
                cancelReservation(reservationId); // Call cancel function
            }
        });
    });

    function cancelReservation(reservationId) {
        fetch('CancelReservation', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `reservationId=${reservationId}`
        })
        .then(response => response.text())
        .then(data => {
            alert(data); // Show response message
            location.reload(); // Reload the page to refresh booking history
        })
        .catch(error => console.error('Error:', error));
    }
});


function openPhotoViewer() {
    const avatar = document.getElementById('avatar');
    const fullImage = document.createElement('img');
    fullImage.src = avatar.src;
    fullImage.style.width = '720px';
    fullImage.style.height = '720px';
    fullImage.style.borderRadius = '10px';

    const modal = document.createElement('div');
    modal.style.position = 'fixed';
    modal.style.top = '0';
    modal.style.left = '0';
    modal.style.width = '100vw';
    modal.style.height = '100vh';
    modal.style.background = 'rgba(0, 0, 0, 0.8)';
    modal.style.display = 'flex';
    modal.style.alignItems = 'center';
    modal.style.justifyContent = 'center';
    modal.style.zIndex = '1000';
    modal.appendChild(fullImage);

    modal.addEventListener('click', () => modal.remove());
    document.body.appendChild(modal);
}

function triggerPhotoUpload() {
    document.getElementById('uploadPhoto').click();
}











////////////////////////////////////
/////// CONTACT US PAGE Scripts /////
////////////////////////////////////
















////////////////////////////////////
//////// ERROR PAGE Scripts /////////
////////////////////////////////////














