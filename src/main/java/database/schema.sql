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



-- INSERT DUMMY DATA

-- Insert dummy data into Users table
INSERT INTO Users (user_id, name, email, phone, password, profile_photo) VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', 'password123', 'john.jpg'),
(2, 'Jane Smith', 'jane.smith@example.com', '0987654321', 'password456', 'jane.jpg'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '1112223333', 'password789', 'alice.jpg'),
(4, 'Bob Brown', 'bob.brown@example.com', '4445556666', 'password000', 'bob.jpg'),
(5, 'Emma Wilson', 'emma.wilson@example.com', '7778889999', 'password111', 'emma.jpg');

-- Insert dummy data into Movies table
INSERT INTO Movies (movie_id, title, description, trailer_url, poster_url, status, release_date, duration) VALUES
(1, 'Avengers: Endgame', 'Superhero team battles to save the universe.', 'https://youtube.com/trailer1', 'poster1.jpg', 'Now Showing', '2019-04-26', 180),
(2, 'Avatar: The Way of Water', 'Explore the next chapter of Pandora.', 'https://youtube.com/trailer2', 'poster2.jpg', 'Coming Soon', '2024-12-16', 192),
(3, 'The Batman', "A gritty tale of Gotham\'s dark knight.", 'https://youtube.com/trailer3', 'poster3.jpg', 'Now Showing', '2022-03-04', 175),
(4, 'Joker', 'The origin story of a legendary villain.', 'https://youtube.com/trailer4', 'poster4.jpg', 'Now Showing', '2019-10-04', 122),
(5, 'Dune', 'A journey to the desert planet of Arrakis.', 'https://youtube.com/trailer5', 'poster5.jpg', 'Coming Soon', '2024-12-18', 155);

-- Insert dummy data into Theaters table
INSERT INTO Theaters (theater_id, name, location, seating_capacity) VALUES
(1, 'Downtown Cinema', '123 Main St', 200),
(2, 'City Mall Cineplex', '456 Mall Rd', 300),
(3, 'Starlight Theater', '789 Elm St', 250),
(4, 'Regal Cinema', '101 Pine St', 150),
(5, 'Grand Plaza Multiplex', '202 Oak Ave', 400);

-- Insert dummy data into Reservations table
INSERT INTO Reservations (reservation_id, user_id, movie_id, theater_id, reservation_date, seat_numbers, total_price) VALUES
(1, 1, 1, 1, '2024-11-30', 'A1,A2', 15.00),
(2, 2, 2, 2, '2024-12-20', 'B1,B2', 20.00),
(3, 3, 3, 3, '2024-11-28', 'C1,C2', 25.00),
(4, 4, 4, 4, '2024-11-29', 'D1,D2', 18.00),
(5, 5, 5, 5, '2024-12-01', 'E1,E2', 22.00);

-- Insert dummy data into Seats table
INSERT INTO Seats (seat_id, theater_id, seat_number, is_reserved) VALUES
(1, 1, 'A1', TRUE),
(2, 1, 'A2', TRUE),
(3, 1, 'A3', FALSE),
(4, 2, 'B1', TRUE),
(5, 2, 'B2', TRUE),
(6, 2, 'B3', FALSE),
(7, 3, 'C1', TRUE),
(8, 3, 'C2', TRUE),
(9, 3, 'C3', FALSE),
(10, 4, 'D1', TRUE),
(11, 4, 'D2', FALSE),
(12, 5, 'E1', TRUE),
(13, 5, 'E2', TRUE),
(14, 5, 'E3', FALSE);

-- Insert dummy data into Payments table
INSERT INTO Payments (payment_id, reservation_id, amount, payment_method, payment_status) VALUES
(1, 1, 15.00, 'Credit Card', 'Completed'),
(2, 2, 20.00, 'Debit Card', 'Completed'),
(3, 3, 25.00, 'Cash', 'Completed'),
(4, 4, 18.00, 'Credit Card', 'Pending'),
(5, 5, 22.00, 'Debit Card', 'Failed');

-- Insert dummy data into Feedback table
INSERT INTO Feedback (feedback_id, user_id, rating, description) VALUES
(1, 1, 5, 'Amazing experience, highly recommend!'),
(2, 2, 4, 'Good movie, but the seats were uncomfortable.'),
(3, 3, 3, 'Average, could be better.'),
(4, 4, 5, 'Loved it! Great sound and visuals.'),
(5, 5, 2, 'Disappointed with the service.');

-- Insert dummy data into ChatbotMessages table
INSERT INTO ChatbotMessages (message_id, user_id, bot_response) VALUES
(1, 1, 'Hello John, how can I assist you today?'),
(2, 2, 'Hi Jane, here are your reservation details.'),
(3, 3, 'Alice, your tickets are ready for collection.'),
(4, 4, 'Bob, your payment is pending.'),
(5, 5, 'Emma, your feedback has been submitted.');

-- Insert dummy data into Inquiries table
INSERT INTO Inquiries (inquiry_id, name, email, message) VALUES
(1, 'Alice', 'alice@example.com', 'What are the show timings for Avengers?'),
(2, 'Bob', 'bob@example.com', 'How can I cancel my reservation?'),
(3, 'Charlie', 'charlie@example.com', 'Is there a discount for students?'),
(4, 'Diana', 'diana@example.com', 'Are pets allowed in the theater?'),
(5, 'Eve', 'eve@example.com', 'Can I book seats for a group?');

-- Insert dummy data into AdminSettings table
INSERT INTO AdminSettings (setting_id, carousel_images, testimonials, gallery_images) VALUES
(1, '[\"image1.jpg\", \"image2.jpg\"]', '[\"Great service!\", \"Loved it!\"]', '[\"gallery1.jpg\", \"gallery2.jpg\"]'),
(2, '[\"image3.jpg\", \"image4.jpg\"]', '[\"Amazing experience!\", \"Highly recommended!\"]', '[\"gallery3.jpg\", \"gallery4.jpg\"]'),
(3, '[\"image5.jpg\", \"image6.jpg\"]', '[\"Best theater in town!\", \"Excellent seating arrangements!\"]', '[\"gallery5.jpg\", \"gallery6.jpg\"]'),
(4, '[\"image7.jpg\", \"image8.jpg\"]', '[\"Affordable prices!\", \"Top-notch sound system!\"]', '[\"gallery7.jpg\", \"gallery8.jpg\"]'),
(5, '[\"image9.jpg\", \"image10.jpg\"]', '[\"Loved the ambiance!\", \"Best customer service!\"]', '[\"gallery9.jpg\", \"gallery10.jpg\"]');

-- Insert dummy data into NewsletterSubscriptions table
INSERT INTO NewsletterSubscriptions (subscription_id, email) VALUES
(1, 'subscriber1@example.com'),
(2, 'subscriber2@example.com'),
(3, 'subscriber3@example.com'),
(4, 'subscriber4@example.com'),
(5, 'subscriber5@example.com');
