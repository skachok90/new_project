-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Чрв 21 2013 р., 21:43
-- Версія сервера: 5.1.65-community
-- Версія PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- БД: `test_project`
--

-- --------------------------------------------------------

--
-- Структура таблиці `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп даних таблиці `city`
--

INSERT INTO `city` (`id`, `country_id`, `value`) VALUES
(1, 1, 'Киев'),
(2, 1, 'Чернигов'),
(3, 1, 'Луганск'),
(4, 1, 'Харьков'),
(5, 1, 'Николаев'),
(6, 2, 'Москва'),
(7, 2, 'Санкт-Петербург'),
(8, 2, 'Ростов'),
(9, 2, 'Воронеж'),
(10, 2, 'Архангельск'),
(11, 3, 'Бостон'),
(12, 3, 'Нью-Йорк'),
(13, 3, 'Анкоридж'),
(14, 4, 'Мюнхер'),
(15, 4, 'Берлин'),
(16, 4, 'Дортмунд'),
(17, 5, 'Мадрид'),
(18, 5, 'Валенсия'),
(19, 5, 'Барселона'),
(20, 5, 'Севилья');

-- --------------------------------------------------------

--
-- Структура таблиці `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп даних таблиці `country`
--

INSERT INTO `country` (`id`, `value`) VALUES
(1, 'Украина'),
(2, 'Россия'),
(3, 'США'),
(4, 'Германия'),
(5, 'Испания');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
