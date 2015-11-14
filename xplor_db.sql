

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xplor_local`
--

-- --------------------------------------------------------

--
-- Table structure for table `flight_info`
--

CREATE TABLE `flight_info` (
  `vendor` varchar(50) DEFAULT NULL,
  `saleTotal` varchar(50) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `airline` varchar(100) DEFAULT NULL,
  `departure_time` varchar(100) DEFAULT NULL,
  `arrival_time` varchar(100) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_info`
--

INSERT INTO `flight_info` (`vendor`, `saleTotal`, `time`, `airline`, `departure_time`, `arrival_time`, `origin`, `destination`, `id`) VALUES
('Spirit Airlines', '98.10', '1:55', 'NK 110', '2015-11-11T06:45-05:00', '2015-11-11T08:40-05:00', 'DTW', 'BOS', 'Q2YZ7S0IB4'),
('JetBlue', '143.10', '1:46', 'B6 1336', '2015-11-11T19:10-05:00', '2015-11-11T20:56-05:00', 'DTW', 'BOS', 'TD784ONI5Z'),
('JetBlue', '143.10', '1:46', 'B6 1836', '2015-11-11T06:20-05:00', '2015-11-11T08:06-05:00', 'DTW', 'BOS', 'AP7BVWN9ZW'),
('JetBlue', '143.10', '1:46', 'B6 2036', '2015-11-11T09:55-05:00', '2015-11-11T11:41-05:00', 'DTW', 'BOS', 'G9POVE85Y5'),
('F9', '149.00', '9:00', 'F9 627', '2015-11-20T10:20-07:00', '2015-11-20T12:00-08:00', 'DEN', 'SFO', 'QMNOIQ5X7M'),
('JetBlue', '449.60', '6:04', 'B6 2036', '2015-11-20T09:55-05:00', '2015-11-20T11:41-05:00', 'DTW', 'BOS', 'SL5L4HVHQ1'),
('UA', '285.60', '8:21', 'UA 3798', '2015-11-20T07:30-05:00', '2015-11-20T07:58-06:00', 'DTW', 'ORD', '5EIEG655UR'),
('UA', '285.60', '8:21', 'UA 3798', '2015-11-20T19:45-05:00', '2015-11-20T20:08-06:00', 'DTW', 'ORD', 'OI6A5S18NV'),
('JetBlue', '399.60', '3:28', 'B6 2036', '2015-11-20T09:55-05:00', '2015-11-20T11:41-05:00', 'DTW', 'BOS', 'BCK4P8I1BF'),
('United Airline', '285.60', '3:00', 'UA6381', '2015-11-20T06:00-05:00', '2015-11-20T08:07-06:00', 'DTW', 'IAH', 'Q2YZ7S0IB6'),
('United Airline', '285.60', '3:00', 'UA 570', '2015-11-20T09:11-06:00', '2015-11-20T11:43-08:00', 'IAH', 'SFO', 'Q2YZ7S0IB6'),
('Alaska Airlines', '567.60', '6:00', 'AS 793', '2015-11-20T16:40-05:00', '2015-11-20T18:45-08:00', 'DTW', 'SEA', 'Q2YZ7S0IB8'),
('Alaska Airlines', '567.60', '6:00', 'AS 300', '2015-11-20T21:50-08:00', '2015-11-20T23:59-08:00', 'SEA', 'SFO', 'Q2YZ7S0IB8'),
('JetBlue', '399.60', '3:28', 'B6 117', '2015-11-20T12:09-05:00', '2015-11-20T13:23-05:00', 'BOS', 'JFK', 'BCK4P8I1BF'),
('JetBlue', '419.60', '6:20', 'B61589', '2015-11-20T12:09-05:00', '2015-11-20T10:42-05:00', 'DTW', 'FLL', 'BCK490I1BF'),
('JetBlue', '419.60', '6:20', 'B6 102', '2015-11-20T13:25-05:00', '2015-11-20T16:16-05:00', 'FLL', 'JFK', 'BCK490I1BF'),
('United Airline', '201.60', '4:55', 'UA1937', '2015-11-20T08:09-05:00', '2015-11-20T10:44-08:00', 'EWR', 'LAS', 'ACK421I1BF'),
('Spirit Airlines', '223.10', '1:27', 'NK 511', '2015-11-20T11:17-05:00', '2015-11-20T12:44-08:00', 'DTW', 'LAS', 'PUH325I1BU'),
('Spirit Airlines', '223.10', '1:27', 'NK 111', '2015-11-20T06:40-05:00', '2015-11-20T08:09-08:00', 'DTW', 'LAS', 'HYE765I1OY'),
('United Airlines', '351.60', '5:30', 'UA3282', '2015-11-20T05:50-05:00', '2015-11-20T07:34-05:00', 'DTW', 'EWR', 'ABC765I165'),
('United Airlines', '351.60', '5:30', 'UA1253', '2015-11-20T08:29-05:00', '2015-11-20T11:39-05:00', 'EWR', 'MIA', 'ABC765I165'),
('United Airlines', '566.60', '6:00', 'UA3707', '2015-11-20T16:23-05:00', '2015-11-20T16:40-06:00', 'DTW', 'ORD', 'UY438PYQBS'),
('United Airlines', '566.60', '6:00', 'UA 362', '2015-11-20T19:19-06:00', '2015-11-20T23:20-05:00', 'ORD', 'MIA', 'UY438PYQBS'),
('United Airlines', '332.60', '8:36', 'UA3798', '2015-11-20T14:49-05:00', '2015-11-20T17:00-06:00', 'DTW', 'IAH', '7Y6WO5AQZ5'),
('United Airlines', '332.60', '8:36', 'UA1220', '2015-11-20T18:15-06:00', '2015-11-20T20:31-08:00', 'IAH', 'SMF', '7Y6WO5AQZ5'),
('United Airlines', '506.60', '4:01', 'UA 311', '2015-11-20T09:12-05:00', '2015-11-20T10:39-07:00', 'DTW', 'DEN', 'WE8223HASD'),
('United Airlines', '506.60', '4:01', 'UA 282', '2015-11-20T11:14-07:00', '2015-11-20T12:55-08:00', 'DEN', 'SMF', 'WE8223HASD');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
