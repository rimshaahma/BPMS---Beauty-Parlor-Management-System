-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2024 at 02:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rimsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` char(50) NOT NULL,
  `UserName` char(50) NOT NULL,
  `MobileNumber` bigint(10) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Passsword` varchar(200) NOT NULL,
  `AdminRegdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Passsword`, `AdminRegdate`) VALUES
(1, 'rimsha', 'ahmad', 444, 'rim@gmail.com', '444', '2024-12-18 00:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `tblbook`
--

CREATE TABLE `tblbook` (
  `ID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `AptNumber` int(10) NOT NULL,
  `AptDate` date NOT NULL,
  `AptTime` time NOT NULL,
  `Message` mediumtext NOT NULL,
  `BookingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Remark` varchar(250) NOT NULL,
  `Status` varchar(250) NOT NULL,
  `RemarkDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbook`
--

INSERT INTO `tblbook` (`ID`, `UserID`, `AptNumber`, `AptDate`, `AptTime`, `Message`, `BookingDate`, `Remark`, `Status`, `RemarkDate`) VALUES
(2, 2, 2, '2024-12-31', '17:14:15', 'partyyyyyyy makeuppppp', '2024-12-30 00:14:12', 'good', 'yes', '2024-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `ID` int(10) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Message` mediumtext NOT NULL,
  `EnquiryDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IsRead` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`ID`, `FirstName`, `LastName`, `Phone`, `Email`, `Message`, `EnquiryDate`, `IsRead`) VALUES
(3, 'rida', 'jee', 333, 'rida@gmail.com', 'hlo is everyone thereee???????????', '2025-01-01 00:21:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `BillingID` int(11) NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`ID`, `UserID`, `ServiceID`, `BillingID`, `PostingDate`) VALUES
(4, 4, 5, 4, '2024-12-28 00:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) NOT NULL,
  `PageTitle` mediumtext NOT NULL,
  `Email` varchar(200) NOT NULL,
  `MobileNumber` bigint(10) NOT NULL,
  `UpdatingDate` date NOT NULL,
  `Timing` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `Email`, `MobileNumber`, `UpdatingDate`, `Timing`) VALUES
(5, 'about us', 'we are a famous and 10 years experince beauty salon that gives various services', 'nails@gmail.com', 444, '2024-12-31', '10min'),
(6, 'contact us', 'we are here to assist u', 'assising@gmail.com', 66, '2025-12-24', '3min');

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

CREATE TABLE `tblservices` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) NOT NULL,
  `ServiceDescription` mediumtext NOT NULL,
  `Cost` int(10) NOT NULL,
  `Image` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`ID`, `ServiceName`, `ServiceDescription`, `Cost`, `Image`, `CreationDate`) VALUES
(7, 'Fruit Facial', 'Fruit facials contain certain fruit acid like glycelyrine etc and many other good productss', 33, 'How-To-Do-Fruit-Facial-At-Home.jpg', '2024-12-30 00:40:50'),
(8, 'Charcol Facial', 'Activated charcoal is created from bone charand many thingsss', 40, 'b9fb9d37bdf15a699bc071ce49baea531652852364.jpg', '2025-01-01 00:40:56'),
(10, 'Deluxe Menicure', 'A luxurious treatment including a soak and moisture.', 500, 'efc1a80c391be252d7d777a437f868701652852477.jpg', '2025-01-01 00:42:27'),
(11, 'Deluxe Pedicure', 'A luxurious treatment including a soak and moistur.', 500, '1e6ae4ada992769567b71815f124fac51652852492.jpg', '2025-01-01 00:43:31'),
(12, 'Normal Menicure', 'A luxurious treatment including a soak and moistur...', 300, 'The-Dummys-Guide-To-Using-A-Manicure-Kit_OI.jpg', '2025-01-01 00:44:35'),
(12, 'Normal Pedicure', 'A luxurious treatment including a soak and moistur...', 250, '1e6ae4ada992769567b71815f124fac51652852492.jpg\r\n', '2024-12-14 00:45:32'),
(13, 'U-Shape Hair Cut', 'U-Shape Hair Cut', 370, 'cff8ad28cf40ebf4fbdd383fe546098d1652852593.jpg', '2024-12-27 00:46:38'),
(14, 'Layer Haircut', 'Layer Haircut', 470, '74375080377499ab76dad37484ee7f151652852649.jpg', '2025-01-01 00:47:58'),
(15, 'Rebonding', 'Hair rebonding is a chemical process that changes ...', 355, 'c362f21370120580f5779a2d019392851652852555.jpg', '2025-01-01 00:48:53'),
(16, 'Loreal Hair Color(Full)', 'Loreal Hair Color(Full)', 500, 'images.jpg', '2025-01-01 00:49:58'),
(17, 'body spa', 'It is typically a massage spa therapy that helps r.', 344, 'efc1a80c391be252d7d777a437f868701652852477.jpg', '2024-12-12 00:50:44'),
(18, 'Aroma Oil Massage Therapy', 'Aroma Oil Massage TherapyAroma Oil Massage Therapy.', 500, '032b2cc936860b03048302d991c3498f1652173213.jpg', '2025-01-01 00:51:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` mediumtext NOT NULL,
  `MobileNumber` int(10) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
