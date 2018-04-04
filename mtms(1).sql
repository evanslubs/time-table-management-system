-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 04, 2018 at 01:35 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mtms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `username`, `password`) VALUES
(1, 'kamoga', 'kamoga'),
(1101, 'Evans', 'Lubeger');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `campus_id` int(11) NOT NULL,
  `campus_name` varchar(255) NOT NULL,
  PRIMARY KEY (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `dept_id` varchar(255) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `dept_id`) VALUES
('1107', 'Bachelors in copulation', '43'),
('1109', 'Bachelors in business administration', ''),
('1189', 'Bachelors kin education', ''),
('3456', 'Bachelors of killing', ''),
('45', 'bachelors of educ', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` varchar(255) NOT NULL,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `lecturer` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`lecturer`, `message`) VALUES
('evans', 'Im gonna change University, so de register me please!'),
('davie', 'please send me my timetable'),
('davie', 'please send me my timetable');

-- --------------------------------------------------------

--
-- Table structure for table `hod`
--

DROP TABLE IF EXISTS `hod`;
CREATE TABLE IF NOT EXISTS `hod` (
  `hod_id` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`hod_id`),
  KEY `dept_fk` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hod`
--

INSERT INTO `hod` (`hod_id`, `fullname`, `username`, `password`, `dept_id`) VALUES
('190', 'ssazie', 'ssazie', 'ssazie', 678),
('191', 'Douglas Lubeger', 'Douglas', 'Lubeger', 1),
('23', 'Katerega paul', 'Katerega', 'Katerega', 4),
('24', 'lubega evans', 'evans', 'evans', 43);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE IF NOT EXISTS `lecturer` (
  `lecturer_id` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`lecturer_id`, `fullname`, `username`, `password`) VALUES
('1', 'kizito david', 'davie', '1'),
('123', 'Aggie Lubeger', 'Aggie', 'Lubeger'),
('3', 'saint evans', 'evans', 'saintevans'),
('4', 'saazi enock', 'enock', '4');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `module_id` varchar(255) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `module_name`) VALUES
('1', 'discrete maths'),
('2', 'communication skills'),
('25', 'javascript'),
('567', 'data programming'),
('9', 'game programming');

-- --------------------------------------------------------

--
-- Table structure for table `module_allocated`
--

DROP TABLE IF EXISTS `module_allocated`;
CREATE TABLE IF NOT EXISTS `module_allocated` (
  `module_id` varchar(11) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_fk` (`lecturer_id`),
  KEY `m` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
CREATE TABLE IF NOT EXISTS `shift` (
  `shift_id` int(11) NOT NULL,
  `shift_name` varchar(255) NOT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE IF NOT EXISTS `timetable` (
  `year` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `start` varchar(255) NOT NULL,
  `end` varchar(255) NOT NULL,
  `lecturer_id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  KEY `course_id` (`course_id`,`module_id`),
  KEY `lecturer_id` (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`year`, `sem`, `course_id`, `module_id`, `day`, `start`, `end`, `lecturer_id`, `type`) VALUES
(1, 1, '3456', '1', 'sat', '8:00', '11:00', '3', 'Weekend'),
(1, 1, '3456', '2', 'sun', '11:00', '2:00', '3', 'Weekend'),
(1, 1, '1107', '567', 'mon', '8:00', '11:00', '3', 'Day'),
(1, 1, '1107', '9', 'mon', '11:00', '2:00', '3', 'Day'),
(1, 1, '1107', '2', 'mon', '3:00', '5:00', '3', 'Day');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
