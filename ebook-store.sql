-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Lip 2022, 12:39
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ebook-store`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `address`
--

CREATE TABLE `address` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `street_number` varchar(10) NOT NULL,
  `street_name` varchar(50) NOT NULL,
  `city` varchar(60) NOT NULL,
  `country_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `address_status`
--

CREATE TABLE `address_status` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `status` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `author`
--

CREATE TABLE `author` (
  `author_id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `author_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `author`
--

INSERT INTO `author` (`author_id`, `author_name`) VALUES
('62e51013-df82-11ec-878c-7085c2d2e153', 'Alistair Welchman'),
('62e51a48-df82-11ec-878c-7085c2d2e153', 'Alison Aldridge'),
('62e51aa7-df82-11ec-878c-7085c2d2e153', 'Alistair Hackett'),
('62e51ac1-df82-11ec-878c-7085c2d2e153', 'Mirosław Mickiewicz'),
('62e51ad9-df82-11ec-878c-7085c2d2e153', 'Alice Terefenko'),
('62e51af3-df82-11ec-878c-7085c2d2e153', 'Alison Krawczyk'),
('62e51b09-df82-11ec-878c-7085c2d2e153', 'Monika Janicki'),
('62e51b1f-df82-11ec-878c-7085c2d2e153', 'Malcolm Korab'),
('62e51b3a-df82-11ec-878c-7085c2d2e153', 'Marlena Hamilton'),
('62e52417-df82-11ec-878c-7085c2d2e153', 'Maria Smith'),
('62e52444-df82-11ec-878c-7085c2d2e153', 'Maria Twardoch'),
('62e5245a-df82-11ec-878c-7085c2d2e153', 'Lech Kowalski'),
('62e52473-df82-11ec-878c-7085c2d2e153', 'Lech Krawczyk'),
('62e5248a-df82-11ec-878c-7085c2d2e153', 'Jowita Hamilton'),
('62e5249f-df82-11ec-878c-7085c2d2e153', 'Jarosław Aldridge'),
('62e524b4-df82-11ec-878c-7085c2d2e153', 'Henryk Kowalski'),
('62e524c8-df82-11ec-878c-7085c2d2e153', 'Malcolm Miroszewski'),
('62e524e2-df82-11ec-878c-7085c2d2e153', 'Jowita Smith'),
('62e524f6-df82-11ec-878c-7085c2d2e153', 'Mariusz Podgórski'),
('62e5250b-df82-11ec-878c-7085c2d2e153', 'Leon Pratchett'),
('62e52520-df82-11ec-878c-7085c2d2e153', 'Margaret Friedman'),
('62e52533-df82-11ec-878c-7085c2d2e153', 'Alison Mróz'),
('62e52548-df82-11ec-878c-7085c2d2e153', 'Marlena Krawczyk'),
('62e5255b-df82-11ec-878c-7085c2d2e153', 'Adam Warchoł'),
('62e52570-df82-11ec-878c-7085c2d2e153', 'Jan Twardoch'),
('62e52583-df82-11ec-878c-7085c2d2e153', 'Mirosław Smith'),
('62e52598-df82-11ec-878c-7085c2d2e153', 'Dariusz Walker'),
('62e525ac-df82-11ec-878c-7085c2d2e153', 'Dariusz Smith'),
('62e525c0-df82-11ec-878c-7085c2d2e153', 'Anna Mróz'),
('62e525d5-df82-11ec-878c-7085c2d2e153', 'Alistair Hackett');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `category_id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `category_name` varchar(30) NOT NULL,
  `popular` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `popular`) VALUES
('58dac472-df29-11ec-b311-7085c2d2e153', 'Fantastyka', 1),
('58daccdd-df29-11ec-b311-7085c2d2e153', 'Historia', 0),
('58dacd30-df29-11ec-b311-7085c2d2e153', 'Kuchnia', 0),
('58dacd4f-df29-11ec-b311-7085c2d2e153', 'Dla dzieci', 0),
('58dacd6e-df29-11ec-b311-7085c2d2e153', 'Thriller', 0),
('58dacd8c-df29-11ec-b311-7085c2d2e153', 'Kryminał', 1),
('58dacdaa-df29-11ec-b311-7085c2d2e153', 'Literatura popularnonaukowa', 0),
('58dacde0-df29-11ec-b311-7085c2d2e153', 'Powieść obyczajowa', 0),
('58dace02-df29-11ec-b311-7085c2d2e153', 'Poradniki', 1),
('58dace1f-df29-11ec-b311-7085c2d2e153', 'Reportaż', 0),
('58dace50-df29-11ec-b311-7085c2d2e153', 'Podróże', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `country_id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `country_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
('aceb3930-df30-11ec-b311-7085c2d2e153', 'Afghanistan'),
('aceb3b88-df30-11ec-b311-7085c2d2e153', 'Netherlands Antilles'),
('aceb3bd0-df30-11ec-b311-7085c2d2e153', 'Albania'),
('aceb3be8-df30-11ec-b311-7085c2d2e153', 'Algeria'),
('aceb3c00-df30-11ec-b311-7085c2d2e153', 'Andorra'),
('aceb3c19-df30-11ec-b311-7085c2d2e153', 'Angola'),
('aceb3c32-df30-11ec-b311-7085c2d2e153', 'Antigua and Barbuda'),
('aceb3c48-df30-11ec-b311-7085c2d2e153', 'Australasia'),
('aceb3c60-df30-11ec-b311-7085c2d2e153', 'Argentina'),
('aceb3c76-df30-11ec-b311-7085c2d2e153', 'Armenia'),
('aceb3c8b-df30-11ec-b311-7085c2d2e153', 'Aruba'),
('aceb3ca1-df30-11ec-b311-7085c2d2e153', 'American Samoa'),
('aceb3cbd-df30-11ec-b311-7085c2d2e153', 'Australia'),
('aceb3cd2-df30-11ec-b311-7085c2d2e153', 'Austria'),
('aceb3ce7-df30-11ec-b311-7085c2d2e153', 'Azerbaijan'),
('aceb3cfd-df30-11ec-b311-7085c2d2e153', 'Bahamas'),
('aceb47c7-df30-11ec-b311-7085c2d2e153', 'Bangladesh'),
('aceb4812-df30-11ec-b311-7085c2d2e153', 'Barbados'),
('aceb482b-df30-11ec-b311-7085c2d2e153', 'Burundi'),
('aceb4841-df30-11ec-b311-7085c2d2e153', 'Belgium'),
('aceb4858-df30-11ec-b311-7085c2d2e153', 'Benin'),
('aceb486f-df30-11ec-b311-7085c2d2e153', 'Bermuda'),
('aceb4884-df30-11ec-b311-7085c2d2e153', 'Bhutan'),
('aceb4899-df30-11ec-b311-7085c2d2e153', 'Bosnia and Herzegovina'),
('aceb48b1-df30-11ec-b311-7085c2d2e153', 'Belize'),
('aceb48c5-df30-11ec-b311-7085c2d2e153', 'Belarus'),
('aceb48da-df30-11ec-b311-7085c2d2e153', 'Bohemia'),
('aceb48ee-df30-11ec-b311-7085c2d2e153', 'Boliva'),
('aceb4905-df30-11ec-b311-7085c2d2e153', 'Botswana'),
('aceb4919-df30-11ec-b311-7085c2d2e153', 'Brazil'),
('aceb492d-df30-11ec-b311-7085c2d2e153', 'Bahrain'),
('aceb4942-df30-11ec-b311-7085c2d2e153', 'Brunei'),
('aceb4958-df30-11ec-b311-7085c2d2e153', 'Bulgaria'),
('aceb497f-df30-11ec-b311-7085c2d2e153', 'Burkina Faso'),
('aceb4995-df30-11ec-b311-7085c2d2e153', 'Central African Republic'),
('aceb49ad-df30-11ec-b311-7085c2d2e153', 'Cambodia'),
('aceb49d4-df30-11ec-b311-7085c2d2e153', 'Canada'),
('aceb49ea-df30-11ec-b311-7085c2d2e153', 'Cayman Islands'),
('aceb4a00-df30-11ec-b311-7085c2d2e153', 'Republic of Congo'),
('aceb4a18-df30-11ec-b311-7085c2d2e153', 'Chad'),
('aceb4a32-df30-11ec-b311-7085c2d2e153', 'Chile'),
('aceb4a45-df30-11ec-b311-7085c2d2e153', 'China'),
('aceb4a58-df30-11ec-b311-7085c2d2e153', 'Ivory Coast'),
('aceb4a6d-df30-11ec-b311-7085c2d2e153', 'Cameroon'),
('aceb4a80-df30-11ec-b311-7085c2d2e153', 'Democratic Republic of the Congo'),
('aceb4a95-df30-11ec-b311-7085c2d2e153', 'Cook Islands'),
('aceb4aa9-df30-11ec-b311-7085c2d2e153', 'Colombia'),
('aceb4abd-df30-11ec-b311-7085c2d2e153', 'Comoros'),
('aceb4ad2-df30-11ec-b311-7085c2d2e153', 'Cape Verde'),
('aceb4ae5-df30-11ec-b311-7085c2d2e153', 'Costa Rica'),
('aceb4af9-df30-11ec-b311-7085c2d2e153', 'Croatia'),
('aceb4b0d-df30-11ec-b311-7085c2d2e153', 'Crete'),
('aceb4b20-df30-11ec-b311-7085c2d2e153', 'Cuba'),
('aceb4b36-df30-11ec-b311-7085c2d2e153', 'Cyprus'),
('aceb4b4a-df30-11ec-b311-7085c2d2e153', 'Czech Republic'),
('aceb4b5d-df30-11ec-b311-7085c2d2e153', 'Denmark'),
('aceb4b71-df30-11ec-b311-7085c2d2e153', 'Djibouti'),
('aceb4b85-df30-11ec-b311-7085c2d2e153', 'Dominica'),
('aceb4b99-df30-11ec-b311-7085c2d2e153', 'Dominican Republic'),
('aceb4bad-df30-11ec-b311-7085c2d2e153', 'Ecuador'),
('aceb4bc1-df30-11ec-b311-7085c2d2e153', 'Egypt'),
('aceb4bd5-df30-11ec-b311-7085c2d2e153', 'Eritrea'),
('aceb4be9-df30-11ec-b311-7085c2d2e153', 'El Salvador'),
('aceb4bfd-df30-11ec-b311-7085c2d2e153', 'Spain'),
('aceb4c10-df30-11ec-b311-7085c2d2e153', 'Estonia'),
('aceb4c24-df30-11ec-b311-7085c2d2e153', 'Ethiopia'),
('aceb4c38-df30-11ec-b311-7085c2d2e153', 'Unified Team'),
('aceb4c4b-df30-11ec-b311-7085c2d2e153', 'Fiji'),
('aceb4c60-df30-11ec-b311-7085c2d2e153', 'Finland'),
('aceb4c73-df30-11ec-b311-7085c2d2e153', 'France'),
('aceb4c86-df30-11ec-b311-7085c2d2e153', 'West Germany'),
('aceb4c9a-df30-11ec-b311-7085c2d2e153', 'Micronesia'),
('aceb4cae-df30-11ec-b311-7085c2d2e153', 'Gabon'),
('aceb4cc2-df30-11ec-b311-7085c2d2e153', 'Gambia'),
('aceb4cd5-df30-11ec-b311-7085c2d2e153', 'United Kingdom'),
('aceb4ce8-df30-11ec-b311-7085c2d2e153', 'Guinea-Bissau'),
('aceb4cfc-df30-11ec-b311-7085c2d2e153', 'East Germany'),
('aceb4d10-df30-11ec-b311-7085c2d2e153', 'Georgia'),
('aceb4d24-df30-11ec-b311-7085c2d2e153', 'Equatorial Guinea'),
('aceb4d37-df30-11ec-b311-7085c2d2e153', 'Germany'),
('aceb4d4b-df30-11ec-b311-7085c2d2e153', 'Ghana'),
('aceb4d5f-df30-11ec-b311-7085c2d2e153', 'Greece'),
('aceb4d72-df30-11ec-b311-7085c2d2e153', 'Grenada'),
('aceb4d85-df30-11ec-b311-7085c2d2e153', 'Guatemala'),
('aceb4d99-df30-11ec-b311-7085c2d2e153', 'Guinea'),
('aceb4dad-df30-11ec-b311-7085c2d2e153', 'Guam'),
('aceb4dc0-df30-11ec-b311-7085c2d2e153', 'Guyana'),
('aceb4dd3-df30-11ec-b311-7085c2d2e153', 'Haiti'),
('aceb4de8-df30-11ec-b311-7085c2d2e153', 'Hong Kong'),
('aceb4dfc-df30-11ec-b311-7085c2d2e153', 'Honduras'),
('aceb4e10-df30-11ec-b311-7085c2d2e153', 'Hungary'),
('aceb4e23-df30-11ec-b311-7085c2d2e153', 'Indonesia'),
('aceb4e37-df30-11ec-b311-7085c2d2e153', 'India'),
('aceb4e4a-df30-11ec-b311-7085c2d2e153', 'Individual Olympic Athletes'),
('aceb4e5f-df30-11ec-b311-7085c2d2e153', 'Iran'),
('aceb4e74-df30-11ec-b311-7085c2d2e153', 'Ireland'),
('aceb4e88-df30-11ec-b311-7085c2d2e153', 'Iraq'),
('aceb4e9b-df30-11ec-b311-7085c2d2e153', 'Iceland'),
('aceb4eaf-df30-11ec-b311-7085c2d2e153', 'Israel'),
('aceb4ec2-df30-11ec-b311-7085c2d2e153', 'Virgin Islands'),
('aceb4ed6-df30-11ec-b311-7085c2d2e153', 'Italy'),
('aceb4ee9-df30-11ec-b311-7085c2d2e153', 'Virgin Islands, British'),
('aceb4efe-df30-11ec-b311-7085c2d2e153', 'Jamaica'),
('aceb4f12-df30-11ec-b311-7085c2d2e153', 'Jordan'),
('aceb4f25-df30-11ec-b311-7085c2d2e153', 'Japan'),
('aceb4f39-df30-11ec-b311-7085c2d2e153', 'Kazakhstan'),
('aceb4f4c-df30-11ec-b311-7085c2d2e153', 'Kenya'),
('aceb4f60-df30-11ec-b311-7085c2d2e153', 'Kyrgyzstan'),
('aceb4f74-df30-11ec-b311-7085c2d2e153', 'Kiribati'),
('aceb4f87-df30-11ec-b311-7085c2d2e153', 'South Korea'),
('aceb4f9b-df30-11ec-b311-7085c2d2e153', 'Kosovo'),
('aceb4fae-df30-11ec-b311-7085c2d2e153', 'Saudi Arabia'),
('aceb4fc3-df30-11ec-b311-7085c2d2e153', 'Kuwait'),
('aceb4fd6-df30-11ec-b311-7085c2d2e153', 'Laos'),
('aceb4feb-df30-11ec-b311-7085c2d2e153', 'Latvia'),
('aceb4ffe-df30-11ec-b311-7085c2d2e153', 'Libya'),
('aceb5011-df30-11ec-b311-7085c2d2e153', 'Liberia'),
('aceb502d-df30-11ec-b311-7085c2d2e153', 'Saint Lucia'),
('aceb5041-df30-11ec-b311-7085c2d2e153', 'Lesotho'),
('aceb5055-df30-11ec-b311-7085c2d2e153', 'Lebanon'),
('aceb5069-df30-11ec-b311-7085c2d2e153', 'Liechtenstein'),
('aceb507e-df30-11ec-b311-7085c2d2e153', 'Lithuania'),
('aceb5091-df30-11ec-b311-7085c2d2e153', 'Luxembourg'),
('aceb50a5-df30-11ec-b311-7085c2d2e153', 'Madagascar'),
('aceb50b9-df30-11ec-b311-7085c2d2e153', 'Malaya'),
('aceb50ce-df30-11ec-b311-7085c2d2e153', 'Morocco'),
('aceb50e1-df30-11ec-b311-7085c2d2e153', 'Malaysia'),
('aceb50f5-df30-11ec-b311-7085c2d2e153', 'Malawi'),
('aceb5108-df30-11ec-b311-7085c2d2e153', 'Moldova'),
('aceb511c-df30-11ec-b311-7085c2d2e153', 'Maldives'),
('aceb512f-df30-11ec-b311-7085c2d2e153', 'Mexico'),
('aceb5143-df30-11ec-b311-7085c2d2e153', 'Mongolia'),
('aceb5157-df30-11ec-b311-7085c2d2e153', 'Marshall Islands'),
('aceb516a-df30-11ec-b311-7085c2d2e153', 'Macedonia'),
('aceb517e-df30-11ec-b311-7085c2d2e153', 'Mali'),
('aceb5192-df30-11ec-b311-7085c2d2e153', 'Malta'),
('aceb51a6-df30-11ec-b311-7085c2d2e153', 'Montenegro'),
('aceb51b9-df30-11ec-b311-7085c2d2e153', 'Monaco'),
('aceb51cd-df30-11ec-b311-7085c2d2e153', 'Mozambique'),
('aceb51e0-df30-11ec-b311-7085c2d2e153', 'Mauritius'),
('aceb51f4-df30-11ec-b311-7085c2d2e153', 'Mauritania'),
('aceb5210-df30-11ec-b311-7085c2d2e153', 'Myanmar'),
('aceb522e-df30-11ec-b311-7085c2d2e153', 'Namibia'),
('aceb5248-df30-11ec-b311-7085c2d2e153', 'North Borneo'),
('aceb525c-df30-11ec-b311-7085c2d2e153', 'Nicaragua'),
('aceb5274-df30-11ec-b311-7085c2d2e153', 'Netherlands'),
('aceb5291-df30-11ec-b311-7085c2d2e153', 'Nepal'),
('aceb52a5-df30-11ec-b311-7085c2d2e153', 'Newfoundland'),
('aceb52b9-df30-11ec-b311-7085c2d2e153', 'Nigeria'),
('aceb52cd-df30-11ec-b311-7085c2d2e153', 'Niger'),
('aceb52e0-df30-11ec-b311-7085c2d2e153', 'Norway'),
('aceb52f5-df30-11ec-b311-7085c2d2e153', 'Nauru'),
('aceb5308-df30-11ec-b311-7085c2d2e153', 'New Zealand'),
('aceb531d-df30-11ec-b311-7085c2d2e153', 'Oman'),
('aceb5330-df30-11ec-b311-7085c2d2e153', 'Pakistan'),
('aceb5344-df30-11ec-b311-7085c2d2e153', 'Panama'),
('aceb5357-df30-11ec-b311-7085c2d2e153', 'Paraguay'),
('aceb536b-df30-11ec-b311-7085c2d2e153', 'Peru'),
('aceb537e-df30-11ec-b311-7085c2d2e153', 'Philippines'),
('aceb5392-df30-11ec-b311-7085c2d2e153', 'Palestine'),
('aceb53a7-df30-11ec-b311-7085c2d2e153', 'Palau'),
('aceb53bb-df30-11ec-b311-7085c2d2e153', 'Papua New Guinea'),
('aceb53ce-df30-11ec-b311-7085c2d2e153', 'Poland'),
('aceb53e2-df30-11ec-b311-7085c2d2e153', 'Portugal'),
('aceb53f6-df30-11ec-b311-7085c2d2e153', 'North Korea'),
('aceb540a-df30-11ec-b311-7085c2d2e153', 'Puerto Rico'),
('aceb541d-df30-11ec-b311-7085c2d2e153', 'Qatar'),
('aceb5430-df30-11ec-b311-7085c2d2e153', 'Zimbabwe (Rhodesia)'),
('aceb5445-df30-11ec-b311-7085c2d2e153', 'Refugee Olympic Team'),
('aceb5458-df30-11ec-b311-7085c2d2e153', 'Romania'),
('aceb546c-df30-11ec-b311-7085c2d2e153', 'South Africa'),
('aceb5480-df30-11ec-b311-7085c2d2e153', 'Russia'),
('aceb5494-df30-11ec-b311-7085c2d2e153', 'Rwanda'),
('aceb54a8-df30-11ec-b311-7085c2d2e153', 'Saar'),
('aceb54bb-df30-11ec-b311-7085c2d2e153', 'Samoa'),
('aceb54ce-df30-11ec-b311-7085c2d2e153', 'Serbia and Montenegro'),
('aceb54e4-df30-11ec-b311-7085c2d2e153', 'Senegal'),
('aceb54f7-df30-11ec-b311-7085c2d2e153', 'Seychelles'),
('aceb550b-df30-11ec-b311-7085c2d2e153', 'Singapore'),
('aceb5534-df30-11ec-b311-7085c2d2e153', 'Turks and Caicos Islands'),
('aceb554a-df30-11ec-b311-7085c2d2e153', 'Sierra Leone'),
('aceb555e-df30-11ec-b311-7085c2d2e153', 'Slovenia'),
('aceb5572-df30-11ec-b311-7085c2d2e153', 'San Marino'),
('aceb5586-df30-11ec-b311-7085c2d2e153', 'Solomon Islands'),
('aceb5599-df30-11ec-b311-7085c2d2e153', 'Somalia'),
('aceb55ad-df30-11ec-b311-7085c2d2e153', 'Serbia'),
('aceb55c1-df30-11ec-b311-7085c2d2e153', 'Sri Lanka'),
('aceb55d5-df30-11ec-b311-7085c2d2e153', 'South Sudan'),
('aceb55e9-df30-11ec-b311-7085c2d2e153', 'Sao Tome and Principe'),
('aceb55fd-df30-11ec-b311-7085c2d2e153', 'Sudan'),
('aceb5611-df30-11ec-b311-7085c2d2e153', 'Switzerland'),
('aceb5624-df30-11ec-b311-7085c2d2e153', 'Suriname'),
('aceb5638-df30-11ec-b311-7085c2d2e153', 'Slovakia'),
('aceb564c-df30-11ec-b311-7085c2d2e153', 'Sweden'),
('aceb5661-df30-11ec-b311-7085c2d2e153', 'Swaziland'),
('aceb5675-df30-11ec-b311-7085c2d2e153', 'Syria'),
('aceb5688-df30-11ec-b311-7085c2d2e153', 'Tanzania'),
('aceb569c-df30-11ec-b311-7085c2d2e153', 'Czechoslovakia'),
('aceb56b0-df30-11ec-b311-7085c2d2e153', 'Tonga'),
('aceb56c3-df30-11ec-b311-7085c2d2e153', 'Thailand'),
('aceb56d7-df30-11ec-b311-7085c2d2e153', 'Tajikistan'),
('aceb56eb-df30-11ec-b311-7085c2d2e153', 'Turkmenistan'),
('aceb56fe-df30-11ec-b311-7085c2d2e153', 'Timor-Leste'),
('aceb5712-df30-11ec-b311-7085c2d2e153', 'Togo'),
('aceb5726-df30-11ec-b311-7085c2d2e153', 'Taiwan'),
('aceb573a-df30-11ec-b311-7085c2d2e153', 'Trinidad and Tobago'),
('aceb574d-df30-11ec-b311-7085c2d2e153', 'Tunisia'),
('aceb5761-df30-11ec-b311-7085c2d2e153', 'Turkey'),
('aceb5775-df30-11ec-b311-7085c2d2e153', 'Tuvalu'),
('aceb5797-df30-11ec-b311-7085c2d2e153', 'United Arab Emirates'),
('aceb57aa-df30-11ec-b311-7085c2d2e153', 'United Arab Republic'),
('aceb57be-df30-11ec-b311-7085c2d2e153', 'Uganda'),
('aceb57d3-df30-11ec-b311-7085c2d2e153', 'Ukraine'),
('aceb57e7-df30-11ec-b311-7085c2d2e153', 'Unknown'),
('aceb57fb-df30-11ec-b311-7085c2d2e153', 'Soviet Union'),
('aceb580e-df30-11ec-b311-7085c2d2e153', 'Uruguay'),
('aceb5823-df30-11ec-b311-7085c2d2e153', 'United States of America'),
('aceb5837-df30-11ec-b311-7085c2d2e153', 'Uzbekistan'),
('aceb584a-df30-11ec-b311-7085c2d2e153', 'Vanuatu'),
('aceb585e-df30-11ec-b311-7085c2d2e153', 'Venezuela'),
('aceb5872-df30-11ec-b311-7085c2d2e153', 'Vietnam'),
('aceb5886-df30-11ec-b311-7085c2d2e153', 'Saint Vincent'),
('aceb589a-df30-11ec-b311-7085c2d2e153', 'Vietnam (pre)'),
('aceb58ae-df30-11ec-b311-7085c2d2e153', 'West Indies Federation'),
('aceb58c2-df30-11ec-b311-7085c2d2e153', 'North Yemen'),
('aceb58d6-df30-11ec-b311-7085c2d2e153', 'Yemen'),
('aceb58ea-df30-11ec-b311-7085c2d2e153', 'South Yemen'),
('aceb58fe-df30-11ec-b311-7085c2d2e153', 'Yugoslavia'),
('aceb5912-df30-11ec-b311-7085c2d2e153', 'Zambia'),
('aceb5926-df30-11ec-b311-7085c2d2e153', 'Zimbabwe'),
('aceb5939-df30-11ec-b311-7085c2d2e153', 'Singapore'),
('aceb594d-df30-11ec-b311-7085c2d2e153', 'French Polynesia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer`
--

CREATE TABLE `customer` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_id` varchar(36) NOT NULL,
  `address_id` varchar(36) NOT NULL,
  `status_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer_discount`
--

CREATE TABLE `customer_discount` (
  `customer_id` varchar(36) NOT NULL,
  `discount_id` varchar(36) NOT NULL,
  `code` varchar(20) NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cust_order`
--

CREATE TABLE `cust_order` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `order_date` datetime NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `shipping_method_id` varchar(36) NOT NULL,
  `dest_address_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `discount`
--

CREATE TABLE `discount` (
  `discount_id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `discount_name` varchar(150) NOT NULL,
  `discount_value` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ebook`
--

CREATE TABLE `ebook` (
  `ebook_id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `title` varchar(100) NOT NULL,
  `num_pages` int(4) NOT NULL,
  `publication_date` date NOT NULL,
  `description` text NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `language_id` varchar(36) NOT NULL,
  `publisher_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ebook`
--

INSERT INTO `ebook` (`ebook_id`, `title`, `num_pages`, `publication_date`, `description`, `price`, `language_id`, `publisher_id`) VALUES
('c3142ee9-e048-11ec-80cc-7085c2d2e153', 'Hobbit: Tam i z powrotem', 205, '2021-10-21', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '22.59', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3144cf8-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 5', 537, '2021-07-13', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '46.76', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3144db0-e048-11ec-80cc-7085c2d2e153', 'Władca Pierścieni: Powrót Króla', 176, '2022-03-29', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '13.13', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3144e61-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 10', 437, '2022-01-20', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '16.20', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3144ee7-e048-11ec-80cc-7085c2d2e153', 'BlaBla', 348, '2022-04-30', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '21.06', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3144fc2-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 20', 515, '2022-01-28', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '18.47', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148a42-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 4', 71, '2022-01-14', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '33.26', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148b70-e048-11ec-80cc-7085c2d2e153', 'BlaBla', 488, '2022-02-12', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '4.41', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148c00-e048-11ec-80cc-7085c2d2e153', 'Silmarillion', 579, '2021-12-12', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '7.56', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148c84-e048-11ec-80cc-7085c2d2e153', 'BlaBla', 318, '2021-06-29', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '24.77', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148cf5-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 19', 393, '2021-10-23', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '38.37', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148d65-e048-11ec-80cc-7085c2d2e153', 'Krecik', 271, '2021-06-25', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '6.56', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148dcf-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 7', 590, '2021-08-21', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '3.90', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3148fe9-e048-11ec-80cc-7085c2d2e153', 'Bolek i Lolek', 20, '2021-10-03', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '18.41', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149066-e048-11ec-80cc-7085c2d2e153', 'Silmarillion', 215, '2021-10-16', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '44.54', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31490d2-e048-11ec-80cc-7085c2d2e153', 'Krecik', 341, '2021-11-19', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '15.01', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314913e-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 7', 253, '2021-11-27', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '42.25', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31491b3-e048-11ec-80cc-7085c2d2e153', 'Hobbit: Tam i z powrotem', 19, '2021-07-02', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '20.30', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314927d-e048-11ec-80cc-7085c2d2e153', 'Wielka Lechia', 49, '2022-03-18', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '45.11', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31492e6-e048-11ec-80cc-7085c2d2e153', 'Władca Pierścieni: Powrót Króla', 286, '2021-12-17', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '7.54', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314935d-e048-11ec-80cc-7085c2d2e153', 'Dummy Book', 161, '2021-08-10', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '2.33', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31493c4-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 5', 468, '2022-04-17', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '4.47', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314942a-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 13', 663, '2021-11-11', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '40.83', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149498-e048-11ec-80cc-7085c2d2e153', 'Pan Samochodzik', 616, '2021-09-18', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '40.76', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149501-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 6', 316, '2021-08-07', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '9.17', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149572-e048-11ec-80cc-7085c2d2e153', 'Jakiś Kryminał', 463, '2022-05-30', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '36.27', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31495d9-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 4', 645, '2021-11-17', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '19.60', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314963c-e048-11ec-80cc-7085c2d2e153', 'Jakiś Kryminał', 58, '2022-04-14', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '15.85', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31496ac-e048-11ec-80cc-7085c2d2e153', 'Jakiś Kryminał', 487, '2022-02-27', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '39.50', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149712-e048-11ec-80cc-7085c2d2e153', 'Zbrodnia bez kary', 556, '2021-09-04', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '17.52', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31497c7-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 3', 79, '2021-06-07', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '16.34', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149837-e048-11ec-80cc-7085c2d2e153', 'Hobbit: Tam i z powrotem', 138, '2022-02-28', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '37.10', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314989f-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 13', 181, '2022-05-21', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '20.73', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149906-e048-11ec-80cc-7085c2d2e153', 'Atlas Cudów Wszelakich', 131, '2022-04-13', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '32.91', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c31499a4-e048-11ec-80cc-7085c2d2e153', 'Yummy Cook', 24, '2021-06-30', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '28.40', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149a0a-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 19', 18, '2022-03-14', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '40.67', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149a74-e048-11ec-80cc-7085c2d2e153', 'Menelos i Halina', 595, '2021-10-04', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '40.05', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149ada-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 11', 599, '2022-05-11', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '18.90', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149b42-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 15', 506, '2021-07-21', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '14.84', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153');
INSERT INTO `ebook` (`ebook_id`, `title`, `num_pages`, `publication_date`, `description`, `price`, `language_id`, `publisher_id`) VALUES
('c3149ba8-e048-11ec-80cc-7085c2d2e153', 'Ranczo', 47, '2022-01-09', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '21.81', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149c11-e048-11ec-80cc-7085c2d2e153', 'Brudny Harry', 103, '2021-12-15', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '7.58', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149c73-e048-11ec-80cc-7085c2d2e153', 'W Pustyni i Pustelni', 598, '2021-09-11', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '19.21', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149d27-e048-11ec-80cc-7085c2d2e153', 'Przeminęło z wiatrem', 246, '2021-11-11', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '18.27', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149d90-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 9', 459, '2022-04-14', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '28.59', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149df9-e048-11ec-80cc-7085c2d2e153', 'Wielka Lechia', 341, '2022-03-19', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '6.97', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149e61-e048-11ec-80cc-7085c2d2e153', 'Atlas Cudów Wszelakich', 523, '2021-07-29', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '45.74', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149ec6-e048-11ec-80cc-7085c2d2e153', 'Menelos i Halina', 336, '2022-05-04', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '33.74', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149f2a-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 4', 606, '2021-12-23', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '13.62', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149f90-e048-11ec-80cc-7085c2d2e153', 'Władca Pierścieni: Powrót Króla', 511, '2021-08-27', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '29.91', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c3149ff6-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 17', 608, '2021-08-20', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '28.67', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a05e-e048-11ec-80cc-7085c2d2e153', 'Jakiś Kryminał', 239, '2022-02-03', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '43.85', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a0c0-e048-11ec-80cc-7085c2d2e153', 'Władca Pierścieni: Dwie Wieże', 491, '2021-08-29', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '8.30', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a127-e048-11ec-80cc-7085c2d2e153', 'Atlas Cudów Wszelakich', 19, '2022-02-06', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '4.57', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a18d-e048-11ec-80cc-7085c2d2e153', 'Bolek i Lolek', 659, '2021-06-11', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '35.77', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a23c-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 2', 38, '2022-02-12', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '46.82', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a2a3-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 10', 602, '2021-09-06', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '49.32', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a30c-e048-11ec-80cc-7085c2d2e153', 'BlaBla', 143, '2021-06-14', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '16.80', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a372-e048-11ec-80cc-7085c2d2e153', 'BlaBla', 173, '2021-11-01', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '20.62', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a3e5-e048-11ec-80cc-7085c2d2e153', 'Dummy Book 8', 518, '2021-07-30', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '45.17', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153'),
('c314a44d-e048-11ec-80cc-7085c2d2e153', 'Atlas Chmur', 554, '2021-08-27', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente, adipisci. Velit voluptas numquam, explicabo at veritatis non mollitia, nobis maxime optio nam unde maiores ea id soluta quaerat, cupiditate ut. Recusandae facilis vero accusamus quibusdam error dolorem accusantium adipisci, quia excepturi aliquid impedit, alias cum voluptas quis nam libero culpa. Atque totam excepturi laboriosam cupiditate illo eum maiores dolores fugiat! Assumenda fuga debitis harum nostrum minus, quam id animi ab magni officia quaerat voluptas nisi iusto ut maxime quo inventore? Maiores neque doloremque illo consequuntur fugiat, quis quisquam omnis sed! Harum consequuntur dolorem sunt velit unde enim quo distinctio ratione, cumque minus natus reiciendis illo fugiat aspernatur totam quia laborum quas autem quod alias architecto aperiam, voluptas voluptatibus nihil. Consectetur. Vel repellat culpa corporis qui aut nihil corrupti earum enim necessitatibus molestiae odio officia soluta veniam voluptatibus quas neque ratione iure quod quae modi esse, ipsum adipisci sapiente? Rem, similique?', '48.45', 'e29cb596-deb5-11ec-94f4-7085c2d2e153', 'a27ea500-e046-11ec-80cc-7085c2d2e153');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ebook_author`
--

CREATE TABLE `ebook_author` (
  `ebook_id` varchar(36) NOT NULL,
  `author_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ebook_author`
--

INSERT INTO `ebook_author` (`ebook_id`, `author_id`) VALUES
('c3142ee9-e048-11ec-80cc-7085c2d2e153', '62e524b4-df82-11ec-878c-7085c2d2e153'),
('c3144cf8-e048-11ec-80cc-7085c2d2e153', '62e51aa7-df82-11ec-878c-7085c2d2e153'),
('c3144db0-e048-11ec-80cc-7085c2d2e153', '62e524c8-df82-11ec-878c-7085c2d2e153'),
('c3144e61-e048-11ec-80cc-7085c2d2e153', '62e51a48-df82-11ec-878c-7085c2d2e153'),
('c3144ee7-e048-11ec-80cc-7085c2d2e153', '62e52598-df82-11ec-878c-7085c2d2e153'),
('c3144fc2-e048-11ec-80cc-7085c2d2e153', '62e52548-df82-11ec-878c-7085c2d2e153'),
('c3148a42-e048-11ec-80cc-7085c2d2e153', '62e524b4-df82-11ec-878c-7085c2d2e153'),
('c3148b70-e048-11ec-80cc-7085c2d2e153', '62e524f6-df82-11ec-878c-7085c2d2e153'),
('c3148c00-e048-11ec-80cc-7085c2d2e153', '62e524f6-df82-11ec-878c-7085c2d2e153'),
('c3148c84-e048-11ec-80cc-7085c2d2e153', '62e5245a-df82-11ec-878c-7085c2d2e153'),
('c3148cf5-e048-11ec-80cc-7085c2d2e153', '62e51ac1-df82-11ec-878c-7085c2d2e153'),
('c3148d65-e048-11ec-80cc-7085c2d2e153', '62e5250b-df82-11ec-878c-7085c2d2e153'),
('c3148dcf-e048-11ec-80cc-7085c2d2e153', '62e525d5-df82-11ec-878c-7085c2d2e153'),
('c3148fe9-e048-11ec-80cc-7085c2d2e153', '62e5245a-df82-11ec-878c-7085c2d2e153'),
('c3149066-e048-11ec-80cc-7085c2d2e153', '62e51a48-df82-11ec-878c-7085c2d2e153'),
('c31490d2-e048-11ec-80cc-7085c2d2e153', '62e51ad9-df82-11ec-878c-7085c2d2e153'),
('c314913e-e048-11ec-80cc-7085c2d2e153', '62e51a48-df82-11ec-878c-7085c2d2e153'),
('c31491b3-e048-11ec-80cc-7085c2d2e153', '62e51aa7-df82-11ec-878c-7085c2d2e153'),
('c314927d-e048-11ec-80cc-7085c2d2e153', '62e52473-df82-11ec-878c-7085c2d2e153'),
('c31492e6-e048-11ec-80cc-7085c2d2e153', '62e524e2-df82-11ec-878c-7085c2d2e153'),
('c314935d-e048-11ec-80cc-7085c2d2e153', '62e52548-df82-11ec-878c-7085c2d2e153'),
('c31493c4-e048-11ec-80cc-7085c2d2e153', '62e51ac1-df82-11ec-878c-7085c2d2e153'),
('c314942a-e048-11ec-80cc-7085c2d2e153', '62e51ad9-df82-11ec-878c-7085c2d2e153'),
('c3149498-e048-11ec-80cc-7085c2d2e153', '62e52533-df82-11ec-878c-7085c2d2e153'),
('c3149501-e048-11ec-80cc-7085c2d2e153', '62e52548-df82-11ec-878c-7085c2d2e153'),
('c3149572-e048-11ec-80cc-7085c2d2e153', '62e52583-df82-11ec-878c-7085c2d2e153'),
('c31495d9-e048-11ec-80cc-7085c2d2e153', '62e524c8-df82-11ec-878c-7085c2d2e153'),
('c314963c-e048-11ec-80cc-7085c2d2e153', '62e51ac1-df82-11ec-878c-7085c2d2e153'),
('c31496ac-e048-11ec-80cc-7085c2d2e153', '62e51aa7-df82-11ec-878c-7085c2d2e153'),
('c3149712-e048-11ec-80cc-7085c2d2e153', '62e525d5-df82-11ec-878c-7085c2d2e153'),
('c31497c7-e048-11ec-80cc-7085c2d2e153', '62e524c8-df82-11ec-878c-7085c2d2e153'),
('c3149837-e048-11ec-80cc-7085c2d2e153', '62e52598-df82-11ec-878c-7085c2d2e153'),
('c314989f-e048-11ec-80cc-7085c2d2e153', '62e5249f-df82-11ec-878c-7085c2d2e153'),
('c3149906-e048-11ec-80cc-7085c2d2e153', '62e51ac1-df82-11ec-878c-7085c2d2e153'),
('c31499a4-e048-11ec-80cc-7085c2d2e153', '62e51013-df82-11ec-878c-7085c2d2e153'),
('c3149a0a-e048-11ec-80cc-7085c2d2e153', '62e52583-df82-11ec-878c-7085c2d2e153'),
('c3149a74-e048-11ec-80cc-7085c2d2e153', '62e51ad9-df82-11ec-878c-7085c2d2e153'),
('c3149ada-e048-11ec-80cc-7085c2d2e153', '62e52570-df82-11ec-878c-7085c2d2e153'),
('c3149b42-e048-11ec-80cc-7085c2d2e153', '62e51ac1-df82-11ec-878c-7085c2d2e153'),
('c3149ba8-e048-11ec-80cc-7085c2d2e153', '62e52417-df82-11ec-878c-7085c2d2e153'),
('c3149c11-e048-11ec-80cc-7085c2d2e153', '62e52570-df82-11ec-878c-7085c2d2e153'),
('c3149c73-e048-11ec-80cc-7085c2d2e153', '62e51013-df82-11ec-878c-7085c2d2e153'),
('c3149d27-e048-11ec-80cc-7085c2d2e153', '62e5245a-df82-11ec-878c-7085c2d2e153'),
('c3149d90-e048-11ec-80cc-7085c2d2e153', '62e52583-df82-11ec-878c-7085c2d2e153'),
('c3149df9-e048-11ec-80cc-7085c2d2e153', '62e52533-df82-11ec-878c-7085c2d2e153'),
('c3149e61-e048-11ec-80cc-7085c2d2e153', '62e524e2-df82-11ec-878c-7085c2d2e153'),
('c3149ec6-e048-11ec-80cc-7085c2d2e153', '62e52598-df82-11ec-878c-7085c2d2e153'),
('c3149f2a-e048-11ec-80cc-7085c2d2e153', '62e52548-df82-11ec-878c-7085c2d2e153'),
('c3149f90-e048-11ec-80cc-7085c2d2e153', '62e52533-df82-11ec-878c-7085c2d2e153'),
('c3149ff6-e048-11ec-80cc-7085c2d2e153', '62e51013-df82-11ec-878c-7085c2d2e153'),
('c314a05e-e048-11ec-80cc-7085c2d2e153', '62e52570-df82-11ec-878c-7085c2d2e153'),
('c314a0c0-e048-11ec-80cc-7085c2d2e153', '62e52598-df82-11ec-878c-7085c2d2e153'),
('c314a127-e048-11ec-80cc-7085c2d2e153', '62e51aa7-df82-11ec-878c-7085c2d2e153'),
('c314a18d-e048-11ec-80cc-7085c2d2e153', '62e52473-df82-11ec-878c-7085c2d2e153'),
('c314a23c-e048-11ec-80cc-7085c2d2e153', '62e52473-df82-11ec-878c-7085c2d2e153'),
('c314a2a3-e048-11ec-80cc-7085c2d2e153', '62e51ac1-df82-11ec-878c-7085c2d2e153'),
('c314a30c-e048-11ec-80cc-7085c2d2e153', '62e51ac1-df82-11ec-878c-7085c2d2e153'),
('c314a372-e048-11ec-80cc-7085c2d2e153', '62e52548-df82-11ec-878c-7085c2d2e153'),
('c314a3e5-e048-11ec-80cc-7085c2d2e153', '62e5248a-df82-11ec-878c-7085c2d2e153'),
('c314a44d-e048-11ec-80cc-7085c2d2e153', '62e51ad9-df82-11ec-878c-7085c2d2e153');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ebook_category`
--

CREATE TABLE `ebook_category` (
  `ebook_id` varchar(36) NOT NULL,
  `category_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ebook_category`
--

INSERT INTO `ebook_category` (`ebook_id`, `category_id`) VALUES
('c3142ee9-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c3144cf8-e048-11ec-80cc-7085c2d2e153', '58dacdaa-df29-11ec-b311-7085c2d2e153'),
('c3144db0-e048-11ec-80cc-7085c2d2e153', '58dacd30-df29-11ec-b311-7085c2d2e153'),
('c3144db0-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c3144e61-e048-11ec-80cc-7085c2d2e153', '58dac472-df29-11ec-b311-7085c2d2e153'),
('c3144ee7-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c3144fc2-e048-11ec-80cc-7085c2d2e153', '58dace50-df29-11ec-b311-7085c2d2e153'),
('c3148a42-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c3148b70-e048-11ec-80cc-7085c2d2e153', '58dac472-df29-11ec-b311-7085c2d2e153'),
('c3148c00-e048-11ec-80cc-7085c2d2e153', '58dace02-df29-11ec-b311-7085c2d2e153'),
('c3148c84-e048-11ec-80cc-7085c2d2e153', '58dac472-df29-11ec-b311-7085c2d2e153'),
('c3148cf5-e048-11ec-80cc-7085c2d2e153', '58dacdaa-df29-11ec-b311-7085c2d2e153'),
('c3148d65-e048-11ec-80cc-7085c2d2e153', '58dacd6e-df29-11ec-b311-7085c2d2e153'),
('c3148dcf-e048-11ec-80cc-7085c2d2e153', '58dace1f-df29-11ec-b311-7085c2d2e153'),
('c3148fe9-e048-11ec-80cc-7085c2d2e153', '58dacd6e-df29-11ec-b311-7085c2d2e153'),
('c3149066-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c31490d2-e048-11ec-80cc-7085c2d2e153', '58dacd4f-df29-11ec-b311-7085c2d2e153'),
('c314913e-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c31491b3-e048-11ec-80cc-7085c2d2e153', '58dacd6e-df29-11ec-b311-7085c2d2e153'),
('c314927d-e048-11ec-80cc-7085c2d2e153', '58dacd30-df29-11ec-b311-7085c2d2e153'),
('c31492e6-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c314935d-e048-11ec-80cc-7085c2d2e153', '58dace1f-df29-11ec-b311-7085c2d2e153'),
('c31493c4-e048-11ec-80cc-7085c2d2e153', '58dace02-df29-11ec-b311-7085c2d2e153'),
('c314942a-e048-11ec-80cc-7085c2d2e153', '58dace02-df29-11ec-b311-7085c2d2e153'),
('c3149498-e048-11ec-80cc-7085c2d2e153', '58dace50-df29-11ec-b311-7085c2d2e153'),
('c3149501-e048-11ec-80cc-7085c2d2e153', '58dac472-df29-11ec-b311-7085c2d2e153'),
('c3149572-e048-11ec-80cc-7085c2d2e153', '58dacdaa-df29-11ec-b311-7085c2d2e153'),
('c31495d9-e048-11ec-80cc-7085c2d2e153', '58dacdaa-df29-11ec-b311-7085c2d2e153'),
('c314963c-e048-11ec-80cc-7085c2d2e153', '58dacd6e-df29-11ec-b311-7085c2d2e153'),
('c31496ac-e048-11ec-80cc-7085c2d2e153', '58dacd6e-df29-11ec-b311-7085c2d2e153'),
('c3149712-e048-11ec-80cc-7085c2d2e153', '58dace02-df29-11ec-b311-7085c2d2e153'),
('c31497c7-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c3149837-e048-11ec-80cc-7085c2d2e153', '58dace1f-df29-11ec-b311-7085c2d2e153'),
('c314989f-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c3149906-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c31499a4-e048-11ec-80cc-7085c2d2e153', '58dacd4f-df29-11ec-b311-7085c2d2e153'),
('c3149a0a-e048-11ec-80cc-7085c2d2e153', '58dace02-df29-11ec-b311-7085c2d2e153'),
('c3149a74-e048-11ec-80cc-7085c2d2e153', '58dac472-df29-11ec-b311-7085c2d2e153'),
('c3149ada-e048-11ec-80cc-7085c2d2e153', '58daccdd-df29-11ec-b311-7085c2d2e153'),
('c3149b42-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c3149ba8-e048-11ec-80cc-7085c2d2e153', '58dace1f-df29-11ec-b311-7085c2d2e153'),
('c3149c11-e048-11ec-80cc-7085c2d2e153', '58dacd4f-df29-11ec-b311-7085c2d2e153'),
('c3149c73-e048-11ec-80cc-7085c2d2e153', '58dace02-df29-11ec-b311-7085c2d2e153'),
('c3149d27-e048-11ec-80cc-7085c2d2e153', '58dacd30-df29-11ec-b311-7085c2d2e153'),
('c3149d90-e048-11ec-80cc-7085c2d2e153', '58dacd6e-df29-11ec-b311-7085c2d2e153'),
('c3149df9-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c3149e61-e048-11ec-80cc-7085c2d2e153', '58dacd6e-df29-11ec-b311-7085c2d2e153'),
('c3149ec6-e048-11ec-80cc-7085c2d2e153', '58daccdd-df29-11ec-b311-7085c2d2e153'),
('c3149f2a-e048-11ec-80cc-7085c2d2e153', '58dace1f-df29-11ec-b311-7085c2d2e153'),
('c3149f90-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c3149ff6-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c314a05e-e048-11ec-80cc-7085c2d2e153', '58dace02-df29-11ec-b311-7085c2d2e153'),
('c314a0c0-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c314a127-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c314a18d-e048-11ec-80cc-7085c2d2e153', '58dacdaa-df29-11ec-b311-7085c2d2e153'),
('c314a23c-e048-11ec-80cc-7085c2d2e153', '58dace50-df29-11ec-b311-7085c2d2e153'),
('c314a2a3-e048-11ec-80cc-7085c2d2e153', '58dacd8c-df29-11ec-b311-7085c2d2e153'),
('c314a30c-e048-11ec-80cc-7085c2d2e153', '58dacd4f-df29-11ec-b311-7085c2d2e153'),
('c314a372-e048-11ec-80cc-7085c2d2e153', '58dacde0-df29-11ec-b311-7085c2d2e153'),
('c314a3e5-e048-11ec-80cc-7085c2d2e153', '58dace50-df29-11ec-b311-7085c2d2e153'),
('c314a44d-e048-11ec-80cc-7085c2d2e153', '58dace1f-df29-11ec-b311-7085c2d2e153');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ebook_discount`
--

CREATE TABLE `ebook_discount` (
  `id` varchar(36) NOT NULL,
  `ebook_id` varchar(36) NOT NULL,
  `discount_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ebook_language`
--

CREATE TABLE `ebook_language` (
  `language_id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `language_code` varchar(5) NOT NULL,
  `language_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ebook_language`
--

INSERT INTO `ebook_language` (`language_id`, `language_code`, `language_name`) VALUES
('e29cb596-deb5-11ec-94f4-7085c2d2e153', 'pl', 'Polski'),
('e29cbe39-deb5-11ec-94f4-7085c2d2e153', 'en', 'English');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_history`
--

CREATE TABLE `order_history` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `order_id` varchar(36) NOT NULL,
  `status_id` varchar(36) NOT NULL,
  `status_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_line`
--

CREATE TABLE `order_line` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `order_id` varchar(36) NOT NULL,
  `ebook_id` varchar(36) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_status`
--

CREATE TABLE `order_status` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `status_value` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `publisher_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`) VALUES
('a27ea500-e046-11ec-80cc-7085c2d2e153', 'Dummy Books');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shipping_method`
--

CREATE TABLE `shipping_method` (
  `id` varchar(36) NOT NULL DEFAULT 'uuid()',
  `method_name` varchar(60) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indeksy dla tabeli `address_status`
--
ALTER TABLE `address_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indeksy dla tabeli `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_id`,`address_id`),
  ADD KEY `customer_id` (`customer_id`,`address_id`,`status_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksy dla tabeli `customer_discount`
--
ALTER TABLE `customer_discount`
  ADD KEY `customer_id` (`customer_id`,`discount_id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indeksy dla tabeli `cust_order`
--
ALTER TABLE `cust_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`,`shipping_method_id`,`dest_address_id`),
  ADD KEY `shipping_method_id` (`shipping_method_id`),
  ADD KEY `dest_address_id` (`dest_address_id`);

--
-- Indeksy dla tabeli `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indeksy dla tabeli `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`ebook_id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indeksy dla tabeli `ebook_author`
--
ALTER TABLE `ebook_author`
  ADD PRIMARY KEY (`ebook_id`,`author_id`),
  ADD KEY `ebook_id` (`ebook_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indeksy dla tabeli `ebook_category`
--
ALTER TABLE `ebook_category`
  ADD PRIMARY KEY (`ebook_id`,`category_id`),
  ADD KEY `ebook_id` (`ebook_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `ebook_discount`
--
ALTER TABLE `ebook_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ebook_id` (`ebook_id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indeksy dla tabeli `ebook_language`
--
ALTER TABLE `ebook_language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indeksy dla tabeli `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksy dla tabeli `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`ebook_id`),
  ADD KEY `ebook_id` (`ebook_id`);

--
-- Indeksy dla tabeli `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indeksy dla tabeli `shipping_method`
--
ALTER TABLE `shipping_method`
  ADD PRIMARY KEY (`id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Ograniczenia dla tabeli `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `address_status` (`id`);

--
-- Ograniczenia dla tabeli `customer_discount`
--
ALTER TABLE `customer_discount`
  ADD CONSTRAINT `customer_discount_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `customer_discount_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`);

--
-- Ograniczenia dla tabeli `cust_order`
--
ALTER TABLE `cust_order`
  ADD CONSTRAINT `cust_order_ibfk_1` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`),
  ADD CONSTRAINT `cust_order_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `cust_order_ibfk_3` FOREIGN KEY (`dest_address_id`) REFERENCES `address` (`id`);

--
-- Ograniczenia dla tabeli `ebook`
--
ALTER TABLE `ebook`
  ADD CONSTRAINT `ebook_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `ebook_language` (`language_id`),
  ADD CONSTRAINT `ebook_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Ograniczenia dla tabeli `ebook_author`
--
ALTER TABLE `ebook_author`
  ADD CONSTRAINT `ebook_author_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `ebook_author_ibfk_2` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`ebook_id`);

--
-- Ograniczenia dla tabeli `ebook_category`
--
ALTER TABLE `ebook_category`
  ADD CONSTRAINT `ebook_category_ibfk_1` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`ebook_id`),
  ADD CONSTRAINT `ebook_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Ograniczenia dla tabeli `ebook_discount`
--
ALTER TABLE `ebook_discount`
  ADD CONSTRAINT `ebook_discount_ibfk_1` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`ebook_id`),
  ADD CONSTRAINT `ebook_discount_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`);

--
-- Ograniczenia dla tabeli `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`id`),
  ADD CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`);

--
-- Ograniczenia dla tabeli `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`id`),
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`ebook_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
