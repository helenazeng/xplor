
--
-- Host: localhost
-- Generation Time: Nov 06, 2015 at 12:19 AM
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
  `location` varchar(50) DEFAULT NULL,
  `TotalRate` varchar(45) DEFAULT NULL,
  `CheckInDate` varchar(80) DEFAULT NULL,
  `DetailsUrl` char(200) DEFAULT NULL,
  `StarRating` varchar(70) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_info`
--

INSERT INTO `hotel_info` (`HotelID`, `Name`, `location`, `TotalRate`, `CheckInDate`, `DetailsUrl`, `StarRating`, `latitude`, `longitude`) VALUES
('8377936', 'Stone Chalet Bed and Breakfast Inn and Event Center', 'Ann Arbor', '168.54', '2015-11-08', 'http://www.expedia.com/go/hotel/info/8377936/2015-11-08/2015-11-11?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.5', '42.268281', '-83.722783'),
('458015', 'Wyndham Garden Ann Arbor', 'Ann Arbor', '59.93', '2015-11-10', 'http://www.expedia.com/go/hotel/info/458015/2015-11-10/2015-11-13?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0', '42.28287', '-83.78817'),
('12078091', 'Residence Inn Ann Arbor Downtown', 'Ann Arbor', '198.69', '2015-11-08', 'http://www.expedia.com/go/hotel/info/12078091/2015-11-08/2015-11-11?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '3.0', '42.281451', '-83.749748'),
('1050440', 'Bell Tower Hotel', 'Ann Arbor', '206.63', '2015-11-22', 'http://www.expedia.com/go/hotel/info/1050440/2015-11-22/2015-11-25?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '2.5', '42.27942', '-83.73963'),
('899896', 'Lamp Post Inn', 'Ann Arbor', '72.15', '2015-11-08', 'http://www.expedia.com/go/hotel/info/899896/2015-11-08/2015-11-11?NumRooms=1&NumAdult-Room1=2&tpid=1&eapid=0&langid=1033', '2.0', '42.2594', '-83.71221');

-- --------------------------------------------------------

--
-- Table structure for table `uber`
--

CREATE TABLE `uber` (
  `origin` varchar(50) DEFAULT NULL,
  `distance` varchar(100) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
