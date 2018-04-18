-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2018 at 08:14 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `nama_admin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`) VALUES
('11', 'ftr');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` varchar(10) NOT NULL,
  `nama_peserta` varchar(255) DEFAULT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `nama_peserta`, `nilai`) VALUES
('01', 'victor', 0),
('02', 'fathur', 0),
('03', 'kamal', 0),
('04', 'vina', 0),
('05', 'uti', 0),
('06', 'chlau', 0),
('07', 'abc', 0);

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
-- Table structure for table `relasi_random`
--

CREATE TABLE `relasi_random` (
  `id_random` varchar(10) NOT NULL,
  `id_upload` varchar(10) NOT NULL,
  `id_soalpeserta` varchar(10) NOT NULL
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

--
-- Dumping data for table `soal_materi`
--

INSERT INTO `soal_materi` (`id_soal`, `soal`, `kunci_jawaban`, `option_a`, `option_b`, `option_c`, `option_d`) VALUES
('AA01', 'I and my friends(isi disini) in the library. We read some books', 'd', 'am', 'is', 'have', 'are'),
('AA02', 'She (isi disini) not work because she has the flu', 'b', 'is', 'does', 'do ', 'be'),
('AA03', 'Alina (isi disini) song every night.', 'a', 'sings', 'sing', 'is ', 'does'),
('AA04', 'My father (isi disini) tea every morning.', 'b', 'drink', 'drinks', 'drinking', 'is'),
('AA05', 'They (isi disini) a test every week.', 'd', 'does', 'has', 'are', 'have'),
('AA06', 'Dolph: Please call me if you need.   Jack: No. I (isi disini) need your help.', 'a', 'do not', 'does', 'not', 'am not'),
('AA07', 'She is a student. She (isi disini) at school.', 'c', 'studying', 'study', 'studies', 'does'),
('AA08', 'We (isi disini) soccer match.', 'd', 'doing', 'watching', 'watches', 'watch'),
('AA09', 'Gina cooks fried rice. It (isi disini) amazing.', 'd', 'does', 'does', 'are', 'is'),
('AA10', 'My brother rides a bike to school (isi disini)', 'a', 'everyday', 'last day', 'next week', 'next time'),
('AA11 ', 'Tomy, Jane, Mark, Sarah (isi disini). smart students.', 'b', 'is', 'are', 'am', 'is not'),
('AA12', 'Are you a doctor? No, I (isi disini). a dentist.', 'c', 'am not', 'do not', 'am', 'was'),
('AA13', 'we(isi disini).smart students.', 'a', 'are', 'is ', 'is not', 'am'),
('AA14', 'Father (isi disini). a car but he(isi disini).it very often.', 'b', 'does not have', 'has- does not drive', 'had-does not drive', 'has  is not driving'),
('AA15', '(isi disini). your brother and sister (isi disini). four languages?', 'd', 'Did-speak', 'Does-speak', 'Do-speaks', 'Do-speak'),
('AA16', 'Bobs niece is very cute. (isi disini).name is Mia.', 'a', 'her', 'his', 'he', 'she'),
('AA17', 'Most of us(isi disini).24 SKS this semester', 'c', 'to take', 'are be taking', 'are taking', 'be taking'),
('AA18', 'What are they doing right now?', 'c', 'They are doing swimming.', 'They swim right now.', 'They are swimming.', 'They usually go swimming.'),
('AA19', '(isi disini). You and Nanang at cafe last night?', 'a', 'were', 'did', 'are', 'do'),
('AA20', 'What is he doing in the garden?', 'd', 'He is watching TV', 'He is playing cards.', 'He is eating.', 'He is planting flowers.'),
('AA21', 'Mega cant come to the conference right now because she(isi disini). her little baby.', 'b', 'taking care of', 'is taking care of', 'is takes care of', 'be taking care of'),
('AA22', 'It is still raining now outside. Therefore, the riders (isi disini). their rain coat.', 'a', 'are wearing', 'will wearing', 'is wearing', 'have wearing'),
('AA23', 'Are you a pilot?Yes, I (isi disini). a flight attendant.', 'c', 'no', 'am not', 'am', 'was'),
('AA24', 'Dina (isi disini).. her little brother to buy her some foods at the moment.', 'b', 'askes', 'am', 'asked', 'asks'),
('AA25', 'What time does your brother get up?', 'b', 'He get up at 5 am.', 'He always gets up at 5 am.', 'He usually got up at 5 am.', 'She always gets up at 5 am.'),
('AA26', 'The baby (isi disini) for three hours.', 'b', 'has sleeping', 'has slept', 'has sleep', 'has been slept'),
('AA27', 'Someone (isi disini) the door now. We are not in the living room.', 'c', 'are knocking', 'knock', 'is knocking', 'knocked'),
('AA28', '(isi disini). You and Ahmed at the library last night?', 'a', 'were', 'did', 'are', 'do'),
('AA29', 'My older sister receives a lot of flowers (isi disini).', 'c', 'now', 'tomorrow', 'every february', 'yesterday'),
('AA30', 'Where did you buy your new book last night?', 'c', 'i sold it in Gramedia', 'i borrowed it from my friend', 'i bought it in fajar agung', 'i took it in ramayana'),
('AA31', 'Carmen and I (isi disini) the lunch yet. So, we are very hungry now.', 'd', 'have not eat', 'have not eating', 'have eaten', 'have not eaten'),
('AA32', 'Why didnt you answer my phone last night? Sorry, I (isi disini). out to meet my lecturer, and I left my mobile phone at home.', 'c', 'go', 'am gooing', 'went', 'have gone'),
('AA33', 'Sam (isi disini). a very terrible accident on the avenue yesterday.', 'b', 'to see', 'saw', 'being saw', 'is seen'),
('AA34', 'What did you do two hours ago? (isi disini).', 'a', 'i watched tv', 'i will study english', 'i am reading a book', 'i have breakfast'),
('AA35', 'My uncle (isi disini). me a modern laptop last new year.', 'a', 'bought', 'was bought', 'have bought', 'to bought'),
('AA36', 'Desi, Mitha, and Nina (isi disini). here for ten years', 'c', 'been', 'being have', 'have been', 'be have been'),
('AA37', 'They have known each other since (isi disini).', 'c', 'two days', 'tomorrow', '2003', 'three years'),
('AA38', 'Ms. Jenifer (isi disini). a lot of novels since she was a teenager.', 'b', 'has being read', 'has read', 'has been read', 'has readed'),
('AA39', 'Are you and your sister going to (isi disini). the movie tonight?No, we are not. We are very busy this evening.', 'n', 'come', 'to see', 'play', 'theater'),
('AA40', 'I think (isi disini). come at the meeting tomorrow.', 'a', 'i will', 'i will to', 'i will be going to', 'i will to going to'),
('AA41', 'The person on the bench (isi disini) Barbara.', 'b', 'are', 'is', 'has', 'does'),
('AA42', 'She (isi disini). long brown hair.', 'a', 'has', 'have', 'had', 'is'),
('AA43', 'She (isi disini) smart person.', 'b', 'does', 'is', 'are', 'am'),
('AA44', 'Shes an accountant. She (isi disini). for the government.', 'b', 'working', 'works', 'work', 'worked'),
('AA45', 'She (isi disini).. an hour for lunch every day.', 'a', 'has', 'have', 'had', 'none'),
('AA46', 'She often (isi disini). Lunch in the Park.', 'a', 'eats', 'eating', 'ate', 'ating'),
('AA47', 'She usually (isi disini). a sandwich and some fruits with her to the park.', 'c', 'bringing', 'broughting', 'brings', 'bring'),
('AA48', 'She usually (isi disini). on a bench but she (isi disini) sitting on the grass.', 'c', 'sits; is not liking', 'sit; is not liking', 'sits; does not like', 'sit; is not like'),
('AA49', 'While shes at the park, she (isi disini) people and animals.', 'b', 'watch', 'watches', 'watching', 'has watching'),
('AA50', 'She (isi disini) Joggers and squirrels when she (isi disini). at the park.', 'a', 'is seeing; eats', 'are seeing; eats', 'are seeing; eating', 'is seeing; eating'),
('AA51', 'Tomy, Jane, Mark, Sarah (isi disini). smart students.', 'b', 'is', 'are', 'am', 'is not'),
('AA52', 'Are you a doctor? No, I (isi disini). a dentist.', 'n', 'am not', 'do not', 'am', 'was'),
('AA53', '(isi disini). your brother and sister (isi disini). four languages?', 'a', 'did-speak', 'does-speak', 'do-speaks', 'do-speak'),
('AA54', 'Bobs niece is very cute. (isi disini).name is Mia.', 'a', 'her', 'his', 'he', 'she'),
('AA55', 'Most of us(isi disini).24 SKS this semester.', 'c', 'to take', 'are be taking', 'are taking', 'be taking'),
('AA56', 'What are they doing right now?', 'c', 'they are doing swimming', 'they swim right now ', 'they are swimming', 'they usually go swimming'),
('AA57', 'What is he doing in the garden?', 'd', 'he is watching TV', 'he is playing cards', 'he is eating', 'he is planting flowers'),
('AA58', 'Mega cant come to the conference right now because she(isi disini). her little baby.', 'b', 'taking care of', 'is taking care of', 'is takes care of', 'be taking care of'),
('AA59', 'It is still raining now outside. Therefore, the riders (isi disini). their rain coat.', 'a', 'aare wearing', 'will wearing', 'is wearing', 'have wearing'),
('AA60', 'Dina (isi disini)(isi disini).. her little brother to buy her some foods at the moment.', 'b', 'askes', 'is asking', 'asked', 'asks'),
('AA61', 'What time does your brother get up?', 'a', 'he get up at 5 am', 'he always gets up at 5 am', 'he usually got up at 5 am', 'she always gets up at 5 am'),
('AA62', 'Father (isi disini). a car but he(isi disini).it very often.', 'b', 'does not have', 'has-does not drive', 'had-does not drive', 'has-is not driving'),
('AA63', 'The baby (isi disini)(isi disini). for three hours.', 'd', 'has sleeping', 'has slept', 'has sleep', 'has been slept'),
('AA64', 'Someone (isi disini) the door now. We are not in the living room.', 'b', 'are knocking', 'knock', 'is knocking ', 'knocked'),
('AA65', '(isi disini). You and Ahmed at the library last night?', 'a', 'were', 'did', 'are', 'do'),
('AA66', 'My older sister receives a lot of flowers (isi disini).', 'a', 'now', 'tomorrow', 'every February', 'yesterday'),
('AA67', 'Carmen and I (isi disini) the lunch yet. So, we are very hungry now.', 'd', 'have not eat', 'have not eating', 'have eaten', 'have not eaten '),
('AA68', 'Sam (isi disini). a very terrible accident on the avenue yesterday.', 'b', 'to see', 'saw', 'being saw', 'is seen'),
('AA69', 'What did you do two hours ago? (isi disini).', 'a', 'i watched tv', 'i will study english', 'i am reading a book', 'i have breakfast'),
('AA70', 'My uncle (isi disini). me a modern laptop last new year.', 'a', 'bought', 'was bought', 'have bought', 'to bought'),
('AA71', 'Desi, Mitha, and Nina (isi disini). here for ten years.', 'c', 'been', 'being have', 'have been', 'be have been'),
('AA72', 'They have known each other since (isi disini).', 'c', 'two days', 'tomorrow', '2003', 'three years'),
('AA73', 'Ms. Jenifer (isi disini). a lot of novels since she was a teenager.', 'c', 'has being read', 'has read', 'has been read', 'has readed'),
('AA74', 'I think (isi disini). come at the meeting tomorrow.', 'c', 'i will', 'i will to', 'i will be going to', 'i will to going to'),
('AA75', '(isi disini) do you do? Im a salesclerk.', 'c', 'how', 'who', 'what', 'what is'),
('AA76', 'What is Joni doing? He (isi disini) lemonade.', 'b', 'drinks', 'is drinking', 'drinking', 'drank'),
('AA77', 'The students (isi disini) studying computer now because their teacher is sick.', 'a', 'are not', 'is not', 'do not', 'are'),
('AA78', 'Sandra and Robin(isi disini) and talking.', 'd', 'is standing', 'is stand', 'stand', 'are standing'),
('AA79', 'Where (isi disini) your father work every day?', 'b', 'are', 'does', 'is', 'do'),
('AA80', 'The daily workers (isi disini) receive their salary every month.', 'a', 'do not', 'are not', 'did not', 'does not'),
('AA81', 'What time (isi disini) you go to campus every morning? We go to campus at 7 oclock.', 'b', 'are', 'do', 'were', 'did'),
('AA82', 'Mike usually (isi disini)a job at the post office every summer.', 'a', 'has', 'haves', 'have', 'does not'),
('AA83', 'The sun always (isi disini) in my bedroom window every morning.', 'c', 'shine', 'shining', 'shines', 'is shines'),
('AA84', '(-) Mary (isi disini)her dirty dishes on the table after having lunch.', 'c', 'is not leave', 'do not leave', 'does not leaves', 'does not leave'),
('AA85', 'Mr. Wilson drinks two cups of coffee, but his wife(isi disini) coffee.', 'c', 'is not drink', 'does not drinks', 'does not drink', 'do not drink'),
('AA86', 'What time (isi disini) the first train leave to Jakarta today?', 'd', 'do', 'is', 'are', 'does'),
('AA87', 'What kind of TV program did you watch last night? I (isi disini) world news on RCTI.', 'c', 'was watching', 'watching', 'watched', 'watch'),
('AA88', '(isi disini) the children in the museum yesterday afternoon?', 'b', 'did', 'were', 'are', 'was'),
('AA89', '(isi disini) you and your son go cinema last night?', 'a', 'were', 'was', 'did', 'do'),
('AA90', 'Dian (isi disini) the bus to school every day. She walks to school with her neighbor.', 'a', 'does not take', 'do not take', 'is not take', 'is not take'),
('AA91', 'Marilyn usually has bread for her breakfast, but she (isi disini). bread tomorrow morning.', 'd', 'is not have', 'will be', 'has not', 'will not have'),
('AA92', 'Look at those black clouds. It (isi disini) rain.', 'a', 'will not', 'is', 'will', 'are'),
('AA93', '(isi disini) your son left to school already?', 'a', 'has', 'had', 'are', 'is'),
('AA94', 'Some new employees (isi disini) in the meeting room since yesterday.', 'a', 'have been', 'has been', 'have', 'has'),
('AA95', 'Dennis (isi disini) to office yet.', 'd', 'does not', 'do not come', 'did not come', 'has not come'),
('AA96', 'The secretary (isi disini) some daily reports since this morning.', 'b', 'types', 'has typed', 'has typinig', 'typed'),
('AA97', '(isi disini) her children drawn this painting?', 'a', 'has', 'did', 'have', 'does'),
('AA98', 'How long (isi disini) your father (isi disini) in that company?', 'a', 'have/working', 'has/working', 'has/worked', 'has been/worked'),
('AA99', 'Bill knows Paris very well, He (isi disini) to there for many times.', 'd', 'has going', 'has go', 'have gone', 'has gone'),
('AB01', 'The students ((isi disini) in the library now. They are reading books.', 'a', 'are', 'is', 'do', 'were');

-- --------------------------------------------------------

--
-- Table structure for table `soal_peserta`
--

CREATE TABLE `soal_peserta` (
  `id_soalpeserta` varchar(10) NOT NULL,
  `kunci_jawaban_peserta` varchar(1) DEFAULT NULL,
  `id_peserta` varchar(10) NOT NULL
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
-- Indexes for table `relasi_random`
--
ALTER TABLE `relasi_random`
  ADD PRIMARY KEY (`id_random`),
  ADD KEY `relasi_rendom_relasi_mengupload_fk` (`id_upload`),
  ADD KEY `relasi_rendom_soal_peserta_fk` (`id_soalpeserta`);

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
  ADD UNIQUE KEY `soal_peserta_fk1` (`id_peserta`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi_mengupload`
--
ALTER TABLE `relasi_mengupload`
  ADD CONSTRAINT `relasi_mengupload_Soal_Materi_FK` FOREIGN KEY (`id_soal`) REFERENCES `soal_materi` (`id_soal`),
  ADD CONSTRAINT `relasi_mengupload_admin_fk` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `relasi_random`
--
ALTER TABLE `relasi_random`
  ADD CONSTRAINT `relasi_rendom_relasi_mengupload_fk` FOREIGN KEY (`id_upload`) REFERENCES `relasi_mengupload` (`id_upload`),
  ADD CONSTRAINT `relasi_rendom_soal_peserta_fk` FOREIGN KEY (`id_soalpeserta`) REFERENCES `soal_peserta` (`id_soalpeserta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
