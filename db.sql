-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 28, 2024 lúc 05:10 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(255) NOT NULL,
  `cate_pr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cate_id`, `cate_name`, `cate_pr`) VALUES
(1, 'Áo', 0),
(2, 'Áo polo', 0),
(3, 'Áo khoác', 0),
(4, 'Áo sweater', 0),
(5, 'Quần', 0),
(6, 'Balo', 0),
(7, 'Túi', 0),
(8, 'Phụ kiện', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `cmt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `cmt_content` text NOT NULL,
  `cmt_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`cmt_id`, `user_id`, `pro_id`, `cmt_content`, `cmt_date`) VALUES
(50, 3, 4, 'sản phẩm đẹp', '2024-12-28 03:46:43'),
(51, 1, 60, 'Áo quá đẹp', '2024-12-28 05:32:30'),
(52, 3, 59, 'Áo đẹp quá', '2024-12-28 07:55:42'),
(53, 3, 59, 'GIao hàng nhanh', '2024-12-28 08:54:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_price` float NOT NULL,
  `order_date` date NOT NULL,
  `order_stt` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `order_price`, `order_date`, `order_stt`) VALUES
(1, 3, 170000, '2024-12-28', 'Giao hàng thành công'),
(2, 3, 390000, '2024-12-28', 'Giao hàng thành công'),
(3, 3, 600000, '2024-12-28', 'Giao hàng thành công'),
(4, 3, 300000, '2024-12-28', 'Giao hàng thành công'),
(5, 3, 3600000, '2024-12-28', 'Đang chờ xử lý');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `orderdt_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `size` varchar(4) NOT NULL,
  `orderdt_qty` int(11) NOT NULL,
  `orderdt_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`orderdt_id`, `order_id`, `pro_id`, `size`, `orderdt_qty`, `orderdt_price`) VALUES
(1, 1, 4, 'S', 1, 170000),
(2, 2, 5, 'M', 3, 130000),
(3, 3, 6, 'S', 4, 150000),
(4, 4, 1, 'S', 3, 100000),
(5, 5, 59, 'L', 8, 200000),
(6, 5, 12, 'S', 10, 200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_image` varchar(255) NOT NULL,
  `pro_price` float NOT NULL,
  `pro_sale` float NOT NULL,
  `pro_intro` text NOT NULL,
  `pro_view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`pro_id`, `cate_id`, `pro_name`, `pro_image`, `pro_price`, `pro_sale`, `pro_intro`, `pro_view`) VALUES
(1, 1, 'Áo thun màu xanh rêu', '1.webp', 150000, 100000, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 15),
(3, 1, 'Áo thun uta', '3.webp', 150000, 120000, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 3),
(4, 1, 'Áo thun sài gòn', '4.webp', 170000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 30),
(5, 1, 'Áo thun con mèo', '5.webp', 150000, 130000, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 3),
(6, 1, 'Áo thun Laurents', '6.webp', 150000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 3),
(7, 1, 'Áo thun paradox', '7.webp', 150000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 2),
(8, 1, 'Áo thun Dont miss', '8.webp', 150000, 100000, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(9, 1, 'Áo thun MLB', '9.webp', 300000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(10, 1, 'Áo thun Hà Nội', '10.webp', 150000, 100000, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 1),
(11, 1, 'Áo thun MYO', '11.jpg', 150000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 2),
(12, 1, 'Áo khoa HTTH', '12.png', 200000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ: </strong>UIT.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 3),
(13, 2, 'Áo polo gemme', 'polo1.webp', 160000, 130000, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(14, 2, 'Áo polo labubu', 'polo2.webp', 200000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(15, 2, 'Áo polo đen trơn', 'polo3.webp', 120000, 100000, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(16, 2, 'Áo polo teelab', 'polo4.webp', 150000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(17, 2, 'Áo polo tí chuột', 'polo5.webp', 100000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(18, 2, 'Áo polo simpson', 'polo6.webp', 150000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(19, 2, 'Áo polo fearow', 'polo7.webp', 120000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(20, 3, 'Áo khoác đen', 'aokhoac1.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(21, 3, 'Áo khoác teelab', 'aokhoac2.webp', 350000, 300000, '<p><strong>-Chất liệu: </strong>d&ugrave;.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(22, 3, 'Áo khoác dù màu be', 'aokhoac3.webp', 350000, 0, '<p><strong>-Chất liệu: </strong>d&ugrave;.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(23, 3, 'Áo khoác Aokang', 'aokhoac4.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>vải nhung.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(24, 3, 'Áo khoác chữ N', 'aokhoac5.webp', 300000, 0, '<p><strong>-Chất liệu: </strong>nỉ ch&acirc;n cua.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(25, 3, 'Áo khoác hàn ', 'aokhoac6.webp', 400000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>H&agrave;n Quốc.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(26, 3, 'Áo gió màu be', 'aokhoac7.webp', 350000, 320000, '<p><strong>-Chất liệu: </strong>polyeste.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(27, 3, 'Áo khoác chữ P', 'aokhoac8.webp', 350000, 310000, '<p><strong>-Chất liệu: </strong>vải nhung.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(28, 3, 'Áo khoác bom house', 'aokhoac9.webp', 320000, 300000, '<p><strong>-Chất liệu: </strong>nỉ ch&acirc;n cua.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(29, 4, 'Áo sweater teelab', 'sweater1.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(30, 4, 'Áo sweater best snoopy', 'sweater2.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(31, 4, 'Áo sweater nâu', 'sweater3.webp', 250000, 210000, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(32, 4, 'Áo sweater snoopy xanh', 'sweater4.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(33, 4, 'Áo sweater con mèo', 'sweater5.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(34, 4, 'Áo sweater caradla', 'sweater6.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(35, 4, 'Áo sweater hồng', 'sweater7.webp', 250000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(36, 4, 'Áo sweater Noel', 'sweater8.webp', 300000, 0, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(37, 4, 'Áo sweater dickies', 'sweater9.webp', 400000, 350000, '<p><strong>-Chất liệu: </strong>nỉ.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Nước ngo&agrave;i.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o: </strong>D&agrave;i.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(38, 5, 'Quần jeans ống rộng xanh', 'quan1.webp', 200000, 190000, '<p><strong>-Chất liệu: </strong>jeans.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu quần: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(39, 5, 'Quần jeans đen sờn', 'quan2.webp', 230000, 0, '<p><strong>-Chất liệu: </strong>jeans.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu quần: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(40, 5, 'Quần jeans basic', 'quan3.webp', 190000, 0, '<p><strong>-Chất liệu: </strong>jeans.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu quần: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(41, 5, 'Quần vải caro', 'quan4.webp', 150000, 0, '<p><strong>-Chất liệu: </strong>vải.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu quần: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(42, 5, 'Quần kaki màu be', 'quan5.webp', 250000, 220000, '<p><strong>-Chất liệu: </strong>kaki.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu quần: </strong>Rộng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(43, 5, 'Quần kaki xanh rêu', 'quan6.webp', 350000, 300000, '<p><strong>-Chất liệu: </strong>kaki.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu quần: </strong>Vừa.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(44, 6, 'Balo đen', 'balo1.webp', 400000, 370000, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>c&oacute;.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(45, 6, 'Balo trắng', 'balo2.webp', 380000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>Kh&ocirc;ng.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(46, 6, 'Balo Fortune Mouse', 'balo3.webp', 450000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp, d&ugrave;.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>c&oacute;.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>C&oacute;.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(47, 6, 'Balo saigonswagger', 'balo4.webp', 500000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>c&oacute;.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(48, 6, 'Balo chống shock', 'balo5.webp', 450000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>c&oacute; 2 ngăn.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>C&oacute;.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(49, 6, 'Balo thời trang', 'balo6.webp', 350000, 310000, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>Kh&ocirc;ng.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(50, 6, 'Balo IMELON', 'balo7.webp', 550000, 450000, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>c&oacute;.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 1),
(51, 7, 'Túi chống sốc', 'tui1.webp', 200000, 170000, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(52, 7, 'Túi đựng laptop', 'tui2.webp', 150000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(53, 7, 'Túi đeo chéo', 'tui3.webp', 200000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(54, 7, 'Túi bảo vệ laptop', 'tui4.webp', 400000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp, d&ugrave;.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>C&oacute;.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(55, 7, 'Túi da', 'tui5.webp', 550000, 500000, '<p><strong>-Chất liệu: </strong>Da.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>C&oacute;.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 1),
(56, 8, 'Móc khóa hình mèo', 'pk1.webp', 50000, 0, '<p><strong>-Chất liệu: </strong>Nhựa&nbsp;tổng hợp.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(57, 8, 'Bình nước basic', 'pk6.webp', 200000, 170000, '<p><strong>-Chất liệu: </strong>Inox 304.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(58, 8, 'Cuốn tập \"bí kíp\"', 'pk9.webp', 10000, 0, '<p><strong>-Chất liệu: </strong>Giấy.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(59, 1, 'Áo khoa HTTT màu tím', '14.png', 200000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 16),
(60, 1, 'Áo khoa HTTT màu xanh', '12.png', 200000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ: </strong>UIT.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 19),
(61, 1, 'Áo khoa KHMT', '13.png', 200000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>UIT.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(62, 1, 'Áo căn tin UIT', '15.png', 200000, 0, '<p><strong>-Chất liệu:&nbsp;</strong>cotton.</p>\r\n\r\n<p><strong>-Phong c&aacute;ch:&nbsp;</strong>cơ bản.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>UIT.</p>\r\n\r\n<p><strong>-Chiều d&agrave;i tay &aacute;o:&nbsp;</strong>Ngắn.</p>\r\n\r\n<p><strong>-D&aacute;ng kiểu &aacute;o:&nbsp;</strong>Rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 0),
(63, 6, 'Balo K17', 'a.png', 300000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>c&oacute;.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>UIT.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 2),
(64, 6, 'Balo K16', 'b.png', 300000, 0, '<p><strong>-Chất liệu: </strong>Sợi tổng hợp.</p>\r\n\r\n<p><strong>-Ngăn đựng laptop:&nbsp;</strong>c&oacute;.</p>\r\n\r\n<p><strong>-Xuất xứ:&nbsp;</strong>Việt Nam.</p>\r\n\r\n<p><strong>-Chống nước: </strong>Kh&ocirc;ng.</p>\r\n<script src=\"chrome-extension://fpelahbljekknahkcaegamhcndkfpfnc/iFrame.js\" type=\"text/javascript\"></script>\r\n', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_detail`
--

CREATE TABLE `products_detail` (
  `prodt_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products_detail`
--

INSERT INTO `products_detail` (`prodt_id`, `pro_id`, `size`, `quantity`, `sold`) VALUES
(1, 1, 'S', 7, 8),
(2, 1, 'M', 10, 0),
(3, 1, 'L', 10, 0),
(4, 2, 'S', 10, 0),
(5, 2, 'M', 10, 0),
(6, 2, 'L', 10, 0),
(7, 3, 'S', 10, 0),
(8, 3, 'M', 10, 0),
(9, 3, 'L', 10, 0),
(10, 4, 'S', 9, 1),
(11, 4, 'M', 10, 0),
(12, 4, 'L', 10, 0),
(13, 5, 'S', 10, 0),
(14, 5, 'M', 7, 3),
(15, 5, 'L', 10, 0),
(16, 6, 'S', 6, 4),
(17, 6, 'M', 10, 0),
(18, 6, 'L', 10, 0),
(19, 7, 'S', 10, 0),
(20, 7, 'M', 10, 0),
(21, 7, 'L', 10, 0),
(22, 8, 'S', 10, 0),
(23, 8, 'M', 10, 0),
(24, 8, 'L', 10, 0),
(25, 9, 'S', 10, 0),
(26, 9, 'M', 10, 0),
(27, 9, 'L', 10, 0),
(28, 10, 'S', 10, 0),
(29, 10, 'M', 10, 0),
(30, 10, 'L', 10, 0),
(31, 11, 'S', 10, 0),
(32, 11, 'M', 10, 0),
(33, 11, 'L', 10, 0),
(34, 12, 'S', 10, 0),
(35, 12, 'M', 10, 0),
(36, 12, 'L', 10, 0),
(37, 13, 'S', 10, 0),
(38, 13, 'M', 10, 0),
(39, 13, 'L', 10, 0),
(40, 14, 'S', 10, 0),
(41, 14, 'M', 10, 0),
(42, 14, 'L', 10, 0),
(43, 15, 'S', 10, 0),
(44, 15, 'M', 10, 0),
(45, 15, 'L', 10, 0),
(46, 64, 'Freesize', 50, 105),
(47, 63, 'Freesize', 50, 90),
(48, 60, 'M', 50, 25),
(49, 60, 'L', 50, 20),
(50, 59, 'M', 50, 30),
(51, 59, 'L', 50, 25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `slide_id` int(11) NOT NULL,
  `slide_image` varchar(255) NOT NULL,
  `slide_link` varchar(255) NOT NULL,
  `slide_pr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`slide_id`, `slide_image`, `slide_link`, `slide_pr`) VALUES
(5, 'a.png', 'http://localhost:3000/front-end/product.php?search=Balo+K&category=&price_range=1000000', 2),
(6, '12.png', 'http://localhost:3000/front-end/product.php?search=%C3%81o+khoa+HTTT&category=1&price_range=1000000', 2),
(7, 'ad.png', 'http://localhost/kienthph11085_pro1014/front-end/detail.php?cate_id=9&pro_id=26', 2),
(13, 'slider-uit1.jpg', 'https://www.facebook.com/photo?fbid=1067701695355798&set=a.304540691671906', 1),
(14, 'slider-uit2.jpg', 'https://www.facebook.com/photo?fbid=1054398920019409&set=a.304540688338573', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(70) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`, `avatar`, `email`, `role`) VALUES
(1, 'admin', 'admin123', 'admin.jpg', 'admin@gmail.com', 2),
(2, 'nhanvien', 'nhanvien123', 'nhanvien.jpg', 'nhanvien@gmail.com', 1),
(3, 'khachhang1', 'khachhang1', 'khachhang1.jpg', 'khachhang1@gmail.com', 1),
(4, 'khachhang2', 'khachhang2', 'khachhang2.jpg', 'khachhang2@gmail.com', 0),
(5, 'khachhang3', 'khachhang3', 'none.png', 'khachhang3@gmail.com', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_detail`
--

CREATE TABLE `users_detail` (
  `userdt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_add` varchar(255) NOT NULL,
  `fullname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users_detail`
--

INSERT INTO `users_detail` (`userdt_id`, `user_id`, `user_phone`, `user_add`, `fullname`) VALUES
(1, 1, '0397680398', 'KTX Khu B', 'Nguyễn Trung Nguyên'),
(2, 2, '', '', ''),
(3, 3, '0123456789', 'Bình Dương', 'Nguyễn Lan Ngọc'),
(4, 4, '', '', ''),
(5, 5, '', '', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cate_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cmt_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orderdt_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`);

--
-- Chỉ mục cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  ADD PRIMARY KEY (`prodt_id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`slide_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `users_detail`
--
ALTER TABLE `users_detail`
  ADD PRIMARY KEY (`userdt_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `orderdt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  MODIFY `prodt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `userdt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
