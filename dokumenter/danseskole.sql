-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2017 at 09:31 AM
-- Server version: 5.6.34
-- PHP Version: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `danseskole`
--

-- --------------------------------------------------------

--
-- Table structure for table `aldersgrupper`
--

CREATE TABLE `aldersgrupper` (
  `ID` int(11) NOT NULL,
  `navn` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brugere`
--

CREATE TABLE `brugere` (
  `ID` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `adgangskode` varchar(70) NOT NULL,
  `fk_profil` int(11) NOT NULL,
  `fk_brugerrolle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brugerroller`
--

CREATE TABLE `brugerroller` (
  `ID` int(11) NOT NULL,
  `navn` varchar(10) NOT NULL,
  `niveau` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deltagere`
--

CREATE TABLE `deltagere` (
  `ID` int(11) NOT NULL,
  `fk_hold` int(11) NOT NULL,
  `fk_kunde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hold`
--

CREATE TABLE `hold` (
  `ID` int(11) NOT NULL,
  `holdnummer` varchar(8) NOT NULL,
  `pris` decimal(10,2) NOT NULL,
  `fk_stilarter` int(11) NOT NULL,
  `fk_instruktør` int(11) NOT NULL,
  `fk_aldersgrupper` int(11) NOT NULL,
  `fk_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instruktører`
--

CREATE TABLE `instruktører` (
  `ID` int(11) NOT NULL,
  `billede` varchar(64) NOT NULL,
  `beskrivelse` text NOT NULL,
  `fk_profil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

CREATE TABLE `niveau` (
  `ID` int(11) NOT NULL,
  `navn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `ID` int(11) NOT NULL,
  `fornavn` varchar(50) NOT NULL,
  `efternavn` varchar(50) NOT NULL,
  `fødselsdato` date NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `postnr` int(5) NOT NULL,
  `city` varchar(20) NOT NULL,
  `emil` varchar(128) NOT NULL,
  `tlf` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sider`
--

CREATE TABLE `sider` (
  `ID` int(11) NOT NULL,
  `overskrift` varchar(20) NOT NULL,
  `tekst` text NOT NULL,
  `billede` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stilarter`
--

CREATE TABLE `stilarter` (
  `ID` int(11) NOT NULL,
  `navn` varchar(20) NOT NULL,
  `beskrivelse` text NOT NULL,
  `billede` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aldersgrupper`
--
ALTER TABLE `aldersgrupper`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `brugere`
--
ALTER TABLE `brugere`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `brugerroller`
--
ALTER TABLE `brugerroller`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `deltagere`
--
ALTER TABLE `deltagere`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hold`
--
ALTER TABLE `hold`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `holdnummer` (`holdnummer`);

--
-- Indexes for table `instruktører`
--
ALTER TABLE `instruktører`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sider`
--
ALTER TABLE `sider`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `stilarter`
--
ALTER TABLE `stilarter`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aldersgrupper`
--
ALTER TABLE `aldersgrupper`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `brugere`
--
ALTER TABLE `brugere`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `brugerroller`
--
ALTER TABLE `brugerroller`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deltagere`
--
ALTER TABLE `deltagere`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hold`
--
ALTER TABLE `hold`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `instruktører`
--
ALTER TABLE `instruktører`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sider`
--
ALTER TABLE `sider`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stilarter`
--
ALTER TABLE `stilarter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
