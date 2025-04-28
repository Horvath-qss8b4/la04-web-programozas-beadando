-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Ápr 28. 15:22
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `konyv`
--
CREATE DATABASE konyv;
USE konyv;
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `Kategoria_id` int(3) NOT NULL,
  `Kategoria` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`Kategoria_id`, `Kategoria`) VALUES
(1, 'szakirodalom'),
(2, 'tudományos'),
(3, 'ismeretterjesztő'),
(4, 'regény'),
(5, 'filozófiai');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kiadok`
--

CREATE TABLE `kiadok` (
  `Kiado_id` int(3) NOT NULL,
  `Kiado` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `kiadok`
--

INSERT INTO `kiadok` (`Kiado_id`, `Kiado`) VALUES
(1, 'Wiley'),
(2, 'Penguin'),
(3, 'HarperCollins'),
(4, 'Springer'),
(5, 'Orient Blackswan'),
(6, 'CRC'),
(7, 'Apress'),
(8, 'Random House'),
(9, 'Bodley Head'),
(10, 'MIT Press'),
(11, 'O\'Reilly'),
(12, 'HBA'),
(13, 'Rupa'),
(14, 'Transworld'),
(15, 'Pan'),
(16, 'Hyperion'),
(17, 'Pocket'),
(18, 'Mauj'),
(19, 'BBC'),
(20, 'Elsevier'),
(21, 'Pearson'),
(22, 'Prentice Hall'),
(23, 'TMH'),
(24, 'Picador'),
(25, 'vikas'),
(26, 'Routledge'),
(27, 'FreePress'),
(28, 'Jaico'),
(29, 'Vintage'),
(30, 'HighStakes'),
(31, 'Simon&Schuster'),
(32, 'Fontana'),
(33, 'Dell');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `konyvek`
--

CREATE TABLE `konyvek` (
  `Id` int(3) NOT NULL,
  `Cim` varchar(255) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `Szerzo` varchar(255) NOT NULL,
  `Kategoria_id` int(3) DEFAULT NULL,
  `Ar` int(5) DEFAULT NULL,
  `Kiado_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `konyvek`
--

INSERT INTO `konyvek` (`Id`, `Cim`, `Szerzo`, `Kategoria_id`, `Ar`, `Kiado_id`) VALUES
(1, 'A hullámok alapjai', 'Goswami Jaideva', 1, 8446, 1),
(2, 'Data Smart', 'Foreman John', 1, 8636, 1),
(3, 'Isten teremtette az egész számokat', 'Hawking Stephen', 1, 6132, 2),
(4, 'Szuperfreakonomika', 'Dubner Stephen', 2, 9069, 3),
(5, 'Orientalizmus', 'Said Edward', 3, 1978, 2),
(6, 'A statisztikai tanuláselmélet természete', 'Vapnik Vladimir', 1, 8846, 4),
(7, 'Az indiai államok integrációja', 'Menon V P', 3, 1519, 5),
(8, 'Drunkard\'s Walk', 'Mlodinow Leonard', 2, 5994, 2),
(9, 'Képfeldolgozás és matematikai morfológia', 'Shih Frank', 1, 5463, 6),
(10, 'Hogyan gondolkodjunk úgy mint Sherlock Holmes', 'Konnikova Maria', 3, 4269, 2),
(11, 'Adattudósok munkában', 'Sebastian Gutierrez', 1, 6814, 7),
(12, 'Ötös vágóhíd', 'Vonnegut Kurt', 4, 7667, 8),
(13, 'Egy tétel születése', 'Villani Cedric', 2, 8751, 9),
(14, 'Számítógépes programok felépítése és értelmezése', 'Sussman Gerald', 1, 8935, 10),
(15, 'Age of Wrath', 'Eralybraham', 3, 6028, 2),
(16, 'A per', 'Kafka Frank', 4, 1534, 8),
(17, 'Statisztikai döntéselmélet”', 'Pratt John', 1, 1771, 10),
(18, 'Adatbányászati ??kézikönyv', 'Nisbet Robert', 1, 9854, 7),
(19, 'Új Machiavelli', 'Wells H. G.', 4, 7042, 2),
(20, 'Fizika és filozófia', 'Heisenberg Werner', 5, 2920, 2),
(21, 'Szoftver készítés', 'Oramndy', 1, 2436, 11),
(22, 'Elemzés I. kötet', 'Tao Terence', 1, 6266, 12),
(23, 'Gépi tanulás hackereknek', 'Conway Drew', 1, 9954, 11),
(24, 'Jel és a zaj', 'Silver Nate', 1, 5639, 2),
(25, 'Python adatelemzéshez', 'McKinney Wes', 1, 9038, 11),
(26, 'Bevezetés az algoritmusokba', 'Cormen Thomas', 1, 8945, 10),
(27, 'Szép és átkozott', 'Deb Siddhartha', 3, 4813, 2),
(28, 'Kívülálló', 'Camuslbert', 4, 3595, 2),
(29, 'Teljes Sherlock Holmes - Vol I', 'Doylerthur Conan', 4, 2402, 8),
(30, 'Teljes Sherlock Holmes - Vol II', 'Doylerthur Conan', 4, 2870, 8),
(31, 'Nemzetek gazdagsága', 'Smithdam', 2, 4488, 8),
(32, 'A Föld oszlopai', 'Follett Ken', 4, 2489, 8),
(33, 'Mein Kampf', 'Hitlerdolf', 3, 8237, 13),
(34, 'Tao of Physics', 'Capra Fritjof', 2, 1360, 2),
(35, 'Biztosan viccel Mr. Feynman', 'Feynman Richard', 2, 1945, 8),
(36, 'Búcsút fegyvertől', 'Hemingway Ernest', 4, 8028, 13),
(37, 'Veterán', 'Forsyth Frederick', 4, 5570, 14),
(38, 'Hamis benyomások', 'Archer Jeffery', 4, 8047, 15),
(39, 'Utolsó előadás', 'Pausch Randy', 3, 2382, 16),
(40, 'A primitív visszatérése', 'Randyn', 5, 9078, 2),
(41, 'Jurassic Park', 'Crichton Michael', 4, 5439, 8),
(42, 'Orosz folyóirat', 'Steinbeck John', 3, 3561, 2),
(43, 'A rejtély és a képzelet meséi', 'Poe Edgar Allen', 4, 4806, 3),
(44, 'Freakonomics', 'Dubner Stephen', 2, 7046, 2),
(45, 'Rejtett kapcsolatok', 'Capra Fritjof', 2, 1562, 3),
(46, 'A filozófia története', 'Durant Will', 5, 7829, 17),
(47, 'Asami Asami', 'Deshpande P L', 4, 8142, 18),
(48, 'Egy 4 folyóirata', 'Steinbeck John', 4, 4425, 2),
(49, 'Volt egyszer egy háború', 'Steinbeck John', 3, 8687, 2),
(50, 'A Hold leszáll', 'Steinbeck John', 4, 5107, 2),
(51, 'Testvérek', 'Grisham John', 4, 2685, 8),
(52, 'Egy szabad államban', 'Naipaul V. S.', 4, 6016, 13),
(53, 'Fogás 22', 'Heller Joseph', 4, 7054, 8),
(54, 'Complete Mastermind', 'BBC', 3, 9206, 19),
(55, 'Dylan Dylanon', 'Dylan Bob', 3, 4612, 8),
(56, 'Lágy számítás1nika és intelligens rendszerek', 'Gupta Madan', 1, 6107, 20),
(57, 'Gazdaságelméleti tankönyv', 'Stonierlfred', 1, 7574, 21),
(58, 'Ökonometriai elemzés', 'Greene W. H.', 1, 2490, 21),
(59, 'OpenCV tanulása', 'Bradsky Gary', 1, 5196, 11),
(60, 'Adatstruktúrák C & C++ használatával', 'Tanenbaumndrew', 1, 9857, 22),
(61, 'Számítógépes látás modern megközelítés', 'Forsyth David', 1, 8512, 21),
(62, 'A kommunikációs rendszerek alapelvei', 'Taub Schilling', 1, 2183, 23),
(63, 'Hadd legyen C', 'Kanetkar Yashwant', 1, 1948, 22),
(64, 'Szamarkand amulettje', 'Stroud Jonathan', 4, 1637, 8),
(65, 'Bűn és büntetés', 'Dostoevsky Fyodor', 4, 9469, 2),
(66, 'Angyalok és démonok', 'Brown Dan', 4, 4851, 8),
(67, 'Érvelő indiai', 'Senmartya', 3, 8384, 24),
(68, 'Pipacsok tengere', 'Ghoshmitav', 4, 8235, 2),
(69, 'Az igazságosság eszméje', 'Senmartya', 5, 6435, 2),
(70, 'Mazsola a napon', 'Hansberry Lorraine', 4, 1869, 2),
(71, 'Az elnök összes embere', 'Woodward Bob', 3, 5253, 8),
(72, 'születési fogoly', 'Archer Jeffery', 4, 7360, 15),
(73, 'Gombóc!', 'Nayar Kuldip', 3, 8788, 3),
(74, 'Ahe Manohar Tari', 'Deshpande Sunita', 3, 1523, 18),
(75, 'Utolsó mogul', 'Dalrymple William', 3, 9698, 2),
(76, 'Social Choice & Welfare 39. kötet 1. szám', 'Various', 1, 5618, 4),
(77, 'Radiowaril Bhashane és Shrutika', 'Deshpande P L', 3, 2365, 18),
(78, 'Gun Gayin Awadi', 'Deshpande P L', 3, 2479, 18),
(79, 'Aghal Paghal', 'Deshpande P L', 3, 5271, 18),
(80, 'Maqta-e-Ghalib', 'Garg Sanjay', 3, 7787, 18),
(81, 'Beyond Degrees', 'Garg Sanjay', 5, 1567, 3),
(82, 'Manasa', 'Kale V P', 3, 2835, 18),
(83, 'India éjféltől a millenniumig', 'Tharoor Shashi', 3, 7452, 2),
(84, 'A világ legnagyobb próbatételei', 'Tharoor Shashi', 3, 2929, 2),
(85, 'Nagy indiai 4', 'Tharoor Shashi', 4, 9256, 2),
(86, 'Ó Jeruzsálem!', 'Lapierre Dominique', 3, 3183, 25),
(87, 'Öröm városa', 'Lapierre Dominique', 4, 6154, 25),
(88, 'Szabadság éjfélkor', 'Lapierre Dominique', 3, 9961, 25),
(89, 'Elégedetlenségünk téle', 'Steinbeck John', 4, 5558, 2),
(90, 'Az oktatásról', 'Russell Bertrand', 5, 7781, 26),
(91, 'Szabad akarat', 'Harris Sam', 3, 3455, 27),
(92, 'Könyv nélkül Bagdadban', 'Tharoor Shashi', 3, 8160, 2),
(93, 'A sánta kanári esete', 'Gardner Earle Stanley', 4, 1351, 2),
(94, 'Mindennek elmélete', 'Hawking Stephen', 2, 4192, 28),
(95, 'Új piacok és egyéb esszék', 'Drucker Peter', 2, 7418, 2),
(96, 'Elektromos Univerzum', 'Bodanis David', 2, 7484, 2),
(97, 'Púpos a Notre Dame', 'Hugo Victor', 4, 8226, 8),
(98, 'Burning Bright', 'Steinbeck John', 4, 5990, 2),
(99, 'A diszkontuinitás kora', 'Drucker Peter', 3, 2800, 8),
(100, 'Doktor az aktban', 'Gordon Richard', 4, 6571, 2),
(101, 'Le és ki Párizsban és Londonban', 'Orwell George', 3, 6327, 2),
(102, 'Identitás és erőszak', 'Senmartya', 5, 5280, 2),
(103, 'A három tengeren túl', 'Dalrymple William', 3, 9745, 8),
(104, 'A világ legnagyobb novellái', 'Dalrymple William', 4, 6691, 28),
(105, 'Egyenesen beszél', 'Iacoca Lee', 3, 4175, 28),
(106, 'Maugham összegyűjtött novellái 3. kötet', 'Maugham William S', 4, 6598, 29),
(107, 'Manhattan fantomja', 'Forsyth Frederick', 4, 7898, 29),
(108, 'Ashenden a brit ügynöktől', 'Maugham William S', 4, 5679, 29),
(109, 'Zen és a motorkerékpár-karbantartás művészete', 'Pirsig Robert', 5, 2997, 29),
(110, 'Nagy háború a civilizációért', 'Fisk Robert', 3, 4596, 3),
(111, 'Mi az Élő', 'Randyn', 4, 9771, 2),
(112, 'Művész és matematikus', 'Aczelmir', 2, 1753, 30),
(113, 'A nyugati filozófia története', 'Russell Bertrand', 5, 2252, 26),
(114, 'Válogatott novellák', 'Russell Bertrand', 4, 8577, 28),
(115, 'Racionalitás és szabadság', 'Senmartya', 2, 9646, 4),
(116, 'Civilizációk összecsapása és a világrend újraalkotása', 'Huntington Samuel', 3, 5849, 31),
(117, 'Nem mindennapi bölcsesség', 'Capra Fritjof', 3, 3313, 32),
(118, 'Egy', 'Bach Richard', 3, 1905, 33),
(119, 'Karl Marx életrajza', 'Bach Richard', 3, 4294, 33),
(120, 'Uramnak Szeretettel', 'Braithwaite', 4, 4165, 2),
(121, 'Half A Life', 'Naipaul V S', 4, 6538, 2),
(122, 'India felfedezése', 'Nehru Jawaharlal', 3, 6992, 2),
(123, 'Apulki', 'Deshpande P L', 3, 6666, 2),
(124, 'Népszerűtlen esszék', 'Russell Bertrand', 5, 9738, 2),
(125, 'Megtévesztő', 'Forsyth Frederick', 4, 2976, 2),
(126, 'Fátyol: A CIA titkos háborúi', 'Woodward Bob', 3, 4074, 2),
(127, 'Char Shabda', 'Deshpande P L', 3, 4935, 2),
(128, 'Rosy a rokonom', 'Durrell Gerald', 4, 2973, 2),
(129, 'Moon and Sixpence', 'Maugham William S', 4, 5412, 2),
(130, 'Politikai filozófusok', 'Maugham William S', 5, 3806, 2),
(131, 'A világ rövid története', 'Wells H G', 3, 9084, 2),
(132, 'Egy levél remegése', 'Maugham William S', 4, 7689, 2),
(133, 'Orvos az agyon', 'Gordon Richard', 4, 9781, 2),
(134, 'Simpson családok és matematikai titkaik', 'Singh Simon', 2, 9697, 2),
(135, 'Minta osztályozás', 'Duda Hart', 1, 8779, 2),
(136, 'Bejrúttól Jeruzsálemig', 'Friedman Thomas', 3, 5938, 2),
(137, 'Kódkönyv', 'Singh Simon', 2, 9641, 2),
(138, 'Age of the Warrior', 'Fisk Robert', 3, 3494, 2),
(139, 'Végső válság', 'Fisk Robert', 4, 4737, 2),
(140, 'Killing Joke', 'Fisk Robert', 4, 7786, 2),
(141, 'Lobbanáspont', 'Fisk Robert', 4, 5624, 2),
(142, 'Batman Earth One', 'Fisk Robert', 4, 2552, 2),
(143, 'Válság a végtelen földeken', 'Fisk Robert', 4, 7471, 2),
(144, 'Numbers Behind Numb3rs', 'Devlin Keith', 2, 6497, 2),
(145, 'Superman Earth One – 1', 'Devlin Keith', 4, 5324, 2),
(146, 'Superman Earth One – 2', 'Devlin Keith', 4, 5547, 2),
(147, 'Igazság Ligája: Atlantisz trónja', 'Devlin Keith', 4, 8351, 2),
(148, 'Justice League: A gazember utazása', 'Devlin Keith', 4, 4843, 2),
(149, 'Superman halála', 'Devlin Keith', 4, 5473, 2),
(150, 'A DC Univerzum története', 'Devlin Keith', 4, 9134, 2),
(151, 'Batman: A hosszú Halloween', 'Devlin Keith', 4, 7972, 2),
(152, 'Élet levelekben', 'Steinbeck John', 3, 6483, 2),
(153, 'Információk', 'Gleick James', 2, 8948, 2),
(154, 'Journal of Economics 106. évf. 3. szám', 'Gleick James', 2, 6351, 2),
(155, 'Az információelmélet elemei', 'Thomas Joy', 1, 4713, 2),
(156, 'Teljesítményelektronika – Rashid', 'Rashid Muhammad', 1, 3920, 2),
(157, 'Teljesítményelektronika – Mohan', 'Mohan Ned', 1, 9781, 2),
(158, 'Neurális hálózatok', 'Haykin Simon', 1, 3044, 2),
(159, 'Grapes of Wrath', 'Steinbeck John', 4, 8926, 2),
(160, 'Vyakti ani Valli', 'Deshpande P L', 3, 8039, 2),
(161, 'Statisztikai tanuláselmélet', 'Vapnik Vladimir', 1, 8475, 2),
(162, 'A Mogul birodalma – A szennyezett trón', 'Rutherfordlex', 3, 1887, 2),
(163, 'Empire of the Moghal - Brothers at War', 'Rutherfordlex', 3, 8355, 2),
(164, 'Mogul birodalma – a világ uralkodója', 'Rutherfordlex', 3, 6376, 2),
(165, 'A Mogul birodalma – A kígyó foga', 'Rutherfordlex', 3, 9151, 2),
(166, 'Empire of the Moghal – Raiders of the North', 'Rutherfordlex', 3, 1323, 2),
(167, 'Moszad', 'Baz-Zohar Michael', 3, 6536, 2),
(168, 'Jim Corbett Omnibusz', 'Corbett Jim', 3, 9998, 2),
(169, '20000 liga a tenger alatt', 'Verne Jules', 4, 1621, 2),
(170, 'Batatyachi Chal', 'Deshpande P L', 4, 7617, 2),
(171, 'Hafasavnuk', 'Deshpande P L', 4, 9224, 2),
(172, 'Urlasurla', 'Deshpande P L', 4, 7625, 2),
(173, 'Mutatók C-ben', 'Kanetkar Yashwant', 1, 8372, 2),
(174, 'A katedrális és a bazár', 'Raymond Eric', 1, 2560, 2),
(175, 'Tervezés OpAmps segítségével', 'Franco Sergio', 1, 6052, 2),
(176, 'Gondolj a komplexitásra', 'Downeyllen', 1, 1235, 2),
(177, 'Az ördög ügyvédje', 'West Morris', 4, 7937, 2),
(178, 'Ayn Rand válaszol', 'Randyn', 5, 9132, 2),
(179, 'Filozófia: Kinek van szüksége rá', 'Randyn', 5, 1641, 2),
(180, 'A világ nagy gondolkodói', 'Randyn', 2, 1935, 2),
(181, 'Adatelemzés nyílt forráskódú eszközökkel', 'Janert Phillip', 1, 8170, 2),
(182, 'Broca agya', 'Sagan Carl', 2, 1729, 2),
(183, 'A matematika emberei', 'Bell E T', 2, 7903, 2),
(184, 'Oxford könyv a modern 2 írásról', 'Dawkins Richard', 2, 2376, 2),
(185, 'Igazságszolgáltatás igazságszolgáltatás és demokrácia', 'Ranjan Sudhanshu', 3, 3449, 2),
(186, 'Arthashastra', 'Kautiyla', 5, 5603, 2),
(187, 'Mi a Nép', 'Palkhivala', 5, 8416, 2),
(188, 'Mi a Nemzet', 'Palkhivala', 5, 2962, 2),
(189, 'Tárgyalóterem Genius', 'Sorabjee', 3, 5869, 2),
(190, 'Dongri Dubaiba', 'Zaidi Hussain', 3, 7848, 2),
(191, 'Anglia történetelapítvány', 'Ackroyd Peter', 3, 2220, 2),
(192, 'Djinns városa', 'Dalrymple William', 3, 2943, 2),
(193, 'India jogrendszere', 'Nariman', 3, 6389, 2),
(194, 'Még több könny a síráshoz', 'Sassoon Jean', 4, 3564, 2),
(195, 'Kötélkészítő', 'Dickinson Peter', 4, 1950, 2),
(196, 'Angyalok és démonok', 'Brown Dan', 4, 7596, 2),
(197, 'Bíró', 'Brown Dan', 4, 1525, 2),
(198, 'Ügyvéd', 'Brown Dan', 4, 3677, 2),
(199, 'Herceg', 'Machiavelli', 4, 2516, 2),
(200, 'Szemtelen Gázában', 'Huxleyldous', 4, 9344, 2),
(201, 'Beedle bárd meséi', 'Rowling J K', 4, 6036, 2),
(202, 'Lány a sárkány tetoválással', 'Larsson Steig', 4, 2385, 2),
(203, 'Lányki megrúgta a Darázsfészket', 'Larsson Steig', 4, 3789, 2),
(204, 'Lányki a tűzzel játszott', 'Larsson Steig', 4, 8940, 2),
(205, 'Batman kézikönyv', 'Larsson Steig', 4, 2133, 2),
(206, 'Murphy törvénye', 'Larsson Steig', 5, 4346, 2),
(207, 'Struktúra és véletlenszerűség', 'Tao Terence', 2, 3899, 2),
(208, 'Képfeldolgozás MATLAB-bal', 'Eddins Steve', 1, 1622, 2),
(209, 'Állatfarm', 'Orwell George', 4, 6257, 2),
(210, 'Idióta', 'Dostoevsky Fyodor', 4, 6353, 2),
(211, 'Karácsonyi ének', 'Dickens Charles', 4, 7770, 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`Kategoria_id`);

--
-- A tábla indexei `kiadok`
--
ALTER TABLE `kiadok`
  ADD PRIMARY KEY (`Kiado_id`);

--
-- A tábla indexei `konyvek`
--
ALTER TABLE `konyvek`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Kategoria_id` (`Kategoria_id`),
  ADD KEY `Kiado_id` (`Kiado_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `konyvek`
--
ALTER TABLE `konyvek`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `konyvek`
--
ALTER TABLE `konyvek`
  ADD CONSTRAINT `konyvek_ibfk_1` FOREIGN KEY (`Kategoria_id`) REFERENCES `kategoriak` (`Kategoria_id`),
  ADD CONSTRAINT `konyvek_ibfk_2` FOREIGN KEY (`Kiado_id`) REFERENCES `kiadok` (`Kiado_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
