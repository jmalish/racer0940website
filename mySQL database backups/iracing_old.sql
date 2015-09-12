-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2015 at 04:03 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iracing`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `car_id` int(11) NOT NULL,
  `car_name` text NOT NULL,
  `shortName` text NOT NULL,
  `displayName` text NOT NULL,
  `folderName` text NOT NULL,
  `car_isDefaultContent` tinyint(1) NOT NULL,
  `iRacingId` int(11) NOT NULL,
  `imageURL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `shortName`, `displayName`, `folderName`, `car_isDefaultContent`, `iRacingId`, `imageURL`) VALUES
(0, 'Mazda MX-5 Roadster', 'mx5_roadster', 'MX5 Roadster', 'mx5 roadster', 1, 35, 'mx5_roadster.bmp'),
(1, 'Mazda MX-5 Cup', 'mx5_cup', 'MX5 Cup', 'mx5 cup', 1, 34, 'mx5_cup.bmp'),
(2, 'Star Mazda', 'starmazda', 'StarMazda', 'formulamazda', 0, 4, 'formulamazda.bmp'),
(3, 'Skip Barber Formula 2000', 'skipbarber', 'Skip Barber', 'rt2000', 0, 1, 'rt2000.bmp'),
(4, 'Legends Ford ''34 Coupe', 'legend', 'Legends', 'legends ford34c', 1, 5, 'legends_ford34c.bmp'),
(5, 'Pontiac Solstice', 'solstice', 'Solstice', 'solstice', 1, 3, 'solstice.bmp'),
(6, 'Radical SR8', 'radical', 'Radical', 'radical sr8', 0, 13, 'radical_sr8.bmp'),
(7, 'SCCA Spec Racer Ford', 'srf', 'SRF', 'specracer', 1, 23, 'specracer.bmp'),
(8, 'Street Stock', 'streetstock', 'StreetStock', 'streetstock', 1, 36, 'streetstock.bmp'),
(9, 'Williams-Toyota FW31', 'williamsf1', 'FW31', 'williamsfw31', 0, 33, 'williamsfw31.bmp'),
(10, 'Chevrolet Corvette C6R', 'corvette', 'Corvette', 'c6r', 0, 26, 'c6r.bmp'),
(11, 'Chevrolet Impala', 'impala', 'Impala', 'stockcars impala', 0, 22, 'stockcars_impala.bmp'),
(12, 'Chevrolet Impala Class B', 'impala_b', 'Impala B', 'stockcars2 chevy cot', 0, 38, 'stockcars2_chevy_cot.bmp'),
(13, 'Chevrolet Impala SS 2009', 'impala_ss2009', 'Impala SS', 'stockcars2 chevy', 0, 24, 'stockcars2_chevy.bmp'),
(14, 'Chevrolet Monte Carlo SS', 'montecarlo', 'MonteCarlo SS', 'latemodel', 0, 12, 'latemodel.bmp'),
(15, 'Chevrolet Silverado', 'silverado', 'Silverado', 'trucks silverado', 0, 20, 'trucks_silverado.bmp'),
(16, 'Dallara Indycar', 'indycar', 'IndyCar', 'dallara', 0, 29, 'dallara.bmp'),
(17, 'Ford Falcon FG01 V8 - Circa 2012', 'fordv8_2012', 'Ford V8', 'fordv8sc', 0, 28, 'fordv8sc.bmp'),
(18, 'Ford GT', 'fordgt', 'Ford GT', 'fordgt', 0, 40, 'fordgt.bmp'),
(19, 'Ford Mustang FR500S', 'fordmustang', 'Mustang', 'fr500s', 0, 30, 'fr500s.bmp'),
(20, 'HPD ARX-01c', 'hpd', 'HPD', 'hpdarx01c', 0, 39, 'hpdarx01c.bmp'),
(21, 'Lotus 79', 'lotus79', 'Lotus 79', 'lotus79', 0, 25, 'lotus79.bmp'),
(22, 'SK Modified', 'skmod', 'Modified', 'skmodified', 0, 2, 'skmodified.bmp'),
(23, 'SK Tour Modified', 'skmod_tour', 'Tour Modified', 'skmodified tour', 0, 31, 'skmodified_tour.bmp'),
(24, 'Riley MkXX Daytona Prototype', 'riley', 'Riley DP', 'rileydp', 0, 21, 'rileydp.bmp'),
(25, 'Silver Crown', 'silvercrown', 'Silver Crown', 'silvercrown', 0, 18, 'silvercrown.bmp'),
(26, 'Sprint Car', 'sprintcar', 'Sprint Car', 'sprint', 0, 37, 'sprint.bmp'),
(27, 'VW Jetta TDI Cup', 'jetta', 'Jetta', 'jettatdi', 0, 27, 'jettatdi.bmp'),
(28, 'Cadillac CTS-VR', 'cadillacctsvr', 'Cadillac', 'cadillacctsvr', 1, 41, 'cadillacctsvr.bmp'),
(29, 'Legends Ford ''34 Coupe - Rookie', 'legendrookie', 'Legends - Rookie', 'legends ford34c rookie', 1, 11, 'legends_ford34c_rookie.bmp'),
(30, 'Pontiac Solstice - Rookie', 'solstice_rookie', 'Solstice R', 'solstice rookie', 1, 10, 'solstice_rookie.bmp'),
(31, 'McLaren MP4-12C', 'mclaren', 'McLaren', 'mclarenmp4', 0, 43, 'mclarenmp4.bmp'),
(32, 'Lotus 49', 'lotus49', 'Lotus 49', 'lotus49', 0, 42, 'lotus49.bmp'),
(33, 'Chevrolet SS-Gen 6', 'chevy_gen6', 'Chevy Gen 6', 'stockcars chevyss', 0, 45, 'stockcars_chevyss.bmp'),
(34, 'Ford Fusion-Gen6', 'fusion_gen6', 'Fusion Gen6', 'stockcars fordfusion', 0, 46, 'stockcars_fordfusion.bmp'),
(35, 'Kia Optima GX', 'kia', 'Kia', 'kiaoptima', 0, 44, 'kiaoptima.bmp'),
(36, 'Ford Mustang Class B', 'mustang_b', 'Mustang B', 'stockcars2 nwford2013', 0, 51, 'stockcars2_nwford2013.bmp'),
(37, 'Ruf RT 12R C-Spec', 'ruf_cspec', 'Ruf C-Spec', 'rufrt12r track cspec', 0, 52, 'rufrt12r_track_cspec.bmp'),
(38, 'Ruf RT 12R Track', 'ruf_track', 'Ruf Track', 'rufrt12r track', 0, 50, 'rufrt12r_track.bmp'),
(39, 'Ruf RT 12R RWD', 'ruf_rwd', 'Ruf RWD', 'rufrt12r rwd', 0, 49, 'rufrt12r_rwd.bmp'),
(40, 'Ruf RT 12R AWD', 'ruf_awd', 'Ruf AWD', 'rufrt12r awd', 0, 48, 'rufrt12r_awd.bmp'),
(41, 'Super Late Model', 'slm', 'SLM', 'superlatemodel', 0, 54, 'superlatemodel.bmp'),
(42, 'BMW Z4 GT3', 'bmwz4gt3', 'BMW Z4 GT3', 'bmwz4gt3', 0, 55, 'bmwz4gt3.bmp'),
(43, 'Toyota Camry-Gen6', 'toyota_gen6', 'Toyota Gen6', 'stockcars toyotacamry', 0, 56, 'stockcars_toyotacamry.bmp'),
(44, 'Dallara DW12', 'dw12', 'DW12', 'dallaradw12', 0, 57, 'dallaradw12.bmp'),
(45, 'Chevrolet Camaro Class B', 'camaro', 'Camaro B', 'stockcars2 nwcamaro2014', 0, 58, 'stockcars2_nwcamaro2014.bmp'),
(46, 'Holden Commodore VF V8', 'holden', 'Holden V8', 'v8supercars holden2014', 0, 60, 'v8supercars_holden2014.bmp'),
(47, 'Ford GT GT3', 'fordgt3', 'Ford GT3', 'fordgt gt3', 0, 59, 'fordgt_gt3.bmp'),
(48, 'Ford Falcon FG V8', 'fordfalcon', 'Ford Falcon V8', 'v8supercars ford2014', 0, 61, 'v8supercars_ford2014.bmp');

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
  `config_id` int(11) NOT NULL,
  `iracingId` int(11) NOT NULL,
  `trackId` int(11) NOT NULL,
  `config_name` text NOT NULL,
  `isOval` tinyint(1) NOT NULL,
  `hasNight` tinyint(1) NOT NULL,
  `pitstallCount` int(11) NOT NULL,
  `configLayoutImageURL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`config_id`, `iracingId`, `trackId`, `config_name`, `isOval`, `hasNight`, `pitstallCount`, `configLayoutImageURL`) VALUES
(0, 52, 23, 'Legends Oval', 1, 0, 26, 'atlantaspeedway_LegendsOval.jpg'),
(1, 51, 23, 'Road Course', 0, 0, 43, 'atlantaspeedway_RoadCourse.jpg'),
(2, 53, 23, 'Oval', 1, 0, 43, 'atlantaspeedway_Oval.jpg'),
(3, 46, 2, 'Full Course', 0, 0, 41, 'barber_FullCourse.jpg'),
(4, 99, 2, 'Short A', 0, 0, 43, 'barber_ShortA.jpg'),
(5, 100, 2, 'Short B', 0, 0, 14, 'barber_ShortB.jpg'),
(6, 145, 24, 'Grand Prix', 0, 0, 41, 'brandshatch_GrandPrix.jpg'),
(7, 146, 24, 'Indy', 0, 0, 41, 'brandshatch_Indy.jpg'),
(8, 101, 25, 'Oval', 1, 1, 43, 'bristol_Oval.jpg'),
(9, 143, 53, 'Skid Pad', 1, 0, 1, 'centripetal_SkidPad.jpg'),
(10, 40, 3, 'Oval', 1, 1, 45, 'charlotte_Oval.jpg'),
(11, 38, 3, 'Infield Road Course', 0, 1, 44, 'charlotte_InfieldRoadCourse.jpg'),
(12, 39, 3, 'Legends Oval', 1, 1, 32, 'charlotte_LegendsOval.jpg'),
(13, 37, 3, 'Road Course', 0, 1, 43, 'charlotte_RoadCourse.jpg'),
(14, 123, 26, 'Oval', 1, 0, 43, 'chicagoland_Oval.jpg'),
(15, 164, 4, 'Classic Pits', 0, 0, 42, 'spa_ClassicPits.jpg'),
(16, 163, 4, 'GP Pits', 0, 0, 48, 'spa_GPPits.jpg'),
(17, 165, 4, 'Endurance', 0, 0, 60, 'spa_Endurance.jpg'),
(18, 15, 27, 'Oval', 1, 0, 36, 'concord_Oval.jpg'),
(19, 115, 28, 'Oval', 1, 0, 43, 'darlington_Oval.jpg'),
(20, 26, 49, 'Road', 0, 0, 43, 'daytona_old_Road.jpg'),
(21, 29, 49, 'Short', 0, 0, 23, 'daytona_old_Short.jpg'),
(22, 28, 49, 'Bike', 0, 0, 43, 'daytona_old_Bike.jpg'),
(23, 27, 49, 'Oval', 1, 0, 43, 'daytona_old_Oval.jpg'),
(24, 191, 29, 'Oval', 1, 1, 43, 'daytona_Oval.jpg'),
(25, 192, 29, 'Road', 0, 1, 43, 'daytona_Road.jpg'),
(26, 193, 29, 'Bike', 0, 1, 43, 'daytona_Bike.jpg'),
(27, 194, 29, 'Short', 0, 1, 43, 'daytona_Short.jpg'),
(28, 162, 30, 'Oval', 1, 0, 42, 'dover_Oval.jpg'),
(29, 20, 31, 'Oval', 1, 0, 43, 'homestead_Oval.jpg'),
(30, 21, 31, 'Road Course A', 0, 0, 43, 'homestead_RoadCourseA.jpg'),
(31, 22, 31, 'Road Course B', 0, 0, 43, 'homestead_RoadCourseB.jpg'),
(32, 133, 32, 'Oval', 1, 0, 55, 'indianapolis_Oval.jpg'),
(33, 134, 32, 'Road Course', 0, 0, 53, 'indianapolis_RoadCourse.jpg'),
(34, 135, 32, 'Bike', 0, 0, 53, 'indianapolis_Bike.jpg'),
(35, 178, 32, 'IndyCar Oval', 1, 0, 48, 'indianapolis_IndyCarOval.jpg'),
(36, 49, 5, 'IRL 2007', 0, 0, 43, 'sonoma_IRL2007.jpg'),
(37, 98, 5, 'Long', 0, 0, 43, 'sonoma_Long.jpg'),
(38, 102, 5, 'IRL', 0, 0, 43, 'sonoma_IRL.jpg'),
(39, 48, 5, 'Cup', 0, 0, 43, 'sonoma_Cup.jpg'),
(40, 170, 33, 'Road', 0, 1, 44, 'iowa_Road.jpg'),
(41, 171, 33, 'Legends', 1, 1, 21, 'iowa_Legends.jpg'),
(42, 172, 33, 'Infield Legends', 1, 1, 24, 'iowa_InfieldLegends.jpg'),
(43, 169, 33, 'Oval', 1, 1, 44, 'iowa_Oval.jpg'),
(44, 11, 34, 'Full Course', 1, 0, 37, 'stafford_FullCourse.jpg'),
(45, 188, 52, 'Oval', 1, 1, 44, 'kentucky_Oval.jpg'),
(46, 189, 52, 'Legends', 1, 1, 31, 'kentucky_Legends.jpg'),
(47, 17, 6, 'Oval', 1, 0, 45, 'lanier_Oval.jpg'),
(48, 103, 35, 'Oval', 1, 0, 43, 'lasvegas_Oval.jpg'),
(49, 110, 35, 'Legends Oval', 1, 0, 22, 'lasvegas_LegendsOval.jpg'),
(50, 111, 35, 'Road Long', 0, 0, 40, 'lasvegas_RoadLong.jpg'),
(51, 112, 35, 'Road Short', 0, 0, 40, 'lasvegas_RoadShort.jpg'),
(52, 113, 35, 'Infield Legends Oval', 0, 0, 7, 'lasvegas_InfieldLegendsOval.jpg'),
(53, 114, 35, 'Road Combined', 0, 0, 40, 'lasvegas_RoadCombined.jpg'),
(54, 34, 7, 'Chicane', 0, 0, 44, 'limerock_Chicane.jpg'),
(55, 1, 7, 'Full Course', 0, 0, 44, 'limerock_FullCourse.jpg'),
(56, 160, 7, 'School', 0, 0, 35, 'limerock_School.jpg'),
(57, 33, 36, 'Oval', 1, 0, 43, 'martinsville_Oval.jpg'),
(58, 47, 8, 'Full Course', 0, 0, 46, 'laguna_FullCourse.jpg'),
(59, 158, 8, 'School', 0, 0, 46, 'laguna_School.jpg'),
(60, 124, 37, 'Oval', 1, 0, 43, 'michigan_Oval.jpg'),
(61, 154, 9, 'Chicane', 0, 0, 46, 'midohio_Chicane.jpg'),
(62, 155, 9, 'Short', 0, 0, 46, 'midohio_Short.jpg'),
(63, 156, 9, 'Oval', 1, 0, 31, 'midohio_Oval.jpg'),
(64, 157, 9, 'Alt Oval', 1, 0, 26, 'midohio_AltOval.jpg'),
(65, 153, 9, 'Full', 0, 0, 46, 'midohio_Full.jpg'),
(66, 144, 10, 'Oval', 0, 0, 45, 'canadian_Oval.jpg'),
(67, 129, 11, 'Road', 0, 0, 44, 'newhampshire_Road.jpg'),
(68, 131, 11, 'Oval', 1, 0, 44, 'newhampshire_Oval.jpg'),
(69, 132, 11, 'Road with South Oval', 0, 0, 44, 'newhampshire_RoadwithSouthOval.jpg'),
(70, 130, 11, 'Road with North Oval', 0, 0, 44, 'newhampshire_RoadwithNorthOval.jpg'),
(71, 190, 50, 'Oval', 1, 1, 42, 'newsmyrna_Oval.jpg'),
(72, 166, 12, 'Full Course', 0, 0, 40, 'okayama_FullCourse.jpg'),
(73, 167, 12, 'Short Course', 0, 0, 40, 'okayama_ShortCourse.jpg'),
(74, 180, 48, 'International', 0, 0, 27, 'oultonpark_International.jpg'),
(75, 181, 48, 'Fosters', 0, 0, 27, 'oultonpark_Fosters.jpg'),
(76, 182, 48, 'Island', 0, 0, 27, 'oultonpark_Island.jpg'),
(77, 186, 48, 'Fosters w/Hislop', 0, 0, 27, 'oultonpark_FostersWithHislop.jpg'),
(78, 187, 48, 'Island Historic', 0, 0, 27, 'oultonpark_IslandHistoric.jpg'),
(79, 183, 48, 'Intl w/out Hislop', 0, 0, 27, 'oultonpark_IntlWithoutHislop.jpg'),
(80, 184, 48, 'Intl w/out Brittens', 0, 0, 27, 'oultonpark_IntlWithoutBrittens.jpg'),
(81, 185, 48, 'Intl w/no Chicanes', 0, 0, 27, 'oultonpark_IntlWithnoChicanes.jpg'),
(82, 12, 13, 'Oval', 1, 0, 35, 'oxford_Oval.jpg'),
(83, 152, 38, 'Phillip Island Circuit', 0, 0, 44, 'phillip Island_PhillipIslandCircuit.jpg'),
(84, 104, 39, 'Oval', 1, 0, 43, 'phoenix2008_Oval.jpg'),
(85, 105, 39, 'Road', 0, 0, 51, 'phoenix2008_Road.jpg'),
(86, 136, 40, 'Oval', 1, 0, 43, 'pocono_Oval.jpg'),
(87, 137, 40, 'East', 0, 0, 31, 'pocono_East.jpg'),
(88, 138, 40, 'South', 0, 0, 15, 'pocono_South.jpg'),
(89, 139, 40, 'North', 0, 0, 60, 'pocono_North.jpg'),
(90, 140, 40, 'International Course', 0, 0, 60, 'pocono_InternationalCourse.jpg'),
(91, 31, 41, 'Oval', 1, 1, 43, 'richmond_Oval.jpg'),
(92, 50, 14, 'Bend', 0, 0, 60, 'roadamerica_Bend.jpg'),
(93, 18, 14, 'Full Course', 0, 0, 60, 'roadamerica_FullCourse.jpg'),
(94, 128, 1, 'Short', 0, 0, 43, 'roadatlanta_Short.jpg'),
(95, 126, 1, 'Club', 0, 0, 43, 'roadatlanta_Club.jpg'),
(96, 127, 1, 'Full Course', 0, 0, 43, 'roadatlanta_FullCourse.jpg'),
(97, 97, 42, 'Club', 0, 1, 39, 'sebring_Club.jpg'),
(98, 95, 42, 'International', 0, 1, 43, 'sebring_International.jpg'),
(99, 96, 42, 'Modified', 0, 1, 43, 'sebring_Modified.jpg'),
(100, 41, 43, 'Grand Prix', 0, 0, 54, 'silverstone_GrandPrix.jpg'),
(101, 45, 43, 'Southern', 0, 0, 54, 'silverstone_Southern.jpg'),
(102, 44, 43, 'National', 0, 0, 54, 'silverstone_National.jpg'),
(103, 43, 43, 'International', 0, 0, 54, 'silverstone_International.jpg'),
(104, 42, 43, 'Historical Grand Prix', 0, 0, 54, 'silverstone_HistoricalGrandPrix.jpg'),
(105, 14, 15, 'Oval', 1, 0, 43, 'southboston_Oval.jpg'),
(106, 142, 16, 'Jefferson Reverse', 0, 0, 20, 'summitpoint_JeffersonReverse.jpg'),
(107, 8, 16, 'Jefferson Course', 0, 0, 20, 'summitpoint_JeffersonCourse.jpg'),
(108, 9, 16, 'Summit Point Raceway', 0, 0, 39, 'summitpoint_SummitPointRaceway.jpg'),
(109, 24, 16, 'Short Configuration', 0, 0, 39, 'summitpoint_ShortConfiguration.jpg'),
(110, 159, 16, 'School', 0, 0, 28, 'summitpoint_School.jpg'),
(111, 173, 17, 'Moto', 0, 0, 60, 'suzuka_Moto.jpg'),
(112, 174, 17, 'East', 0, 0, 60, 'suzuka_East.jpg'),
(113, 175, 17, 'West', 0, 0, 22, 'suzuka_West.jpg'),
(114, 176, 17, 'West w/chicane', 0, 0, 22, 'suzuka_WestWithchicane.jpg'),
(115, 168, 17, 'Grand Prix', 0, 0, 60, 'suzuka_GrandPrix.jpg'),
(116, 116, 44, 'Oval', 1, 0, 43, 'talladega_Oval.jpg'),
(117, 117, 45, 'Road Long', 0, 0, 37, 'texas_RoadLong.jpg'),
(118, 118, 45, 'Road Short A', 0, 0, 23, 'texas_RoadShortA.jpg'),
(119, 119, 45, 'Road Short B', 0, 0, 37, 'texas_RoadShortB.jpg'),
(120, 120, 45, 'Legends Oval', 1, 0, 18, 'texas_LegendsOval.jpg'),
(121, 121, 45, 'Oval', 1, 0, 43, 'texas_Oval.jpg'),
(122, 122, 45, 'Road Combined', 0, 0, 43, 'texas_RoadCombined.jpg'),
(123, 94, 18, 'Oval', 1, 0, 43, 'milwaukee_Oval.jpg'),
(124, 161, 19, 'Oval', 1, 0, 43, 'thompson_Oval.jpg'),
(125, 30, 46, 'Outer - Inner', 1, 0, 31, 'irwindale_Outer-Inner.jpg'),
(126, 23, 46, 'Outer', 1, 0, 44, 'irwindale_Outer.jpg'),
(127, 19, 46, 'Inner', 1, 0, 33, 'irwindale_Inner.jpg'),
(128, 195, 51, 'GP', 0, 1, 42, 'motegi_GP.jpg'),
(129, 196, 51, 'East', 0, 1, 31, 'motegi_East.jpg'),
(130, 197, 51, 'West', 0, 1, 42, 'motegi_West.jpg'),
(131, 198, 51, 'Oval', 1, 1, 43, 'motegi_Oval.jpg'),
(132, 16, 47, 'Oval', 1, 0, 43, 'usa_speedway_Oval.jpg'),
(133, 3, 20, 'Patriot', 0, 0, 15, 'vir_Patriot.jpg'),
(134, 7, 20, 'South Course', 0, 0, 23, 'vir_SouthCourse.jpg'),
(135, 141, 20, 'Patriot Reverse', 0, 0, 17, 'vir_PatriotReverse.jpg'),
(136, 5, 20, 'Grand West', 0, 0, 48, 'vir_GrandWest.jpg'),
(137, 2, 20, 'Full Course', 0, 0, 48, 'vir_FullCourse.jpg'),
(138, 4, 20, 'North Course', 0, 0, 48, 'vir_NorthCourse.jpg'),
(139, 6, 20, 'Grand East', 0, 0, 48, 'vir_GrandEast.jpg'),
(140, 106, 21, 'Cup', 0, 0, 42, 'watkinsglen_Cup.jpg'),
(141, 107, 21, 'Boot', 0, 0, 42, 'watkinsglen_Boot.jpg'),
(142, 108, 21, 'Classic Boot', 0, 0, 42, 'watkinsglen_ClassicBoot.jpg'),
(143, 109, 21, 'Classic', 0, 0, 42, 'watkinsglen_Classic.jpg'),
(144, 147, 22, 'Chicane', 0, 0, 29, 'zandvoort_Chicane.jpg'),
(145, 148, 22, 'Club', 0, 0, 29, 'zandvoort_Club.jpg'),
(146, 149, 22, 'Grand Prix', 0, 0, 29, 'zandvoort_GrandPrix.jpg'),
(147, 150, 22, 'National', 0, 0, 29, 'zandvoort_National.jpg'),
(148, 151, 22, 'Oostelijk', 0, 0, 15, 'zandvoort_Oostelijk.jpg'),
(149, 199, 54, 'Grand Prix', 0, 0, 42, 'zolder_GrandPrix.jpg'),
(150, 200, 54, 'Alternate', 0, 0, 42, 'zolder_Alternate.jpg'),
(151, 203, 57, 'Oval', 1, 0, 45, 'rockingham_Oval.jpg'),
(152, 204, 57, 'Road Course', 0, 0, 45, 'rockingham_RoadCourse.jpg'),
(153, 205, 57, 'Infield Road Course', 0, 0, 11, 'rockingham_InfieldRoadCourse.jpg'),
(154, 206, 57, 'Short Road Course', 0, 0, 11, 'rockingham_ShortRoadCourse.jpg'),
(155, 207, 56, 'North Course', 0, 0, 17, 'oranpark_NorthCourse.jpg'),
(156, 210, 56, 'North B Course', 0, 0, 17, 'oranpark_NorthBCourse.jpg'),
(157, 208, 56, 'South Course', 0, 0, 38, 'oranpark_SouthCourse.jpg'),
(158, 209, 56, 'North A Course', 0, 0, 17, 'oranpark_NorthACourse.jpg'),
(159, 211, 56, 'Moto', 0, 0, 38, 'oranpark_Moto.jpg'),
(160, 202, 56, 'Grand Prix', 0, 0, 38, 'oranpark_GrandPrix.jpg'),
(161, 212, 58, 'Grand Prix', 0, 0, 50, 'interlagos_GrandPrix.jpg'),
(162, 213, 58, 'Moto', 0, 0, 50, 'interlagos_Moto.jpg'),
(163, 201, 1009, 'Oval', 1, 1, 25, 'langley_Oval.jpg'),
(164, 214, 1010, 'Oval', 1, 1, 43, 'kansas_Oval.jpg'),
(165, 215, 1010, 'Road Course', 0, 1, 43, 'kansas_RoadCourse.jpg'),
(166, 216, 1010, 'Infield Road Course', 0, 1, 17, 'kansas_InfieldRoadCourse.jpg'),
(167, 218, 1011, 'Grand Prix', 0, 0, 44, 'montreal_GrandPrix.jpg'),
(168, 179, 1012, 'Oval', 0, 0, 50, 'longbeach_Oval.jpg'),
(169, 217, 46, 'Figure Eight', 1, 0, 33, 'irwindale_FigureEight.jpg'),
(170, 219, 1013, 'Oval', 0, 0, 54, 'bathurst_Oval.jpg'),
(171, 220, 1014, 'Thunderbolt', 0, 0, 44, 'njmp_Thunderbolt.jpg'),
(172, 221, 1014, 'Thunderbolt w/ both chicanes', 0, 0, 44, 'njmp_ThunderboltWithbothchicanes.jpg'),
(173, 223, 1014, 'Thunderbolt w/ first chicane', 0, 0, 44, 'njmp_ThunderboltWithfirstchicane.jpg'),
(174, 224, 1014, 'Thunderbolt w/ second chicane', 0, 0, 44, 'njmp_ThunderboltWithsecondchicane.jpg'),
(175, 222, 11, 'Legends', 1, 0, 12, 'newhampshire_Legends.jpg'),
(176, 225, 1015, 'Oval', 1, 0, 0, 'autoclub_Oval.jpg'),
(177, 226, 1015, 'Competition', 0, 0, 0, 'autoclub_Competition.jpg'),
(178, 227, 1015, 'Moto', 0, 0, 0, 'autoclub_Moto.jpg'),
(179, 228, 1015, 'Interior', 0, 0, 0, 'autoclub_Interior.jpg'),
(180, 229, 1016, 'Grand Prix', 0, 0, 60, 'cota_GrandPrix.jpg'),
(181, 230, 1016, 'East', 0, 0, 26, 'cota_East.jpg'),
(182, 231, 1016, 'West', 0, 0, 60, 'cota_West.jpg'),
(183, 232, 1017, 'Oval', 1, 1, 0, 'irp_Oval.jpg'),
(184, 235, 1018, 'Oval', 1, 1, 44, 'phoenix_Oval.jpg'),
(185, 236, 1018, 'Oval w/open dogleg', 1, 1, 44, 'phoenix_OvalWithopendogleg.jpg'),
(186, 233, 1019, 'GP', 0, 0, 34, 'donington_GP.jpg'),
(187, 234, 1019, 'National', 0, 0, 34, 'donington_National.jpg'),
(188, 237, 1020, 'Oval', 1, 1, 42, 'gateway_Oval.jpg'),
(189, 238, 1020, 'Road', 0, 1, 42, 'gateway_Road.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `track_id` int(11) NOT NULL,
  `track_name` text NOT NULL,
  `shortName` text NOT NULL,
  `track_isDefaultContent` tinyint(1) NOT NULL,
  `trackWebsiteURL` text NOT NULL,
  `trackLogoURL` text NOT NULL,
  `mapImageURL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`track_id`, `track_name`, `shortName`, `track_isDefaultContent`, `trackWebsiteURL`, `trackLogoURL`, `mapImageURL`) VALUES
(1, 'Road Atlanta', 'roadatlanta', 0, 'http://www.roadatlanta.com', 'roadatlantaLogo.jpg', 'roadatlantaMap.jpg'),
(2, 'Barber Motorsports Park', 'barber', 0, 'http://www.barbermotorsports.com/', 'barberLogo.jpg', 'barberMap.jpg'),
(3, 'Charlotte Motor Speedway', 'charlotte', 1, 'http://www.charlottemotorspeedway.com/', 'charlotteLogo.jpg', 'charlotteMap.jpg'),
(4, 'Circuit de Spa-Francorchamps', 'spa', 0, 'http://www.spa-francorchamps.be/', 'spaLogo.jpg', 'spaMap.jpg'),
(5, 'Sonoma Raceway', 'sonoma', 0, 'http://www.infineonraceway.com/', 'sonomaLogo.jpg', 'sonomaMap.jpg'),
(6, 'Lanier National Speedway', 'lanier', 1, 'http://www.lanierspeedway.com', 'lanierLogo.jpg', 'lanierMap.jpg'),
(7, 'Lime Rock Park', 'limerock', 1, 'http://www.limerock.com/', 'limerockLogo.jpg', 'limerockMap.jpg'),
(8, 'Mazda Raceway Laguna Seca', 'laguna', 1, 'http://www.laguna-seca.com/', 'lagunaLogo.jpg', 'lagunaMap.jpg'),
(9, 'Mid-Ohio Sports Car Course', 'midohio', 0, 'http://www.midohio.com/', 'midohioLogo.jpg', 'midohioMap.jpg'),
(10, 'Canadian Tire Motorsports Park', 'canadian', 0, 'http://www.mosport.com', 'canadianLogo.jpg', 'canadianMap.jpg'),
(11, 'New Hampshire Motor Speedway', 'newhampshire', 0, 'http://www.nhms.com', 'newhampshireLogo.jpg', 'newhampshireMap.jpg'),
(12, 'Okayama International Circuit', 'okayama', 1, 'http://www.okayama-international-circuit.jp/', 'okayamaLogo.jpg', 'okayamaMap.jpg'),
(13, 'Oxford Plains Speedway', 'oxford', 1, 'http://www.oxfordplains.com/', 'oxfordLogo.jpg', 'oxfordMap.jpg'),
(14, 'Road America', 'roadamerica', 0, 'https://www.roadamerica.com', 'roadamericaLogo.jpg', 'roadamericaMap.jpg'),
(15, 'South Boston Speedway', 'southboston', 1, 'http://www.southbostonspeedway.com/', 'southbostonLogo.jpg', 'southbostonMap.jpg'),
(16, 'Summit Point Raceway', 'summitpoint', 1, 'http://www.summitpoint-raceway.com/', 'summitpointLogo.jpg', 'summitpointMap.jpg'),
(17, 'Suzuka International Racing Course', 'suzuka', 0, 'http://www.mobilityland.co.jp/english/suzuka/', 'suzukaLogo.jpg', 'suzukaMap.jpg'),
(18, 'The Milwaukee Mile', 'milwaukee', 0, 'http://www.milwaukeemile.com/', 'milwaukeeLogo.jpg', 'milwaukeeMap.jpg'),
(19, 'Thompson International Speedway', 'thompson', 1, 'http://www.thompsonspeedway.com', 'thompsonLogo.jpg', 'thompsonMap.jpg'),
(20, 'Virginia International Raceway', 'vir', 0, 'http://www.virclub.com/vir', 'virLogo.jpg', 'virMap.jpg'),
(21, 'Watkins Glen International', 'watkinsglen', 0, 'http://www.theglen.com/', 'watkinsglenLogo.jpg', 'watkinsglenMap.jpg'),
(22, 'Zandvoort', 'zandvoort', 0, 'http://www.cpz.nl/', 'zandvoortLogo.jpg', 'zandvoortMap.jpg'),
(23, 'Atlanta Motor Speedway', 'atlantaspeedway', 0, 'http://www.atlantamotorspeedway.com/', 'atlantaspeedwayLogo.jpg', 'atlantaspeedwayMap.jpg'),
(24, 'Brands Hatch', 'brandshatch', 0, 'http://www.motorsportvision.co.uk/brands-hatch/', 'brandshatchLogo.jpg', 'brandshatchMap.jpg'),
(25, 'Bristol Motor Speedway', 'bristol', 0, 'http://www.bristolmotorspeedway.com/', 'bristolLogo.jpg', 'bristolMap.jpg'),
(26, 'Chicagoland Speedway', 'chicagoland', 0, 'http://www.chicagolandspeedway.com', 'chicagolandLogo.jpg', 'chicagolandMap.jpg'),
(27, 'Concord Speedway', 'concord', 0, 'http://www.concordmotorsportpark.com/', 'concordLogo.jpg', 'concordMap.jpg'),
(28, 'Darlington Raceway', 'darlington', 0, 'http://www.darlingtonraceway.com', 'darlingtonLogo.jpg', 'darlingtonMap.jpg'),
(29, 'Daytona International Speedway', 'daytona', 0, 'http://www.daytonainternationalspeedway.com/', 'daytonaLogo.jpg', 'daytonaMap.jpg'),
(30, 'Dover International Speedway', 'dover', 0, 'http://www.doverspeedway.com', 'doverLogo.jpg', 'doverMap.jpg'),
(31, 'Homestead Miami Speedway', 'homestead', 0, 'http://www.homesteadmiamispeedway.com/', 'homesteadLogo.jpg', 'homesteadMap.jpg'),
(32, 'Indianapolis Motor Speedway', 'indianapolis', 0, 'http://www.indianapolismotorspeedway.com', 'indianapolisLogo.jpg', 'indianapolisMap.jpg'),
(33, 'Iowa Speedway', 'iowa', 0, 'http://www.iowaspeedway.com/', 'iowaLogo.jpg', 'iowaMap.jpg'),
(34, 'Stafford Motor Speedway', 'stafford', 0, 'http://staffordmotorspeedway.com/', 'staffordLogo.jpg', 'staffordMap.jpg'),
(35, 'Las Vegas Motor Speedway', 'lasvegas', 0, 'http://www.lvms.com', 'lasvegasLogo.jpg', 'lasvegasMap.jpg'),
(36, 'Martinsville Speedway', 'martinsville', 0, 'http://www.martinsvillespeedway.com', 'martinsvilleLogo.jpg', 'martinsvilleMap.jpg'),
(37, 'Michigan International Speedway', 'michigan', 0, 'http://www.mispeedway.com', 'michiganLogo.jpg', 'michiganMap.jpg'),
(38, 'Phillip Island', 'phillip Island', 0, 'http://www.phillipislandcircuit.com.au/', 'phillip IslandLogo.jpg', 'phillip IslandMap.jpg'),
(39, 'Phoenix circa 2008', 'phoenix2008', 0, 'http://www.phoenixinternationalraceway.com/', 'phoenix2008Logo.jpg', 'phoenix2008Map.jpg'),
(40, 'Pocono Raceway', 'pocono', 0, 'http://www.poconoraceway.com', 'poconoLogo.jpg', 'poconoMap.jpg'),
(41, 'Richmond International Raceway', 'richmond', 0, 'http://www.rir.com', 'richmondLogo.jpg', 'richmondMap.jpg'),
(42, 'Sebring International Raceway', 'sebring', 0, 'http://www.sebringraceway.com', 'sebringLogo.jpg', 'sebringMap.jpg'),
(43, 'Silverstone Circuit', 'silverstone', 0, 'http://www.silverstone.co.uk/', 'silverstoneLogo.jpg', 'silverstoneMap.jpg'),
(44, 'Talladega Superspeedway', 'talladega', 0, 'http://www.talladegasuperspeedway.com', 'talladegaLogo.jpg', 'talladegaMap.jpg'),
(45, 'Texas Motor Speedway', 'texas', 0, 'http://www.texasmotorspeedway.com', 'texasLogo.jpg', 'texasMap.jpg'),
(46, 'Irwindale Speedway', 'irwindale', 0, 'http://www.irwindalespeedway.com/', 'irwindaleLogo.jpg', 'irwindaleMap.jpg'),
(47, 'USA International Speedway', 'usa_speedway', 1, 'http://www.usaspeedway.com/', 'usa_speedwayLogo.jpg', 'usa_speedwayMap.jpg'),
(48, 'Oulton Park Circuit', 'oultonpark', 0, 'http://www.oultonpark.co.uk', 'oultonparkLogo.jpg', 'oultonparkMap.jpg'),
(49, 'Daytona circa 2007', 'daytona_old', 0, 'http://www.daytonainternationalspeedway.com/', 'daytona_oldLogo.jpg', 'daytona_oldMap.jpg'),
(50, 'New Smyrna Speedway', 'newsmyrna', 0, 'http://newsmyrnaspeedway.org/', 'newsmyrnaLogo.jpg', 'newsmyrnaMap.jpg'),
(51, 'Twin Ring Motegi', 'motegi', 0, 'http://www.mobilityland.co.jp/', 'motegiLogo.jpg', 'motegiMap.jpg'),
(52, 'Kentucky Speedway', 'kentucky', 0, 'http://www.kentuckyspeedway.com', 'kentuckyLogo.jpg', 'kentuckyMap.jpg'),
(53, 'Centripetal Circuit', 'centripetal', 1, 'http://www.iracing.com', 'centripetalLogo.jpg', 'centripetalMap.jpg'),
(54, 'Circuit Zolder', 'zolder', 0, 'http://www.circuit-zolder.be', 'zolderLogo.jpg', 'zolderMap.jpg'),
(56, 'Oran Park Raceway', 'oranpark', 0, 'http://en.wikipedia.org/wiki/Oran_Park_Raceway', 'oranparkLogo.jpg', 'oranparkMap.jpg'),
(57, 'Rockingham Speedway', 'rockingham', 0, 'http://rockinghamspeedway.com/', 'rockinghamLogo.jpg', 'rockinghamMap.jpg'),
(58, 'Autodrome Jose Carlos Pace', 'interlagos', 0, 'http://www.autodromodeinterlagos.com.br/', 'interlagosLogo.jpg', 'interlagosMap.jpg'),
(1009, 'Langley Speedway', 'langley', 0, 'http://langley-speedway.com/', 'langleyLogo.jpg', 'langleyMap.jpg'),
(1010, 'Kansas Speedway', 'kansas', 0, 'http://www.kansasspeedway.com/', 'kansasLogo.jpg', 'kansasMap.jpg'),
(1011, 'Circuit Gilles Villeneuve', 'montreal', 0, 'http://www.circuitgillesvilleneuve.ca/en', 'montrealLogo.jpg', 'montrealMap.jpg'),
(1012, 'Long Beach Street Circuit', 'longbeach', 0, 'http://www.gplb.com/', 'longbeachLogo.jpg', 'longbeachMap.jpg'),
(1013, 'Mount Panorama Circuit', 'bathurst', 0, 'http://www.mount-panorama.com.au/', 'bathurstLogo.jpg', 'bathurstMap.jpg'),
(1014, 'New Jersey Motorsports Park', 'njmp', 0, 'http://www.njmp.com/', 'njmpLogo.jpg', 'njmpMap.jpg'),
(1015, 'Auto Club Speedway', 'autoclub', 0, 'http://www.autoclubspeedway.com/', 'autoclubLogo.jpg', 'autoclubMap.jpg'),
(1016, 'Circuit of the Americas', 'cota', 0, 'http://www.circuitoftheamericas.com/', 'cotaLogo.jpg', 'cotaMap.jpg'),
(1017, 'Lucas Oil Raceway', 'irp', 0, 'http://www.lucasoilraceway.com/', 'irpLogo.jpg', 'irpMap.jpg'),
(1018, 'Phoenix International Raceway', 'phoenix', 0, 'http://www.phoenixraceway.com/', 'phoenixLogo.jpg', 'phoenixMap.jpg'),
(1019, 'Donington Park Racing Circuit', 'donington', 0, 'http://www.donington-park.co.uk/', 'doningtonLogo.jpg', 'doningtonMap.jpg'),
(1020, 'Gateway Motorsports Park', 'gateway', 0, 'http://www.gatewaymsp.com/home/', 'gatewayLogo.jpg', 'gatewayMap.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `iRacingId` (`iRacingId`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`config_id`),
  ADD UNIQUE KEY `iracingId` (`iracingId`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`track_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
