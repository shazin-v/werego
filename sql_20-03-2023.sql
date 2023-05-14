






















/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - itec_rainfall
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


CREATE DATABASE /*!32312 IF NOT EXISTS*/`EV_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `EV_DB`;



-- *Table structure for table `user_profile` 

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE user_profile (
  user_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(20),
  address VARCHAR(200)
);

 /*Data for the table `user_profile` */

INSERT INTO user_profile (user_id, first_name, last_name, email, phone_number, address) VALUES
(1, 'admin', 'admin', 'admin@example.com', '+1-555-555-5555', '123 Main St, Anytown, USA'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '+1-555-555-5555', '456 Elm St, Anytown, USA'),
(3, 'Bob', 'Johnson', 'bobjohnson@example.com', '+1-555-555-5555', '789 Oak St, Anytown, USA'),
(4, 'Alice', 'Williams', 'alicewilliams@example.com', '+1-555-555-5555', '321 Pine St, Anytown, USA'),
(5, 'David', 'Brown', 'davidbrown@example.com', '+1-555-555-5555', '654 Cedar St, Anytown, USA'),
(6, 'Sarah', 'Davis', 'sarahdavis@example.com', '+1-555-555-5555', '987 Maple St, Anytown, USA'),
(7, 'Michael', 'Wilson', 'michaelwilson@example.com', '+1-555-555-5555', '456 Birch St, Anytown, USA'),
(8, 'Amy', 'Lee', 'amylee@example.com', '+1-555-555-5555', '789 Walnut St, Anytown, USA'),
(9, 'Kevin', 'Jones', 'kevinjones@example.com', '+1-555-555-5555', '123 Oak St, Anytown, USA'),
(10, 'Emily', 'Taylor', 'emilytaylor@example.com', '+1-555-555-5555', '456 Maple St, Anytown, USA');

-- Table structure for table `charging_station_list`

DROP TABLE IF EXISTS `admin_charging_station_list`;

CREATE TABLE charging_station_list (
id INT PRIMARY KEY,
station_name VARCHAR(50) NOT NULL,
address VARCHAR(100) NOT NULL,
city CHAR(100) NOT NULL,
charger_type CHAR(20) NOT NULL,
available_ports INT NOT NULL,
status ENUM('Active', 'Under Maintenance', 'Out of Service') NOT NULL
);


-- Data for table `charging_station_list`

INSERT INTO admin_charging_station_list (id, station_name, address, city, charger_type, available_ports, status)
VALUES
(1, 'ABC Charging Station', '123 Main St', 'Thiruvananthapuram', 'AC Level 1 Charging', 4, 'Active'),
(2, 'XYZ Charging Station', '456 Elm St', 'Kollam', 'AC Level 2 Charging', 2, 'Under Maintenance'),
(3, '123 Charging Station', '789 Oak St', 'Pathanamthitta', 'DC Fast Charging', 6, 'Active'),
(4, '456 Charging Station', '1011 Pine St', 'Alappuzha', 'AC Level 1 Charging', 3, 'Out of Service'),
(5, '789 Charging Station', '1213 Maple St', 'Kottayam', 'AC Level 2 Charging', 1, 'Active'),
(6, 'DEF Charging Station', '1415 Cedar St', 'Idukki', 'DC Fast Charging', 5, 'Active'),
(7, 'GHI Charging Station', '1617 Birch St', 'Ernakulam', 'AC Level 1 Charging', 2, 'Under Maintenance'),
(8, 'JKL Charging Station', '1819 Spruce St', 'Thrissur', 'AC Level 2 Charging', 4, 'Active'),
(9, 'MNO Charging Station', '2021 Walnut St', 'Palakkad', 'DC Fast Charging', 3, 'Out of Service'),
(10, 'PQR Charging Station', '2223 Pineapple St', 'Malappuram', 'AC Level 1 Charging', 1, 'Active'),
(11, 'ABC Charging Station', '123 Main St', 'Kozhikode', 'AC Level 1 Charging', 4, 'Active'),
(12, 'XYZ Charging Station', '456 Elm St', 'Wayanad', 'AC Level 2 Charging', 2, 'Under Maintenance'),
(13, '123 Charging Station', '789 Oak St', 'Kannur', 'DC Fast Charging', 6, 'Active'),
(14, '456 Charging Station', '1011 Pine St', 'Kasaragod', 'AC Level 1 Charging', 3, 'Out of Service'),
(15, '789 Charging Station', '1213 Maple St', 'Thiruvananthapuram', 'AC Level 2 Charging', 1, 'Active'),
(16, 'DEF Charging Station', '1415 Cedar St', 'Kollam', 'DC Fast Charging', 5, 'Active'),
(17, 'GHI Charging Station', '1617 Birch St', 'Pathanamthitta', 'AC Level 1 Charging', 2, 'Under Maintenance'),
(18, 'JKL Charging Station', '1819 Spruce St', 'Alappuzha', 'AC Level 2 Charging', 4, 'Active'),
(19, 'MNO Charging Station', '2021 Walnut St', 'Kottayam', 'DC Fast Charging', 3, 'Out of Service'),
(20, 'PQR Charging Station', '2223 Pineapple St', 'Idukki', 'AC Level 1 Charging', 1, 'Active'),
(21, 'ABC Charging Station', '123 Main St', 'Ernakulam', 'AC Level 1 Charging', 4, 'Active');
(51, 'KLM Charging Station', '3035 Laurel St', 'Thrissur', 'AC Level 2 Charging', 3, 'Active'),
(52, 'STU Charging Station', '3237 Ash St', 'Kollam', 'DC Fast Charging', 2, 'Under Maintenance'),
(53, 'VWX Charging Station', '3439 Cedar St', 'Kottayam', 'AC Level 1 Charging', 4, 'Active'),
(54, 'YZA Charging Station', '3641 Elm St', 'Ernakulam', 'AC Level 2 Charging', 5, 'Active'),
(55, 'BCD Charging Station', '3843 Birch St', 'Thiruvananthapuram', 'DC Fast Charging', 2, 'Out of Service'),
(56, 'EFG Charging Station', '4045 Oak St', 'Alappuzha', 'AC Level 1 Charging', 1, 'Active'),
(57, 'HIJ Charging Station', '4247 Pine St', 'Palakkad', 'AC Level 2 Charging', 3, 'Under Maintenance'),
(58, 'KLM Charging Station', '4449 Walnut St', 'Malappuram', 'DC Fast Charging', 6, 'Active'),
(59, 'NOP Charging Station', '4651 Maple St', 'Kannur', 'AC Level 1 Charging', 4, 'Active'),
(60, 'QRS Charging Station', '4853 Pineapple St', 'Kozhikode', 'AC Level 2 Charging', 2, 'Under Maintenance'),
(61, 'TUV Charging Station', '5055 Oakwood St', 'Thrissur', 'DC Fast Charging', 3, 'Active'),
(62, 'WXYZ Charging Station', '5257 Chestnut St', 'Kollam', 'AC Level 1 Charging', 5, 'Out of Service'),
(63, 'ABC2 Charging Station', '5459 Walnut St', 'Kottayam', 'AC Level 2 Charging', 1, 'Active'),
(64, 'DEF2 Charging Station', '5661 Cedar St', 'Ernakulam', 'DC Fast Charging', 4, 'Active'),
(65, 'GHI2 Charging Station', '5863 Elm St', 'Thiruvananthapuram', 'AC Level 1 Charging', 2, 'Under Maintenance'),
(66, 'JKL2 Charging Station', '6065 Pine St', 'Alappuzha', 'AC Level 2 Charging', 3, 'Active'),
(67, 'MNO2 Charging Station', '6267 Oak St', 'Palakkad', 'DC Fast Charging', 6, 'Out of Service'),
(68, 'PQR2 Charging Station', '6469 Pineapple St', 'Malappuram', 'AC Level 1 Charging', 1, 'Active'),
(69, 'STU2 Charging Station', '6671 Walnut St', 'Kannur', 'AC Level 2 Charging', 4, 'Under Maintenance'),
(70, 'VWX2 Charging Station', '6873 Cedar St', 'Kozhikode', 'DC Fast Charging', 5, 'Active'),
(71, 'YZA2 Charging Station', '7075 Ash St', 'Thrissur', 'AC Level 1 Charging', 3, 'Active');




-- Table structure for table `login`

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` ENUM('admin', 'user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

INSERT INTO `login` (`username`, `password`, `usertype`) VALUES
('admin', '123', 'admin'),
('user2', '123', 'user'),
('johnsmith', 'qwertyuiop', 'user'),
('johndoe', 'asdfghjkl', 'user'),
('janedoe', 'zxcvbnm', 'user'),
('admin', 'adminpass', 'user'),
('testuser', 'testpass', 'user'),
('guest', 'guestpass', 'user'),
('user3', 'pass789', 'user'),
('user4', 'password1234', 'user');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

INSERT INTO `user` (`name`, `email`) VALUES
  ('John Doe', 'johndoe@example.com'),
  ('Jane Smith', 'janesmith@example.com'),
  ('Bob Johnson', 'bjohnson@example.com'),
  ('Sara Lee', 'saralee@example.com'),
  ('Maxwell Smart', 'msmart@example.com'),
  ('Lucy Liu', 'lucyliu@example.com'),
  ('Jack Black', 'jblack@example.com'),
  ('Amy Adams', 'aadams@example.com'),
  ('Tom Hanks', 'thanks@example.com'),
  ('Emma Watson', 'ewatson@example.com');

  

/*Table structure for table `charging_station_booking` */


CREATE TABLE charging_station_booking (
id INT PRIMARY KEY,
charging_station_id INT NOT NULL,
user_id INT NOT NULL,
booking_start_time DATETIME NOT NULL,
booking_end_time DATETIME NOT NULL,
status ENUM('Active', 'Cancelled', 'Completed') NOT NULL
);
-- FOREIGN KEY (user_id) REFERENCES user_list(id)
-- FOREIGN KEY (charging_station_id) REFERENCES charging_station_list(id),



/*Data for the table `charging_station_booking` */

INSERT INTO charging_station_booking (id, charging_station_id, user_id, booking_start_time, booking_end_time, status)
VALUES
(1, 1, 1, '2022-01-01 10:00:00', '2022-01-01 12:00:00', 'Completed'),
(2, 2, 2, '2022-01-02 13:00:00', '2022-01-02 15:00:00', 'Cancelled'),
(3, 3, 3, '2022-01-03 16:00:00', '2022-01-03 18:00:00', 'Active'),
(4, 4, 4, '2022-01-04 19:00:00', '2022-01-04 21:00:00', 'Active'),
(5, 5, 5, '2022-01-05 22:00:00', '2022-01-05 23:00:00', 'Completed'),
(6, 6, 6, '2022-01-06 10:00:00', '2022-01-06 11:00:00', 'Completed'),
(7, 7, 7, '2022-01-07 12:00:00', '2022-01-07 13:00:00', 'Active'),
(8, 8, 8, '2022-01-08 14:00:00', '2022-01-08 16:00:00', 'Cancelled'),
(9, 9, 9, '2022-01-09 17:00:00', '2022-01-09 19:00:00', 'Active'),
(10, 10, 10, '2022-01-10 20:00:00', '2022-01-10 22:00:00', 'Completed');



/*Table structure for table `user_dashboard` */


CREATE TABLE user_dashboard (
  booking_date DATE,
  time TIME,
  city VARCHAR(50),
  station VARCHAR(50)
);  

/*Data for the table `user_dashboard` */



INSERT INTO user_dashboard (booking_date, time, city, station)
VALUES
('2023-04-27', '10:00:00', 'New York', 'Station A'),
('2023-04-27', '14:30:00', 'San Francisco', 'Station B'),
('2023-04-28', '09:15:00', 'London', 'Station C'),
('2023-04-28', '16:00:00', 'Paris', 'Station D'),
('2023-04-29', '11:45:00', 'Sydney', 'Station E'),
('2023-04-29', '15:30:00', 'Tokyo', 'Station F'),
('2023-04-30', '13:00:00', 'Dubai', 'Station G'),
('2023-04-30', '18:45:00', 'Mumbai', 'Station H'),
('2023-05-01', '10:30:00', 'Berlin', 'Station I'),
('2023-05-01', '14:15:00', 'Toronto', 'Station J'),
('2023-05-02', '12:00:00', 'Hong Kong', 'Station K'),
('2023-05-02', '17:30:00', 'Chicago', 'Station L'),
('2023-05-03', '08:45:00', 'Barcelona', 'Station M'),
('2023-05-03', '13:15:00', 'Melbourne', 'Station N'),
('2023-05-04', '11:00:00', 'Seoul', 'Station O');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

