-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 14, 2022 lúc 03:27 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thrift_fashion`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cartinfo`
--

CREATE TABLE `cartinfo` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cartinfo`
--

INSERT INTO `cartinfo` (`id`, `user_id`, `product_id`, `orderDate`, `amount`) VALUES
(1, 1, 1, '2022-08-11 01:33:37', 1),
(2, 2, 2, '2022-08-11 01:33:37', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Men clothes'),
(2, 'Men\'s accessories'),
(3, 'Women\'s clothes'),
(4, 'Women\'s accessories'),
(5, 'Children\'s wear'),
(6, 'Children\'s accessories');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `comment_date`, `note`) VALUES
(1, 2, '2022-08-11', 'Very nice clothes'),
(2, 1, '2022-08-08', 'The shirt is very nice and fit'),
(3, 2, '2022-08-09', 'Yesterday I bought a shirt that fits and is very beautiful'),
(4, 1, '2022-08-09', 'The shirt is very nice and fit');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `description`) VALUES
(1, 'Mason Greenwood', 'mason@gmail.com', '0147365401', 'I want to place ads on your website'),
(2, 'Number One', 'number@gmail.com', '0147652147', 'The product was broken after 3 days I want to return it');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`id`, `order_id`, `product_id`, `price`, `num`) VALUES
(1, 1, 1, 1.6, 1),
(2, 2, 2, 2.4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `orderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `phone`, `name`, `status_id`, `orderDate`) VALUES
(1, 1, 'Hoan Kiem - Hanoi', '0478562112', 'Mason Mouse', 3, '2022-08-11'),
(2, 2, 'Hoang Mai - Hanoi', '0147854123', 'Drink', 2, '2022-08-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `imgName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `size` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `imgName`, `category_id`, `status_id`, `size`, `title`, `price`, `description`, `created_at`, `update_at`, `deleted`) VALUES
(1, 'twleoteam1.jpg', 5, 1, '5', 'Cool children\'s shirt', 2.4, 'Cotton material is cool in the summer, very suitable for active children\r\nSize: 5 for children from 14 - 16kg\r\nThe product is very popular in the Japanese market', '2022-08-11 01:11:14', '2022-08-09 21:21:50', 0),
(2, 'twleoteam2.jpg', 6, 1, '9-12', 'Cool kids pants', 1.6, 'Cotton material is cool in the summer, very suitable for active children\r\nSize: 5 for children from 8,5 - 10kg, body length 73cm\r\nThe product is very popular in the Japanese market', '2022-08-11 01:11:14', '2022-08-09 21:21:53', 0),
(3, 'twleoteam3.jpg', 3, 1, '8', 'Women jacket JK2', 62, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: Women jacketColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-11 01:11:14', 0),
(4, 'twleoteam4.jpg', 3, 1, '10', 'Women jacket JK3', 56, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:32', 0),
(5, 'twleoteam5.jpg', 3, 1, '6', 'Women jacket JK4', 73, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:36', 0),
(6, 'twleoteam6.jpg', 3, 1, '6', 'Women jacket JK5', 26, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:40', 0),
(7, 'twleoteam7.jpg', 3, 2, '9', 'Women jacket JK6', 48, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:44', 0),
(8, 'twleoteam8.jpg', 3, 2, '5', 'Women jacket JK7', 31, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:47', 0),
(9, 'twleoteam9.jpg', 3, 3, '5', 'Red lace dress LD1', 71, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:50', 0),
(10, 'twleoteam10.jpg', 3, 2, '7', 'Red lace dress LD2', 80, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:53', 0),
(11, 'twleoteam11.jpg', 3, 1, '5', 'Women\'s sweaters WS1', 34, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:56', 0),
(12, 'twleoteam12.jpg', 3, 1, '7', 'Red lace dress LD2', 24, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:06:59', 0),
(13, 'twleoteam13.jpg', 3, 3, '9', 'Black  lace dress LD2', 58, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:01', 0),
(14, 'twleoteam14.jpg', 3, 3, '9', 'Women\'s sweaters WS2', 74, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:05', 0),
(15, 'twleoteam15.jpg', 3, 1, '9', 'Women jacket JK8', 32, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:08', 0),
(16, 'twleoteam16.jpg', 3, 3, '8', 'Women\'s sweaters WS3', 15, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:11', 0),
(17, 'twleoteam17.jpg', 3, 1, '5', 'Women\'s sweaters WS4', 68, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:37', 0),
(18, 'twleoteam18.jpg', 3, 3, '6', 'Red lace dress LD1', 52, 'With a unique and luxurious flower design on the chest, elegant colors and meticulous seams, the dress brings comfort and confidence to the wearer. Products can be worn to work, parties, walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold water, limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry place, avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:41', 0),
(19, 'twleoteam19.jpg', 3, 3, '8', 'Red lace dress LD2', 32, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:45', 0),
(20, 'twleoteam20.jpg', 5, 1, '10', 'Red lace dress LD3', 61, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:47', 0),
(21, 'twleoteam21.jpg', 2, 3, '9', 'Red lace dress LD4', 78, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:50', 0),
(22, 'twleoteam22.jpg', 3, 1, '9', 'Women\'s T-Shirt TS1', 73, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:52', 0),
(23, 'twleoteam23.jpg', 1, 2, '10', 'Women\'s T-Shirt TS2', 68, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:54', 0),
(24, 'twleoteam24.jpg', 2, 2, '7', 'Women\'s T-Shirt TS3', 73, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:57', 0),
(25, 'twleoteam25.jpg', 3, 2, '10', 'Women\'s T-Shirt TS4', 40, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-11 01:11:14', '2022-08-13 21:07:59', 0),
(26, 'twleoteam26.jpg', 4, 1, '5', 'women\'s clogs CL1', 15, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-03 21:22:09', '2022-08-15 21:22:12', 0),
(27, 'twleoteam27.jpg', 3, 1, '8', 'women\'s clogs CL2', 51, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-17 21:22:15', '2022-08-17 21:22:18', 0),
(28, 'twleoteam28.jpg', 2, 1, '5', 'women\'s clogs CL1', 55, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-17 21:22:21', '2022-08-10 21:22:25', 0),
(29, 'twleoteam29.jpg', 1, 1, '5', 'women\'s clogs', 61, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-10 21:22:29', '2022-08-09 21:22:32', 0),
(30, 'twleoteam30.jpg', 3, 1, '9', 'women\'s clogs', 48, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-10 21:22:35', '2022-08-09 21:22:37', 0),
(31, 'twleoteam31.jpg', 4, 1, '5', 'women\'s clogs CL1', 14, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-03 21:22:40', '2022-08-17 21:22:42', 0),
(32, 'twleoteam32.jpg', 3, 1, '8', 'Women\'s book bag BB1', 66, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-02 21:23:08', '2022-08-02 21:23:17', 0),
(33, 'twleoteam33.jpg', 5, 1, '8', 'Women\'s book bag BB2', 56, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-10 21:23:06', '2022-08-09 21:23:43', 0),
(34, 'twleoteam34.jpg', 2, 1, '6', 'Women\'s book bag BB3', 48, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-03 21:23:03', '2022-08-17 21:23:41', 0),
(35, 'twleoteam35.jpg', 1, 1, '10', 'women\'s clogs CL1', 25, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-03 21:23:01', '2022-08-10 21:23:39', 0),
(36, 'twleoteam36.jpg', 2, 1, '7', 'women\'s clogs CL1', 13, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-02 21:22:58', '2022-08-17 21:23:37', 0),
(37, 'twleoteam37.jpg', 3, 1, '5', 'Red lace dress LD10', 34, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-02 21:22:56', '2022-08-16 21:23:34', 0),
(38, 'twleoteam38.jpg', 1, 1, '6', 'Red lace dress LD11', 40, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-17 21:22:54', '2022-08-16 21:23:32', 0),
(39, 'twleoteam39.jpg', 4, 1, '5', 'Red lace dress LD12', 44, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-10 21:22:52', '2022-08-10 21:23:29', 0),
(40, 'twleoteam40.jpg', 4, 1, '9', 'Red lace dress LD13', 10, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-17 21:22:50', '2022-08-11 21:23:27', 0),
(41, 'twleoteam41.jpg', 4, 1, '6', 'Red lace dress LD14', 23, 'With a unique and luxurious flower design on the chestwater,elegant colors and meticulous seamswater,the dress brings comfort and confidence to the wearer. Products can be worn to workwater,partieswater,walking with friends and family.Line: Women\'s clothesMaterial: TuytsiColor: redWashing and storage: Hand wash in cold waterwater,limit washing with hot water over 40 degrees Celsius. Wash separately from products that are easy to fade. Store in a cool dry placewater,avoid direct sunlight.', '2022-08-09 21:22:47', '2022-08-04 21:23:22', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `statusName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`id`, `statusName`) VALUES
(1, 'In warehouse'),
(2, 'in cart'),
(3, 'Confirm and wait for delivery');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `role_id`, `fullname`, `password`, `phone_number`, `email`, `address`, `status`, `created_at`, `update_at`, `deleted`) VALUES
(1, 2, 'Mason Mouse', '123456', '0698745123', 'mouse.ms@aptechlearning.edu.vn', 'Tokyo-Japan', 1, '2022-08-10 23:02:00', '2022-08-03 21:34:37', 0),
(2, 2, 'Drink Water', '123456', '0632145123', 'drink.wt@aptechlearning.edu.vn', 'Hanoi-Vietnam', 1, '2022-08-10 23:02:00', '2022-08-03 21:34:39', 0),
(3, 1, 'Admin', '123456', '0354789852', 'admin@gmail.com', 'Hanoi-VN', 1, '2022-08-10 18:09:50', '2022-08-09 21:34:32', 0),
(4, 1, 'Management', '123456789', '0314789852', 'mana@gmail.com', 'Hanoi-VN', 1, '2022-08-10 18:09:50', '2022-08-10 21:34:34', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cartinfo`
--
ALTER TABLE `cartinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cartinfo`
--
ALTER TABLE `cartinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cartinfo`
--
ALTER TABLE `cartinfo`
  ADD CONSTRAINT `cartinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cartinfo_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
