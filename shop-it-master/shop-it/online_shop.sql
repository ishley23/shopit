-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2020 at 10:21 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `UserID`, `ProductID`) VALUES
(32, 8, 1),
(34, 8, 3),
(35, 8, 1),
(42, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(20) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `seller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Price`, `Image`, `Description`, `quantity`, `seller`) VALUES
(1, 'Designer', '1400', 'dress.png', 'One of the best there is in the industry.', 20, 'orlan'),
(2, 'Ginormica', '2500', 'blackish.png', 'Inspired by a well-known cartoon movie.', 20, 'shiro'),
(3, 'Casuality', '2749', 'causal.png', 'Fashion model\'s top pick.', 20, 'dale'),
(4, 'The Simpleton', '1999', 'simple.png', 'Simply sexy design,\r\nMulti-occasional wear.', 20, 'dave'),
(5, 'Crystal', '3199', 'white.png', 'White top and jeans\r\nPerfect for the snow weather', 20, 'jollave9'),
(6, 'Montague', '1499', 'vintage.png', 'Juliet\'s color\r\nBlended with modern styling', 20, 'jollave9'),
(21, 'add', '12', 'add', 'lorem ipsum lorem ipsum', 18, 'jollave9'),
(22, 'sinina', '60', 'images/sinina.jpeg', 'addsell', 5, 'jollave9'),
(23, 'jacket', '750', 'jacket.jpg', 'jacket for summer', 20, 'jollave9');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionID`, `ProductID`, `UserID`, `ProductQuantity`) VALUES
(1, 3, 6, 4),
(2, 1, 7, 2),
(3, 4, 3, 1),
(4, 6, 5, 1),
(5, 5, 1, 3),
(6, 3, 3, 2),
(7, 2, 3, 2),
(8, 3, 7, 1),
(9, 4, 3, 1),
(10, 3, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `Password`, `Address`, `Contact`) VALUES
(1, 'shiro', 'reyjoshuamacarat@gmail.com', 'iamnothing1', '', ''),
(3, 'dave', 'davegamboa99@gmail.com', 'disconnect123', '', ''),
(5, 'hey', 'hey@gmail.com', 'disconnect123', '', ''),
(6, 'gil', 'gil@a.c', '123456', '', ''),
(7, 'bla', 'bla@gil.ac', '123456', '', ''),
(8, 'jollave9', 'jollave9@gmail.com', 'jollave9', '868-A Panagdait Homes, Kasambagan, Cebu City', '09430839472'),
(9, 'adcon', 'adcon@gmail.com', 'adcon', 'japan', '0123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
