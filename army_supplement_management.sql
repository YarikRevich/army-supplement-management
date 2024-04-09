-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Kwi 2024, 19:44
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `army_supplement_management`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `administraion_deployment_records`
--

CREATE TABLE `administraion_deployment_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `facility` varchar(40) NOT NULL,
  `till` timestamp NOT NULL DEFAULT current_timestamp(),
  `since` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `administraion_permissions`
--

CREATE TABLE `administraion_permissions` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `administraion_permissions_entries`
--

CREATE TABLE `administraion_permissions_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `scope` enum('administrative','executive','logistics','inventory_holder','communication') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `administraion_trainings`
--

CREATE TABLE `administraion_trainings` (
  `id` int(10) UNSIGNED NOT NULL,
  `till` timestamp NOT NULL DEFAULT current_timestamp(),
  `since` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `administraion_trainings_topic`
--

CREATE TABLE `administraion_trainings_topic` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` enum('combat','management','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `communication_administration_journal`
--

CREATE TABLE `communication_administration_journal` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `communication_administration_journal_topic`
--

CREATE TABLE `communication_administration_journal_topic` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `communication_equipment_inventory_journal`
--

CREATE TABLE `communication_equipment_inventory_journal` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `communication_equipment_inventory_journal_topic`
--

CREATE TABLE `communication_equipment_inventory_journal_topic` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `communication_logistics_journal`
--

CREATE TABLE `communication_logistics_journal` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `communication_logistics_journal_topic`
--

CREATE TABLE `communication_logistics_journal_topic` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_arms_assignments`
--

CREATE TABLE `equipment_inventory_arms_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_arms_disposition`
--

CREATE TABLE `equipment_inventory_arms_disposition` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_arms_type`
--

CREATE TABLE `equipment_inventory_arms_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `caliber` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_attachments_assignments`
--

CREATE TABLE `equipment_inventory_attachments_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_attachments_disposition`
--

CREATE TABLE `equipment_inventory_attachments_disposition` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_vehicles_assignments`
--

CREATE TABLE `equipment_inventory_vehicles_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_vehicles_disposition`
--

CREATE TABLE `equipment_inventory_vehicles_disposition` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_inventory_vehicles_type`
--

CREATE TABLE `equipment_inventory_vehicles_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `engine` enum('ice','electric') NOT NULL,
  `consumption` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logistics_assignments`
--

CREATE TABLE `logistics_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logistics_cargo`
--

CREATE TABLE `logistics_cargo` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logistics_route`
--

CREATE TABLE `logistics_route` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(40) NOT NULL,
  `to` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `staff_personnel`
--

CREATE TABLE `staff_personnel` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `age` int(3) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `origin` varchar(30) NOT NULL,
  `extra_contact` varchar(20) NOT NULL,
  `kind` enum('external','internal','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `staff_rank`
--

CREATE TABLE `staff_rank` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `administraion_deployment_records`
--
ALTER TABLE `administraion_deployment_records`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `administraion_permissions`
--
ALTER TABLE `administraion_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `administraion_permissions_entries`
--
ALTER TABLE `administraion_permissions_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `administraion_trainings`
--
ALTER TABLE `administraion_trainings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `administraion_trainings_topic`
--
ALTER TABLE `administraion_trainings_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `communication_administration_journal`
--
ALTER TABLE `communication_administration_journal`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `communication_administration_journal_topic`
--
ALTER TABLE `communication_administration_journal_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `communication_equipment_inventory_journal`
--
ALTER TABLE `communication_equipment_inventory_journal`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `communication_equipment_inventory_journal_topic`
--
ALTER TABLE `communication_equipment_inventory_journal_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `communication_logistics_journal`
--
ALTER TABLE `communication_logistics_journal`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `communication_logistics_journal_topic`
--
ALTER TABLE `communication_logistics_journal_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_arms_assignments`
--
ALTER TABLE `equipment_inventory_arms_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_arms_disposition`
--
ALTER TABLE `equipment_inventory_arms_disposition`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_arms_type`
--
ALTER TABLE `equipment_inventory_arms_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_attachments_assignments`
--
ALTER TABLE `equipment_inventory_attachments_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_attachments_disposition`
--
ALTER TABLE `equipment_inventory_attachments_disposition`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_vehicles_assignments`
--
ALTER TABLE `equipment_inventory_vehicles_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_vehicles_disposition`
--
ALTER TABLE `equipment_inventory_vehicles_disposition`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `equipment_inventory_vehicles_type`
--
ALTER TABLE `equipment_inventory_vehicles_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logistics_assignments`
--
ALTER TABLE `logistics_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logistics_cargo`
--
ALTER TABLE `logistics_cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logistics_route`
--
ALTER TABLE `logistics_route`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `staff_personnel`
--
ALTER TABLE `staff_personnel`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `staff_rank`
--
ALTER TABLE `staff_rank`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
