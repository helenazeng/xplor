
-- Host: localhost
-- Generation Time: Nov 04, 2015 at 02:13 AM
-- Server version: 5.6.27
-- PHP Version: 5.5.27

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

-- --------------------------------------------------------

--
-- Table structure for table `hotel_info`
--

CREATE TABLE `hotel_info` (
  `HotelID` varchar(45) DEFAULT NULL,
  `Name` varchar(80) DEFAULT NULL,
  `Location` char(100) DEFAULT NULL,
  `TotalRate` varchar(45) DEFAULT NULL,
  `CheckInDate` varchar(80) DEFAULT NULL,
  `DetailsUrl` char(200) DEFAULT NULL,
  `StarRating` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_info`
--

INSERT INTO `hotel_info` (`HotelID`, `Name`, `Location`, `TotalRate`, `CheckInDate`, `DetailsUrl`, `StarRating`) VALUES
('12345', 'hey', 'it works', NULL, NULL, NULL, NULL),
('12078091', 'Residence Inn Ann Arbor Downtown', '[object Object]', '[object Object]', '2015-10-31', 'http://www.expedia.com/go/hotel/info/12078091/2015-10-31/2015-11-03?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0'),
('1050440', 'Bell Tower Hotel', '[object Object]', '[object Object]', '2015-11-01', 'http://www.expedia.com/go/hotel/info/1050440/2015-11-01/2015-11-04?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '2.5'),
('12078091', 'Residence Inn Ann Arbor Downtown', '[object Object]', '[object Object]', '2015-10-31', 'http://www.expedia.com/go/hotel/info/12078091/2015-10-31/2015-11-03?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0'),
('1050440', 'Bell Tower Hotel', '[object Object]', '[object Object]', '2015-11-01', 'http://www.expedia.com/go/hotel/info/1050440/2015-11-01/2015-11-04?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '2.5'),
('12078091', 'Residence Inn Ann Arbor Downtown', '[object Object]', '[object Object]', '2015-10-31', 'http://www.expedia.com/go/hotel/info/12078091/2015-10-31/2015-11-03?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0'),
('12078091', 'Residence Inn Ann Arbor Downtown', '[object Object]', '[object Object]', '2015-10-31', 'http://www.expedia.com/go/hotel/info/12078091/2015-10-31/2015-11-03?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0'),
('12078091', 'Residence Inn Ann Arbor Downtown', '[object Object]', '[object Object]', '2015-10-31', 'http://www.expedia.com/go/hotel/info/12078091/2015-10-31/2015-11-03?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0'),
('12078091', 'Residence Inn Ann Arbor Downtown', '[object Object]', '[object Object]', '2015-10-31', 'http://www.expedia.com/go/hotel/info/12078091/2015-10-31/2015-11-03?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0');

-- --------------------------------------------------------

--
-- Table structure for table `uber`
--

CREATE TABLE `uber` (
  `origin` varchar(50) DEFAULT NULL,
  `leaving` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `arriving` varchar(50) DEFAULT NULL,
  `price` int(100) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
