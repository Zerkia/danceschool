-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Vært: localhost
-- Genereringstid: 19. 05 2017 kl. 06:27:37
-- Serverversion: 10.1.23-MariaDB
-- PHP-version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `landrupdans`
--
CREATE DATABASE IF NOT EXISTS `landrupdans` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `landrupdans`;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `brugere`
--

CREATE TABLE `brugere` (
  `id` int(11) NOT NULL,
  `email` varchar(129) NOT NULL,
  `adgangskode` varchar(70) NOT NULL,
  `fkProfil` int(11) NOT NULL,
  `fkBrugerrolle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `brugerroller`
--

CREATE TABLE `brugerroller` (
  `id` int(11) NOT NULL,
  `navn` varchar(10) NOT NULL,
  `niveau` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `brugerroller`
--

INSERT INTO `brugerroller` (`id`, `navn`, `niveau`) VALUES
(1, 'SuperUser', 99),
(2, 'Admin', 90),
(3, 'Medarb.', 50),
(4, 'Kunder', 30);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `fornavn` varchar(30) NOT NULL,
  `efternavn` varchar(30) NOT NULL,
  `fodselsdato` date NOT NULL,
  `adresse` varchar(65) NOT NULL,
  `postnr` int(5) NOT NULL,
  `city` varchar(31) NOT NULL,
  `oprettet` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tlf` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `brugere`
--
ALTER TABLE `brugere`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fkBrugerRolle` (`fkBrugerrolle`),
  ADD KEY `fkProfil` (`fkProfil`);

--
-- Indeks for tabel `brugerroller`
--
ALTER TABLE `brugerroller`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `brugere`
--
ALTER TABLE `brugere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `brugerroller`
--
ALTER TABLE `brugerroller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `brugere`
--
ALTER TABLE `brugere`
  ADD CONSTRAINT `fkBrugerRolle` FOREIGN KEY (`fkBrugerrolle`) REFERENCES `brugerroller` (`id`),
  ADD CONSTRAINT `fkProfil` FOREIGN KEY (`fkProfil`) REFERENCES `profil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
