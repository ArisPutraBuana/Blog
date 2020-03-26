-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Mar 2020 pada 11.29
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_about`
--

CREATE TABLE `tbl_about` (
  `about_id` int(11) NOT NULL,
  `about_image` varchar(100) DEFAULT NULL,
  `about_description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_about`
--

INSERT INTO `tbl_about` (`about_id`, `about_image`, `about_description`) VALUES
(1, 'about.jpg', 'MBLOG adalah Open Source Source Code untuk personal blog.<br><br>Full responsive dan terlihat memukau pada desktop, tablet, atau perangkat selular apapun.<br><br>Dibangun dengan framework PHP Codeigniter dengan mengikuti standard desain patern MVC, sehingga mudah dikembangkan lebeih lanjut oleh web developer manapun. <br><br>Anda dapat memiliki blog pribadi idaman Anda menggunakan source code ini sekarang juga.<br><br>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `category_slug` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_slug`) VALUES
(1, 'Pengembangan diri', 'pengembangan-diri'),
(2, 'Success', 'success'),
(3, 'Tips dan Tricks', 'tips-dan-tricks');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_name` varchar(60) DEFAULT NULL,
  `comment_email` varchar(90) DEFAULT NULL,
  `comment_message` text,
  `comment_status` int(11) DEFAULT '0',
  `comment_parent` int(11) DEFAULT '0',
  `comment_post_id` int(11) DEFAULT NULL,
  `comment_image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_home`
--

CREATE TABLE `tbl_home` (
  `home_id` int(11) NOT NULL,
  `home_caption_1` varchar(200) DEFAULT NULL,
  `home_caption_2` varchar(200) DEFAULT NULL,
  `home_bg_heading` varchar(50) DEFAULT NULL,
  `home_bg_testimonial` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_home`
--

INSERT INTO `tbl_home` (`home_id`, `home_caption_1`, `home_caption_2`, `home_bg_heading`, `home_bg_testimonial`) VALUES
(1, 'Driven . Inspired . Smart', 'Personal Blog', 'image_4.png', 'image_8.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_inbox`
--

CREATE TABLE `tbl_inbox` (
  `inbox_id` int(11) NOT NULL,
  `inbox_name` varchar(50) DEFAULT NULL,
  `inbox_email` varchar(80) DEFAULT NULL,
  `inbox_subject` varchar(200) DEFAULT NULL,
  `inbox_message` text,
  `inbox_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `inbox_status` varchar(2) DEFAULT '0' COMMENT '0=Unread, 1=Read'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_inbox`
--

INSERT INTO `tbl_inbox` (`inbox_id`, `inbox_name`, `inbox_email`, `inbox_subject`, `inbox_message`, `inbox_created_at`, `inbox_status`) VALUES
(2, 'Aris Buana', 'waw@gmail.com', 'Artikel teknologi', 'saya mau reques tentang iOT', '2020-03-25 16:26:40', '1'),
(3, 'Aris Putra Buana', 'arispb99@gmail.com', 'Informasi Bimbingan Skripsi', 'Aku dan yang terjadi', '2020-03-26 06:00:53', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_navbar`
--

CREATE TABLE `tbl_navbar` (
  `navbar_id` int(11) NOT NULL,
  `navbar_name` varchar(50) DEFAULT NULL,
  `navbar_slug` varchar(200) DEFAULT NULL,
  `navbar_parent_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_navbar`
--

INSERT INTO `tbl_navbar` (`navbar_id`, `navbar_name`, `navbar_slug`, `navbar_parent_id`) VALUES
(1, 'Home', NULL, 0),
(2, 'About', 'about', 0),
(3, 'Blog', 'blog', 0),
(4, 'Contact', 'contact', 0),
(5, 'Teknologi', 'tag/Teknologi', 3),
(10, 'Success', 'category/success', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(250) DEFAULT NULL,
  `post_description` text,
  `post_contents` longtext,
  `post_image` varchar(40) DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `post_last_update` datetime DEFAULT NULL,
  `post_category_id` int(11) DEFAULT NULL,
  `post_tags` varchar(225) DEFAULT NULL,
  `post_slug` varchar(250) DEFAULT NULL,
  `post_status` int(11) DEFAULT NULL COMMENT '1=Publish, 0=Unpublish',
  `post_views` int(11) DEFAULT '0',
  `post_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_post`
--

INSERT INTO `tbl_post` (`post_id`, `post_title`, `post_description`, `post_contents`, `post_image`, `post_date`, `post_last_update`, `post_category_id`, `post_tags`, `post_slug`, `post_status`, `post_views`, `post_user_id`) VALUES
(1, 'Bangun Karakter Idaman Anda Dalam 5 Langkah', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3>Ini adalah Sub Heading&nbsp;</h3><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.<br></p>', '18f65f55e2bc21c3a54031a74ef6c56c.jpg', '2019-04-05 07:45:42', '2020-03-26 12:28:38', 1, 'Psikologi,Motivasi', 'membangun-karakter', 1, 4, 1),
(2, '7 Tips untuk menemukan passion Anda', '', '<p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" color:=\"\" rgb(78,=\"\" 94,=\"\" 106);\"=\"\">Ini adalah Sub Heading&nbsp;</h3><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p>', '787f035149ba2179b8bc4c5ac01c5001.jpg', '2019-04-05 07:52:06', '2020-03-26 12:28:51', 1, 'Psikologi,Motivasi', 'tips-untuk-menemukan-passion-anda', 1, 4, 1),
(3, '5 Alasan kenapa Anda perlu berbuat baik', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" color:=\"\" rgb(78,=\"\" 94,=\"\" 106);\"=\"\">Ini adalah Sub Heading&nbsp;</h3><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p>', 'a06ae9341405a292ae12b67ed85dc1dc.jpg', '2019-04-05 12:25:13', '2020-03-26 12:29:03', 2, 'Psikologi,Motivasi,Kesehatan', '5-alasan-kenapa-anda-perlu-berbuat-baik', 1, 7, 1),
(4, '7 Tips untuk meningkatkan pendapatan Anda', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" color:=\"\" rgb(78,=\"\" 94,=\"\" 106);\"=\"\">Ini adalah Sub Heading&nbsp;</h3><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p>', '9a734ed5d107f0f378da0a1e13dfc92e.jpg', '2019-04-05 12:26:55', '2020-03-26 12:29:25', 3, 'Teknologi,Motivasi', 'tips-untuk-meningkatkan-pendapatan-anda', 1, 9, 1),
(5, '5 Alasan kenapa Anda harus mengajar', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" color:=\"\" rgb(78,=\"\" 94,=\"\" 106);\"=\"\">Ini adalah Sub Heading&nbsp;</h3><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p>', 'c534b8d570a496102d49262217195a50.jpeg', '2019-04-05 12:28:19', '2020-03-26 12:29:56', 2, 'Psikologi,Motivasi', 'alasan-kenapa-anda-harus-mengajar', 1, 5, 1),
(6, '3 Rahasia Manajemen Waktu', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" color:=\"\" rgb(78,=\"\" 94,=\"\" 106);\"=\"\">Ini adalah Sub Heading&nbsp;</h3><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini adalah artikel konten.</p>', 'ee094df754cba6976747236e74949a43.jpg', '2019-04-05 13:05:56', '2020-03-26 12:30:23', 3, 'Psikologi,Motivasi', 'rahasia-manajemen-waktu', 1, 13, 1),
(7, '3 Teknik Efektif Membaca Cepat', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah\r\n artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\">Ini adalah Sub Heading&nbsp;</h3><p style=\"outline: 0px !important;\">Ini\r\n adalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini\r\n adalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten.</p>', 'b69bd34db0726b6cf7747a816c99254f.jpg', '2020-01-12 04:30:20', '2020-03-26 12:30:37', 1, 'Psikologi,Motivasi', '3-teknik-efektif-membaca-cepat', 1, 0, 1),
(8, '7 Cara Efektif Mengatasi Kegagalan dan Hidup', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah\r\n artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\">Ini adalah Sub Heading&nbsp;</h3><p style=\"outline: 0px !important;\">Ini\r\n adalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini\r\n adalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten.</p>', '6233b3b0a8283ff2945802e2b876075e.jpg', '2020-01-12 04:32:01', '2020-03-26 12:30:50', 2, 'Psikologi,Motivasi', '7-cara-efektif-mengatasi-kegagalan-dan-hidup', 1, 1, 1),
(9, '4 Cara Menjadi Lebih Aktif dalam Belajar', '', '<p>Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini adalah\r\n artikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten.</p><p>Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten.</p><h3 style=\"font-family: \" open=\"\">Ini adalah Sub Heading&nbsp;</h3><p style=\"outline: 0px !important;\">Ini\r\n adalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten.</p><p style=\"outline: 0px !important;\">Ini\r\n adalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten.</p><p>Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten.</p><p>Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten.</p><p>Ini adalah artikel konten Ini \r\nadalah artikel konten Ini adalah artikel konten Ini adalah artikel \r\nkonten Ini adalah artikel konten Ini adalah artikel konten Ini adalah \r\nartikel konten Ini adalah artikel konten Ini adalah artikel konten Ini \r\nadalah artikel konten.</p>', 'ec77cde530b2eb464b9add2c31316b10.jpg', '2020-01-12 04:34:01', '2020-03-26 12:31:08', 1, 'Psikologi,Motivasi', '4-cara-menjadi-lebih-aktif-dalam-belajar', 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_post_views`
--

CREATE TABLE `tbl_post_views` (
  `view_id` int(11) NOT NULL,
  `view_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `view_ip` varchar(50) DEFAULT NULL,
  `view_post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_post_views`
--

INSERT INTO `tbl_post_views` (`view_id`, `view_date`, `view_ip`, `view_post_id`) VALUES
(1, '2019-04-06 13:33:39', '::1', 6),
(2, '2019-04-06 23:04:18', '::1', 6),
(3, '2019-04-07 03:32:54', '::1', 5),
(4, '2019-04-07 03:33:14', '::1', 4),
(5, '2019-04-07 04:03:50', '::1', 3),
(6, '2019-04-09 12:19:36', '::1', 6),
(7, '2019-04-09 13:28:30', '::1', 4),
(8, '2019-04-10 01:33:10', '::1', 5),
(9, '2019-04-10 10:00:27', '::1', 2),
(10, '2019-04-10 10:58:17', '::1', 1),
(11, '2019-04-10 13:20:32', '::1', 3),
(12, '2019-04-10 13:20:46', '::1', 6),
(13, '2019-04-11 03:32:18', '::1', 6),
(14, '2019-04-11 04:24:22', '::1', 4),
(15, '2019-04-11 07:58:35', '::1', 2),
(16, '2019-04-12 04:23:04', '::1', 6),
(17, '2019-04-12 10:09:30', '::1', 5),
(18, '2019-04-13 01:42:27', '::1', 6),
(19, '2019-04-13 02:01:01', '::1', 5),
(20, '2019-04-13 02:01:18', '::1', 3),
(21, '2019-04-13 03:23:34', '::1', 4),
(22, '2019-04-14 01:39:17', '::1', 1),
(23, '2019-04-14 03:24:24', '::1', 3),
(24, '2019-04-14 04:08:24', '::1', 2),
(25, '2019-04-15 03:44:42', '::1', 6),
(26, '2019-12-19 02:28:13', '::1', 6),
(27, '2019-12-19 02:29:33', '::1', 7),
(28, '2019-12-28 03:44:29', '::1', 7),
(29, '2019-12-28 07:44:18', '::1', 3),
(30, '2019-12-28 07:44:24', '::1', 2),
(31, '2019-12-28 08:06:56', '::1', 6),
(32, '2019-12-30 03:36:11', '::1', 4),
(33, '2019-12-30 04:21:54', '::1', 7),
(34, '2019-12-31 02:54:27', '::1', 4),
(35, '2019-12-31 02:58:04', '::1', 7),
(36, '2019-12-31 02:59:37', '::1', 1),
(37, '2019-12-31 03:58:35', '::1', 6),
(38, '2020-01-01 02:54:01', '::1', 7),
(39, '2020-01-01 03:19:14', '::1', 6),
(40, '2020-01-02 02:05:56', '::1', 4),
(41, '2020-01-02 03:16:32', '::1', 7),
(42, '2020-01-02 03:24:37', '::1', 1),
(43, '2020-01-03 03:20:23', '::1', 3),
(44, '2020-01-03 03:21:18', '::1', 6),
(45, '2020-01-03 04:03:10', '::1', 7),
(46, '2020-01-04 03:59:33', '::1', 5),
(47, '2020-01-04 04:04:33', '::1', 11),
(48, '2020-01-04 04:06:22', '::1', 10),
(49, '2020-01-04 04:23:16', '::1', 16),
(50, '2020-01-04 05:51:45', '::1', 15),
(51, '2020-01-07 03:12:53', '::1', 15),
(52, '2020-01-12 04:42:18', '::1', 9),
(53, '2020-03-25 16:25:28', '::1', 4),
(54, '2020-03-26 05:46:50', '::1', 8),
(55, '2020-03-26 05:48:27', '::1', 3),
(56, '2020-03-26 10:27:56', '::1', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_site`
--

CREATE TABLE `tbl_site` (
  `site_id` int(11) NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_title` varchar(200) DEFAULT NULL,
  `site_description` text,
  `site_favicon` varchar(50) DEFAULT NULL,
  `site_logo_header` varchar(50) DEFAULT NULL,
  `site_logo_footer` varchar(50) DEFAULT NULL,
  `site_logo_big` varchar(50) DEFAULT NULL,
  `site_facebook` varchar(150) DEFAULT NULL,
  `site_twitter` varchar(150) DEFAULT NULL,
  `site_instagram` varchar(150) DEFAULT NULL,
  `site_pinterest` varchar(150) DEFAULT NULL,
  `site_linkedin` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_site`
--

INSERT INTO `tbl_site` (`site_id`, `site_name`, `site_title`, `site_description`, `site_favicon`, `site_logo_header`, `site_logo_footer`, `site_logo_big`, `site_facebook`, `site_twitter`, `site_instagram`, `site_pinterest`, `site_linkedin`) VALUES
(1, 'MBLOG', 'MBLOG - Source Code untuk Blogger', 'Open Source source code untuk personal blog, simple, elegan, full responsif, dan mudah di customize.  ', 'favicon.png', 'logo-black.png', 'favicon.png', 'LOGO-BIG.png', 'https://www.facebook.com/mfikridotcom/', 'https://twitter.com/MFikri75770694/', 'https://www.instagram.com/mfikricom/', 'https://id.pinterest.com/mfikricom/', 'https://www.linkedin.com/in/m-fikri-setiadi-b03370148/');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_subscribe`
--

CREATE TABLE `tbl_subscribe` (
  `subscribe_id` int(11) NOT NULL,
  `subscribe_email` varchar(100) DEFAULT NULL,
  `subscribe_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `subscribe_status` int(11) DEFAULT '0',
  `subscribe_rating` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_subscribe`
--

INSERT INTO `tbl_subscribe` (`subscribe_id`, `subscribe_email`, `subscribe_created_at`, `subscribe_status`, `subscribe_rating`) VALUES
(1, 'aris@gmail.com', '2020-03-11 07:40:16', 1, 1),
(3, 'aris@gmail.com', '2020-03-11 07:57:28', 1, 1),
(4, 'arisjaka@gmail.com', '2020-03-11 07:58:44', 0, 0),
(5, 'aris@gmail.com', '2020-03-11 03:06:50', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tags`
--

CREATE TABLE `tbl_tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_tags`
--

INSERT INTO `tbl_tags` (`tag_id`, `tag_name`) VALUES
(1, 'Teknologi'),
(2, 'Psikologi'),
(3, 'Motivasi'),
(4, 'Kesehatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_testimonial`
--

CREATE TABLE `tbl_testimonial` (
  `testimonial_id` int(11) NOT NULL,
  `testimonial_name` varchar(50) DEFAULT NULL,
  `testimonial_content` text,
  `testimonial_image` varchar(50) DEFAULT NULL,
  `testimonial_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_testimonial`
--

INSERT INTO `tbl_testimonial` (`testimonial_id`, `testimonial_name`, `testimonial_content`, `testimonial_image`, `testimonial_created_at`) VALUES
(1, 'Aris Putra Buana', 'Ini adalah source code yang luar biasa. simple, elegan, full responsif, cepat, dan mudah di customize oleh web developer pemula.', 'e0e5237a514b6475a09b8a8520b2e60e.jpg', '2020-01-03 03:31:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(60) DEFAULT NULL,
  `user_password` varchar(40) DEFAULT NULL,
  `user_level` varchar(10) DEFAULT NULL,
  `user_status` varchar(10) DEFAULT '1',
  `user_photo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_level`, `user_status`, `user_photo`) VALUES
(2, 'Joko', 'joko1@gmail.com', '202cb962ac59075b964b07152d234b70', '2', '1', '3d0be9678f99be0b5180634d37ff8ef4.png'),
(3, 'aris', 'aris@gmail.com', '202cb962ac59075b964b07152d234b70', '1', '1', '1d6f84159c2dca3ca69ddbd663a8531e.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_visitors`
--

CREATE TABLE `tbl_visitors` (
  `visit_id` int(11) NOT NULL,
  `visit_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `visit_ip` varchar(50) DEFAULT NULL,
  `visit_platform` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_visitors`
--

INSERT INTO `tbl_visitors` (`visit_id`, `visit_date`, `visit_ip`, `visit_platform`) VALUES
(541327, '2019-03-18 14:07:36', '::1', 'Firefox'),
(541328, '2019-03-19 03:33:51', '::1', 'Chrome'),
(541329, '2019-03-20 01:00:19', '::1', 'Chrome'),
(541330, '2019-04-05 01:53:28', '::1', 'Firefox'),
(541331, '2019-04-06 01:37:35', '::1', 'Chrome'),
(541332, '2019-04-06 23:04:12', '::1', 'Chrome'),
(541333, '2019-04-09 12:19:32', '::1', 'Chrome'),
(541334, '2019-04-10 01:33:03', '::1', 'Chrome'),
(541335, '2019-04-11 03:30:38', '::1', 'Chrome'),
(541336, '2019-04-11 03:30:38', '::1', 'Chrome'),
(541337, '2019-04-12 03:51:42', '::1', 'Chrome'),
(541338, '2019-04-12 21:55:51', '::1', 'Chrome'),
(541339, '2019-04-14 01:30:40', '::1', 'Chrome'),
(541340, '2019-04-15 01:42:53', '::1', 'Chrome'),
(541341, '2019-05-08 02:07:09', '::1', 'Chrome'),
(541342, '2019-05-21 05:55:14', '::1', 'Firefox'),
(541343, '2019-08-28 07:08:22', '::1', 'Firefox'),
(541344, '2019-12-17 06:04:57', '::1', 'Firefox'),
(541345, '2019-12-18 01:34:25', '::1', 'Firefox'),
(541346, '2019-12-19 02:21:23', '::1', 'Firefox'),
(541347, '2019-12-20 07:47:00', '::1', 'Firefox'),
(541348, '2019-12-28 02:58:34', '::1', 'Firefox'),
(541349, '2019-12-29 08:48:39', '::1', 'Firefox'),
(541350, '2019-12-30 03:24:04', '::1', 'Firefox'),
(541351, '2019-12-31 02:47:15', '::1', 'Firefox'),
(541352, '2020-01-01 02:24:55', '::1', 'Firefox'),
(541353, '2020-01-02 01:58:25', '::1', 'Firefox'),
(541354, '2020-01-03 03:15:30', '::1', 'Firefox'),
(541355, '2020-01-04 03:31:49', '::1', 'Firefox'),
(541356, '2020-01-05 06:58:35', '127.0.0.1', 'Firefox'),
(541357, '2020-01-06 06:03:25', '::1', 'Firefox'),
(541358, '2020-01-07 00:57:59', '::1', 'Firefox'),
(541359, '2020-01-08 05:53:44', '::1', 'Firefox'),
(541360, '2020-01-12 04:18:15', '::1', 'Firefox'),
(541361, '2020-03-25 16:24:02', '::1', 'Chrome'),
(541362, '2020-03-25 17:15:56', '::1', 'Chrome');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_about`
--
ALTER TABLE `tbl_about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indeks untuk tabel `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indeks untuk tabel `tbl_home`
--
ALTER TABLE `tbl_home`
  ADD PRIMARY KEY (`home_id`);

--
-- Indeks untuk tabel `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  ADD PRIMARY KEY (`inbox_id`);

--
-- Indeks untuk tabel `tbl_navbar`
--
ALTER TABLE `tbl_navbar`
  ADD PRIMARY KEY (`navbar_id`);

--
-- Indeks untuk tabel `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indeks untuk tabel `tbl_post_views`
--
ALTER TABLE `tbl_post_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indeks untuk tabel `tbl_site`
--
ALTER TABLE `tbl_site`
  ADD PRIMARY KEY (`site_id`);

--
-- Indeks untuk tabel `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  ADD PRIMARY KEY (`subscribe_id`);

--
-- Indeks untuk tabel `tbl_tags`
--
ALTER TABLE `tbl_tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indeks untuk tabel `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  ADD PRIMARY KEY (`visit_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_about`
--
ALTER TABLE `tbl_about`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_home`
--
ALTER TABLE `tbl_home`
  MODIFY `home_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  MODIFY `inbox_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_navbar`
--
ALTER TABLE `tbl_navbar`
  MODIFY `navbar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_post_views`
--
ALTER TABLE `tbl_post_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `tbl_site`
--
ALTER TABLE `tbl_site`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  MODIFY `subscribe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_tags`
--
ALTER TABLE `tbl_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541363;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
