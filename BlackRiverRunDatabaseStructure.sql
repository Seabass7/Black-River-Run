-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: s679.loopia.se
-- Generation Time: Jan 16, 2019 at 01:38 PM
-- Server version: 10.2.19-MariaDB-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sebastianoveland_com_db_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `Username` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Password` varchar(60) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `PassToken` varchar(60) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `PassTime` timestamp NULL DEFAULT NULL,
  `LastLogin` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `ID` int(11) NOT NULL,
  `Gender` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `Distance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `Gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invalid_codes`
--

CREATE TABLE `invalid_codes` (
  `Code` int(11) NOT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invalid_punches`
--

CREATE TABLE `invalid_punches` (
  `Timestamp` datetime NOT NULL,
  `SI_unit` int(11) NOT NULL,
  `Runner` int(11) NOT NULL,
  `Station` varchar(12) NOT NULL,
  `Race` int(11) NOT NULL,
  `RaceInstance` int(11) NOT NULL,
  `DiscardReason` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `map_points`
--

CREATE TABLE `map_points` (
  `ID` int(11) NOT NULL,
  `LAT` double NOT NULL,
  `LNG` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `race`
--

CREATE TABLE `race` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `EndTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `race_display`
--

CREATE TABLE `race_display` (
  `Race` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `race_instance`
--

CREATE TABLE `race_instance` (
  `ID` int(11) NOT NULL,
  `Race` int(11) NOT NULL,
  `Class` int(11) NOT NULL,
  `StartTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `race_runner`
--

CREATE TABLE `race_runner` (
  `RaceInstance` int(11) NOT NULL,
  `Runner` int(11) NOT NULL,
  `Bib` int(11) NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Club` int(11) DEFAULT NULL,
  `Place` int(11) DEFAULT NULL,
  `TotalTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `runner`
--

CREATE TABLE `runner` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `runner_status`
--

CREATE TABLE `runner_status` (
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `runner_units`
--

CREATE TABLE `runner_units` (
  `Runner` int(11) NOT NULL,
  `SI_unit` int(11) NOT NULL,
  `Race` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `si_unit`
--

CREATE TABLE `si_unit` (
  `ID` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `si_unit_status`
--

CREATE TABLE `si_unit_status` (
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `ID` varchar(12) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Code` int(11) NOT NULL,
  `LengthFromStart` int(11) NOT NULL,
  `LastID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timestamp`
--

CREATE TABLE `timestamp` (
  `Timestamp` datetime NOT NULL,
  `SI_unit` int(11) NOT NULL,
  `Runner` int(11) NOT NULL,
  `Station` varchar(12) NOT NULL,
  `Race` int(11) DEFAULT NULL,
  `RaceInstance` int(11) DEFAULT NULL,
  `Place` int(11) DEFAULT NULL,
  `Lap` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `class_gender` (`Gender`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`Gender`);

--
-- Indexes for table `invalid_codes`
--
ALTER TABLE `invalid_codes`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `invalid_punches`
--
ALTER TABLE `invalid_punches`
  ADD KEY `invalid_punches_code` (`DiscardReason`);

--
-- Indexes for table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `race_display`
--
ALTER TABLE `race_display`
  ADD KEY `race_display_race` (`Race`);

--
-- Indexes for table `race_instance`
--
ALTER TABLE `race_instance`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Race` (`Race`,`Class`,`StartTime`),
  ADD KEY `Time` (`StartTime`),
  ADD KEY `race_instance_class` (`Class`);

--
-- Indexes for table `race_runner`
--
ALTER TABLE `race_runner`
  ADD PRIMARY KEY (`RaceInstance`,`Runner`),
  ADD KEY `race_runner_club` (`Club`),
  ADD KEY `race_runner_runner` (`Runner`),
  ADD KEY `race_runner_status` (`Status`);

--
-- Indexes for table `runner`
--
ALTER TABLE `runner`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `runner_gender` (`Gender`);

--
-- Indexes for table `runner_status`
--
ALTER TABLE `runner_status`
  ADD PRIMARY KEY (`Status`);

--
-- Indexes for table `runner_units`
--
ALTER TABLE `runner_units`
  ADD PRIMARY KEY (`Runner`,`SI_unit`,`Race`),
  ADD UNIQUE KEY `SI_unit` (`SI_unit`,`Race`),
  ADD KEY `runner_units_race` (`Race`);

--
-- Indexes for table `si_unit`
--
ALTER TABLE `si_unit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `si_unit_si_unit_status` (`Status`);

--
-- Indexes for table `si_unit_status`
--
ALTER TABLE `si_unit_status`
  ADD PRIMARY KEY (`Status`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `timestamp`
--
ALTER TABLE `timestamp`
  ADD PRIMARY KEY (`Timestamp`,`Runner`),
  ADD KEY `timestamp_station` (`Station`),
  ADD KEY `timestamp_runner` (`Runner`),
  ADD KEY `timestamp_race` (`Race`),
  ADD KEY `timestamp_si_unit` (`SI_unit`),
  ADD KEY `timestamp_raceinstance` (`RaceInstance`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `race`
--
ALTER TABLE `race`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `race_instance`
--
ALTER TABLE `race_instance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `runner`
--
ALTER TABLE `runner`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_gender` FOREIGN KEY (`Gender`) REFERENCES `gender` (`Gender`) ON UPDATE CASCADE;

--
-- Constraints for table `invalid_punches`
--
ALTER TABLE `invalid_punches`
  ADD CONSTRAINT `invalid_punches_code` FOREIGN KEY (`DiscardReason`) REFERENCES `invalid_codes` (`Code`) ON UPDATE CASCADE;

--
-- Constraints for table `race_display`
--
ALTER TABLE `race_display`
  ADD CONSTRAINT `race_display_race` FOREIGN KEY (`Race`) REFERENCES `race` (`ID`);

--
-- Constraints for table `race_instance`
--
ALTER TABLE `race_instance`
  ADD CONSTRAINT `race_instance_class` FOREIGN KEY (`Class`) REFERENCES `class` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `race_instance_race` FOREIGN KEY (`Race`) REFERENCES `race` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `race_runner`
--
ALTER TABLE `race_runner`
  ADD CONSTRAINT `race_runner_club` FOREIGN KEY (`Club`) REFERENCES `club` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `race_runner_instance` FOREIGN KEY (`RaceInstance`) REFERENCES `race_instance` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `race_runner_runner` FOREIGN KEY (`Runner`) REFERENCES `runner` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `race_runner_status` FOREIGN KEY (`Status`) REFERENCES `runner_status` (`Status`) ON UPDATE CASCADE;

--
-- Constraints for table `runner`
--
ALTER TABLE `runner`
  ADD CONSTRAINT `runner_gender` FOREIGN KEY (`Gender`) REFERENCES `gender` (`Gender`) ON UPDATE CASCADE;

--
-- Constraints for table `runner_units`
--
ALTER TABLE `runner_units`
  ADD CONSTRAINT `runner_units_race` FOREIGN KEY (`Race`) REFERENCES `race` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `runner_units_runner` FOREIGN KEY (`Runner`) REFERENCES `runner` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `runner_units_si_unit` FOREIGN KEY (`SI_unit`) REFERENCES `si_unit` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `si_unit`
--
ALTER TABLE `si_unit`
  ADD CONSTRAINT `si_unit_si_unit_status` FOREIGN KEY (`Status`) REFERENCES `si_unit_status` (`Status`) ON UPDATE CASCADE;

--
-- Constraints for table `timestamp`
--
ALTER TABLE `timestamp`
  ADD CONSTRAINT `timestamp_race` FOREIGN KEY (`Race`) REFERENCES `race` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timestamp_raceinstance` FOREIGN KEY (`RaceInstance`) REFERENCES `race_instance` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timestamp_runner` FOREIGN KEY (`Runner`) REFERENCES `runner` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timestamp_si_unit` FOREIGN KEY (`SI_unit`) REFERENCES `si_unit` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `timestamp_station` FOREIGN KEY (`Station`) REFERENCES `station` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
