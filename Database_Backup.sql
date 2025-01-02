-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2025 at 11:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminsettings`
--

CREATE TABLE `adminsettings` (
  `setting_id` int(11) NOT NULL,
  `carousel_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`carousel_images`)),
  `testimonials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`testimonials`)),
  `gallery_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`gallery_images`)),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminsettings`
--

INSERT INTO `adminsettings` (`setting_id`, `carousel_images`, `testimonials`, `gallery_images`, `updated_at`) VALUES
(1, '[\"image1.jpg\", \"image2.jpg\"]', '[\"Great service!\", \"Loved it!\"]', '[\"gallery1.jpg\", \"gallery2.jpg\"]', '2024-11-26 08:48:25'),
(2, '[\"image3.jpg\", \"image4.jpg\"]', '[\"Amazing experience!\", \"Highly recommended!\"]', '[\"gallery3.jpg\", \"gallery4.jpg\"]', '2024-11-26 08:48:25'),
(3, '[\"image5.jpg\", \"image6.jpg\"]', '[\"Best theater in town!\", \"Excellent seating arrangements!\"]', '[\"gallery5.jpg\", \"gallery6.jpg\"]', '2024-11-26 08:48:25'),
(4, '[\"image7.jpg\", \"image8.jpg\"]', '[\"Affordable prices!\", \"Top-notch sound system!\"]', '[\"gallery7.jpg\", \"gallery8.jpg\"]', '2024-11-26 08:48:25'),
(5, '[\"image9.jpg\", \"image10.jpg\"]', '[\"Loved the ambiance!\", \"Best customer service!\"]', '[\"gallery9.jpg\", \"gallery10.jpg\"]', '2024-11-26 08:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `chatbotmessages`
--

CREATE TABLE `chatbotmessages` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_msg` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbotmessages`
--

INSERT INTO `chatbotmessages` (`message_id`, `user_id`, `last_msg`, `created_at`) VALUES
(1, 1, 'Hello, Dilshan! How are you doing today? Ready to have some fun and plan your next movie experience?', '2024-11-26 08:48:25'),
(2, 2, 'Hi Jane, here are your reservation details.', '2024-11-26 08:48:25'),
(3, 3, 'Alice, your tickets are ready for collection.', '2024-11-26 08:48:25'),
(4, 4, 'Bob, your payment is pending.', '2024-11-26 08:48:25'),
(5, 5, 'Emma, your feedback has been submitted.', '2024-11-26 08:48:25'),
(6, 1, 'Hello, Dilshan! How are you doing today? Ready to have some fun and plan your next movie experience?', '2024-12-14 19:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `rating`, `description`, `created_at`) VALUES
(1, 1, 5, 'Amazing experience, highly recommend!', '2024-11-26 08:48:25'),
(2, 2, 4, 'Good movie, but the seats were uncomfortable.', '2024-11-26 08:48:25'),
(3, 3, 3, 'Average, could be better.', '2024-11-26 08:48:25'),
(4, 4, 5, 'Loved it! Great sound and visuals.', '2024-11-26 08:48:25'),
(5, 5, 2, 'Disappointed with the service.', '2024-11-26 08:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `Id` int(11) NOT NULL,
  `Image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`Id`, `Image`) VALUES
(1, 'assets/img/gallery/kids.jpg'),
(2, 'assets/img/gallery/gold-hall.jpg'),
(3, 'assets/img/gallery/blue-hall.jpg'),
(4, 'assets/img/gallery/family.jpg'),
(5, 'assets/img/gallery/couple.jpg'),
(6, 'assets/img/gallery/shops.jpg'),
(7, 'assets/img/gallery/wall.jpg'),
(8, 'assets/img/gallery/friends.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `inquiry_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`inquiry_id`, `name`, `email`, `message`, `created_at`, `title`) VALUES
(1, 'Alice', 'alice@example.com', 'What are the show timings for Avengers?', '2024-11-26 08:48:25', 'Inquiry about show timings'),
(2, 'Bob', 'bob@example.com', 'How can I cancel my reservation?', '2024-11-26 08:48:25', 'Cancellation request'),
(3, 'Charlie', 'charlie@example.com', 'Is there a discount for students?', '2024-11-26 08:48:25', 'Student discount inquiry'),
(4, 'Diana', 'diana@example.com', 'Are pets allowed in the theater?', '2024-11-26 08:48:25', 'Pet policy inquiry'),
(5, 'Eve', 'eve@example.com', 'Can I book seats for a group?', '2024-11-26 08:48:25', 'Group booking inquiry');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  `status` enum('Now Showing','Coming Soon') DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `description`, `trailer_url`, `poster_url`, `status`, `release_date`, `duration`, `created_at`) VALUES
(1, 'Gladiator II', 'A historical action sequel focusing on Lucius\'s journey from exile to gladiatorial combat, facing Roman corruption.', 'https://youtu.be/example', 'assets/img/movies/streaming/gladiator2.jpg', 'Now Showing', '2024-11-22', 180, '2024-11-26 08:48:25'),
(2, 'Pushpa 2: The Rule', 'A thrilling action-drama about Pushpa\'s resurgence in the underworld while facing personal and political challenges.', 'https://youtu.be/example2', 'assets/img/movies/streaming/pushpa2.jpg', 'Now Showing', '2024-08-15', 192, '2024-11-26 08:48:25'),
(3, 'Interstellar', 'A sci-fi epic about a group of explorers traveling through a wormhole to save humanity.', 'https://youtu.be/zSWdZVtXT7E', 'assets/img/movies/streaming/interstellar.jpg', 'Now Showing', '2014-11-07', 175, '2024-11-26 08:48:25'),
(4, 'The Wild Robot', 'After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the island\'s animals and cares for an orphaned baby goose.', 'https://youtu.be/7ZxKfmiU6zw', 'assets/img/movies/streaming/robot.jpg', 'Now Showing', '2010-10-01', 122, '2024-11-26 08:48:25'),
(5, 'Venom: The Last Dance', 'Eddie Brock and Venom must make a devastating decision as they\'re pursued by a mysterious military man and alien monsters from Venom\'s home world.', 'https://youtu.be/example3', 'assets/img/movies/streaming/venom3.jpg', 'Now Showing', '2024-07-12', 155, '2024-11-26 08:48:25'),
(6, 'Werewolves', 'A chilling horror-thriller about mysterious werewolf sightings in a remote town.', 'https://youtu.be/example4', 'assets/img/movies/streaming/werewolves.jpg', 'Now Showing', '2024-10-31', 110, '2024-12-13 01:56:55'),
(7, 'Wicked', 'A magical retelling of the witches of Oz and their untold stories.', 'https://youtu.be/example5', 'assets/img/movies/streaming/wicked.jpg', 'Now Showing', '2024-12-25', 135, '2024-12-13 01:56:55'),
(8, 'Y2K', 'A thrilling disaster film about a global tech crisis at the turn of the millennium.', 'https://youtu.be/example6', 'assets/img/movies/streaming/y2k.jpg', 'Now Showing', '2024-06-21', 130, '2024-12-13 01:56:55'),
(9, 'Avatar: Fire And Ash', 'A return to Pandora explores new oceans and cultures in a stunning sci-fi adventure.', 'https://youtu.be/d9MyW72ELq0', 'assets/img/movies/coming/avatar.png', 'Coming Soon', '2024-12-20', 192, '2024-12-13 01:56:55'),
(10, 'How to Train Your Dragon', 'Follows a young Viking as he aspires to hunt dragons, and how he unexpectedly becomes a friend of a young dragon.', 'https://youtu.be/example7', 'assets/img/movies/coming/dragon.jpg', 'Coming Soon', '2024-09-14', 145, '2024-12-13 01:56:55'),
(11, 'Fast X: Part 2', 'The epic continuation of the Fast & Furious saga with high-octane action.', 'https://youtu.be/example8', 'assets/img/movies/coming/fastx2.jpg', 'Coming Soon', '2025-04-04', 160, '2024-12-13 01:56:55'),
(12, 'Mufasa: The Lion King', 'Mufasa, a cub lost and alone, meets a sympathetic lion named Taka, the heir to a royal bloodline. The chance meeting sets in motion an expansive journey of a group of misfits searching for their destiny.', 'https://youtu.be/example9', 'assets/img/movies/coming/lionking.jpg', 'Coming Soon', '2024-07-19', 118, '2024-12-13 01:56:55'),
(14, 'Superman: Legacy', 'A fresh take on the legendary superhero, exploring his origins and purpose.', 'https://youtu.be/example11', 'assets/img/movies/coming/superman.jpg', 'Coming Soon', '2025-07-11', 150, '2024-12-13 01:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` varchar(50) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('Credit Card','Debit Card','Cash','PayPal') DEFAULT NULL,
  `payment_status` enum('Pending','Completed','Failed','approved') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `reservation_id`, `amount`, `payment_method`, `payment_status`, `created_at`) VALUES
('1', 1, 15.00, 'Credit Card', 'Completed', '2024-11-26 08:48:25'),
('1735779740', 1735779740, 12.00, 'PayPal', 'Pending', '2025-01-02 01:02:20'),
('1735780482', 1735780482, 8.00, 'PayPal', 'Pending', '2025-01-02 01:14:42'),
('1735780969', 1735780969, 8.00, 'PayPal', 'Pending', '2025-01-02 01:22:49'),
('1735781122', 1735781122, 12.00, 'PayPal', 'Pending', '2025-01-02 01:25:22'),
('1735781404', 1735781404, 16.00, 'PayPal', 'Pending', '2025-01-02 01:30:04'),
('2', 2, 20.00, 'Debit Card', 'Completed', '2024-11-26 08:48:25'),
('3', 3, 25.00, 'Cash', 'Completed', '2024-11-26 08:48:25'),
('4', 4, 18.00, 'Credit Card', 'Pending', '2024-11-26 08:48:25'),
('5', 5, 22.00, 'Debit Card', 'Failed', '2024-11-26 08:48:25'),
('PAYID-M527CMQ79N595577Y9579540', 1735782702, 8.00, 'PayPal', 'approved', '2025-01-02 01:51:46'),
('PAYID-M527HDY3SE01290WY8596632', 1735783306, 12.00, 'PayPal', 'approved', '2025-01-02 02:01:51'),
('PAYID-M53EKCA5JE711360L561612B', 1735804162, 16.00, 'PayPal', 'approved', '2025-01-02 07:49:27'),
('PAYID-M53FDTY01270437KU160043S', 1735807434, 24.00, 'PayPal', 'approved', '2025-01-02 08:43:58'),
('PAYID-M53GD5I3XW2577881627941A', 1735811568, 8.00, 'PayPal', 'Pending', '2025-01-02 09:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `seat_numbers` varchar(255) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `user_id`, `movie_id`, `theater_id`, `reservation_date`, `seat_numbers`, `total_price`, `created_at`) VALUES
(1, 1, 1, 1, '2024-11-30', 'A1,A2', 15.00, '2024-11-26 08:48:25'),
(2, 2, 2, 2, '2024-12-20', 'B1,B2', 20.00, '2024-11-26 08:48:25'),
(3, 3, 3, 3, '2024-11-28', 'C1,C2', 25.00, '2024-11-26 08:48:25'),
(4, 4, 4, 4, '2024-11-29', 'D1,D2', 18.00, '2024-11-26 08:48:25'),
(5, 5, 5, 5, '2024-12-01', 'E1,E2', 22.00, '2024-11-26 08:48:25'),
(1735779125, 1, 2, 3, '2025-01-02', 'R1S9', 12.00, '2025-01-02 00:52:05'),
(1735779439, 1, 3, 3, '2025-01-02', 'R2S9', 12.00, '2025-01-02 00:57:19'),
(1735779532, 1, 4, 2, '2025-01-02', 'R1S14, R5S14', 20.00, '2025-01-02 00:58:52'),
(1735779740, 1, 5, 3, '2025-01-02', 'R2S9', 12.00, '2025-01-02 01:02:20'),
(1735780482, 1, 10, 2, '2025-01-02', 'R5S12', 8.00, '2025-01-02 01:14:42'),
(1735780969, 1, 12, 3, '2025-01-02', 'R4S11', 8.00, '2025-01-02 01:22:49'),
(1735781122, 1, 6, 3, '2025-01-02', 'R1S10', 12.00, '2025-01-02 01:25:22'),
(1735781404, 1, 11, 3, '2025-01-02', 'R4S10, R4S11', 16.00, '2025-01-02 01:30:04'),
(1735782702, 1, 8, 2, '2025-01-02', 'R5S13', 8.00, '2025-01-02 01:51:42'),
(1735783306, 1, 9, 3, '2025-01-02', 'R1S10', 12.00, '2025-01-02 02:01:47'),
(1735804162, 1, 14, 3, '2025-01-02', 'R4S8, R5S8', 16.00, '2025-01-02 07:49:22'),
(1735807434, 1, 1, 3, '2025-01-02', 'R2S9, R2S10', 24.00, '2025-01-02 08:43:54'),
(1735811568, 1, 1, 3, '2025-01-02', 'R4S11', 8.00, '2025-01-02 09:52:48');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `is_reserved` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `theater_id`, `seat_number`, `is_reserved`) VALUES
(1, 1, 'A1', 1),
(2, 1, 'A2', 1),
(3, 1, 'A3', 0),
(4, 2, 'B1', 1),
(5, 2, 'B2', 1),
(6, 2, 'B3', 0),
(7, 3, 'C1', 1),
(8, 3, 'C2', 1),
(9, 3, 'C3', 0),
(10, 4, 'D1', 1),
(11, 4, 'D2', 0),
(12, 5, 'E1', 1),
(13, 5, 'E2', 1),
(14, 5, 'E3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `subscription_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`subscription_id`, `email`, `created_at`) VALUES
(1, 'subscriber1@example.com', '2024-11-26 08:48:25'),
(2, 'subscriber2@example.com', '2024-11-26 08:48:25'),
(3, 'subscriber3@example.com', '2024-11-26 08:48:25'),
(4, 'subscriber4@example.com', '2024-11-26 08:48:25'),
(5, 'subscriber5@example.com', '2024-11-26 08:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Occupation` varchar(100) DEFAULT NULL,
  `Quote` text NOT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`Id`, `Name`, `Occupation`, `Quote`, `Image`) VALUES
(1, 'Kasun Perera', 'Movie Enthusiast', 'ABC CINEMA offers a truly immersive movie experience with state-of-the-art facilities. Highly recommend it!', 'assets/img/testimonials/testimonials-2.jpg'),
(2, 'Ashen Silva', 'Frequent Visitor', 'The seats are so comfortable, and the sound system is outstanding. My family loves coming here!', 'assets/img/testimonials/testimonials-1.jpg'),
(3, 'Nadini Wijesinghe', 'College Student', 'ABC CINEMA is the perfect place to hang out with friends! The screens are huge, and the snacks are so tasty. I can\'t wait for my next movie night!', 'assets/img/testimonials/testimonials-3.jpg'),
(4, 'Ravindu Fernando', 'Young Professional', 'Watching movies at ABC CINEMA is an epic experience. The 3D visuals are unreal, and the sound quality makes you feel like you\'re in the movie. It\'s my favorite spot!', 'assets/img/testimonials/testimonials-5.jpg'),
(5, 'Emily Carter', 'Tourist', 'I was visiting Sri Lanka and stumbled upon ABC CINEMA. It’s one of the best movie theaters I’ve ever been to—clean, modern, and with amazing service. A must-visit for any movie lover!', 'assets/img/testimonials/testimonials-4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `theater_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `seating_capacity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`theater_id`, `name`, `location`, `seating_capacity`, `created_at`, `image_url`) VALUES
(1, 'Downtown Cinema', '123 Main St', 200, '2024-11-26 08:48:25', 'assets/img/theaters/theater1.jpg'),
(2, 'City Mall Cineplex', '456 Mall Rd', 300, '2024-11-26 08:48:25', 'assets/img/theaters/theater2.jpg'),
(3, 'Starlight Theater', '789 Elm St', 250, '2024-11-26 08:48:25', 'assets/img/theaters/theater3.jpg'),
(4, 'Regal Cinema', '101 Pine St', 150, '2024-11-26 08:48:25', 'assets/img/theaters/theater4.jpg'),
(5, 'Grand Plaza Multiplex', '202 Oak Ave', 400, '2024-11-26 08:48:25', 'assets/img/theaters/theater5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `phone`, `password`, `profile_photo`, `created_at`, `updated_at`) VALUES
(1, 'Dilshan Irugal', 'dilshaniru@gmail.com', '0710103793', 'password123', 'assets/img/users/user1.jpg', '2024-11-26 08:48:25', '2025-01-02 08:10:00'),
(2, 'Jane Smith', 'jane.smith@example.com', '0987654321', 'password456', 'assets/img/users/user2.jpg', '2024-11-26 08:48:25', '2024-12-15 21:28:35'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '1112223333', 'password789', 'assets/img/users/user3.jpg', '2024-11-26 08:48:25', '2024-12-15 21:28:46'),
(4, 'Bob Brown', 'bob.brown@example.com', '4445556666', 'password000', 'assets/img/users/user4.jpg', '2024-11-26 08:48:25', '2024-12-15 21:28:58'),
(5, 'Emma Wilson', 'emma.wilson@example.com', '7778889999', 'password111', 'assets/img/users/user5.jpg', '2024-11-26 08:48:25', '2024-12-15 21:29:08'),
(6, 'Kasun Kalhara', 'kasunkalhara@gmail.com', NULL, '123', NULL, '2025-01-02 04:05:31', '2025-01-02 04:05:31'),
(7, 'Rumesh', 'rumesh@gmail.com', '0895678423', '123123123', NULL, '2025-01-02 04:39:52', '2025-01-02 04:39:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminsettings`
--
ALTER TABLE `adminsettings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `chatbotmessages`
--
ALTER TABLE `chatbotmessages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`inquiry_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_reservation` (`reservation_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`theater_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbotmessages`
--
ALTER TABLE `chatbotmessages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbotmessages`
--
ALTER TABLE `chatbotmessages`
  ADD CONSTRAINT `chatbotmessages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
