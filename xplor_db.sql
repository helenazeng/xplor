

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

-- --------------------------------------------------------

--
-- Table structure for table `hotel_info`
--

CREATE TABLE `hotel_info` (
  `HotelID` varchar(45) DEFAULT NULL,
  `Name` varchar(80) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `TotalRate` varchar(45) DEFAULT NULL,
  `CheckInDate` varchar(80) DEFAULT NULL,
  `DetailsUrl` char(200) DEFAULT NULL,
  `StarRating` varchar(70) DEFAULT NULL,
  `Geo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_info`
--

INSERT INTO `hotel_info` (`HotelID`, `Name`, `location`, `TotalRate`, `CheckInDate`, `DetailsUrl`, `StarRating`, `Geo`) VALUES
('8377936', 'Stone Chalet Bed and Breakfast Inn and Event Center', 'Ann Arbor', '168.54', '2015-11-15', 'http://www.expedia.com/go/hotel/info/8377936/2015-11-15/2015-11-18?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.5', '42.268281,-83.722783'),
('12078091', 'Residence Inn Ann Arbor Downtown', 'Ann Arbor', '198.69', '2015-11-21', 'http://www.expedia.com/go/hotel/info/12078091/2015-11-21/2015-11-24?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0', '42.281451,-83.749748'),
('1050440', 'Bell Tower Hotel', 'Ann Arbor', '217.77', '2015-11-16', 'http://www.expedia.com/go/hotel/info/1050440/2015-11-16/2015-11-19?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '2.5', '42.27942,-83.73963'),
('26146', 'Boston Harbor Hotel', 'Boston', '265.53', '2015-11-27', 'http://www.expedia.com/go/hotel/info/26146/2015-11-27/2015-11-30?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '42.356159,-71.050789'),
('21962', 'Four Seasons Hotel Boston', 'Boston', '484.98', '2015-11-23', 'http://www.expedia.com/go/hotel/info/21962/2015-11-23/2015-11-26?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '42.352317,-71.068525'),
('2175117', 'Mandarin Oriental Boston', 'Boston', '509.30', '2015-11-25', 'http://www.expedia.com/go/hotel/info/2175117/2015-11-25/2015-11-28?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '42.348881,-71.08181'),
('6505', 'Loews Regency San Francisco', 'San Francisco', '365.75', '2015-11-22', 'http://www.expedia.com/go/hotel/info/6505/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '37.792535,-122.400929'),
('1321986', 'The St. Regis San Francisco', 'San Francisco', '415.09', '2015-11-23', 'http://www.expedia.com/go/hotel/info/1321986/2015-11-23/2015-11-26?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '37.78596,-122.40158'),
('18200', 'The Fairmont San Francisco', 'San Francisco', '174.09', '2015-11-23', 'http://www.expedia.com/go/hotel/info/18200/2015-11-23/2015-11-26?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '37.79229,-122.41088'),
('3016186', 'Mandarin Oriental, Las Vegas', 'Las Vegas', '236.69', '2015-11-30', 'http://www.expedia.com/go/hotel/info/3016186/2015-11-30/2015-12-03?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '36.105943,-115.173178'),
('1184243', 'Wynn Las Vegas', 'Las Vegas', '158.77', '2015-11-22', 'http://www.expedia.com/go/hotel/info/1184243/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '36.127548,-115.167795'),
('2223789', 'Encore at Wynn Las Vegas', 'Las Vegas', '167.14', '2015-11-22', 'http://www.expedia.com/go/hotel/info/2223789/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '36.12759,-115.16774'),
('1705854', 'MGM Grand Detroit', 'Detroit', '257.71', '2015-11-22', 'http://www.expedia.com/go/hotel/info/1705854/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '4.5', '42.33231,-83.05784'),
('1764738', 'MotorCity Casino Hotel', 'Detroit', '160.62', '2015-11-16', 'http://www.expedia.com/go/hotel/info/1764738/2015-11-16/2015-11-19?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '4.5', '42.33978,-83.06718'),
('2232457', 'Caesars Windsor', 'Windsor', '118.51', '2015-11-16', 'http://www.expedia.com/go/hotel/info/2232457/2015-11-16/2015-11-19?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '4.0', '42.32081,-83.03461'),
('12057', 'The Beverly Hills Hotel', 'Beverly Hills', '549.62', '2015-11-22', 'http://www.expedia.com/go/hotel/info/12057/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '34.081537,-118.412113'),
('17768', 'The Peninsula Beverly Hills', 'Beverly Hills', '636.40', '2015-11-18', 'http://www.expedia.com/go/hotel/info/17768/2015-11-18/2015-11-21?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '34.06595,-118.411079'),
('300', 'Four Seasons Los Angeles at Beverly Hills', 'Los Angeles', '427.70', '2015-11-22', 'http://www.expedia.com/go/hotel/info/300/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '34.072892,-118.389692'),
('3253', 'The Lowell', 'New York', '688.26', '2015-11-14', 'http://www.expedia.com/go/hotel/info/3253/2015-11-14/2015-11-17?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '40.765866,-73.969103'),
('856934', 'the Quin', 'New York', '313.32', '2015-11-22', 'http://www.expedia.com/go/hotel/info/856934/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '40.764263,-73.977069'),
('25559', 'Loews Regency New York Hotel', 'New York', '363.92', '2015-11-22', 'http://www.expedia.com/go/hotel/info/25559/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '5.0', '40.764458,-73.968852'),
('1189730', 'Amber House - Midtown Sacramento', 'Sacramento', '228.86', '2015-11-16', 'http://www.expedia.com/go/hotel/info/1189730/2015-11-16/2015-11-19?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '4.0', '38.57251,-121.47875'),
('1040434', 'Inn & Spa at Parkside', 'Sacramento', '228.85', '2015-11-14', 'http://www.expedia.com/go/hotel/info/1040434/2015-11-14/2015-11-17?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '4.0', '38.5695,-121.5041'),
('2201796', 'The Citizen Hotel, Autograph Collection', 'Sacramento', '188.92', '2015-11-26', 'http://www.expedia.com/go/hotel/info/2201796/2015-11-26/2015-11-29?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '4.0', '38.58035,-121.49366');

-- --------------------------------------------------------

--
-- Table structure for table `uber`
--

CREATE TABLE `uber` (
  `origin` varchar(50) DEFAULT NULL,
  `distance` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uber`
--

INSERT INTO `uber` (`origin`, `distance`, `destination`, `price`) VALUES
('Detroit Metropolitan Airport', '26.46', 'Stone Chalet Bed and Breakfast Inn and Event Center', '$31-39'),
('Detroit Metropolitan Airport', '29.1', 'Residence Inn Ann Arbor Downtown', '$33-43'),
('Detroit Metropolitan Airport', '27.69', 'Bell Tower Hotel', '$32-41'),
('Logan International Airport', '4.72', 'Boston Harbor Hotel', '$26-30'),
('Logan International Airport', '7.75', 'Four Seasons Hotel Boston', '$34-39'),
('Logan International Airport', '8.39', 'Mandarin Oriental Boston', '$35-41'),
('San Francisco International Airport', '14.64', 'Loews Regency San Francisco', '$30-39'),
('San Francisco International Airport', '13.86', 'The St. Regis San Francisco', '$28-37'),
('San Francisco International Airport', '14.29', 'The Fairmont San Francisco', '$30-38'),
('Detroit Metropolitan Airport', '20.71', 'MGM Grand Detroit', '$26-33'),
('Detroit Metropolitan Airport', '20.34', 'MotorCity Casino Hotel', '$25-32'),
('Detroit Metropolitan Airport', '24.79', 'Caesars Windsor', '$29-38'),
('Detroit Metropolitan Airport', '13.48', 'The Beverly Hills Hotel', '$23-30'),
('Detroit Metropolitan Airport', '12.02', 'The Peninsula Beverly Hills', '$21-27'),
('Detroit Metropolitan Airport', '13.53', 'Four Seasons Los Angeles at Beverly Hills', '$23-30'),
('Detroit Metropolitan Airport', '17.38', 'The Lowell', '$52-70'),
('Detroit Metropolitan Airport', '17.69', 'the Quin', '$54-72'),
('Detroit Metropolitan Airport', '17.4', 'Loews Regency New York Hotel', '$52-70'),
('Detroit Metropolitan Airport', '13.53', 'Amber House - Midtown Sacramento', '$18-24'),
('Detroit Metropolitan Airport', '12.88', 'Inn & Spa at Parkside', '$17-22'),
('Detroit Metropolitan Airport', '11.6', 'The Citizen Hotel, Autograph Collection', '$16-21');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
