-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2022 at 07:28 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project141`
--
CREATE DATABASE IF NOT EXISTS `project141` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project141`;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `ID` int(11) NOT NULL,
  `Budget` decimal(65,2) DEFAULT NULL CHECK (`Budget` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `episthmoniko_pedio`
--

CREATE TABLE `episthmoniko_pedio` (
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ereuniths`
--

CREATE TABLE `ereuniths` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `DoBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ereunitiko_kentro`
--

CREATE TABLE `ereunitiko_kentro` (
  `ID` int(11) NOT NULL,
  `Ministry_Budget` decimal(65,2) DEFAULT NULL CHECK (`Ministry_Budget` >= 0),
  `Private_Budget` decimal(65,2) DEFAULT NULL CHECK (`Private_Budget` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ergo`
--

CREATE TABLE `ergo` (
  `ID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Synopsis` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Episthm_Ypeuth` int(11) NOT NULL,
  `Stelexos` int(11) NOT NULL,
  `Organization` int(11) NOT NULL,
  `Xorhgia` int(11) NOT NULL,
  `Funding` decimal(65,2) DEFAULT NULL CHECK (`Funding` >= 0)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `TagName` varchar(255) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `StreetNo` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  `UniID` int(11) DEFAULT NULL,
  `CompID` int(11) DEFAULT NULL,
  `EreunID` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `paradoteo`
--

CREATE TABLE `paradoteo` (
  `Title` varchar(255) NOT NULL,
  `ergo` int(11) NOT NULL,
  `Summary` varchar(255) DEFAULT NULL,
  `Deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pediorelation`
--

CREATE TABLE `pediorelation` (
  `episthmoniko_pedio` varchar(255) NOT NULL,
  `ergo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `programma`
--

CREATE TABLE `programma` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ereuniths` int(11) NOT NULL,
  `ergo` int(11) NOT NULL,
  `Grade` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stelexos`
--

CREATE TABLE `stelexos` (
  `ID` int(11) NOT NULL,
  `FistName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Gender` enum('Male','Female','NaN') DEFAULT NULL,
  `DoBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE `telephone` (
  `Number` varchar(15) NOT NULL,
  `organization` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `ID` int(11) NOT NULL,
  `Budget` decimal(65,2) DEFAULT NULL CHECK (`Budget` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`ereuniths_ID` int(11)
,`first_name` varchar(255)
,`last_name` varchar(255)
,`ergo_id` int(11)
,`title` varchar(255)
,`Synopsis` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2`
-- (See below for the actual view)
--
CREATE TABLE `view2` (
`ereuniths_ID` int(11)
,`first_name` varchar(255)
,`last_name` varchar(255)
,`oraganization_id` int(11)
,`tagname` varchar(255)
,`date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `worksforergo`
--

CREATE TABLE `worksforergo` (
  `ergo` int(11) NOT NULL,
  `ereuniths` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `worksfororganization`
--

CREATE TABLE `worksfororganization` (
  `organization` int(11) NOT NULL,
  `ereuniths` int(11) NOT NULL,
  `SINCE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS SELECT `p`.`ID` AS `ereuniths_ID`, `p`.`FirstName` AS `first_name`, `p`.`LastName` AS `last_name`, `pm`.`ID` AS `ergo_id`, `pm`.`Title` AS `title`, `pm`.`Synopsis` AS `Synopsis` FROM ((`worksforergo` `w` join `ereuniths` `p` on(`w`.`ereuniths` = `p`.`ID`)) join `ergo` `pm` on(`w`.`ergo` = `pm`.`ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view2`
--
DROP TABLE IF EXISTS `view2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2`  AS SELECT `p`.`ID` AS `ereuniths_ID`, `p`.`FirstName` AS `first_name`, `p`.`LastName` AS `last_name`, `pm`.`ID` AS `oraganization_id`, `pm`.`TagName` AS `tagname`, `w`.`SINCE` AS `date` FROM ((`worksfororganization` `w` join `ereuniths` `p` on(`w`.`ereuniths` = `p`.`ID`)) join `organization` `pm` on(`w`.`organization` = `pm`.`ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `episthmoniko_pedio`
--
ALTER TABLE `episthmoniko_pedio`
  ADD PRIMARY KEY (`NAME`);

--
-- Indexes for table `ereuniths`
--
ALTER TABLE `ereuniths`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ereunitiko_kentro`
--
ALTER TABLE `ereunitiko_kentro`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ergo`
--
ALTER TABLE `ergo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Xorhgia` (`Xorhgia`),
  ADD KEY `Episthm_Ypeuth` (`Episthm_Ypeuth`),
  ADD KEY `Stelexos` (`Stelexos`),
  ADD KEY `Organization` (`Organization`),
  ADD KEY `ind_ergo` (`ID`,`Title`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UniID` (`UniID`),
  ADD KEY `CompID` (`CompID`),
  ADD KEY `EreunID` (`EreunID`),
  ADD KEY `ind_organization` (`ID`,`Name`,`TagName`);

--
-- Indexes for table `paradoteo`
--
ALTER TABLE `paradoteo`
  ADD PRIMARY KEY (`Title`,`ergo`),
  ADD KEY `ergo` (`ergo`);

--
-- Indexes for table `pediorelation`
--
ALTER TABLE `pediorelation`
  ADD PRIMARY KEY (`episthmoniko_pedio`,`ergo`),
  ADD KEY `ergo` (`ergo`);

--
-- Indexes for table `programma`
--
ALTER TABLE `programma`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ereuniths`,`ergo`),
  ADD KEY `ergo` (`ergo`);

--
-- Indexes for table `stelexos`
--
ALTER TABLE `stelexos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`organization`,`Number`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `worksforergo`
--
ALTER TABLE `worksforergo`
  ADD PRIMARY KEY (`ergo`,`ereuniths`),
  ADD KEY `ereuniths` (`ereuniths`);

--
-- Indexes for table `worksfororganization`
--
ALTER TABLE `worksfororganization`
  ADD PRIMARY KEY (`ereuniths`),
  ADD KEY `organization` (`organization`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ereuniths`
--
ALTER TABLE `ereuniths`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ereunitiko_kentro`
--
ALTER TABLE `ereunitiko_kentro`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ergo`
--
ALTER TABLE `ergo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programma`
--
ALTER TABLE `programma`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stelexos`
--
ALTER TABLE `stelexos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ergo`
--
ALTER TABLE `ergo`
  ADD CONSTRAINT `ergo_ibfk_1` FOREIGN KEY (`Xorhgia`) REFERENCES `programma` (`ID`),
  ADD CONSTRAINT `ergo_ibfk_2` FOREIGN KEY (`Episthm_Ypeuth`) REFERENCES `ereuniths` (`ID`),
  ADD CONSTRAINT `ergo_ibfk_3` FOREIGN KEY (`Stelexos`) REFERENCES `stelexos` (`ID`),
  ADD CONSTRAINT `ergo_ibfk_4` FOREIGN KEY (`Organization`) REFERENCES `organization` (`ID`);

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`UniID`) REFERENCES `university` (`ID`),
  ADD CONSTRAINT `organization_ibfk_2` FOREIGN KEY (`CompID`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `organization_ibfk_3` FOREIGN KEY (`EreunID`) REFERENCES `ereunitiko_kentro` (`ID`);

--
-- Constraints for table `paradoteo`
--
ALTER TABLE `paradoteo`
  ADD CONSTRAINT `paradoteo_ibfk_1` FOREIGN KEY (`ergo`) REFERENCES `ergo` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `pediorelation`
--
ALTER TABLE `pediorelation`
  ADD CONSTRAINT `pediorelation_ibfk_1` FOREIGN KEY (`episthmoniko_pedio`) REFERENCES `episthmoniko_pedio` (`NAME`),
  ADD CONSTRAINT `pediorelation_ibfk_2` FOREIGN KEY (`ergo`) REFERENCES `ergo` (`ID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ereuniths`) REFERENCES `ereuniths` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ergo`) REFERENCES `ergo` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `telephone`
--
ALTER TABLE `telephone`
  ADD CONSTRAINT `telephone_ibfk_1` FOREIGN KEY (`organization`) REFERENCES `organization` (`ID`);

--
-- Constraints for table `worksforergo`
--
ALTER TABLE `worksforergo`
  ADD CONSTRAINT `worksforergo_ibfk_1` FOREIGN KEY (`ergo`) REFERENCES `ergo` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `worksforergo_ibfk_2` FOREIGN KEY (`ereuniths`) REFERENCES `ereuniths` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `worksfororganization`
--
ALTER TABLE `worksfororganization`
  ADD CONSTRAINT `worksfororganization_ibfk_1` FOREIGN KEY (`organization`) REFERENCES `organization` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `worksfororganization_ibfk_2` FOREIGN KEY (`ereuniths`) REFERENCES `ereuniths` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
