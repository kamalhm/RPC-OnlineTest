-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2018 at 12:50 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sister`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(10) NOT NULL,
  `password_admin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` varchar(10) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relasi_mengupload`
--

CREATE TABLE `relasi_mengupload` (
  `id_upload` varchar(10) NOT NULL,
  `id_admin` varchar(10) NOT NULL,
  `id_soal` varchar(10) NOT NULL,
  `tanggal_upload` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `soal_materi`
--

CREATE TABLE `soal_materi` (
  `id_soal` varchar(10) NOT NULL,
  `soal` varchar(2000) DEFAULT NULL,
  `kunci_jawaban` varchar(1) DEFAULT NULL,
  `option_a` varchar(2000) DEFAULT NULL,
  `option_b` varchar(2000) DEFAULT NULL,
  `option_c` varchar(2000) DEFAULT NULL,
  `option_d` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `soal_peserta`
--

CREATE TABLE `soal_peserta` (
  `id_soalpeserta` varchar(10) NOT NULL,
  `kunci_jawaban_peserta` varchar(1) DEFAULT NULL,
  `id_peserta` varchar(10) NOT NULL,
  `id_soal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- Indexes for table `relasi_mengupload`
--
ALTER TABLE `relasi_mengupload`
  ADD PRIMARY KEY (`id_upload`),
  ADD KEY `relasi_mengupload_admin_fk` (`id_admin`),
  ADD KEY `relasi_mengupload_Soal_Materi_FK` (`id_soal`);

--
-- Indexes for table `soal_materi`
--
ALTER TABLE `soal_materi`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `soal_peserta`
--
ALTER TABLE `soal_peserta`
  ADD PRIMARY KEY (`id_soalpeserta`),
  ADD KEY `soal_peserta_fk1` (`id_peserta`) USING BTREE,
  ADD KEY `soal_peserta_fk2` (`id_soal`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi_mengupload`
--
ALTER TABLE `relasi_mengupload`
  ADD CONSTRAINT `relasi_mengupload_Soal_Materi_FK` FOREIGN KEY (`id_soal`) REFERENCES `soal_materi` (`id_soal`),
  ADD CONSTRAINT `relasi_mengupload_admin_fk` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
