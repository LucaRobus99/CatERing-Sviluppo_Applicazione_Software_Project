-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 14, 2024 alle 14:25
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catering`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `expected_participants` int(11) DEFAULT NULL,
  `organizer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `events`
--

INSERT INTO `events` (`id`, `name`, `date_start`, `date_end`, `expected_participants`, `organizer_id`) VALUES
(1, 'Convegno Agile Community', '2020-09-25', '2020-09-25', 100, 2),
(2, 'Compleanno di Manuela', '2020-08-13', '2020-08-13', 25, 2),
(3, 'Fiera del Sedano Rapa', '2020-10-02', '2020-10-04', 400, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `menufeatures`
--

CREATE TABLE `menufeatures` (
  `menu_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `menufeatures`
--

INSERT INTO `menufeatures` (`menu_id`, `name`, `value`) VALUES
(80, 'Richiede cuoco', 0),
(80, 'Buffet', 0),
(80, 'Richiede cucina', 0),
(80, 'Finger food', 0),
(80, 'Piatti caldi', 0),
(82, 'Richiede cuoco', 0),
(82, 'Buffet', 0),
(82, 'Richiede cucina', 0),
(82, 'Finger food', 0),
(82, 'Piatti caldi', 0),
(86, 'Richiede cuoco', 0),
(86, 'Buffet', 0),
(86, 'Richiede cucina', 0),
(86, 'Finger food', 0),
(86, 'Piatti caldi', 0),
(91, 'Richiede cuoco', 1),
(91, 'Buffet', 1),
(91, 'Richiede cucina', 1),
(91, 'Finger food', 1),
(91, 'Piatti caldi', 1),
(92, 'Richiede cuoco', 0),
(92, 'Buffet', 0),
(92, 'Richiede cucina', 0),
(92, 'Finger food', 0),
(92, 'Piatti caldi', 0),
(93, 'Richiede cuoco', 0),
(93, 'Buffet', 0),
(93, 'Richiede cucina', 0),
(93, 'Finger food', 0),
(93, 'Piatti caldi', 0),
(94, 'Richiede cuoco', 0),
(94, 'Buffet', 0),
(94, 'Richiede cucina', 0),
(94, 'Finger food', 0),
(94, 'Piatti caldi', 0),
(95, 'Richiede cuoco', 0),
(95, 'Buffet', 0),
(95, 'Richiede cucina', 0),
(95, 'Finger food', 0),
(95, 'Piatti caldi', 0),
(96, 'Richiede cuoco', 1),
(96, 'Buffet', 1),
(96, 'Richiede cucina', 1),
(96, 'Finger food', 1),
(96, 'Piatti caldi', 1),
(97, 'Richiede cuoco', 1),
(97, 'Buffet', 1),
(97, 'Richiede cucina', 1),
(97, 'Finger food', 1),
(97, 'Piatti caldi', 1),
(98, 'Richiede cuoco', 1),
(98, 'Buffet', 1),
(98, 'Richiede cucina', 1),
(98, 'Finger food', 1),
(98, 'Piatti caldi', 1),
(99, 'Richiede cuoco', 1),
(99, 'Buffet', 1),
(99, 'Richiede cucina', 1),
(99, 'Finger food', 1),
(99, 'Piatti caldi', 1),
(100, 'Richiede cuoco', 0),
(100, 'Buffet', 0),
(100, 'Richiede cucina', 0),
(100, 'Finger food', 0),
(100, 'Piatti caldi', 0),
(101, 'Richiede cuoco', 1),
(101, 'Buffet', 1),
(101, 'Richiede cucina', 1),
(101, 'Finger food', 1),
(101, 'Piatti caldi', 1),
(102, 'Richiede cuoco', 1),
(102, 'Buffet', 1),
(102, 'Richiede cucina', 1),
(102, 'Finger food', 1),
(102, 'Piatti caldi', 1),
(103, 'Richiede cuoco', 0),
(103, 'Buffet', 0),
(103, 'Richiede cucina', 0),
(103, 'Finger food', 0),
(103, 'Piatti caldi', 0),
(104, 'Richiede cuoco', 0),
(104, 'Buffet', 0),
(104, 'Richiede cucina', 0),
(104, 'Finger food', 0),
(104, 'Piatti caldi', 0),
(105, 'Richiede cuoco', 1),
(105, 'Buffet', 1),
(105, 'Richiede cucina', 1),
(105, 'Finger food', 1),
(105, 'Piatti caldi', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `menuitems`
--

CREATE TABLE `menuitems` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `recipe_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `menuitems`
--

INSERT INTO `menuitems` (`id`, `menu_id`, `section_id`, `description`, `recipe_id`, `position`) VALUES
(96, 80, 0, 'Croissant vuoti', 9, 0),
(97, 80, 0, 'Croissant alla marmellata', 9, 1),
(98, 80, 0, 'Pane al cioccolato mignon', 10, 2),
(99, 80, 0, 'Panini al latte con prosciutto crudo', 12, 4),
(100, 80, 0, 'Panini al latte con prosciutto cotto', 12, 5),
(101, 80, 0, 'Panini al latte con formaggio spalmabile alle erbe', 12, 6),
(102, 80, 0, 'Girelle all\'uvetta mignon', 11, 3),
(103, 82, 0, 'Biscotti', 13, 1),
(104, 82, 0, 'Lingue di gatto', 14, 2),
(105, 82, 0, 'Bigné alla crema', 15, 3),
(106, 82, 0, 'Bigné al caffè', 15, 4),
(107, 82, 0, 'Pizzette', 16, 5),
(108, 82, 0, 'Croissant al prosciutto crudo mignon', 9, 6),
(109, 82, 0, 'Tramezzini tonno e carciofini mignon', 17, 7),
(112, 86, 41, 'Vitello tonnato', 1, 0),
(113, 86, 41, 'Carpaccio di spada', 2, 1),
(114, 86, 41, 'Alici marinate', 3, 2),
(115, 86, 42, 'Penne alla messinese', 5, 0),
(116, 86, 42, 'Risotto alla zucca', 20, 1),
(117, 86, 43, 'Salmone al forno', 8, 0),
(118, 86, 44, 'Sorbetto al limone', 18, 0),
(119, 86, 44, 'Torta Saint Honoré', 19, 1),
(135, 91, 53, 'Vitello tonnato', 1, 0),
(136, 91, 53, 'Carpaccio di spada', 2, 1),
(137, 91, 53, 'Alici marinate', 3, 2),
(138, 91, 55, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(139, 91, 55, 'Salmone al forno', 8, 1),
(140, 91, 0, 'Insalata di riso', 4, 0),
(141, 91, 0, 'Penne al sugo di baccalà', 5, 1),
(142, 92, 56, 'Vitello tonnato', 1, 0),
(143, 92, 56, 'Carpaccio di spada', 2, 1),
(144, 92, 56, 'Alici marinate', 3, 2),
(145, 92, 58, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(146, 92, 58, 'Salmone al forno', 8, 1),
(147, 92, 0, 'Insalata di riso', 4, 0),
(148, 92, 0, 'Penne al sugo di baccalà', 5, 1),
(149, 93, 59, 'Vitello tonnato', 1, 0),
(150, 93, 59, 'Carpaccio di spada', 2, 1),
(151, 93, 59, 'Alici marinate', 3, 2),
(152, 93, 61, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(153, 93, 61, 'Salmone al forno', 8, 1),
(154, 93, 0, 'Insalata di riso', 4, 0),
(155, 93, 0, 'Penne al sugo di baccalà', 5, 1),
(156, 94, 62, 'Vitello tonnato', 1, 0),
(157, 94, 62, 'Carpaccio di spada', 2, 1),
(158, 94, 62, 'Alici marinate', 3, 2),
(159, 94, 64, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(160, 94, 64, 'Salmone al forno', 8, 1),
(161, 94, 0, 'Insalata di riso', 4, 0),
(162, 94, 0, 'Penne al sugo di baccalà', 5, 1),
(163, 95, 65, 'Vitello tonnato', 1, 0),
(164, 95, 65, 'Carpaccio di spada', 2, 1),
(165, 95, 65, 'Alici marinate', 3, 2),
(166, 95, 67, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(167, 95, 67, 'Salmone al forno', 8, 1),
(168, 95, 0, 'Insalata di riso', 4, 0),
(169, 95, 0, 'Penne al sugo di baccalà', 5, 1),
(170, 96, 68, 'Vitello tonnato', 1, 0),
(171, 96, 68, 'Carpaccio di spada', 2, 1),
(172, 96, 68, 'Alici marinate', 3, 2),
(173, 96, 70, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(174, 96, 70, 'Salmone al forno', 8, 1),
(175, 96, 0, 'Insalata di riso', 4, 0),
(176, 96, 0, 'Penne al sugo di baccalà', 5, 1),
(177, 97, 71, 'Vitello tonnato', 1, 0),
(178, 97, 71, 'Carpaccio di spada', 2, 1),
(179, 97, 71, 'Alici marinate', 3, 2),
(180, 97, 73, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(181, 97, 73, 'Salmone al forno', 8, 1),
(182, 97, 0, 'Insalata di riso', 4, 0),
(183, 97, 0, 'Penne al sugo di baccalà', 5, 1),
(184, 98, 74, 'Vitello tonnato', 1, 0),
(185, 98, 74, 'Carpaccio di spada', 2, 1),
(186, 98, 74, 'Alici marinate', 3, 2),
(187, 98, 76, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(188, 98, 76, 'Salmone al forno', 8, 1),
(189, 98, 0, 'Insalata di riso', 4, 0),
(190, 98, 0, 'Penne al sugo di baccalà', 5, 1),
(191, 99, 77, 'Vitello tonnato', 1, 0),
(192, 99, 77, 'Carpaccio di spada', 2, 1),
(193, 99, 77, 'Alici marinate', 3, 2),
(194, 99, 79, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(195, 99, 79, 'Salmone al forno', 8, 1),
(196, 99, 0, 'Insalata di riso', 4, 0),
(197, 99, 0, 'Penne al sugo di baccalà', 5, 1),
(201, 100, 82, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(202, 100, 82, 'Salmone al forno', 8, 1),
(203, 100, 0, 'Insalata di riso', 4, 0),
(204, 100, 0, 'Penne al sugo di baccalà', 5, 1),
(205, 101, 83, 'Vitello tonnato', 1, 0),
(206, 101, 83, 'Carpaccio di spada', 2, 1),
(207, 101, 83, 'Alici marinate', 3, 2),
(208, 101, 85, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(209, 101, 85, 'Salmone al forno', 8, 1),
(210, 101, 0, 'Insalata di riso', 4, 0),
(211, 101, 0, 'Penne al sugo di baccalà', 5, 1),
(212, 102, 86, 'Vitello tonnato', 1, 0),
(213, 102, 86, 'Carpaccio di spada', 2, 1),
(214, 102, 86, 'Alici marinate', 3, 2),
(215, 102, 88, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(216, 102, 88, 'Salmone al forno', 8, 1),
(217, 102, 0, 'Insalata di riso', 4, 0),
(218, 102, 0, 'Penne al sugo di baccalà', 5, 1),
(219, 103, 89, 'Vitello tonnato', 1, 0),
(220, 103, 89, 'Carpaccio di spada', 2, 1),
(221, 103, 89, 'Alici marinate', 3, 2),
(222, 103, 91, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(223, 103, 91, 'Salmone al forno', 8, 1),
(224, 103, 0, 'Insalata di riso', 4, 0),
(225, 103, 0, 'Penne al sugo di baccalà', 5, 1),
(226, 104, 92, 'Vitello tonnato', 1, 0),
(227, 104, 92, 'Carpaccio di spada', 2, 1),
(228, 104, 92, 'Alici marinate', 3, 2),
(229, 104, 94, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(230, 104, 94, 'Salmone al forno', 8, 1),
(231, 104, 0, 'Insalata di riso', 4, 0),
(232, 104, 0, 'Penne al sugo di baccalà', 5, 1),
(233, 105, 95, 'Vitello tonnato', 1, 0),
(234, 105, 95, 'Carpaccio di spada', 2, 1),
(235, 105, 95, 'Alici marinate', 3, 2),
(236, 105, 97, 'Hamburger con bacon e cipolla caramellata', 7, 0),
(237, 105, 97, 'Salmone al forno', 8, 1),
(238, 105, 0, 'Insalata di riso', 4, 0),
(239, 105, 0, 'Penne al sugo di baccalà', 5, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `title` tinytext DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `menus`
--

INSERT INTO `menus` (`id`, `title`, `owner_id`, `published`) VALUES
(80, 'Coffee break mattutino', 2, 1),
(82, 'Coffee break pomeridiano', 2, 1),
(86, 'Cena di compleanno pesce', 3, 1),
(91, 'Titolo Nuovo', 2, 1),
(92, 'Menu da copiare', 2, 1),
(93, 'Menu da copiare', 2, 0),
(94, 'Menu da copiare', 2, 1),
(95, 'Menu da copiare', 2, 0),
(96, 'Titolo Nuovo', 2, 1),
(97, 'Titolo Nuovo', 2, 1),
(98, 'Titolo Nuovo', 2, 1),
(99, 'Titolo Nuovo', 2, 1),
(100, 'Menu Pinco Pallino', 2, 0),
(101, 'Titolo Nuovo', 2, 1),
(102, 'Titolo Nuovo', 2, 1),
(103, 'Menu da copiare', 2, 1),
(104, 'Menu da copiare', 2, 0),
(105, 'Titolo Nuovo', 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `menusections`
--

CREATE TABLE `menusections` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` tinytext DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `menusections`
--

INSERT INTO `menusections` (`id`, `menu_id`, `name`, `position`) VALUES
(41, 86, 'Antipasti', 0),
(42, 86, 'Primi', 1),
(43, 86, 'Secondi', 2),
(44, 86, 'Dessert', 3),
(45, 87, 'Antipasti', 0),
(53, 91, 'Antipasti', 0),
(54, 91, 'Primi', 1),
(55, 91, 'Secondi', 2),
(56, 92, 'Antipasti', 0),
(57, 92, 'Primi', 1),
(58, 92, 'Secondi', 2),
(59, 93, 'Antipasti', 0),
(60, 93, 'Primi', 1),
(61, 93, 'Secondi', 2),
(62, 94, 'Antipasti', 0),
(63, 94, 'Primi', 1),
(64, 94, 'Secondi', 2),
(65, 95, 'Antipasti', 0),
(66, 95, 'Primi', 1),
(67, 95, 'Secondi', 2),
(68, 96, 'Antipasti', 0),
(69, 96, 'Primi', 1),
(70, 96, 'Secondi', 2),
(71, 97, 'Antipasti', 0),
(72, 97, 'Primi', 1),
(73, 97, 'Secondi', 2),
(74, 98, 'Antipasti', 0),
(75, 98, 'Primi', 1),
(76, 98, 'Secondi', 2),
(77, 99, 'Antipasti', 0),
(78, 99, 'Primi', 1),
(79, 99, 'Secondi', 2),
(82, 100, 'Secondi', 2),
(83, 101, 'Antipasti', 0),
(84, 101, 'Primi', 1),
(85, 101, 'Secondi', 2),
(86, 102, 'Antipasti', 0),
(87, 102, 'Primi', 1),
(88, 102, 'Secondi', 2),
(89, 103, 'Antipasti', 0),
(90, 103, 'Primi', 1),
(91, 103, 'Secondi', 2),
(92, 104, 'Antipasti', 0),
(93, 104, 'Primi', 1),
(94, 104, 'Secondi', 2),
(95, 105, 'Antipasti', 0),
(96, 105, 'Primi', 1),
(97, 105, 'Secondi', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `name` tinytext DEFAULT NULL,
  `type` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `type`) VALUES
(1, 'Vitello tonnato', 'r'),
(2, 'Carpaccio di spada', 'r'),
(3, 'Alici marinate', 'r'),
(4, 'Insalata di riso', 'r'),
(5, 'Penne al sugo di baccalà', 'r'),
(6, 'Pappa al pomodoro', 'r'),
(7, 'Hamburger con bacon e cipolla caramellata', 'r'),
(8, 'Salmone al forno', 'r'),
(9, 'Croissant', 'r'),
(10, 'Pane al cioccolato', 'r'),
(11, 'Girelle all\'uvetta', 'r'),
(12, 'Panini al latte', 'r'),
(13, 'Biscotti di pasta frolla', 'r'),
(14, 'Lingue di gatto', 'r'),
(15, 'Bigné farciti', 'r'),
(16, 'Pizzette', 'r'),
(17, 'Tramezzini', 'r'),
(18, 'Sorbetto al limone', 'r'),
(19, 'Torta Saint Honoré', 'r'),
(20, 'Risotto alla zucca', 'r');

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

CREATE TABLE `roles` (
  `id` char(1) NOT NULL,
  `role` varchar(128) NOT NULL DEFAULT 'servizio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
('c', 'cuoco'),
('h', 'chef'),
('o', 'organizzatore'),
('s', 'servizio');

-- --------------------------------------------------------

--
-- Struttura della tabella `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `proposed_menu_id` int(11) NOT NULL DEFAULT 0,
  `approved_menu_id` int(11) DEFAULT 0,
  `service_date` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `expected_participants` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `services`
--

INSERT INTO `services` (`id`, `event_id`, `name`, `proposed_menu_id`, `approved_menu_id`, `service_date`, `time_start`, `time_end`, `expected_participants`) VALUES
(1, 2, 'Cena', 86, NULL, '2020-08-13', '20:00:00', '23:30:00', 25),
(2, 1, 'Coffee break mattino', 0, 80, '2020-09-25', '10:30:00', '11:30:00', 100),
(3, 1, 'Colazione di lavoro', 0, 0, '2020-09-25', '13:00:00', '14:00:00', 80),
(4, 1, 'Coffee break pomeriggio', 0, 82, '2020-09-25', '16:00:00', '16:30:00', 100),
(5, 1, 'Cena sociale', 0, 0, '2020-09-25', '20:00:00', '22:30:00', 40),
(6, 3, 'Pranzo giorno 1', 0, 0, '2020-10-02', '12:00:00', '15:00:00', 200),
(7, 3, 'Pranzo giorno 2', 0, 0, '2020-10-03', '12:00:00', '15:00:00', 300),
(8, 3, 'Pranzo giorno 3', 0, 0, '2020-10-04', '12:00:00', '15:00:00', 400);

-- --------------------------------------------------------

--
-- Struttura della tabella `summarysheets`
--

CREATE TABLE `summarysheets` (
  `id` int(11) NOT NULL,
  `id_chef` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `summarysheets`
--

INSERT INTO `summarysheets` (`id`, `id_chef`, `id_service`) VALUES
(86, 4, 2),
(87, 4, 2),
(88, 4, 2),
(89, 4, 2),
(90, 4, 2),
(91, 4, 2),
(92, 4, 2),
(93, 4, 2),
(94, 4, 2),
(95, 4, 2),
(96, 4, 2),
(97, 4, 2),
(98, 4, 2),
(99, 4, 2),
(100, 4, 2),
(101, 4, 2),
(102, 4, 2),
(103, 4, 2),
(104, 4, 2),
(105, 4, 2),
(106, 4, 2),
(107, 4, 2),
(108, 4, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `id_sheet` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `id_cook` int(11) DEFAULT NULL,
  `id_turn` int(11) DEFAULT NULL,
  `id_recipe` int(11) NOT NULL,
  `timeEstimate` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tasks`
--

INSERT INTO `tasks` (`id`, `id_sheet`, `position`, `id_cook`, `id_turn`, `id_recipe`, `timeEstimate`, `quantity`, `completed`) VALUES
(622, 86, 3, NULL, NULL, 9, NULL, NULL, 0),
(623, 86, 0, 5, 1, 9, 90, 2, 0),
(624, 86, 1, 5, 1, 10, NULL, NULL, 0),
(625, 86, 2, NULL, 1, 11, NULL, NULL, 0),
(626, 86, 4, NULL, NULL, 12, NULL, NULL, 0),
(627, 86, 5, NULL, NULL, 12, NULL, NULL, 0),
(628, 86, 6, NULL, NULL, 12, NULL, NULL, 0),
(629, 87, 3, NULL, NULL, 9, NULL, NULL, 0),
(630, 87, 0, 5, 1, 9, 90, 2, 0),
(631, 87, 1, 5, 1, 10, NULL, NULL, 0),
(632, 87, 2, NULL, 1, 11, NULL, NULL, 0),
(633, 87, 4, NULL, NULL, 12, NULL, NULL, 0),
(634, 87, 5, NULL, NULL, 12, NULL, NULL, 0),
(635, 87, 6, NULL, NULL, 12, NULL, NULL, 0),
(636, 87, 7, NULL, NULL, 1, NULL, NULL, 0),
(637, 88, 3, NULL, NULL, 9, NULL, NULL, 0),
(638, 88, 0, 5, 1, 9, 90, 2, 0),
(639, 88, 1, 5, 1, 10, NULL, NULL, 0),
(640, 88, 2, NULL, 1, 11, NULL, NULL, 0),
(641, 88, 4, NULL, NULL, 12, NULL, NULL, 0),
(642, 88, 5, NULL, NULL, 12, NULL, NULL, 0),
(643, 88, 6, NULL, NULL, 12, NULL, NULL, 0),
(644, 88, 7, NULL, NULL, 1, NULL, NULL, 0),
(645, 89, 0, NULL, NULL, 9, NULL, NULL, 0),
(646, 89, 1, NULL, NULL, 9, NULL, NULL, 0),
(647, 89, 2, NULL, NULL, 10, NULL, NULL, 0),
(648, 89, 3, NULL, NULL, 11, NULL, NULL, 0),
(649, 89, 4, NULL, NULL, 12, NULL, NULL, 0),
(650, 89, 5, NULL, NULL, 12, NULL, NULL, 0),
(651, 89, 6, NULL, NULL, 12, NULL, NULL, 0),
(652, 90, 0, NULL, NULL, 9, NULL, NULL, 0),
(653, 90, 1, NULL, NULL, 9, NULL, NULL, 0),
(654, 90, 2, NULL, NULL, 10, NULL, NULL, 0),
(655, 90, 3, NULL, NULL, 11, NULL, NULL, 0),
(656, 90, 4, NULL, NULL, 12, NULL, NULL, 0),
(657, 90, 5, NULL, NULL, 12, NULL, NULL, 0),
(658, 90, 6, NULL, NULL, 12, NULL, NULL, 0),
(660, 91, 1, NULL, NULL, 9, NULL, NULL, 0),
(661, 91, 2, NULL, NULL, 10, NULL, NULL, 0),
(662, 91, 3, NULL, NULL, 11, NULL, NULL, 0),
(663, 91, 4, NULL, NULL, 12, NULL, NULL, 0),
(664, 91, 5, NULL, NULL, 12, NULL, NULL, 0),
(665, 91, 6, NULL, NULL, 12, NULL, NULL, 0),
(667, 92, 1, NULL, NULL, 9, NULL, NULL, 0),
(668, 92, 2, NULL, NULL, 10, NULL, NULL, 0),
(669, 92, 3, NULL, NULL, 11, NULL, NULL, 0),
(670, 92, 4, NULL, NULL, 12, NULL, NULL, 0),
(671, 92, 5, NULL, NULL, 12, NULL, NULL, 0),
(672, 92, 6, NULL, NULL, 12, NULL, NULL, 0),
(674, 93, 1, NULL, NULL, 9, NULL, NULL, 0),
(675, 93, 2, NULL, NULL, 10, NULL, NULL, 0),
(676, 93, 3, NULL, NULL, 11, NULL, NULL, 0),
(677, 93, 4, NULL, NULL, 12, NULL, NULL, 0),
(678, 93, 5, NULL, NULL, 12, NULL, NULL, 0),
(679, 93, 6, NULL, NULL, 12, NULL, NULL, 0),
(680, 94, 0, 4, 1, 9, NULL, NULL, 0),
(681, 94, 1, NULL, NULL, 9, NULL, NULL, 0),
(682, 94, 2, NULL, NULL, 10, NULL, NULL, 0),
(683, 94, 3, NULL, NULL, 11, NULL, NULL, 0),
(684, 94, 4, NULL, NULL, 12, NULL, NULL, 0),
(685, 94, 5, NULL, NULL, 12, NULL, NULL, 0),
(686, 94, 6, NULL, NULL, 12, NULL, NULL, 0),
(687, 95, 3, NULL, NULL, 9, NULL, NULL, 0),
(688, 95, 0, 5, 1, 9, 90, 2, 0),
(689, 95, 1, NULL, NULL, 10, NULL, NULL, 0),
(690, 95, 2, NULL, 1, 11, NULL, NULL, 0),
(691, 95, 4, NULL, NULL, 12, NULL, NULL, 0),
(692, 95, 5, NULL, NULL, 12, NULL, NULL, 0),
(693, 95, 6, NULL, NULL, 12, NULL, NULL, 0),
(694, 95, 7, NULL, NULL, 1, NULL, NULL, 0),
(695, 96, 0, 4, 1, 9, NULL, NULL, 0),
(696, 96, 1, NULL, NULL, 9, NULL, NULL, 0),
(697, 96, 2, NULL, NULL, 10, NULL, NULL, 0),
(698, 96, 3, NULL, NULL, 11, NULL, NULL, 0),
(699, 96, 4, NULL, NULL, 12, NULL, NULL, 0),
(700, 96, 5, NULL, NULL, 12, NULL, NULL, 0),
(701, 96, 6, NULL, NULL, 12, NULL, NULL, 0),
(702, 97, 0, 6, 1, 9, NULL, NULL, 0),
(703, 97, 1, NULL, NULL, 9, NULL, NULL, 0),
(704, 97, 2, NULL, NULL, 10, NULL, NULL, 0),
(705, 97, 3, NULL, NULL, 11, NULL, NULL, 0),
(706, 97, 4, NULL, NULL, 12, NULL, NULL, 0),
(707, 97, 5, NULL, NULL, 12, NULL, NULL, 0),
(708, 97, 6, NULL, NULL, 12, NULL, NULL, 0),
(709, 98, 0, 6, 1, 9, NULL, NULL, 0),
(710, 98, 1, NULL, NULL, 9, NULL, NULL, 0),
(711, 98, 2, NULL, NULL, 10, NULL, NULL, 0),
(712, 98, 3, NULL, NULL, 11, NULL, NULL, 0),
(713, 98, 4, NULL, NULL, 12, NULL, NULL, 0),
(714, 98, 5, NULL, NULL, 12, NULL, NULL, 0),
(715, 98, 6, NULL, NULL, 12, NULL, NULL, 0),
(716, 99, 0, 6, 1, 9, NULL, NULL, 0),
(717, 99, 1, NULL, NULL, 9, NULL, NULL, 0),
(718, 99, 2, NULL, NULL, 10, NULL, NULL, 0),
(719, 99, 3, NULL, NULL, 11, NULL, NULL, 0),
(720, 99, 4, NULL, NULL, 12, NULL, NULL, 0),
(721, 99, 5, NULL, NULL, 12, NULL, NULL, 0),
(722, 99, 6, NULL, NULL, 12, NULL, NULL, 0),
(723, 100, 0, 6, 1, 9, NULL, NULL, 0),
(724, 100, 1, NULL, NULL, 9, NULL, NULL, 0),
(725, 100, 2, NULL, NULL, 10, NULL, NULL, 0),
(726, 100, 3, NULL, NULL, 11, NULL, NULL, 0),
(727, 100, 4, NULL, NULL, 12, NULL, NULL, 0),
(728, 100, 5, NULL, NULL, 12, NULL, NULL, 0),
(729, 100, 6, NULL, NULL, 12, NULL, NULL, 0),
(730, 101, 0, 6, 1, 9, NULL, NULL, 0),
(731, 101, 1, 6, NULL, 9, NULL, NULL, 0),
(732, 101, 2, NULL, NULL, 10, NULL, NULL, 0),
(733, 101, 3, NULL, NULL, 11, NULL, NULL, 0),
(734, 101, 4, NULL, NULL, 12, NULL, NULL, 0),
(735, 101, 5, NULL, NULL, 12, NULL, NULL, 0),
(736, 101, 6, NULL, NULL, 12, NULL, NULL, 0),
(737, 102, 0, 6, 1, 9, NULL, NULL, 0),
(738, 102, 1, 6, NULL, 9, NULL, NULL, 0),
(739, 102, 2, NULL, NULL, 10, NULL, NULL, 0),
(740, 102, 3, NULL, NULL, 11, NULL, NULL, 0),
(741, 102, 4, NULL, NULL, 12, NULL, NULL, 0),
(742, 102, 5, NULL, NULL, 12, NULL, NULL, 0),
(743, 102, 6, NULL, NULL, 12, NULL, NULL, 0),
(744, 103, 0, NULL, 1, 9, NULL, NULL, 0),
(745, 103, 1, NULL, NULL, 9, NULL, NULL, 0),
(746, 103, 2, NULL, NULL, 10, NULL, NULL, 0),
(747, 103, 3, NULL, NULL, 11, NULL, NULL, 0),
(748, 103, 4, NULL, NULL, 12, NULL, NULL, 0),
(749, 103, 5, NULL, NULL, 12, NULL, NULL, 0),
(750, 103, 6, NULL, NULL, 12, NULL, NULL, 0),
(751, 104, 0, 5, 1, 9, NULL, NULL, 0),
(752, 104, 1, NULL, NULL, 9, NULL, NULL, 0),
(753, 104, 2, NULL, NULL, 10, NULL, NULL, 0),
(754, 104, 3, NULL, NULL, 11, NULL, NULL, 0),
(755, 104, 4, NULL, NULL, 12, NULL, NULL, 0),
(756, 104, 5, NULL, NULL, 12, NULL, NULL, 0),
(757, 104, 6, NULL, NULL, 12, NULL, NULL, 0),
(758, 105, 0, 5, 2, 9, NULL, NULL, 0),
(759, 105, 1, NULL, NULL, 9, NULL, NULL, 0),
(760, 105, 2, NULL, NULL, 10, NULL, NULL, 0),
(761, 105, 3, NULL, NULL, 11, NULL, NULL, 0),
(762, 105, 4, NULL, NULL, 12, NULL, NULL, 0),
(763, 105, 5, NULL, NULL, 12, NULL, NULL, 0),
(764, 105, 6, NULL, NULL, 12, NULL, NULL, 0),
(765, 106, 0, 5, 1, 9, NULL, NULL, 1),
(766, 106, 1, NULL, NULL, 9, NULL, NULL, 0),
(767, 106, 2, NULL, NULL, 10, NULL, NULL, 0),
(768, 106, 3, NULL, NULL, 11, NULL, NULL, 0),
(769, 106, 4, NULL, NULL, 12, NULL, NULL, 0),
(770, 106, 5, NULL, NULL, 12, NULL, NULL, 0),
(771, 106, 6, NULL, NULL, 12, NULL, NULL, 0),
(772, 107, 3, NULL, NULL, 9, NULL, NULL, 0),
(773, 107, 0, 5, 1, 9, 90, 2, 0),
(774, 107, 1, NULL, NULL, 10, NULL, NULL, 0),
(775, 107, 2, NULL, 1, 11, NULL, NULL, 0),
(776, 107, 4, NULL, NULL, 12, NULL, NULL, 0),
(777, 107, 5, NULL, NULL, 12, NULL, NULL, 0),
(778, 107, 6, NULL, NULL, 12, NULL, NULL, 0),
(779, 107, 7, NULL, NULL, 1, NULL, NULL, 0),
(780, 108, 0, 5, 1, 9, 160, 5, 0),
(781, 108, 1, NULL, NULL, 9, NULL, NULL, 0),
(782, 108, 2, NULL, NULL, 10, NULL, NULL, 0),
(783, 108, 3, NULL, NULL, 11, NULL, NULL, 0),
(784, 108, 4, NULL, NULL, 12, NULL, NULL, 0),
(785, 108, 5, NULL, NULL, 12, NULL, NULL, 0),
(786, 108, 6, NULL, NULL, 12, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `turns`
--

CREATE TABLE `turns` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `h_start` time NOT NULL,
  `h_end` time NOT NULL,
  `place` varchar(100) NOT NULL,
  `full` tinyint(1) NOT NULL,
  `over` tinyint(1) NOT NULL,
  `type` enum('s','p') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `turns`
--

INSERT INTO `turns` (`id`, `date`, `h_start`, `h_end`, `place`, `full`, `over`, `type`) VALUES
(1, '2022-08-30', '09:00:00', '18:00:00', 'sede', 0, 0, 'p'),
(2, '2022-08-30', '18:00:00', '23:00:00', 'sede', 0, 0, 'p'),
(3, '2022-08-31', '09:00:00', '18:00:00', 'sede', 0, 0, 'p'),
(4, '2022-08-31', '18:00:00', '23:00:00', 'sede', 0, 0, 'p');

-- --------------------------------------------------------

--
-- Struttura della tabella `userroles`
--

CREATE TABLE `userroles` (
  `user_id` int(11) NOT NULL,
  `role_id` char(1) NOT NULL DEFAULT 's'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `userroles`
--

INSERT INTO `userroles` (`user_id`, `role_id`) VALUES
(1, 'o'),
(2, 'o'),
(2, 'h'),
(3, 'h'),
(4, 'h'),
(4, 'c'),
(5, 'c'),
(6, 'c'),
(7, 'c'),
(8, 's'),
(9, 's'),
(10, 's'),
(7, 's');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`) VALUES
(1, 'Carlin'),
(2, 'Lidia'),
(3, 'Tony'),
(4, 'Marinella'),
(5, 'Guido'),
(6, 'Antonietta'),
(7, 'Paola'),
(8, 'Silvia'),
(9, 'Marco'),
(10, 'Piergiorgio');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `menusections`
--
ALTER TABLE `menusections`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `summarysheets`
--
ALTER TABLE `summarysheets`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `turns`
--
ALTER TABLE `turns`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT per la tabella `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT per la tabella `menusections`
--
ALTER TABLE `menusections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT per la tabella `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `summarysheets`
--
ALTER TABLE `summarysheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT per la tabella `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=787;

--
-- AUTO_INCREMENT per la tabella `turns`
--
ALTER TABLE `turns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
