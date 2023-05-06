-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2023 at 08:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `typecode` varchar(15) NOT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `title`, `typecode`, `Description`) VALUES
(1, 'Quần áo', 'quan_ao_1', 'Các sản phẩm liên quan đến quần áo'),
(2, 'Gia dụng', 'gia_dung_1', 'Các sản phẩm gia dụng'),
(3, 'Nội thất', 'noi_that', 'Các sản phẩm nội thất gia dụng');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Type_category` int(11) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `img` varchar(200) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `expried_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `Name`, `Type_category`, `Description`, `created_by`, `created_at`, `updated_at`, `img`, `price`, `expried_at`) VALUES
(2, 'Truyện tranh Doreamonascasc', 3, '                      axaxAS                                                                                                                                                                            ', 10, '2023-04-11 10:18:32', '2023-05-04 22:26:59', 'product-1683213028.jpg', 12000, '2140-08-01 00:00:00'),
(3, 'Cô giang xinh gái', 2, '                                                                     ascascascascasc                                                  ', 9, '2023-04-14 15:25:18', '2023-05-04 22:11:11', 'product-1683213054.jpg', 1000000, '2024-10-09 01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `first_name`, `last_name`, `password`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Khoa', 'Trần Đỗ Anh', '12345', 'trandoanhkhoa192837@gmail.com', '2023-04-04 16:53:06', '2023-04-04 16:53:06'),
(7, 'Linh', 'Nguyễn Khánh ', 'd41d8cd98f00b204e9800998ecf8427e', 'khanhlinh1608@gmail.com', '2023-04-06 23:00:48', '2023-04-06 23:00:48'),
(9, 'Giang', 'Ma Ngân', '827ccb0eea8a706c4c34a16891f84e7b', 'giangmn@gmail.com', '2023-04-07 12:53:14', '2023-04-07 12:53:14'),
(10, 'Hải', 'Trần Lê Chí', '7130853a09f034816c7c1840d2199066', 'tranlechihai128@gmail.com', '2023-04-10 14:57:09', '2023-04-10 14:57:09'),
(11, 'khanh', 'daica', 'f2be1e3107cb2cdae31f75eb6d20d660', 'dangkdev@gmail.com', '2023-05-04 13:27:14', '2023-05-04 13:27:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_category` (`Type_category`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_category` FOREIGN KEY (`Type_category`) REFERENCES `categories` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
