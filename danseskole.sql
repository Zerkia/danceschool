-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Vært: 127.0.0.1
-- Genereringstid: 06. 06 2017 kl. 09:32:35
-- Serverversion: 5.6.24
-- PHP-version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `danseskole`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `aldersgrupper`
--

CREATE TABLE IF NOT EXISTS `aldersgrupper` (
  `ID` int(11) NOT NULL,
  `navn` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `brugere`
--

CREATE TABLE IF NOT EXISTS `brugere` (
  `ID` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `adgangskode` varchar(70) NOT NULL,
  `fk_profil` int(11) NOT NULL,
  `fk_brugerrolle` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `brugere`
--

INSERT INTO `brugere` (`ID`, `email`, `adgangskode`, `fk_profil`, `fk_brugerrolle`) VALUES
(7, 'test@test.dk', '$2y$12$e8mo/TwSZX3BGBwsqTW0iOUJA/Xc8NquUbd6HKqdiQu7tuG4BmiM6', 7, 3),
(9, 'admin@admin.com', '$2y$12$Z.Yt5Ej9MIIeTxrCPMW5MuFIqXA18K6RkB6Hszirr2V3ifTiRoNha', 9, 2),
(10, 'SuperAdmin@admin.com', '$2y$12$y6oFCk1BPqV.9WuEsPA8feAR2c97MPc3QVNe8PYaNoBsf67k0ZAkG', 10, 1),
(11, 'nikolajpregaard@gmail.com', '$2y$12$Rh9X3m/PvIFW0aZDRkHaVeHhUUVVpEhnPo/zfdQ4V427LCktk6BPO', 16, 4);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `brugerroller`
--

CREATE TABLE IF NOT EXISTS `brugerroller` (
  `ID` int(11) NOT NULL,
  `navn` varchar(10) NOT NULL,
  `niveau` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `brugerroller`
--

INSERT INTO `brugerroller` (`ID`, `navn`, `niveau`) VALUES
(1, 'SuperUser', 99),
(2, 'Admin', 90),
(3, 'Medarb', 50),
(4, 'Kunde', 25);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `deltagere`
--

CREATE TABLE IF NOT EXISTS `deltagere` (
  `ID` int(11) NOT NULL,
  `fk_hold` int(11) NOT NULL,
  `fk_kunde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `hold`
--

CREATE TABLE IF NOT EXISTS `hold` (
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
-- Struktur-dump for tabellen `instruktorer`
--

CREATE TABLE IF NOT EXISTS `instruktorer` (
  `ID` int(11) NOT NULL,
  `beskrivelse` text NOT NULL,
  `fk_media` int(11) NOT NULL,
  `fk_profil` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `instruktorer`
--

INSERT INTO `instruktorer` (`ID`, `beskrivelse`, `fk_media`, `fk_profil`) VALUES
(2, 'Lederen af alle Admins.', 2, 10),
(3, 'Den normale administrator, der ogsÃ¥ er instruktÃ¸r', 3, 9),
(4, 'Den normale administrator, der ogsÃ¥ er instruktÃ¸r', 4, 9);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `ID` int(11) NOT NULL,
  `sti` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(90) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `media`
--

INSERT INTO `media` (`ID`, `sti`, `type`) VALUES
(1, '1495623130_open-book-bw.jpg', 'image/jpeg'),
(2, '1495625492_open-book-bw.jpg', 'image/jpeg'),
(3, '1496300853_100 Crates In The Bank.png', 'image/png'),
(4, '1496301164_100 Crates In The Bank.png', 'image/png');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `ID` int(11) NOT NULL,
  `navn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `ID` int(11) NOT NULL,
  `fornavn` varchar(50) NOT NULL,
  `efternavn` varchar(50) NOT NULL,
  `fodselsdato` date NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `postnr` int(5) NOT NULL,
  `city` varchar(20) NOT NULL,
  `oprettet` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tlf` int(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `profil`
--

INSERT INTO `profil` (`ID`, `fornavn`, `efternavn`, `fodselsdato`, `adresse`, `postnr`, `city`, `oprettet`, `tlf`) VALUES
(5, 'jajaja', 'jajaja', '2016-09-09', 'jajajavej 22', 2222, 'jajajaby', '2017-05-29 10:59:32', 22222222),
(6, 'lelelelel', 'lelelelel', '1843-07-04', 'fejaiofjda', 2388, 'jfaduhfasuid', '2017-05-29 10:59:32', 48239423),
(7, 'Test', 'Medarbejder', '2012-08-04', 'hdufahdsi', 4892, 'rjdiahru', '2017-05-29 10:59:32', 23849232),
(8, 'Nikolaj', 'Pregaard', '1997-07-09', 'Gyldenrisvej 52 2th', 2300, 'KÃ¸benhavn S', '2017-05-29 10:59:32', 22744460),
(9, 'Normal', 'Admin', '2017-05-24', 'Administrationsvej 22', 2300, 'Adminby', '2017-05-29 10:59:32', 48237423),
(10, 'Super', 'Admin', '2017-05-24', 'SuperAdminVej', 9999, 'SuperAdminBy', '2017-05-29 10:59:32', 99999999),
(11, 'Nikolaj', 'Pregaard', '1997-07-09', 'Gyldenrisvej 52 2th', 2300, 'KÃ¸benhavn S', '2017-05-29 11:19:53', 22),
(12, 'Nikolaj', 'Pregaard', '1997-07-09', 'Gyldenrisvej 52 2th', 2300, 'KÃ¸benhavn S', '2017-05-29 11:21:03', 22744460),
(13, 'Nikolaj', 'Pregaard', '1997-07-09', 'Gyldenrisvej 52 2th', 2300, 'KÃ¸benhavn S', '2017-05-29 11:21:59', 22744460),
(14, 'Nikolaj', 'Pregaard', '1997-07-09', 'Gyldenrisvej 52 2th', 2300, 'KÃ¸benhavn S', '2017-05-29 11:23:55', 22744460),
(15, 'Nikolaj', 'Pregaard', '1997-07-09', 'Gyldenrisvej 52 2th', 2300, 'KÃ¸benhavn S', '2017-05-29 11:24:42', 22744460),
(16, 'Nikolaj', 'Pregaard', '1997-07-09', 'Gyldenrisvej 52 2th', 2300, 'KÃ¸benhavn S', '2017-05-29 11:25:30', 22744460);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sider`
--

CREATE TABLE IF NOT EXISTS `sider` (
  `ID` int(11) NOT NULL,
  `overskrift` varchar(20) NOT NULL,
  `tekst` text NOT NULL,
  `billede` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `stilarter`
--

CREATE TABLE IF NOT EXISTS `stilarter` (
  `ID` int(11) NOT NULL,
  `navn` varchar(20) NOT NULL,
  `beskrivelse` text NOT NULL,
  `billede` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `aldersgrupper`
--
ALTER TABLE `aldersgrupper`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `brugere`
--
ALTER TABLE `brugere`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `brugerroller`
--
ALTER TABLE `brugerroller`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `deltagere`
--
ALTER TABLE `deltagere`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `hold`
--
ALTER TABLE `hold`
  ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `holdnummer` (`holdnummer`);

--
-- Indeks for tabel `instruktorer`
--
ALTER TABLE `instruktorer`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `sider`
--
ALTER TABLE `sider`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `stilarter`
--
ALTER TABLE `stilarter`
  ADD PRIMARY KEY (`ID`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `aldersgrupper`
--
ALTER TABLE `aldersgrupper`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `brugere`
--
ALTER TABLE `brugere`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Tilføj AUTO_INCREMENT i tabel `brugerroller`
--
ALTER TABLE `brugerroller`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `deltagere`
--
ALTER TABLE `deltagere`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `hold`
--
ALTER TABLE `hold`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `instruktorer`
--
ALTER TABLE `instruktorer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `media`
--
ALTER TABLE `media`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `niveau`
--
ALTER TABLE `niveau`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `profil`
--
ALTER TABLE `profil`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- Tilføj AUTO_INCREMENT i tabel `sider`
--
ALTER TABLE `sider`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `stilarter`
--
ALTER TABLE `stilarter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
