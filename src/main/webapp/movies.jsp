<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.css" rel="stylesheet">
    <style>
        :root {
            --gold: #cda45e;
            --chocolate: #0c0b09;
            --oil: #1a1814;
            --black: #000000;
        }
* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        body {
            background-color: var(--black);
            color: white;
        }
         /* Header Styles */
        header {
            background: linear-gradient(-50deg, #cda45e, #0c0b09, #1a1814, #ffcc00, #000000);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: white;
            padding: 2rem;
            text-align: center;
            height: 500px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        header * {
            position: relative;
            z-index: 2;
        }

        .logo {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #ffffff;
            font-weight: bold;
            text-shadow: 0 0 10px rgba(0,0,0,0.5);
        }

        /* Navigation Styles */
        nav {
            background: rgba(0, 0, 0, 0.9);
            padding: 1rem;
            position: sticky;
            top: 0;
            z-index: 100;
            backdrop-filter: blur(10px);
        }

        nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
            gap: 2rem;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
            padding: 0.5rem 1rem;
            border-radius: 20px;
        }

        nav a:hover {
            background: rgba(255,255,255,0.1);
            color: #e1ad21;
        }

        .section-title {
            color: var(--gold);
            text-align: center;
            padding: 2rem 0;
            font-size: 2.5rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .swiper {
            width: 100%;
            padding: 2rem 1rem;
        }

        .movie-card {
            background: rgba(255,255,255,0.05);
            border-radius: 15px;
            overflow: hidden;
            height: 500px;
            transition: transform 0.3s;
        }

        .movie-card:hover {
            transform: translateY(-10px);
        }

        .movie-image {
            width: 100%;
            height: 350px;
            object-fit: cover;
        }

        .movie-info {
            padding: 1rem;
            background: linear-gradient(to top, var(--chocolate), var(--oil));
        }

        .movie-title {
            color: var(--gold);
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
        }

        .movie-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            color: #fff;
            font-size: 0.9rem;
        }

        .book-btn {
            width: 100%;
            padding: 0.5rem;
            background: var(--gold);
            border: none;
            border-radius: 25px;
            color: var(--black);
            font-weight: bold;
            transition: all 0.3s;
        }

        .book-btn:hover {
            background: #ddb76e;
            transform: scale(1.05);
        }

        .swiper-button-next,
        .swiper-button-prev {
            color: var(--gold) !important;
        }

        .swiper-pagination-bullet {
            background: var(--gold) !important;
        }

        .movies-container {
            padding: 2rem 0;
            background: linear-gradient(180deg, var(--black) 0%, var(--oil) 100%);
        }
         /* Footer Styles */
        footer {
            background: linear-gradient(-45deg, #1a1a1a, #2a2a2a);
            color: white;
            padding: 3rem 2rem;
            text-align: justify;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 3rem;
        }

        .footer-section h3 {
            color:#cda45e ;
            margin-bottom: 1.5rem;
            font-size: 1.3rem;
            
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section li {
            margin-bottom: 0.8rem;
        }

        .footer-section a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-section a:hover {
            color:#cda45e ;
        }
        

        /* Responsive Design */
        @media (max-width: 768px) {
            .footer-content {
                grid-template-columns: 1fr;
            }

            nav ul {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .logo {
                font-size: 3rem;
            }

            .swiper-slide {
                width: 300px;
            }
        }
       
    </style>
</head>
<body>
     <!-- Header Section -->
    <header>
        <div class="logo">ABC CINEMA</div>
        <h1>Experience Magic on the Big Screen</h1>
    </header>

    <!-- Navigation -->
    <nav>
        <ul>
            <li><a href="#NOW SHOWING">Now Showing</a></li>
            <li><a href="#COMING SOON">Upcoming</a></li>
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>
    <div class="movies-container">
        <!-- Now Showing Section -->
        <section>
            <h2 class="section-title">Now Showing</h2>
            <div class="swiper nowShowingSwiper">
                <div class="swiper-wrapper">
                    <!-- Movie 1 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/M1.jpg" alt="AMARAN" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">AMARAN</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">?????</span>
                                    <span class="movie-date">Showing Now</span>
                                </div>
                                <button class="book-btn">Book Now</button>
                            </div>
                        </div>
                    </div>
                    <!-- Movie 2 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/M2.jpg" alt="MANDHARA" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">MANDHARA</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">?????</span>
                                    <span class="movie-date">Showing Now</span>
                                </div>
                                <button class="book-btn">Book Now</button>
                            </div>
                        </div>
                    </div>
                    <!-- Movie 3 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/M3.jpeg" alt="SMILE2" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">SMILE2</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">?????</span>
                                    <span class="movie-date">Showing Now</span>
                                </div>
                                <button class="book-btn">Book Now</button>
                            </div>
                        </div>
                    </div>
                    <!-- Movie 4 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/M4.jpeg" alt="VENOM" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">VENOM</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">?????</span>
                                    <span class="movie-date">Showing Now</span>
                                </div>
                                <button class="book-btn">Book Now</button>
                            </div>
                        </div>
                    </div>
                     <!-- Movie 5 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/M4.jpeg" alt="VENOM" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">VENOM</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">?????</span>
                                    <span class="movie-date">Showing Now</span>
                                </div>
                                <button class="book-btn">Book Now</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>

        <!-- Coming Soon Section -->
        <section>
            <h2 class="section-title">Coming Soon</h2>
            <div class="swiper upcomingSwiper">
                <div class="swiper-wrapper">
                    <!-- Upcoming Movie 1 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/UM1.jpg" alt="Dune: Part Two" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">Fast X: Part Two</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">Coming Soon</span>
                                    <span class="movie-date">March 15, 2024</span>
                                </div>
                                <button class="book-btn">Notify Me</button>
                            </div>
                        </div>
                    </div>
                    <!-- Upcoming Movie 2 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/UM2.jpeg" alt="The Matrix Returns" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">Solo Town</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">Coming Soon</span>
                                    <span class="movie-date">April 1, 2024</span>
                                </div>
                                <button class="book-btn">Notify Me</button>
                            </div>
                        </div>
                    </div>
                    <!-- Upcoming Movie 3 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/UM3.jpg" alt="Avengers: Secret Wars" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">Moana 2</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">Coming Soon</span>
                                    <span class="movie-date">April 15, 2024</span>
                                </div>
                                <button class="book-btn">Notify Me</button>
                            </div>
                        </div>
                    </div>
                    <!-- Upcoming Movie 4 -->
                    <div class="swiper-slide">
                        <div class="movie-card">
                            <img src="assets/img/UM4.jpeg" alt="Deadpool 3" class="movie-image">
                            <div class="movie-info">
                                <h3 class="movie-title">Sonic 3</h3>
                                <div class="movie-meta">
                                    <span class="movie-rating">Coming Soon</span>
                                    <span class="movie-date">May 1, 2024</span>
                                </div>
                                <button class="book-btn">Notify Me</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
    </div>
    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Contact Us</h3>
                <ul>
                    <li>Phone: (123) 456-7890</li>
                    <li>Email: info@abccinema.com</li>
                    <li>Address: 123 Movie Street</li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#now-showing">Now Showing</a></li>
                    <li><a href="#upcoming">Coming Soon</a></li>
                    <li><a href="#about">About Us</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Follow</h3>
                <ul>
                    <li><a href="#">FaceBook</a></li>
                    <li><a href="#">Instergrame</a></li>
                    <li><a href="#">Twiter</a></li>
                </ul>
            </div>
        </div>
        <p style="margin-top: 2rem;"><center>&copy; 2024 ABC CINEMA. All rights reserved.</center></p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.js"></script>
    <script>
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
    </script>
</body>
</html>