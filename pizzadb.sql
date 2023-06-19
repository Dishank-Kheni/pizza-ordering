-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 02:02 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresstb`
--

CREATE TABLE `addresstb` (
  `addressid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `houseno` varchar(10) NOT NULL,
  `apartment_street` varchar(100) NOT NULL,
  `area` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresstb`
--

INSERT INTO `addresstb` (`addressid`, `custid`, `houseno`, `apartment_street`, `area`, `pincode`) VALUES
(12, 20, 'B-402', 'paradise residency', 'yogi chowk', 395006);

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

CREATE TABLE `admintb` (
  `adminid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admintb`
--

INSERT INTO `admintb` (`adminid`, `name`, `password`, `email`) VALUES
(4, 'admin', 'admin@123', 'admin45@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `cartitemstb`
--

CREATE TABLE `cartitemstb` (
  `cartid` int(11) NOT NULL,
  `pizzaid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carttb`
--

CREATE TABLE `carttb` (
  `cartid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carttb`
--

INSERT INTO `carttb` (`cartid`, `custid`, `created_at`) VALUES
(45, 20, '2022-06-18 00:45:57');

-- --------------------------------------------------------

--
-- Table structure for table `contactustb`
--

CREATE TABLE `contactustb` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customertb`
--

CREATE TABLE `customertb` (
  `custid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `contactno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customertb`
--

INSERT INTO `customertb` (`custid`, `name`, `email`, `password`, `contactno`) VALUES
(15, 'divyesh khokhar', 'divyeshkhokhar2511@gmail.com', '$2y$10$9L0q69gcn/v0HoURF7OV2O39Z7QFSIiAKZuncOJ3gTiMKz0xzQWsC', '9568569956'),
(19, 'akash vaghela', 'avvaghela93@gmail.com', '$2y$10$D2m7D8G8JC3VWWGkVfGY2.mRGAvdg.oDxbnK4V2ou8V1.dVmFzaQa', '9565638844'),
(20, 'ritesh sutariya', 'riteshsutariya91@gmail.com', '$2y$10$qCqdyrD5YyiXxsfabjbZqOwVu60bmBwv2HBOVu29rD2IuMNf2gNA6', '7990305766');

-- --------------------------------------------------------

--
-- Table structure for table `orderitemstb`
--

CREATE TABLE `orderitemstb` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `pizzaid` int(11) NOT NULL,
  `priceid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitemstb`
--

INSERT INTO `orderitemstb` (`id`, `orderid`, `pizzaid`, `priceid`, `quantity`, `amount`) VALUES
(114, 1001, 24, 35, 1, 299),
(115, 1002, 25, 37, 1, 799);

-- --------------------------------------------------------

--
-- Table structure for table `ordertb`
--

CREATE TABLE `ordertb` (
  `orderid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `addressid` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordertb`
--

INSERT INTO `ordertb` (`orderid`, `custid`, `addressid`, `datetime`, `payment_status`, `order_status`) VALUES
(1001, 20, 12, '2022-06-18 00:52:41', 'Success', 'Delivered'),
(1002, 20, 12, '2022-06-23 05:14:33', 'Success', 'Order Placed');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttb`
--

CREATE TABLE `paymenttb` (
  `paymentid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` float NOT NULL,
  `transactionid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymenttb`
--

INSERT INTO `paymenttb` (`paymentid`, `orderid`, `date`, `amount`, `transactionid`) VALUES
(38, 1001, '2022-06-18', 299, '20220618111212800110168588403793839'),
(39, 1002, '2022-06-23', 799, '20220623111212800110168596403811368');

-- --------------------------------------------------------

--
-- Table structure for table `pizzatb`
--

CREATE TABLE `pizzatb` (
  `pizzaid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `type` varchar(50) NOT NULL,
  `image_url` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizzatb`
--

INSERT INTO `pizzatb` (`pizzaid`, `name`, `description`, `type`, `image_url`) VALUES
(23, 'Margherita', 'Say Cheese , extra cheese pizza with the delicious...', 'veg', './images/uploads/image-581856-1595939022.jpeg'),
(24, 'Lovers Bite', 'A Wholesome Combination Of Tossed Mushrooms, Olives.', 'veg', './images/uploads/image-1578568887.jpeg'),
(25, 'Burn To Hell', 'A Fiery And Lethal Combination Of Hot & Garlic', 'veg', './images/uploads/image-1578569001.jpeg'),
(26, 'Tandoori Chicken', 'Tandoori Chicken pizza', 'nonveg', './images/uploads/image-135889-1595939023.jpeg'),
(27, 'Spanish Sizzles', 'Chicken Tikka, Chicken Kebab,Chicken Salami', 'nonveg', './images/uploads/image-1578572719.jpeg'),
(28, 'Garden Delight Pizza', 'A Classic Veg Pizza That Combines The Zing', 'veg', './images/uploads/image-571627-1595939023.jpeg'),
(29, 'Cheezy-7 Pizza', 'An Exotic Combination of White Mozzarilla.', 'veg', './images/uploads/image-1578568978.jpeg'),
(30, 'Hot Tandoori Pizza', 'Chicken Tikka, Chicken Seekh Kebab', 'nonveg', './images/uploads/image-1578572399.jpeg'),
(33, 'hatters Bite', 'A NotSome Combination Of Fried Chkakri, Chocholates.', 'veg', './images/uploads/image-postman.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `pricetb`
--

CREATE TABLE `pricetb` (
  `priceid` int(11) NOT NULL,
  `pizzaid` int(11) NOT NULL,
  `size` varchar(25) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pricetb`
--

INSERT INTO `pricetb` (`priceid`, `pizzaid`, `size`, `price`) VALUES
(32, 23, 'small', 299),
(33, 23, 'medium', 399),
(34, 23, 'small', 179),
(35, 24, 'medium', 299),
(36, 24, 'large', 449),
(37, 25, 'medium', 799),
(38, 25, 'large', 1299),
(39, 26, 'small', 150),
(40, 26, 'medium', 200),
(41, 26, 'large', 299),
(42, 27, 'small', 299),
(43, 27, 'medium', 399),
(44, 27, 'large', 500),
(45, 28, 'small', 199),
(46, 28, 'medium', 289),
(47, 28, 'large', 589),
(48, 28, 'small', 99),
(49, 28, 'medium', 188),
(50, 28, 'large', 259),
(51, 29, 'small', 189),
(52, 29, 'medium', 289),
(53, 29, 'large', 379),
(54, 30, 'small', 199),
(55, 30, 'medium', 329),
(56, 30, 'large', 521),
(57, 24, 'small', 249),
(58, 25, 'small', 499);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresstb`
--
ALTER TABLE `addresstb`
  ADD PRIMARY KEY (`addressid`),
  ADD KEY `custid` (`custid`);

--
-- Indexes for table `admintb`
--
ALTER TABLE `admintb`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `cartitemstb`
--
ALTER TABLE `cartitemstb`
  ADD PRIMARY KEY (`cartid`,`pizzaid`),
  ADD KEY `pizzaid` (`pizzaid`),
  ADD KEY `cartitemstb_ibfk_3` (`price_id`);

--
-- Indexes for table `carttb`
--
ALTER TABLE `carttb`
  ADD PRIMARY KEY (`cartid`),
  ADD KEY `custid` (`custid`);

--
-- Indexes for table `contactustb`
--
ALTER TABLE `contactustb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customertb`
--
ALTER TABLE `customertb`
  ADD PRIMARY KEY (`custid`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contactno` (`contactno`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Indexes for table `orderitemstb`
--
ALTER TABLE `orderitemstb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `orderitemstb_ibfk_2` (`pizzaid`),
  ADD KEY `priceid` (`priceid`);

--
-- Indexes for table `ordertb`
--
ALTER TABLE `ordertb`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `custid` (`custid`),
  ADD KEY `addressid` (`addressid`);

--
-- Indexes for table `paymenttb`
--
ALTER TABLE `paymenttb`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `orderid` (`orderid`);

--
-- Indexes for table `pizzatb`
--
ALTER TABLE `pizzatb`
  ADD PRIMARY KEY (`pizzaid`);

--
-- Indexes for table `pricetb`
--
ALTER TABLE `pricetb`
  ADD PRIMARY KEY (`priceid`),
  ADD KEY `pizzaid` (`pizzaid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresstb`
--
ALTER TABLE `addresstb`
  MODIFY `addressid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `admintb`
--
ALTER TABLE `admintb`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carttb`
--
ALTER TABLE `carttb`
  MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `contactustb`
--
ALTER TABLE `contactustb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customertb`
--
ALTER TABLE `customertb`
  MODIFY `custid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orderitemstb`
--
ALTER TABLE `orderitemstb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `ordertb`
--
ALTER TABLE `ordertb`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT for table `paymenttb`
--
ALTER TABLE `paymenttb`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pizzatb`
--
ALTER TABLE `pizzatb`
  MODIFY `pizzaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `pricetb`
--
ALTER TABLE `pricetb`
  MODIFY `priceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresstb`
--
ALTER TABLE `addresstb`
  ADD CONSTRAINT `addresstb_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customertb` (`custid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cartitemstb`
--
ALTER TABLE `cartitemstb`
  ADD CONSTRAINT `cartitemstb_ibfk_1` FOREIGN KEY (`cartid`) REFERENCES `carttb` (`cartid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartitemstb_ibfk_2` FOREIGN KEY (`pizzaid`) REFERENCES `pizzatb` (`pizzaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartitemstb_ibfk_3` FOREIGN KEY (`price_id`) REFERENCES `pricetb` (`priceid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carttb`
--
ALTER TABLE `carttb`
  ADD CONSTRAINT `carttb_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customertb` (`custid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderitemstb`
--
ALTER TABLE `orderitemstb`
  ADD CONSTRAINT `orderitemstb_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `ordertb` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitemstb_ibfk_2` FOREIGN KEY (`pizzaid`) REFERENCES `pizzatb` (`pizzaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitemstb_ibfk_3` FOREIGN KEY (`priceid`) REFERENCES `pricetb` (`priceid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordertb`
--
ALTER TABLE `ordertb`
  ADD CONSTRAINT `ordertb_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customertb` (`custid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordertb_ibfk_2` FOREIGN KEY (`addressid`) REFERENCES `addresstb` (`addressid`);

--
-- Constraints for table `paymenttb`
--
ALTER TABLE `paymenttb`
  ADD CONSTRAINT `paymenttb_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `ordertb` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pricetb`
--
ALTER TABLE `pricetb`
  ADD CONSTRAINT `pricetb_ibfk_1` FOREIGN KEY (`pizzaid`) REFERENCES `pizzatb` (`pizzaid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
