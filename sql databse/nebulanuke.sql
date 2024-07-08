-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2024 at 09:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nebulanuke`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `concs` int(11) NOT NULL,
  `attacktime` int(11) NOT NULL,
  `blacklist` int(11) NOT NULL,
  `apiaccess` int(11) NOT NULL,
  `premium` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_coupons`
--

CREATE TABLE `addon_coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `percent` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `expire_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apikeys`
--

CREATE TABLE `apikeys` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `api_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attacklogs`
--

CREATE TABLE `attacklogs` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `method` varchar(255) NOT NULL,
  `concs` int(11) NOT NULL,
  `stopped` int(11) NOT NULL,
  `servers` varchar(255) NOT NULL,
  `premium` int(11) NOT NULL,
  `apiattack` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `enddate` int(11) NOT NULL DEFAULT 0,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `reason` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `target` varchar(500) NOT NULL,
  `type` enum('ASN','IP','URL','DOMAIN') NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `percent` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `expire_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `percent`, `created_at`, `expire_at`) VALUES
(1, 'catstresse10', 10, '2023-08-10 00:30:08', 1692484140),
(2, 'SUMMER20', 20, '2023-08-19 10:56:56', 1713516960);

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

CREATE TABLE `methods` (
  `id` int(11) NOT NULL,
  `apiname` varchar(255) NOT NULL,
  `publicname` varchar(255) NOT NULL,
  `type` enum('FREEL4','AMP','UDP','TCP','BOTNET','FREEL7','BASICL7','PREMIUML7','SPECIAL','GAME') NOT NULL,
  `premium` int(11) NOT NULL,
  `timelimit` int(11) NOT NULL,
  `usageStats` int(11) NOT NULL DEFAULT 0,
  `about` varchar(999) NOT NULL DEFAULT '''unknown'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `methods`
--

INSERT INTO `methods` (`id`, `apiname`, `publicname`, `type`, `premium`, `timelimit`, `usageStats`, `about`) VALUES
(2, 'MIXAMP', 'MIXAMP', 'AMP', 1, 50000, 21, 'Multiple Amplifcation'),
(3, 'NTP', 'NTP', 'AMP', 0, 50000, 3, 'Spoofed NTP flood'),
(4, 'DNS', 'DNS', 'AMP', 0, 50000, 22, 'Spoofed DNS flood'),
(5, 'OVH-GAME', 'OVH-GAME', 'SPECIAL', 1, 50000, 19, 'Simple OVH Handshake flood which allow traffic go through'),
(6, 'SOCKET', 'SOCKET', 'TCP', 1, 5000, 3, 'High Socket/s flood'),
(7, 'GAME', 'GAME', 'GAME', 0, 5000, 2, 'Random protocols & payloads'),
(8, 'HTTP-BYPASS', 'HTTP-BYPASS', 'PREMIUML7', 1, 50000, 124, 'HTTP/2 Flood with auto-detection of ratelimit'),
(9, 'DISCORD', 'DISCORD', 'SPECIAL', 1, 50000, 4, 'Discord payload\\\'s, screen and call '),
(10, 'FIVEM', 'FIVEM', 'GAME', 1, 50000, 9, 'Flood Optimized For 5M'),
(11, 'TFO', 'TFO', 'TCP', 1, 50000, 0, 'TCP flood using TFO cookies'),
(12, 'HANDSHAKE', 'HANDSHAKE', 'TCP', 1, 5000, 2, 'unknown'),
(13, 'UDP', 'UDP', 'UDP', 0, 50000, 13, 'Spoofed UDP Flood'),
(14, 'TLS', 'TLS', 'BASICL7', 0, 50000, 12, 'HTTP/2 Flooder using TLS Connections'),
(15, 'TCP', 'TCP', 'TCP', 0, 50000, 27, 'Spoofed SYN/ACK');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` enum('fire','heart','bolt','gift','database','adjust','exclamation','template','ban','dollar') NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `icon`, `date`) VALUES
(2, 'Test News', '@fbicat', 'bolt', '2023-09-01 19:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `uniqid` varchar(1000) NOT NULL,
  `user` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `crypto_address` varchar(1000) NOT NULL,
  `crypto_amount` varchar(255) NOT NULL,
  `amount_paid` varchar(255) NOT NULL DEFAULT '0',
  `crypto_uri` varchar(500) NOT NULL,
  `gateway` varchar(255) NOT NULL,
  `confirmations` int(11) DEFAULT 0,
  `hash` varchar(500) NOT NULL DEFAULT 'Please pay to get hash',
  `created_at` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `premium` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `concs` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `lengthtype` varchar(255) NOT NULL,
  `pagelength` varchar(255) NOT NULL,
  `private` varchar(5) NOT NULL,
  `apiaccess` int(11) NOT NULL,
  `supportprio` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `custom` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `premium`, `time`, `concs`, `length`, `lengthtype`, `pagelength`, `private`, `apiaccess`, `supportprio`, `price`, `custom`) VALUES
(0, 'Free', 0, 75, 1, 25, 'Years', 'years', 'yes', 0, 0, 0, 'no'),
(4, 'Basic #1', 0, 240, 1, 30, 'Days', 'month', 'no', 0, 0, 7, 'no'),
(5, 'Basic #2', 0, 300, 1, 30, 'Days', 'month', 'no', 0, 0, 10, 'no'),
(6, 'Basic #3', 0, 320, 2, 30, 'Days', 'month', 'no', 0, 0, 20, 'no'),
(7, 'Premium #1', 1, 350, 1, 30, 'Days', 'month', 'no', 0, 1, 30, 'no'),
(8, 'Premium #2', 1, 600, 2, 30, 'Days', 'month', 'no', 1, 1, 50, 'no'),
(9, 'Premium #3', 1, 1000, 3, 30, 'Days', 'month', 'no', 1, 1, 70, 'no'),
(10, 'Enterprise #1', 1, 1200, 6, 30, 'Days', 'month', 'no', 1, 1, 120, 'no'),
(11, 'Enterprise #2', 1, 1500, 7, 30, 'Days', 'month', 'no', 1, 1, 150, 'no'),
(12, 'Enterprise #3', 1, 1800, 10, 30, 'Days', 'month', 'no', 1, 1, 200, 'no'),
(13, 'Business #1', 1, 2700, 20, 30, 'Days', 'month', 'no', 1, 1, 400, 'no'),
(14, 'Business #2', 1, 3300, 26, 30, 'Days', 'month', 'no', 1, 1, 500, 'no'),
(15, 'Business #3', 1, 3600, 30, 30, 'Days', 'month', 'no', 1, 1, 570, 'no'),
(16, 'Admin Plan', 1, 9999, 999, 1000, 'Years', 'month', 'yes', 1, 1, 999999, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `plan_purchases`
--

CREATE TABLE `plan_purchases` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `plan` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `plan_purchases`
--

INSERT INTO `plan_purchases` (`id`, `user`, `plan`, `amount`, `date`) VALUES
(1, 'root', 'Basic #1', 7, '2023-08-27 22:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `powerproofs`
--

CREATE TABLE `powerproofs` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `url` text NOT NULL,
  `ad_slots` int(11) NOT NULL,
  `ad_methods` text NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `apiurl` varchar(1024) NOT NULL,
  `methods` varchar(1000) NOT NULL,
  `type` varchar(255) NOT NULL,
  `premium` varchar(255) NOT NULL DEFAULT 'no',
  `slots` int(11) NOT NULL,
  `status` enum('online','offline','maintaince') NOT NULL,
  `lastused` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `name`, `apiurl`, `methods`, `type`, `premium`, `slots`, `status`, `lastused`) VALUES
(1, '#1 Dedicated', 'http://127.0.0.1:3333/attack?host=[host]&port=[port]&time=[time]&method=[method]', 'DNS\nNTP\nTCP\nUDP\nGAME', 'l4', 'no', 15, 'online', '2023-08-08 01:46:07'),
(2, '#2 Dedicated', 'http://127.0.0.1:3333/attack?host=[host]&port=[port]&time=[time]&method=[method]', 'TLS', 'l7', 'no', 15, 'online', '2023-08-08 02:08:27'),
(3, '#3 Dedicated', 'http://127.0.0.1:3333/attack?host=[host]&port=[port]&time=[time]&method=[method]', 'MIXAMP\nSOCKET\nTFO\nHANDSHAKE\nOVH-GAME\nDISCORD\nFIVEM', 'l4', 'yes', 15, 'online', '2023-08-08 02:43:52'),
(4, '#4 Dedicated', 'http://127.0.0.1:3333/attack?host=[host]&port=[port]&time=[time]&method=[method]', 'HTTP-BYPASS', 'l7', 'yes', 15, 'online', '2023-08-08 02:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `googlesitekey` varchar(255) NOT NULL,
  `googlesecretkey` varchar(255) NOT NULL,
  `sellixapikey` varchar(500) NOT NULL,
  `name` varchar(255) NOT NULL,
  `registration` varchar(10) NOT NULL,
  `login` varchar(10) NOT NULL,
  `maintenance` varchar(25) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `googlesitekey`, `googlesecretkey`, `sellixapikey`, `name`, `registration`, `login`, `maintenance`) VALUES
(1, 'none', '0x3355E846D943e272be0688a1DE8E08d50A9AA09B', 'sellixapikeyhere', 'king.cfxsecurity.ru', 'on', 'on', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `sheduledattacks`
--

CREATE TABLE `sheduledattacks` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `method` varchar(255) NOT NULL,
  `started` int(11) NOT NULL DEFAULT 0,
  `datetime` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `priority` enum('low','normal','high') NOT NULL DEFAULT 'normal',
  `user` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `status` enum('open','closed','answered','customer-reply') NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets_replies`
--

CREATE TABLE `tickets_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `sender` enum('admin','support','customer','') NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `secretkey` varchar(20) NOT NULL,
  `rank` varchar(20) NOT NULL DEFAULT 'User',
  `plan` int(11) NOT NULL DEFAULT 0,
  `planexpire` int(11) NOT NULL DEFAULT 1658186997,
  `premium` int(11) NOT NULL DEFAULT 0,
  `apiaccess` int(11) NOT NULL DEFAULT 0,
  `apitoken` varchar(255) NOT NULL,
  `addon_concs` int(11) NOT NULL DEFAULT 0,
  `addon_time` int(11) NOT NULL DEFAULT 0,
  `addon_blacklist` int(11) NOT NULL DEFAULT 0,
  `balance` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  `lastlogin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `secretkey`, `rank`, `plan`, `planexpire`, `premium`, `apiaccess`, `apitoken`, `addon_concs`, `addon_time`, `addon_blacklist`, `balance`, `created`, `lastlogin`) VALUES
(1, 'test200', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'test@test.com', '843836b57a10f8e5', 'User', 0, 1767283020, 0, 0, '0', 0, 0, 0, '0', '2024-07-03 23:19:45.000000', '2024-07-03 21:15:35'),
(2, 'test123', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'test@test1.com', '31346191e11d38cd', 'User', 0, 1767283020, 0, 0, '0', 0, 0, 0, '0', '2024-07-03 23:25:22.000000', '2024-07-03 23:25:22'),
(3, 'new123', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'man411210@gmail.com', 'ac5ef43bc275ffd7', 'User', 0, 1767283020, 0, 0, '0', 0, 0, 0, '0', '2024-07-03 23:41:40.000000', '2024-07-03 23:41:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_coupons`
--
ALTER TABLE `addon_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apikeys`
--
ALTER TABLE `apikeys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attacklogs`
--
ALTER TABLE `attacklogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`,`date`),
  ADD KEY `stopped` (`stopped`),
  ADD KEY `servers` (`servers`),
  ADD KEY `enddate` (`enddate`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `methods`
--
ALTER TABLE `methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_purchases`
--
ALTER TABLE `plan_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `powerproofs`
--
ALTER TABLE `powerproofs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sheduledattacks`
--
ALTER TABLE `sheduledattacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets_replies`
--
ALTER TABLE `tickets_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_coupons`
--
ALTER TABLE `addon_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apikeys`
--
ALTER TABLE `apikeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attacklogs`
--
ALTER TABLE `attacklogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `methods`
--
ALTER TABLE `methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `plan_purchases`
--
ALTER TABLE `plan_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `powerproofs`
--
ALTER TABLE `powerproofs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sheduledattacks`
--
ALTER TABLE `sheduledattacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets_replies`
--
ALTER TABLE `tickets_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
