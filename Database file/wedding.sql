-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2021 at 02:26 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wedding`
--

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `sn` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `from_code` varchar(255) NOT NULL,
  `to_email` varchar(255) NOT NULL,
  `to_code` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`sn`, `code`, `from_email`, `from_code`, `to_email`, `to_code`, `msg`) VALUES
(1, 'H9vFuU_1', 'rahul@gmail.com', 'Aa0324_1', 'babu@gmail.com', 'a56789_15', 'hii'),
(2, 'PGsT4V_2', 'rahul@gmail.com', 'Aa0324_1', 'rani@gmail.com', 'Aa1357_12', 'hlo'),
(3, 'JTxbAj_3', 'rahul@gmail.com', 'Aa0324_1', 'neha@gmail.com', 'Aa2389_11', 'hlo'),
(4, 'AxG6aX_4', 'rahul@gmail.com', 'Aa0324_1', 'ajay@gmail.com', 'a04579_4', 'hlo bro'),
(5, '6QGVmL_5', 'rahul@gmail.com', 'Aa0324_1', 'nisha@gmail.com', 'Aa3579_10', 'hii'),
(6, 'b2kPXB_6', 'rahul@gmail.com', 'Aa0324_1', 'sm@gmail.com', 'A14578_14', 'hlo'),
(7, 'asDtW5_7', 'radhika@gmail.com', 'xBeoDu_2', 'rahul@gmail.com', 'Aa0324_1', 'hlo'),
(8, '3BdI8p_8', 'hema@gmail.com', 'A02589_6', 'rahul@gmail.com', 'Aa0324_1', 'hlo '),
(9, 'bAR5Cd_9', 'nisha@gmail.com', 'Aa3579_10', 'rahul@gmail.com', 'Aa0324_1', 'hlo\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `story`
--

CREATE TABLE `story` (
  `sn` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `couplename` varchar(255) NOT NULL,
  `story` varchar(2000) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `story`
--

INSERT INTO `story` (`sn`, `code`, `couplename`, `story`, `email`) VALUES
(1, 'Oo6u3J_1', 'Vikash & Krishma', 'Finally after looking so many profiles I found my match. All I would say that good things takes time, so guys don\'t loose your patience you will get your special someone.\"Shaadi.com Team congratulates Shubham & Isha. We wish you both a happy future. Thanks for visiting our site god bless both of you.', 'vksh@gmail.com'),
(2, 'EFcdsq_2', 'Radhika & Pranav', 'We saw each others profile on Vivah.com in the month of july 2019. We started chatting on this platform and we both started liking each other. We did our engagement on 30th of January 2020 but unfortunately due to pandemic we could not be able to get married on the same year. It was like god is taking our exam.', 'radhika@gmail.com'),
(3, 'VsJjsw_3', 'Neha & Arnab', 'Arnab and I met through Vivah.com and found each other compatible in all possible aspects and soon realized that there couldn not be any one else than him as my life partner. All I want to convey to the readers that just keep looking out for your match without losing hope and getting disheartened.', 'neha@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `sn` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `caste` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`sn`, `code`, `username`, `email`, `pass`, `gender`, `dob`, `caste`, `religion`, `occupation`, `state`, `country`) VALUES
(1, 'Aa0324_1', 'Kabir Singh', 'rahul@gmail.com', '123', 'Male', '2000-09-22', 'Singh', 'Hindu', 'Engineer', 'Rajasthan', 'India'),
(2, 'xBeoDu_2', 'Radhika', 'radhika@gmail.com', '423432', 'female', '2001-04-02', 'Gupta', 'Hindu', 'Doctor', 'Gujrat', 'India'),
(3, 'A01689_3', 'Raviraj', 'ravi@gmail.com', '12453', 'Male', '2000-09-22', 'Kumawat', 'Hindu', 'Engineer', 'Andhra Pradesh', 'China'),
(4, 'a04579_4', 'Ajay Tak', 'ajay@gmail.com', '1253', 'Male', '2021-06-24', 'Gupta', 'Hindu', 'Psychologist', 'Andhra Pradesh', 'India'),
(5, 'a14578_5', 'Himesh Singh', 'him@gmail.com', '14323', 'Male', '2021-06-09', 'Goyal', 'Sikh', 'Scientist', 'Bihar', 'India'),
(6, 'A02589_6', 'Hema Tuni', 'hema@gmail.com', '14523', 'Female', '2021-06-11', 'Kumawat', 'Buddhism', 'Pharmacist', 'Gujrat', 'India'),
(7, 'a34569_7', 'Hemu Kumar', 'hemu@gmail.com', '14423', 'Male', '2021-07-01', 'Gupta', 'Hindu', 'Teacher', 'Asam', 'India'),
(8, '025679_8', 'Dinesh Kartik', 'dinesh@gmail.com', '12345', 'Male', '2021-06-24', 'Gupta', 'Hindu', 'Technician', 'Asam', 'India'),
(9, 'a13678_9', 'Rahul Sharma', 'rahulsh@gmail.com', '3343', 'Male', '2016-01-09', 'Gupta', 'Hindu', 'Asam', 'Doctor', 'India'),
(10, 'Aa3579_10', 'Nisha Kumawat', 'nisha@gmail.com', '133434', 'Female', '2021-07-30', 'Gupta', 'Hindu', 'Engineer', 'Andhra Pradesh', 'India'),
(11, 'Aa2389_11', 'Neha Sharma', 'neha@gmail.com', '1364', 'Female', '2021-07-29', 'Gupta', 'Hindu', 'Doctor', 'Goa', 'India'),
(12, 'Aa1357_12', 'Rani Deol', 'rani@gmail.com', '3453', 'Female', '2021-07-13', 'Rajput', 'Sikh', 'Actor', 'Gujrat', 'India'),
(13, '026789_13', 'Raju Kumar', 'raju@gmail.com', '4543', 'Male', '2020-10-28', 'Goyal', 'Sikh', 'Architech', 'Rajsthan', 'India'),
(14, 'A14578_14', 'Shyam Varma', 'sm@gmail.com', '1243', 'Male', '2021-07-24', 'Gupta', 'Hindu', 'Physcian', 'Gujrat', 'India'),
(15, 'a56789_15', 'Baburav', 'babu@gmail.com', '233', 'Male', '2008-11-13', 'Gupta', 'Hindu', 'Actor', 'Goa', 'India'),
(16, '014678_16', 'Rohit jaroli', 'rohit@gmail.com', '3433', 'Male', '2021-08-27', 'Gupta', 'Hindu', 'Doctor', 'Asam', 'India'),
(17, 'BwoN97_17', 'Vikash Saharan', 'vksh@gmail.com', '3342', 'male', '1999-03-01', 'Khan', 'Hindu', 'Engineer', 'Rajsthan', 'India');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
