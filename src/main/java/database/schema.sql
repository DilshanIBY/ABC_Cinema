-- CREATE DATABASE TABLES

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(15),
    password VARCHAR(255),
    profile_photo VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    trailer_url VARCHAR(255),
    poster_url VARCHAR(255),
    status ENUM('Now Showing', 'Coming Soon'),
    release_date DATE,
    duration INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    seating_capacity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    theater_id INT,
    reservation_date DATE,
    seat_numbers VARCHAR(255),
    total_price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

CREATE TABLE Seats (
    seat_id INT PRIMARY KEY,
    theater_id INT,
    seat_number VARCHAR(10),
    is_reserved BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    reservation_id INT,
    amount DECIMAL(10, 2),
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash'),
    payment_status ENUM('Pending', 'Completed', 'Failed'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    user_id INT,
    rating INT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE ChatbotMessages (
    message_id INT PRIMARY KEY,
    user_id INT,
    bot_response TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Inquiries (
    inquiry_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE AdminSettings (
    setting_id INT PRIMARY KEY,
    carousel_images JSON,
    testimonials JSON,
    gallery_images JSON,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE NewsletterSubscriptions (
    subscription_id INT PRIMARY KEY,
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);