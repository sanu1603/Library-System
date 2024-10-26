-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:4306
-- Generation Time: Oct 07, 2024 at 08:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `book_name` varchar(250) NOT NULL,
  `isbnno` varchar(250) NOT NULL,
  `author` varchar(250) NOT NULL,
  `publisher` varchar(250) NOT NULL,
  `price` varchar(250) NOT NULL,
  `quantity` varchar(250) NOT NULL,
  `place` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `availability` tinyint(4) NOT NULL COMMENT '1=available, 0=not available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `book_name`, `isbnno`, `author`, `publisher`, `price`, `quantity`, `place`, `category`, `availability`, `created_at`) VALUES
(1, 'Ender\\\'s Game', '9780765394866', 'Orson Scott Card', 'Tor Publishing Group', '999', '5', 'Main Branch', 'Science Fiction', 1, '2024-10-07 05:49:14'),
(2, 'The Great Gatsby', '9780743273565', 'F. Scott Fitzgerald', 'Scribner', '576', '5', 'East Wing', 'Fiction', 1, '2024-10-07 06:31:52'),
(3, 'To Kill a Mockingbird', '9780060935467', 'Harper Lee', 'Harper Perennial', '759', '5', 'East Wing', 'Fiction', 1, '2024-10-07 06:32:06'),
(4, 'Sapiens: A Brief History of Humankind', '9780062316097', 'Yuval Noah Harari', 'Harper', '418', '5', 'west wing', 'Non-Fiction', 0, '2024-10-07 06:25:16'),
(5, 'Educated', '9780399590504', 'Tara Westover', 'Random House', '1210', '5', 'west wing', 'Non-Fiction', 0, '2024-10-07 06:25:16'),
(6, 'The Innovators', '9781476708690', 'Walter Isaacson', 'Simon & Schuster', '1000', '5', 'Main Branch', 'Science & Technology', 0, '2024-10-07 06:26:18'),
(7, 'Astrophysics for People in a Hurry', '9780393609394', 'Neil deGrasse Tyson', 'W. W. Norton & Company', '350', '5', 'Main Branch', 'Science & Technology', 0, '2024-10-07 06:26:18'),
(8, 'Harry Potter and the Sorcerer\'s Stone', '9780590353427', 'J.K. Rowling', 'Scholastic', '1024', '5', 'Children\'s Section', 'Children\'s Books', 0, '2024-10-07 06:27:25'),
(9, 'The Very Hungry Caterpillar', '9780399226908', 'Eric Carle', 'Penguin Group', '750', '5', 'Children\'s Section', 'Children\'s Books', 0, '2024-10-07 06:27:25'),
(10, 'Gone Girl', '9780307588371', 'Gillian Flynn', 'Crown Publishing Group', '500', '5', 'Reference Section', 'Mystery & Thriller', 0, '2024-10-07 06:28:45'),
(11, 'The Girl with the Dragon Tattoo', '9780307454546', 'Stieg Larsson', 'Knopf', '699', '5', 'Reference Section', 'Mystery & Thriller', 0, '2024-10-07 06:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active, 0=inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `status`, `created_at`) VALUES
(1, 'Science Fiction', 1, '2024-10-07 05:23:56'),
(2, 'Fiction', 1, '2024-10-07 05:26:29'),
(3, 'Non-Fiction', 1, '2024-10-07 05:26:29'),
(4, 'Science & Technology', 1, '2024-10-07 05:26:29'),
(5, 'Arts & Literature', 1, '2024-10-07 05:26:29'),
(6, 'Children Books', 1, '2024-10-07 05:26:29'),
(7, 'Educational', 1, '2024-10-07 05:26:29'),
(8, 'Mystery & Thriller', 1, '2024-10-07 05:26:29'),
(9, 'Romance', 1, '2024-10-07 05:26:29'),
(10, 'Fantasy & Science Fiction', 1, '2024-10-07 05:26:29'),
(11, 'Reference', 1, '2024-10-07 05:26:29'),
(12, 'Historical', 1, '2024-10-07 05:26:29'),
(13, 'Biographies & Memoirs', 1, '2024-10-07 05:26:29'),
(14, 'Comics & Graphic Novels', 1, '2024-10-07 05:26:29'),
(15, 'Philosophy & Religion', 1, '2024-10-07 05:26:29'),
(16, 'Magazines & Journals', 1, '2024-10-07 05:26:29'),
(17, 'Travel & Geography', 1, '2024-10-07 05:26:29'),
(18, 'Health & Wellness', 1, '2024-10-07 05:26:29');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `issue_date` varchar(250) NOT NULL,
  `due_date` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT '0' COMMENT '3=request sent, 1=accept, 2=reject',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active, 0=inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `status`, `created_at`) VALUES
(1, 'Main Branch', 1, '2024-10-07 05:29:56'),
(2, 'East Wing', 1, '2024-10-07 05:29:56'),
(3, 'West Wing', 1, '2024-10-07 05:29:56'),
(4, 'Reference Section', 1, '2024-10-07 05:29:56'),
(5, 'Children\'s Section', 1, '2024-10-07 05:29:56'),
(6, 'Young Adult Section', 1, '2024-10-07 05:29:56'),
(7, 'Periodicals Area', 1, '2024-10-07 05:29:56'),
(8, 'Computer Lab', 1, '2024-10-07 05:29:56'),
(9, 'Digital Archives', 1, '2024-10-07 05:29:56'),
(10, 'History Room', 1, '2024-10-07 05:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `returned`
--

CREATE TABLE `returned` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `return_date` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returned`
--

INSERT INTO `returned` (`id`, `book_id`, `user_id`, `user_name`, `return_date`, `created_at`) VALUES
(1, 1, 2, 'Sanika', '2024-10-07', '2024-10-07 05:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `emailid` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` tinyint(4) NOT NULL COMMENT '1=admin, 2=user',
  `status` tinyint(4) NOT NULL COMMENT '1=active, 0=inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `emailid`, `password`, `role`, `status`, `created_at`) VALUES
(2, 'Sanika', '2110067@ritindia.edu', '827ccb0eea8a706c4c34a16891f84e7b', 2, 1, '2024-10-07 06:35:19'),
(3, 'Pooja', '2108022@ritindia.edu', '827ccb0eea8a706c4c34a16891f84e7b', 1, 1, '2024-10-07 06:34:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returned`
--
ALTER TABLE `returned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `returned`
--
ALTER TABLE `returned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
