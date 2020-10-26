-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2020 at 07:29 PM
-- Server version: 10.3.24-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u8037934_5dNrGx65Mf`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `nama_bank` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id_bank`, `nama_bank`) VALUES
(1, 'BCA'),
(2, 'BNI');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `total` int(12) NOT NULL,
  `pengiriman` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=batal, 1=keranjang, 2=checkout'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `datauser`
--

CREATE TABLE `datauser` (
  `id_datauser` int(11) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `status` enum('0','1','2','3','4') NOT NULL COMMENT '0=batal,1=belumbayar,2=dikemas,3=dikirim,4=selesai',
  `databarang` varchar(128) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailproduk`
--

CREATE TABLE `detailproduk` (
  `id` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` int(30) NOT NULL,
  `harga_diskon` int(30) NOT NULL,
  `stok` int(11) NOT NULL,
  `berat` varchar(32) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `daya` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `kegunaan` text DEFAULT NULL,
  `warna` varchar(128) DEFAULT NULL,
  `ukuran` varchar(64) DEFAULT NULL,
  `gambar` varchar(128) DEFAULT NULL,
  `gambar1` varchar(128) NOT NULL,
  `gambar2` varchar(128) NOT NULL,
  `gambar3` varchar(128) NOT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `made` varchar(32) NOT NULL,
  `kondisi` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=baru,1=second',
  `status` enum('0','1','2') NOT NULL COMMENT '0=grosir,1=eceran,2=eceran/grosir',
  `active` enum('0','1') NOT NULL COMMENT 'aktif=0, tidak=1',
  `min_order` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailproduk`
--

INSERT INTO `detailproduk` (`id`, `deskripsi`, `harga`, `harga_diskon`, `stok`, `berat`, `brand`, `daya`, `tipe`, `kegunaan`, `warna`, `ukuran`, `gambar`, `gambar1`, `gambar2`, `gambar3`, `id_produk`, `made`, `kondisi`, `status`, `active`, `min_order`) VALUES
(1, 'Diesel engine kubota D722 memiliki 3 silinder dengan tenaga 14 HP / 3600 RPM, dengan ketahanan yang baik saat digunakan dalam aktivitasnya.  \r\nNama	: Diesel Engine Kubota D722 \r\nTipe	: Vertical, pendingin air, 4 langkah \r\nKategori	: Mesin Diesel \r\nDiameter x Langkah	: 67 x 68 mm \r\nJml Silinder	: 3 \r\nTenaga Kontinyu	: 12.2 kW (16.3 HP) / 3600 rpm \r\nIsi Silinder	: 719 CC \r\nTenaga Maksimum	: 14.9 kW (20.0 HP) / 3600 rpm \r\nSistem Pembakaran	: E-TVCS \r\nJenis BBM	: Solar dengan Kualitas Baik \r\nStarter	: Electric Starter \r\nSistem Pelumas	: Pelumasan Ditekan Dengan Pompa Trochoid \r\nIsi Pelumas	: 3.8 Lt \r\nSistem Pendingin	: Radiator \r\nJenis Minyak Pelumas	: SAE 30 \r\nBerat	: 70 Kg ', 52850000, 48950000, 1, '70 kg', 'Kubota', '3 Cylinder / 14 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, '/diesel_engine/D722/1.png', '/diesel_engine/D722/1.jpg', '/diesel_engine/D722/2.jpg', '/diesel_engine/D722/3.jpg', 1, '', '0', '2', '0', '1'),
(2, 'Diesel engine kubota D905 memiliki 3 silinder dengan tenaga 18 HP / 3600 RPM, dengan ketahanan yang baik saat digunakan dalam aktivitasnya.\r\n\r\nNama	: D 905\r\nTipe	: Vertical, pendingin air, 4 langkah\r\nKategori	: Mesin Diesel\r\nDiameter x Langkah	: 72 x 73.6 mm\r\nJml Silinder	: 3\r\nTenaga Maksimum	: 18.5 kW (24.8 HP) / 3600 rpm\r\nTenaga Kontinyu	: 15.2 kW (20.4 HP) / 3600 rpm\r\nIsi Silinder	: 898 CC\r\nSistem Pembakaran	: E-TVCS\r\nJenis BBM	: Solar dengan Kualitas Baik\r\nStarter	: Electric Starter\r\nSistem Pelumas	: Pelumasan Ditekan Dengan Pompa Trochoid\r\nIsi Pelumas	: 5.1 Lt\r\nSistem Pendingin	: Radiator\r\nJenis Minyak Pelumas	: SAE 30\r\nBerat	: 100 Kg', 57950000, 54850000, 1, '100 kg', 'Kubota', '3 Cylinder / 18 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, '/diesel_engine/D905/1.png', '/diesel_engine/D905/1.png', '/diesel_engine/D905/2.png', '/diesel_engine/D905/3.png', 2, '', '0', '2', '0', '1'),
(3, 'Diesel engine kubota V1505 memiliki 4 silinder dengan tenaga 36 HP / 3000 RPM, dengan ketahanan yang baik saat digunakan dalam aktivitasnya.\r\n\r\nMesin Diesel Pendingin Air 4-Langkah Vertikal \r\nNama	: V 1505 \r\nTipe	: Vertical, pendingin air, 4 langkah \r\nKategori	: Mesin Diesel \r\nDiameter x Langkah	: 78 x 78.4 mm \r\nJml Silinder	: 4 \r\nTenaga Maksimum	: 26.5 kW (35.5 HP) / 3000 rpm \r\nTenaga Kontinyu	: 21.7 kW (29.1 HP) / 3000 rpm \r\nIsi Silinder	: 1498 CC \r\nSistem Pembakaran	: E-TVCS \r\nJenis BBM	: Solar dengan Kualitas Baik \r\nStarter	: Electric Starter \r\nSistem Pelumas	: Pelumasan Ditekan Dengan Pompa Trochoid \r\nIsi Pelumas	: 6 Lt \r\nSistem Pendingin	: Radiator \r\nJenis Minyak Pelumas	: SAE 30 \r\nBerat	: 150 Kg ', 69785000, 67850000, 1, '150 kg', 'Kubota', '4 Cylinder / 36 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, '/diesel_engine/V1505/1.png', '/diesel_engine/V1505/1.png', '/diesel_engine/V1505/2.png', '/diesel_engine/V1505/3.png', 3, '', '0', '2', '0', '1'),
(4, 'Diesel engine kubota V2203 memiliki 4 silinder dengan tenaga 48 HP / 2800 RPM, dengan ketahanan yang baik saat digunakan dalam aktivitasnya.  \r\n\r\nNama	: V 2203 \r\nTipe	: Vertical, pendingin air, 4 langkah \r\nKategori	: Mesin Diesel \r\nDiameter x Langkah	: 87 x 92.4 mm \r\nJml Silinder	: 4 \r\nTenaga Kontinyu	: 29.2 kW (39.1 HP) / 2800 rpm \r\nIsi Silinder	: 2197 CC \r\nTenaga Maksimum	: 36.4 kW (48.8 HP) / 2800 rpm \r\nSistem Pembakaran	: E-TVCS \r\nJenis BBM	: Solar dengan Kualitas Baik \r\nStarter	: Electric Starter \r\nSistem Pelumas	: Pelumasan Ditekan Dengan Pompa Trochoid \r\nIsi Pelumas	: 9.5 Lt \r\nSistem Pendingin	: Radiator \r\nJenis Minyak Pelumas	: SAE 30 \r\nBerat	: 195 Kg ', 82350000, 79950000, 1, '195 kg', 'Kubota', '4 Cylinder / 48 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, '/diesel_engine/V2203/1.png', '/diesel_engine/V2203/1.png', '/diesel_engine/V2203/2.png', '/diesel_engine/V2203/3.png', 4, '', '0', '2', '0', '1'),
(5, 'Diesel engine kubota V3300 memiliki 4 silinder dengan tenaga 88 HP / 2600 RPM, dengan ketahanan yang baik saat digunakan dalam aktivitasnya.  \r\n\r\nMesin Diesel Pendingin Air 4-Langkah Vertikal \r\nNama	: V 3300 \r\nTipe	: Vertical, pendingin air, 4 langkah \r\nKategori	: Mesin Diesel \r\nDiameter x Langkah	: 98 x 110 mm \r\nJml Silinder	: 4 \r\nTenaga Maksimum	: 65.1 kW (87.3 HP) / 2600 rpm \r\nTenaga Kontinyu	: 53.4 kW (71.6 HP) / 2600 rpm \r\nIsi Silinder	: 1498 CC \r\nSistem Pembakaran	: E-TVCS \r\nJenis BBM	: Solar dengan Kualitas Baik \r\nStarter	: Electric Starter \r\nArah Putaran	: Searah jarum jam (dilihat dari depan flywheel) \r\nIsi Pelumas	: 13.2 Lt \r\nSistem Pendingin	: Radiator \r\nJenis Minyak Pelumas	: SAE 30 \r\nBerat	: 270 Kg \r\nIsi Tangki BBM	: 3.5 Lt ', 114750000, 111850000, 1, '270 kg', 'Kubota', '4 Cylinder / 88 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, '/diesel_engine/V3300/1.png', '/diesel_engine/V3300/1.png', '/diesel_engine/V3300/2.png', '/diesel_engine/V3300/3.png', 5, '', '0', '2', '0', '1'),
(6, 'Diesel engine kubota Z482 memiliki 2 silinder dengan tenaga 13 HP / 3600 RPM, dengan ketahanan yang baik saat digunakan dalam aktivitasnya.  \r\n\r\nMesin Diesel Pendingin Air 4-Langkah Vertikal \r\nNama	: Z 482 \r\nTipe	: Vertical, pendingin air, 4 langkah \r\nKategori	: Mesin Diesel \r\nDiameter x Langkah	: 67 x 68 mm \r\nJml Silinder	: 2 \r\nTenaga Kontinyu	: 8.1 kW (10.9 HP) / 3600 rpm \r\nIsi Silinder	: 479 CC \r\nTenaga Maksimum	: 9.9 kW (13.3 HP) / 3600 rpm \r\nSistem Pembakaran	: E-TVCS \r\nJenis BBM	: Solar dengan Kualitas Baik \r\nStarter	: Electric Starter \r\nSistem Pelumas	: Pelumasan Ditekan Dengan Pompa Trochoid \r\nIsi Pelumas	: 2.5 Lt \r\nSistem Pendingin	: Radiator \r\nJenis Minyak Pelumas	: SAE 30 \r\nBerat	: 65 Kg ', 45785000, 42950000, 1, '65 kg', 'Kubota', '2 Cylinder / 13 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 6, '', '0', '2', '1', '1'),
(7, 'Diesel engine loncin LC2v78FD-2 yang memiliki 2 silinder dengan tenaga 22 HP / 3600 RPM, dengan ketahanan yang baik dikelasnya, saat digunakan dalam aktivitasnya.  \r\n\r\nNama	: Diesel Engine Loncin \r\nTipe	: LC2V78FD-2 Twin Engine \r\nTenaga Mesin	: 22 Hp \r\nStart Mesin	: Electric Stater \r\nJml Silinder Mesin / RPM Mesin	: 2 Silinder / 3600 RPM \r\nKonsumsi BB Per Jam	: 4.82 L/Jam \r\nTorsi Maksimum Mesin	: 42 Nm / 2500 RPM \r\nDiameter x Langkah Piston	: 78 x 71 mm \r\nLangkah Mesin	: 4 Langkah \r\nTipe Oli	: SAE 10W-30 \r\nKapasitas Oli	: 1.5 Liter \r\nSistem Pengapian Mesin	: Transistorized Magneto \r\nKapasitas Mesin	: 678 cc \r\nSaringan Udara Mesin	: Semi Kering, Dual Elemen \r\nDimensi (p x l x t)	: 510 x 400 x 450 (mm) \r\nPutaran As Mesin	: Horizontal, Counterclockwise Dari P.T.O (berlawanan arah jarum jam) \r\nDimensi (p x l x t)	: 510 x 400 x 450 (mm) \r\nBerat	: 60 Kg ', 14985000, 14985000, 1, '60 kg', 'Loncin', '2 Cylinder / 22 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 7, '', '0', '2', '1', '1'),
(8, 'Diesel engine loncin G 160 F dengan TPV 38 x 6 concrete vibrator yang memiliki tenaga 5.5 HP. Selain itu, dengan engine 4 Tak dan hemat bahan bakar, rangka vibrator yang kuat dan include selang vibrator ukuran 38 x 6.  \r\n\r\nNama	: Diesel Engine Loncin G160 + Concrete Vibrator \r\nTipe	: G 160 F + TPV 38 x 6 \r\nJenis Vibrator	: Concrete Vibrator \r\nKosongan /Dengan Penggerak	: Dengan Mesin Bensin \r\nTipe Bahan Bakar	: Bensin \r\nStart Mesin	: Recoil  \r\nTenaga Mesin	: 5.5 Hp \r\nBerat	: 75 Kg \r\nKelengkapan Aksesories	: 1x Kunci Busi ', 5350000, 5350000, 1, '75 kg', 'Loncin', '5.5 Hp', NULL, 'Loncin G 160 F With TPV 38×6 Concrete Vibrator merupakan alat untuk memadatkan semen cor yang memudahkan user dalam menggunakan alat konstruksi', NULL, NULL, NULL, '', '', '', 8, '', '0', '2', '1', '1'),
(9, 'Diesel engine loncin LC 80WB30-4.5Q yang dipergunakan untuk pompa lumpur memiliki diameter pengisapan pompa & buang pompa ukuran 3 inch, dengan ketahanan yang baik dikelasnya, saat digunakan dalam aktivitasnya.  \r\n\r\nNama	: Diesel Engine Loncin LC80WB30-4.5Q \r\nTipe	: LC80WB30-4.5 Q \r\nJenis Mesin	: Pompa, Centrrifugal (Self Priming) \r\nStart Mesin	: Recoil \r\nModel Mesin Serbaguna	: G200 F \r\nKapasitas Mesin	: 196 cc \r\nRPM Mesin	: 3600 RPM \r\nMax Tinggi Buang	: 30 Meter \r\nKetinggian Daya Hisap	: 6 Meter \r\nVolume Buang Maksimum	: 4.5 m3/H \r\nKonsumsi BB Per Jam	: 1.5 Liter \r\nKapasitas Tanki Bahan Bakar	: 3.6 L \r\nKapasitas Oli	: 0.6 L \r\nDiameter x Langkah Piston	: 68 x 54 (mm) \r\nDimensi (p x l x t)	: 640 x 530 x 490 (mm) \r\nBerat	: 55 Kg ', 6850000, 6850000, 1, '55 kg', 'Loncin', 'Tenaga output : 4.1 kW \\n\r\nDiameter penghisapan pompa : 3 inch \\n\r\nDiameter buang pompa : 3 inch \\n', NULL, 'Loncin Semi Trash Pump tipe LC80WB30-4.5Q sangat ideal untuk penggunaan dalam memompa air limbah. Dirancang khusus untuk lokasi pekerjaan dan aplikasi dimana untuk memompa dengan kapasitas air limbah volume tinggi. Didukung oleh mesin engine Loncin seri G200F yang memiliki tenaga yang kuat dan mampu bekerja dengan maksimal.', NULL, NULL, NULL, '', '', '', 9, '', '0', '2', '1', '1'),
(10, 'Diesel engine tropic R 175 yang memiliki 1 silinder dengan tenaga 7 HP / 2600 RPM.  \r\n\r\nNama	: Diesel Engine Tropic R 175 / 7 Hp \r\nTipe	: R 175 \r\nTenaga Mesin	: 7 Hp \r\nStart Mesin	: Recoil \r\nJml Silinder Mesin / RPM Mesin	: 1 Silinder / 2600 RPM \r\nPendingin Mesin	: Hopper \r\nDiameter x Langkah Piston	: 75 x 80 mm \r\nLangkah Mesin	: 4 Langkah \r\nTipe Oli	: SAE 40 (Jenis Diesel) \r\nKapasitas Tanki Bahan Bakar	: 4.75 L \r\nDimensi (p x l x t)	: 380 x 570 x 550 (mm) \r\nBerat	: 80 Kg ', 5650000, 5650000, 1, '80 kg', 'Tropic', '1 Cylinder / 7 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 10, '', '0', '2', '1', '1'),
(11, 'Diesel engine yanmar TF 155 R dengan radiator yang memiliki 1 silinder dengan tenaga 15.5 HP / 2400 RPM, dengan ketahanan yang baik dikelasnya, saat digunakan dalam aktivitasnya.  \rNama	: Yanmar TF 155 R \rTipe	: TF 155 R \rTenaga Mesin	: 15.5 Hp \rStart Mesin	: Engkol \rJml Silinder Mesin / RPM Mesin	: 1 Silinder / 2400 RPM \rPendingin Mesin	: Radiator \rTorsi Maksimum Mesin	: 61.8 Nm / 1600 RPM \rDiameter x Langkah Piston	: 102 x 105 mm \rLangkah Mesin	: 4 Langkah \rTipe Oli	: SAE 40 cc/cd \rKapasitas Mesin	: 857 cc \rSistem Pembakaran Mesin	: Direct \rLampu / Double Bearing	: Tidak / Tidak \rKapasitas Oli	: 3 Liter \rDimensi (p x l x t)	: 910 x 500 x 810 (mm) \rBerat	: 170 Kg ', 27850000, 27850000, 1, '170 kg', 'Yanmar', '1 Silinder / 15.5 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 11, '', '0', '2', '1', '1'),
(12, 'Diesel engine yanmar TF 65 R dengan radiator yang memiliki 1 silinder dengan tenaga 6.5 HP / 2200 RPM, dengan ketahanan yang baik dikelasnya, saat digunakan dalam aktivitasnya.  \rNama	: Yanmar TF 65 R \rTipe	: TF 65 R \rTenaga Mesin	: 6.5 Hp \rStart Mesin	: Engkol \rJml Silinder Mesin / RPM Mesin	: 1 Silinder / 2200 RPM \rPendingin Mesin	: Radiator \rTorsi Maksimum Mesin	: 24.2 Nm / 1600 RPM \rDiameter x Langkah Piston	: 78 x 80 mm \rLangkah Mesin	: 4 Langkah \rTipe Oli	: SAE 40 cc/cd \rKapasitas Mesin	: 382 cc \rSistem Pembakaran Mesin	: Direct \rLampu / Double Bearing	: Tidak / Tidak \rKapasitas Oli	: 1.8 Liter \rDimensi (p x l x t)	: 780 x 480 x 700 (mm) \rBerat	: 85 Kg ', 13985000, 13985000, 1, '85 kg', 'Yanmar', '1 Cylinder / 6.5 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 12, '', '0', '2', '1', '1'),
(13, 'Diesel engine yanmar TF 85 R dengan radiator yang memiliki 1 silinder dengan tenaga 8.5 HP / 2200 RPM, dengan ketahanan yang baik dikelasnya, saat digunakan dalam aktivitasnya.  \rNama	: Yanmar TF 85 R \rTipe	: TF 85 R \rTenaga Mesin	: 8.5 Hp \rStart Mesin	: Engkol \rJml Silinder Mesin / RPM Mesin	: 1 Silinder / 2200 RPM \rPendingin Mesin	: Radiator \rTorsi Maksimum Mesin	: 33.8 Nm / 1600 RPM \rDiameter x Langkah Piston	: 85 x 87 mm \rLangkah Mesin	: 4 Langkah \rTipe Oli	: SAE 40 cc/cd \rKapasitas Mesin	: 493 cc \rSistem Pembakaran Mesin	: Direct \rLampu / Double Bearing	: Tidak / Tidak \rKapasitas Oli	: 2.2 Liter \rDimensi (p x l x t)	: 780 x 480 x 700 (mm) \rBerat	: 115 Kg ', 14950000, 14950000, 1, '115 kg', 'Yanmar', '1 Cylinder / 8.5 Hp', NULL, 'Untuk kebutuhan industrial baik mesin bor, mesin pertanian, pergantian genset, mesin penggerak pompa dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 13, '', '0', '2', '1', '1'),
(14, 'Motor orbit hidrolik merupakan sebuah aktuator mekanik yang mengkonversi aliran dan tekanan hidrolik menjadi torsi atau tenaga putaran. Motor hidrolik dengan type NLHR 125 (125 cc) memiliki as spie ukuran 25 mm dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \r\n\r\nSpesifikasi Orbital Hydraulic Motors : \r\nSeries : NLHR 100 \r\nFlow (rated) : 60 lpm \r\nFlow (max) : 75 lpm \r\nSpeed (rated) : 600 rpm \r\nSpeed (max) : 750 rpm \r\nPressure (rated) : 100 bar \r\nPressure (max) : 200 bar \r\nTorque (rated) : 240 Nm \r\nTorque (max) : 280 Nm \r\nPower (rated) : 15 kW \r\nPower (max) : 17 kW ', 2785000, 2785000, 1, '6 kg', 'Nucleo', NULL, 'NLHR 125 (125 cc)', 'Untuk mengkonversikan aliran & tekanan hidrolik menjadi torsi atau putaran, yang bisa untuk mesin bor, mesin pabrik atau kegunaan lainnya.', NULL, NULL, '/motor_hidrolik/motor_hidrolik_nucleo_100_cc/1.png', '/motor_hidrolik/motor_hidrolik_nucleo_100_cc/1.png', '/motor_hidrolik/motor_hidrolik_nucleo_100_cc/2.png', '/motor_hidrolik/motor_hidrolik_nucleo_100_cc/3.png', 14, '', '0', '2', '0', '1'),
(15, 'Motor orbit hidrolik merupakan sebuah aktuator mekanik yang mengkonversi aliran dan tekanan hidrolik menjadi torsi atau tenaga putaran. Motor hidrolik dengan type NLHR 125 (125 cc) memiliki as spie ukuran 25 mm dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \r\n\r\nSpesifikasi Orbital Hydraulic Motors : \r\nSeries : NLHR 125 \r\nFlow (rated) : 60 lpm \r\nFlow (max) : 75 lpm \r\nSpeed (rated) : 475 rpm \r\nSpeed (max) : 600 rpm \r\nPressure (rated) : 175 bar \r\nPressure (max) : 200 bar \r\nTorque (rated) : 292 Nm \r\nTorque (max) : 340 Nm \r\nPower (rated) : 14 kW \r\nPower (max) : 16 kW ', 2985000, 2985000, 1, '6 kg', 'Nucleo', NULL, 'NLHR 125 (125 cc)', 'Untuk mengkonversikan aliran & tekanan hidrolik menjadi torsi atau putaran, yang bisa untuk mesin bor, mesin pabrik atau kegunaan lainnya.', NULL, NULL, '/motor_hidrolik/motor_hidrolik_nucleo_125_cc/1.png', '/motor_hidrolik/motor_hidrolik_nucleo_125_cc/1.png', '/motor_hidrolik/motor_hidrolik_nucleo_125_cc/2.png', '/motor_hidrolik/motor_hidrolik_nucleo_125_cc/3.png', 15, '', '0', '2', '0', '1'),
(16, 'Motor orbit hidrolik merupakan sebuah aktuator mekanik yang mengkonversi aliran dan tekanan hidrolik menjadi torsi atau tenaga putaran. Motor hidrolik dengan type NLHR 160 (160 cc) memiliki as spie ukuran 25 mm dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \r\n\r\nSpesifikasi Orbital Hydraulic Motors : \r\nSeries : NLHR 160   \r\nFlow (rated) : 60 lpm \r\nFlow (max) : 75 lpm \r\nSpeed (rated) : 375 rpm \r\nSpeed (max) : 470 rpm \r\nPressure (rated) : 165 bar \r\nPressure (max) : 200 bar \r\nTorque (rated) : 363 Nm \r\nTorque (max) : 430 Nm \r\nPower (rated) : 14 kW \r\nPower (max) : 15 kW ', 3250000, 3250000, 1, '7 kg', 'Kubota', NULL, 'NLHR 160 (160 cc)', 'Untuk mengkonversikan aliran & tekanan hidrolik menjadi torsi atau putaran, yang bisa untuk mesin bor, mesin pabrik atau kegunaan lainnya.', NULL, NULL, '/motor_hidrolik/motor_hidrolik_nucleo_160_cc/1.png', '/motor_hidrolik/motor_hidrolik_nucleo_160_cc/1.png', '/motor_hidrolik/motor_hidrolik_nucleo_160_cc/2.png', '/motor_hidrolik/motor_hidrolik_nucleo_160_cc/3.png', 16, '', '0', '2', '0', '1'),
(17, 'Motor orbit hidrolik merupakan sebuah aktuator mekanik yang mengkonversi aliran dan tekanan hidrolik menjadi torsi atau tenaga putaran. Motor hidrolik dengan type NLHS-100 (100 cc) body kotak memiliki as spie ukuran 32 mm dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \rSpesifikasi Orbital Hydraulic Motors : \rSeries : NLHS 100 \rFlow (rated) : 75 lpm \rFlow (max) : 95 lpm \rSpeed (rated) : 742 rpm \rSpeed (max) : 924 rpm \rPressure (rated) : 170 bar  \rPressure (max) : 275 bar \rTorque (rated) : 245 Nm \rTorque (max) : 395 Nm ', 5850000, 5850000, 1, '10 kg', 'Nucleo', NULL, 'NLHS 100 (100 cc) , Body Kotak \\n\r\nAs Spie (32 mm)', 'Untuk mengkonversikan aliran & tekanan hidrolik menjadi torsi atau putaran, yang bisa untuk mesin bor, mesin pabrik atau kegunaan lainnya.', NULL, NULL, NULL, '', '', '', 17, '', '0', '2', '1', '1'),
(18, 'Motor orbit hidrolik merupakan sebuah aktuator mekanik yang mengkonversi aliran dan tekanan hidrolik menjadi torsi atau tenaga putaran. Motor hidrolik dengan type NLHS-130 (130 cc) body kotak memiliki as spie ukuran 32 mm dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \rSpesifikasi Orbital Hydraulic Motors : \rSeries : NLHS 130 \rFlow (rated) : 75 lpm \rFlow (max) : 95 lpm \rSpeed (rated) : 630 rpm \rSpeed (max) : 820 rpm \rPressure (rated) : 170 bar \rPressure (max) : 310 bar \rTorque (rated) : 200 Nm \rTorque (max) : 510 Nm ', 6250000, 6250000, 1, '10 kg', 'Nucleo', NULL, 'NLHS 130 (130 cc) , Body Kotak \\n\r\nAs Spie (32 mm)', 'Untuk mengkonversikan aliran & tekanan hidrolik menjadi torsi atau putaran, yang bisa untuk mesin bor, mesin pabrik atau kegunaan lainnya.', NULL, NULL, NULL, '', '', '', 18, '', '0', '2', '1', '1'),
(19, 'Motor orbit hidrolik merupakan sebuah aktuator mekanik yang mengkonversi aliran dan tekanan hidrolik menjadi torsi atau tenaga putaran. Motor hidrolik dengan type NLHS-245 (245 cc) body kotak memiliki as spie ukuran 32 mm dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \rSpesifikasi Orbital Hydraulic Motors : \rSeries : NLHS 245  \rFlow (rated) : 75 lpm \rFlow (max) : 115 lpm \rSpeed (rated) : 308 rpm \rSpeed (max) : 462 rpm \rPressure (rated) : 170 bar \rPressure (max) : 240 bar \rTorque (rated) : 555 Nm \rTorque (max) : 765 Nm ', 6650000, 6650000, 1, '14 kg', 'Nucleo', NULL, 'NLHS 245 (245 cc) , Body Kotak \\n\r\nAs Spie (32 mm)', 'Untuk mengkonversikan aliran & tekanan hidrolik menjadi torsi atau putaran, yang bisa untuk mesin bor, mesin pabrik atau kegunaan lainnya.', NULL, NULL, NULL, '', '', '', 19, '', '0', '2', '1', '1'),
(20, 'Pompa hidrolik merupakan untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Pompa hidrolik dengan type HGP-3A-19 (19 cc) memiliki as spie dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \r\n\r\nSpesifikasi Gear Pump Hydraulics : \r\nModel : HGP-3A-19 \r\nDisplacement : 19.2 L/min \r\nPressure (work) : 210 kgf/cm2 \r\nPressure (max) : 250 kgf/cm2 \r\nSpeed (rate) : 1800 rpm \r\nSpeed (max) : 3000 rpm \r\nSpeed (min) : 400 rpm \r\nPort Size : PT 3/4\" (Out) , PT 1/2\" (In) ', 2650000, 2650000, 1, '5 kg', 'Jaguar', NULL, 'HGP-3A-19 (19 cc)', 'Untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Bisa untuk keperluan hidrolik forklift, mesin bor dan kebutuhan lainnya', NULL, NULL, '/pompa_hidrolik/gear_pump_hgp_3a_19_cc/1.png', '/pompa_hidrolik/gear_pump_hgp_3a_19_cc/1.png', '/pompa_hidrolik/gear_pump_hgp_3a_19_cc/2.png', '/pompa_hidrolik/gear_pump_hgp_3a_19_cc/3.png', 20, '', '0', '2', '0', '1'),
(21, 'Pompa hidrolik merupakan untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Pompa hidrolik dengan type HGP-3A-23 (23 cc) memiliki as spie dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \r\n\r\nSpesifikasi Gear Pump Hydraulics : \r\nModel : HGP-3A-23 \r\nDisplacement : 23 L/min \r\nPressure (work) : 210 kgf/cm2 \r\nPressure (max) : 250 kgf/cm2 \r\nSpeed (rate) : 1800 rpm \r\nSpeed (max) : 3000 rpm \r\nSpeed (min) : 400 rpm \r\nPort Size : PT 3/4\" (Out) , PT 1/2\" (In) ', 2650000, 2650000, 1, '5.5 kg', 'Jaguar', NULL, 'HGP-3A-23 (23 cc)', 'Untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Bisa untuk keperluan hidrolik forklift, mesin bor dan kebutuhan lainnya', NULL, NULL, '/pompa_hidrolik/gear_pump_hgp_3a_23_cc/1.png', '/pompa_hidrolik/gear_pump_hgp_3a_23_cc/1.png', '/pompa_hidrolik/gear_pump_hgp_3a_23_cc/2.png', '/pompa_hidrolik/gear_pump_hgp_3a_23_cc/3.png', 21, '', '0', '2', '0', '1'),
(22, 'Pompa hidrolik merupakan untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Pompa hidrolik dengan type HGP-3A-25 (25 cc) memiliki as spie dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \r\n\r\nSpesifikasi Gear Pump Hydraulics : \r\nModel : HGP-3A-25 \r\nDisplacement : 25 L/min \r\nPressure (work) : 140 kgf/cm2 \r\nPressure (max) : 175 kgf/cm2 \r\nSpeed (rate) : 1800 rpm \r\nSpeed (max) : 3000 rpm \r\nSpeed (min) : 400 rpm \r\nPort Size : PT 1\" (Out) , PT 3/4\" (In) ', 2650000, 2650000, 1, '6 kg', 'Jaguar', NULL, 'HGP-3A-25', 'Untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Bisa untuk keperluan hidrolik forklift, mesin bor dan kebutuhan lainnya', NULL, NULL, '/pompa_hidrolik/gear_pump_hgp_3a_25_cc/1.png', '/pompa_hidrolik/gear_pump_hgp_3a_25_cc/1.png', '/pompa_hidrolik/gear_pump_hgp_3a_25_cc/2.png', '/pompa_hidrolik/gear_pump_hgp_3a_25_cc/3.png', 25, '', '0', '2', '0', '1'),
(23, 'Pompa hidrolik merupakan untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Pompa hidrolik dengan brand marzocchi type ALP2A-D25 (18 cc) memiliki as spie dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \r\nSpesifikasi Gear Pump Hydraulics : \r\nModel : ALP2A-D-25 \r\nDisplacement : 18 cm3/rev \r\nFlow pada 1500 rev/min : 25 liter/menit \r\nPressure (max) : P1 (210 bar), P2 (225 bar), P3 (240 bar) \r\nSpeed (max) : 2500 rpm \r\nDimensi : \r\nL : 56 mm \r\nM : 114.5 mm \r\nd : 7/8-14 UNF \r\nD : 1 1/16-12 UNF ', 3785000, 3785000, 1, '5 kg', NULL, '', 'ALP2A-25 (18 cc) \\n\r\nAs Spie \\n\r\nSingle pump \\n', 'Untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Bisa untuk keperluan hidrolik forklift, mesin bor dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 23, '', '0', '2', '1', '1'),
(24, 'Pompa hidrolik merupakan untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Pompa hidrolik dengan brand marzocchi type ALP2A-D30 (20 cc) memiliki as spie dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \rSpesifikasi Gear Pump Hydraulics : \rModel : ALP2A-D-30 \rDisplacement : 20 cm3/rev \rFlow pada 1500 rev/min : 30 liter/menit \rPressure (max) : P1 (180 bar), P2 (195 bar), P3 (210 bar) \rSpeed (max) : 2200 rpm \rDimensi : \rL : 58.5 mm \rM : 119.5 mm \rd : 7/8-14 UNF \rD : 1 1/16-12 UNF ', 3885000, 3885000, 1, '5 kg', 'Marzocchi', NULL, 'ALP2A-30 (20 cc) \\n\r\nAs Spie \\n\r\nSingle pump \\n', 'Untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Bisa untuk keperluan hidrolik forklift, mesin bor dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 24, '', '0', '2', '1', '1'),
(25, 'Pompa hidrolik merupakan untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Pompa hidrolik dengan brand marzocchi type ALP2A-D40 (28 cc) memiliki as spie dan kinerja yang bagus untuk pengganti ataupun penggunaan baru terhadap kebutuhanmu.  \rSpesifikasi Gear Pump Hydraulics : \rModel : ALP2A-D-40 \rDisplacement : 28 cm3/rev \rFlow pada 1500 rev/min : 40 liter/menit \rPressure (max) : P1 (170 bar), P2 (185 bar), P3 (200 bar) \rSpeed (max) : 1800 rpm \rDimensi : \rL : 64 mm  \rM : 130.5 mm \rd : 7/8-14 UNF \rD : 1 1/16-12 UNF ', 3985000, 3985000, 1, '8 kg', 'Marzocchi', NULL, 'ALP2A-40 (28 cc) \\n\r\nAs Spie \\n\r\nSingle pump \\n', 'Untuk mengubah energy gerak dari engine menjadi energy potensial didalam oli. Bisa untuk keperluan hidrolik forklift, mesin bor dan kebutuhan lainnya', NULL, NULL, NULL, '', '', '', 25, '', '0', '2', '1', '1'),
(26, 'Directional control valves berfungsi untuk mengontrol atau megatur arah gerakan aktuator dengan merubah arah aliran oli. Directional control valves atau handle control valves dengan type 1 bank ditent 40 liter ukuran 1/2? sangat cocok bagi kamu untuk pergantian maupun penggunaan baru.  \rSpesifikasi Directional Control Valves : \rNama Produk : Handle Control Valves Nucleo 1/2? 1 Bank Ditent 40 LPM \rJenis : Directional Control Valves \rStandard Spool Control : Ditent \rUkuran : 1/2 Inch \rRated flow (lpm) : 40 LPM \rMax press (bar) : 300 bar \rPort size : All 1/2 inch ', 1850000, 1850000, 1, '5 kg', 'Nucleo', NULL, 'Ditent \\n\r\nUkuran 1/2\" \\n\r\n1 Handle \\n\r\n40 liter (LPM) \\n', 'Ditent \\n\r\nUkuran 1/2\" \\n\r\n1 Handle \\n\r\n40 liter (LPM) \\n', NULL, NULL, NULL, '', '', '', 26, '', '0', '2', '1', '1'),
(27, 'Directional control valves berfungsi untuk mengontrol atau megatur arah gerakan aktuator dengan merubah arah aliran oli. Directional control valves atau handle control valves dengan type 1 bank ditent 80 liter ukuran 1/2? sangat cocok bagi kamu untuk pergantian maupun penggunaan baru.  \rSpesifikasi Directional Control Valves : \rNama Produk : Handle Control Valves Nucleo 1/2\" 1 Bank Ditent 80 LPM \rJenis : Directional Control Valves \rStandard Spool Control : Ditent \rUkuran : 1/2 Inch \rRated flow (lpm) : 80 LPM \rMax press (bar) : 300 bar \rPort size : All 1/2 inch ', 2250000, 2250000, 1, '6 kg', 'Nucleo', NULL, 'Ditent \\n\r\nUkuran 1/2\" \\n\r\n1 Handle \\n\r\n80 liter (LPM) \\n', 'Mengontrol atau mengatur arah gerakan aktuator dengan merubah arah aliran oli atau memutuskan aliran oli.', NULL, NULL, NULL, '', '', '', 27, '', '0', '2', '1', '1'),
(28, 'Directional control valves berfungsi untuk mengontrol atau megatur arah gerakan aktuator dengan merubah arah aliran oli. Directional control valves atau handle control valves dengan type 1 bank spring 40 liter ukuran 1/2? sangat cocok bagi kamu untuk pergantian maupun penggunaan baru.  \rSpesifikasi Directional Control Valves : \rNama Produk : Handle Control Valves Nucleo 1/2\" 1 Bank 40 LPM \rJenis : Directional Control Valves \rStandard Spool Control : Spring \rUkuran : 1/2 Inch \rRated flow (lpm) : 40 LPM \rMax press (bar) : 300 bar \rPort size : All 1/2 inch ', 1550000, 1550000, 1, '5 kg', 'Nucleo', NULL, 'Spring \\n\r\nUkuran 1/2\" \\n\r\n1 Handle \\n\r\n40 liter (LPM) \\n', 'Mengontrol atau mengatur arah gerakan aktuator dengan merubah arah aliran oli atau memutuskan aliran oli.', NULL, NULL, NULL, '', '', '', 28, '', '0', '2', '1', '1'),
(29, 'Directional control valves berfungsi untuk mengontrol atau megatur arah gerakan aktuator dengan merubah arah aliran oli. Directional control valves atau handle control valves dengan type 1 bank spring 80 liter ukuran 1/2\" sangat cocok bagi kamu untuk pergantian maupun penggunaan baru.  \rSpesifikasi Directional Control Valves : \rNama Produk : Handle Control Valves Nucleo 1/2\" 1 Bank Spring 80 LPM \rJenis : Directional Control Valves \rStandard Spool Control : Spring \rUkuran : 1/2 Inch \rRated flow (lpm) : 80 LPM \rMax press (bar) : 300 bar \rPort size : All 1/2 inch ', 1950000, 1950000, 1, '6 kg', 'Nucleo', NULL, 'Spring \\n\r\nUkuran 1/2\" \\n\r\n1 Handle \\n\r\n80 liter (LPM) \\n', 'Mengontrol atau mengatur arah gerakan aktuator dengan merubah arah aliran oli atau memutuskan aliran oli.', NULL, NULL, NULL, '', '', '', 29, '', '0', '2', '1', '1'),
(30, 'Relief valve hidrolik berfungsi untuk mengatur atau membatasi tekanan kerja maksimum pada sistem pengaman. Relief valve hidrolik dengan type VMP-03 (Ukuran 3/8\") sangat cocok digunakan untuk penggunaan hidrolik kamu agar lebih teratur, bisa diterapkan pada mesin bor, mesin pressure ataupun penggunaan lainnya.  \r\n\r\nSpesikasi Relief Valves Hydraulic : \r\nModel : VMP-03 \r\nPort : 3/8\" \r\nMax Flow : 45 lpm \r\nMax Pressure : 350 bar ', 1250000, 1250000, 1, '3 kg', 'Nucleo', NULL, 'VMP-03 (Relief Valve 3/8\")', 'Untuk mengatur atau membatasi tekanan kerja maksimum pada sistem pengaman. Jadi, ini sangat cocok digunakan untuk kebutuhan hidrolik agar lebih teratur bisa dipakai mesin bor, mesin pabrik, dan kegunaan lainnya', NULL, NULL, '/valve_hidrolik/relief_valve_3_8/1.png', '/valve_hidrolik/relief_valve_3_8/1.png', '/valve_hidrolik/relief_valve_3_8/2.png', '/valve_hidrolik/relief_valve_3_8/3.png', 30, '', '0', '2', '0', '1'),
(31, 'Relief valve hidrolik berfungsi untuk mengatur atau membatasi tekanan kerja maksimum pada sistem pengaman. Relief valve hidrolik dengan type VMP-04 (Ukuran 1/2\") sangat cocok digunakan untuk penggunaan hidrolik kamu agar lebih teratur, bisa diterapkan pada mesin bor, mesin pressure ataupun penggunaan lainnya.  \r\n\r\nSpesikasi Relief Valves Hydraulic : \r\nModel : VMP-04 \r\nPort : 1/2\" \r\nMax Flow : 70 lpm \r\nMax Pressure : 350 bar ', 1450000, 1450000, 1, '3 kg', 'Nucleo', NULL, 'VMP-04 (Relief Valve 1/2\")', 'Untuk mengatur atau membatasi tekanan kerja maksimum pada sistem pengaman. Jadi, ini sangat cocok digunakan untuk kebutuhan hidrolik agar lebih teratur bisa dipakai mesin bor, mesin pabrik, dan kegunaan lainnya', NULL, NULL, '/valve_hidrolik/relief_valve_1_2/1.png', '/valve_hidrolik/relief_valve_1_2/1.png', '/valve_hidrolik/relief_valve_1_2/2.png', '/valve_hidrolik/relief_valve_1_2/3.png', 31, '', '0', '2', '0', '1'),
(32, 'Relief valve hidrolik berfungsi untuk mengatur atau membatasi tekanan kerja maksimum pada sistem pengaman. Relief valve hidrolik dengan type VMP-05 (Ukuran 3/4\") sangat cocok digunakan untuk penggunaan hidrolik kamu agar lebih teratur, bisa diterapkan pada mesin bor, mesin pressure ataupun penggunaan lainnya.  \r\n\r\nSpesikasi Relief Valves Hydraulic : \r\nModel : VMP-05 \r\nPort : 3/4\" \r\nMax Flow : 120 lpm \r\nMax Pressure : 350 bar ', 1650000, 1650000, 1, '3 kg', 'Nucleo', NULL, 'VMP-05 (Relief Valve 3/4\")', 'Untuk mengatur atau membatasi tekanan kerja maksimum pada sistem pengaman. Jadi, ini sangat cocok digunakan untuk kebutuhan hidrolik agar lebih teratur bisa dipakai mesin bor, mesin pabrik, dan kegunaan lainnya', NULL, NULL, '/valve_hidrolik/relief_valve_3_4/1.png', '/valve_hidrolik/relief_valve_3_4/1.png', '/valve_hidrolik/relief_valve_3_4/2.png', '/valve_hidrolik/relief_valve_3_4/3.png', 32, '', '0', '2', '0', '1'),
(33, 'Kunci pipa ridgid dengan ukuran 24 inch ini, memiliki kualitas yang baik saat digunakan untuk pekerjaan yang membutuhkan kunci pipa lifetime dan kuat saat penggunaannya.  \r\n\r\nSpesifikasi Kunci Pipa Ridgid 24IN : \r\nNama Produk	: Heavy Duty – Kunci Pipa 24IN \r\nBrand	: Ridgid \r\nDimensi Unit	: 55 x 11 x 6 (cm) \r\nUkuran	: 24 Inch (600 mm) \r\nKapasitas Pipa	: 3 Inch (80 mm) \r\nMaterial	: Handle (Cast Iron), Jaw (Alloy Steel) \r\nBerat	: 6 Kg ', 2750000, 2750000, 1, '6 kg', 'Ridgid', NULL, 'Heavy Duty – Ukuran 24 Inch', 'Ready stok.\r\nBilamana stok tidak ready, indent selama 60 hari.', NULL, NULL, '/perkakas/kunci_pipa_ridgid_24/1.png', '/perkakas/kunci_pipa_ridgid_24/1.png', '/perkakas/kunci_pipa_ridgid_24/2.png', '/perkakas/kunci_pipa_ridgid_24/3.png', 33, '', '0', '2', '0', '1'),
(34, 'Kunci pipa ridgid dengan ukuran 36 inch ini, memiliki kualitas yang baik saat digunakan untuk pekerjaan yang membutuhkan kunci pipa lifetime dan kuat saat penggunaannya.  \r\n\r\nSpesifikasi Kunci Pipa Ridgid 36IN : \r\nNama Produk	: Heavy Duty – Kunci Pipa 36IN \r\nBrand	: Ridgid \r\nDimensi Unit	: 79 x 15 x 6 (cm) \r\nUkuran	: 36 Inch (900 mm) \r\nKapasitas Pipa	: 5 Inch (125 mm) \r\nMaterial	: Handle (Cast Iron), Jaw (Alloy Steel) \r\nBerat	: 10 Kg ', 3985000, 3985000, 1, '10 kg', 'Ridgid', NULL, 'Heavy Duty – Ukuran 36 Inch', 'Ready stok.\r\nBilamana stok tidak ready, indent selama 60 hari.', NULL, NULL, '/perkakas/kunci_pipa_ridgid_36/1.png', '/perkakas/kunci_pipa_ridgid_36/1.png', '/perkakas/kunci_pipa_ridgid_36/2.png', '/perkakas/kunci_pipa_ridgid_36/3.png', 34, '', '0', '2', '0', '1'),
(35, 'Kunci pipa ridgid dengan ukuran 18 inch ini, memiliki kualitas yang baik saat digunakan untuk pekerjaan yang membutuhkan kunci pipa lifetime dan kuat saat penggunaannya.  \r\n\r\nSpesifikasi Kunci Pipa Ridgid 18IN : \r\nNama Produk	: Heavy Duty – Kunci Pipa 18IN \r\nBrand	: Ridgid \r\nDimensi Unit	: 41 x 9 x 4 (cm) \r\nUkuran	: 18 Inch (450 mm) \r\nKapasitas Pipa	: 2 1/2 Inch (65 mm) \r\nMaterial	: Handle (Cast Iron), Jaw (Alloy Steel) \r\nBerat	: 4 Kg ', 1985000, 1985000, 1, '3.5 kg', 'Ridgid', NULL, 'Heavy Duty – Ukuran 18 Inch', 'Ready stok.\r\nBilamana stok tidak ready, indent selama 60 hari.', NULL, NULL, '/perkakas/kunci_pipa_ridgid_18/1.png', '/perkakas/kunci_pipa_ridgid_18/1.png', '/perkakas/kunci_pipa_ridgid_18/2.png', '/perkakas/kunci_pipa_ridgid_18/3.png', 35, '', '0', '2', '0', '1'),
(36, 'Bentonite dapat berfungsi untuk bidang pengeboran dalam menjaga stabilitas pada lubang sumur bor dan juga memberikan progress yang baik dalam proyek kamu. Yuk segera order dengan minimum order 1 ton (1000 kg), bila dalam kemasan 25 kg sebanyak 40 sak, harga yang ditampilkan dengan kemasan @25 kg/sak. Butuh informasi lebih lanjut bisa klik button nego harga produk.', 187500, 187500, 1, '25 kg', 'Lokal', NULL, NULL, NULL, NULL, '@25 kg / sak', '/suku_cadang_mesin/drilling_chemical_bentonite/1.png', '/suku_cadang_mesin/drilling_chemical_bentonite/1.png', '/suku_cadang_mesin/drilling_chemical_bentonite/2.png', '/suku_cadang_mesin/drilling_chemical_bentonite/3.png', 36, '', '0', '2', '0', '1'),
(37, 'Core box (core tray) berfungsi untuk tempat dari hasil sampel pengeboran, yang dimana dari sampel itu akan dicek di laboratorium, oleh karena itu dengan adanya barang ini, agar tertata dan mudah saat dilakukan pengecekan sampel tersebut. Adapun minimum order sebesar 150 pcs & dapat custom order dengan konfirmasi melalui klik button nego harga produk.  \r\n\r\nSpesifikasi Core Box (Core Tray) : \r\nNama Produk	: Core box (Core tray) \r\nType	: NQ, HQ, PQ \r\nBahan	: Galvalum \r\nKetebalan	: 0,5 mm \r\nBerat	: 2 Kg / Pcs \r\nMinimum Order	: 150 Pcs \r\nKeterangan	: Produksi indonesia. Penyelesaian barang tergantung dari permintaan order, untuk 150 pcs 1-2 hari & lebih dari itu dapat dikonfirmasikan kembali. ', 220000, 220000, 1, '2 kg', 'Lokal', NULL, NULL, 'Untuk tempat sampel pengeboran', NULL, 'NQ, HQ, PQ', '/suku_cadang_mesin/drilling_core_box/1.png', '/suku_cadang_mesin/drilling_core_box/1.png', '/suku_cadang_mesin/drilling_core_box/2.png', '/suku_cadang_mesin/drilling_core_box/3.png', 37, '', '0', '2', '0', '1'),
(38, 'Liquid Polymer adalah PHPA Liquid di gunakan untuk menstabilkan formasi shale dan clay agar tidak bereaksi, yang dimana biasa digunakan untuk kegiatan eksplorasi pengeboran.\r\n\r\nAdapun fungsinya diantaranya :\r\n\r\nMendinginkan, melicinkan dan mendukung matabor serta peralatan bor dalam lubang\r\nMengangkat cutting\r\nMengisi celah-celah dinding bor dari formasi batuan (seal permeable formations)\r\nMengontrol tekanan formasi\r\nMenjaga stabilitas dinding sumur\r\nMeminimalkan kerusakan formasi batuan\r\nMentransmisikan energi hidrolik kepada peralatan di dalam lubang sumur\r\nMedia pelaksanaan logging sumur (evaluasi sumur)\r\nMengontrol korosi (dalam batas-batas tertentu)\r\nMembantu proses penyelesaian sumur', 1450000, 1450000, 1, '27 kg', 'Lokal', NULL, NULL, NULL, NULL, NULL, '/suku_cadang_mesin/drilling_fluids_liquid_polymer/1.png', '/suku_cadang_mesin/drilling_fluids_liquid_polymer/1.png', '/suku_cadang_mesin/drilling_fluids_liquid_polymer/2.png', '/suku_cadang_mesin/drilling_fluids_liquid_polymer/3.png', 38, '', '0', '2', '0', '1'),
(39, 'Mesin rig bor dengan type 75 ini berfungsi untuk penggunaan pengeboran eksplorasi diantaranya bor batubara, bor nikel, bor sumur, bor ground anchor, bor soil test, bor gamping dan penggunaan lainnya. Dengan kemampuan sampai dengan 75 meter tergantung dari diameter lubang bor dan produksi lokal. Selain itu, dapat di custom sesuai dengan permintaan konsumen. Untuk info lebih lanjut, dapat klik button nego harga produk.  \r\n\r\nNama Produk	: Mesin Rig Bor Type 75 \r\nType	: Rig Bor Type 75 \r\nKemampuan	: 75 Meter \r\nDiesel Engine	: Dongfeng 16 Hp/1 Cylinder (Dapat Custom Sesuai Permintaan) \r\nKeterangan	: Produksi lokal \r\nStok	: Ready (Bila indent selama 14 hari kerja) \r\nBerat	: 550 Kg ', 95850000, 95850000, 1, '550 kg', 'Produksi lokal Indonesia', '75 Meter', NULL, 'Untuk kegiatan pengeboran eksplorasi baik bor batu bara, bor nikel, bor soil test, bor ground anchor, bor sumur, dan penggunaan lainnya', NULL, NULL, '/mesin_rig/jacro_tn_75/1.png', '/mesin_rig/jacro_tn_75/1.png', '/mesin_rig/jacro_tn_75/2.png', '/mesin_rig/jacro_tn_75/3.png', 39, '', '0', '2', '0', '1'),
(40, 'Mesin rig bor dengan type 175 ini berfungsi untuk penggunaan pengeboran eksplorasi diantaranya bor batubara, bor nikel, bor sumur, bor ground anchor, bor soil test, bor gamping dan penggunaan lainnya. Dengan kemampuan sampai dengan 175 meter tergantung dari diameter lubang bor dan produksi lokal. Selain itu, dapat di custom sesuai dengan permintaan konsumen. Untuk info lebih lanjut, dapat klik button nego harga produk.  \r\n\r\nNama Produk	: Mesin Rig Bor Type 175 \r\nType	: Rig Bor Type 175 \r\nKemampuan	: 175 Meter \r\nDiesel Engine	: Kubota D1105 24 Hp/3 Cylinder (Dapat Custom Sesuai Permintaan) \r\nKeterangan	: Produksi lokal \r\nStok	: Ready (Bila indent selama 14 hari kerja) \r\nBerat	: 750 Kg ', 195500000, 195500000, 1, '750 kg', '750 kg', 'AW (1 1/4\") : 175 meter, \r\nNQ (2 7/8\") : 150 meter,\r\nHQ (3 7/8\") : 50 meter', NULL, 'Untuk kegiatan pengeboran eksplorasi baik bor batu bara, bor nikel, bor soil test, bor ground anchor, bor sumur, dan penggunaan lainnya', NULL, NULL, '/mesin_rig/jacro_tn_175/1.png', '/mesin_rig/jacro_tn_175/1.png', '/mesin_rig/jacro_tn_175/2.png', '/mesin_rig/jacro_tn_175/3.png', 40, '', '0', '2', '0', '1'),
(41, 'Mesin rig bor dengan type 200 ini berfungsi untuk penggunaan pengeboran eksplorasi diantaranya bor batubara, bor nikel, bor sumur, bor ground anchor, bor soil test, bor gamping dan penggunaan lainnya. Dengan kemampuan sampai dengan 200 meter tergantung dari diameter lubang bor dan produksi lokal. Selain itu, dapat di custom sesuai dengan permintaan konsumen. Untuk info lebih lanjut, dapat klik button nego harga produk.  \r\n\r\nNama Produk	: Mesin Rig Bor Type 200 \r\nType	: Rig Bor Type 200 \r\nKemampuan	: 200 Meter \r\nDiesel Engine	: Kubota V1505 36 Hp/4 Cylinder (Dapat Custom Sesuai Permintaan) \r\nKeterangan	: Produksi lokal \r\nStok	: Ready (Bila indent selama 14 hari kerja) \r\nBerat	: 950 Kg ', 235750000, 235750000, 1, '950 kg', 'Produksi lokal Indonesia', NULL, 'NQ (2 7/8\") : 200 meter,\r\nHQ (3 7/8\") : 125 meter\r\nPQ (4 7/8\") : 50 meter', 'Untuk kegiatan pengeboran eksplorasi baik bor batu bara, bor nikel, bor soil test, bor ground anchor, bor sumur, dan penggunaan lainnya', NULL, NULL, '/mesin_rig/jacro_tn_200/1.png', '/mesin_rig/jacro_tn_200/1.png', '/mesin_rig/jacro_tn_200/2.png', '/mesin_rig/jacro_tn_200/3.png', 41, '', '0', '2', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id_image` int(16) NOT NULL,
  `image_url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `image_category` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `image_name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `gambar`
--

INSERT INTO `gambar` (`id_image`, `image_url`, `image_category`, `image_name`, `created_at`) VALUES
(1, '/banner/1.png', 'banner', 'banner1', NULL),
(2, '/banner/2.png', 'banner', 'banner2', NULL),
(3, '/banner/1.png', 'banner', 'banner3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(128) COLLATE latin1_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(128) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `gambar`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'Diesel Engine', 'Diesel_engine.jpg', '2020-07-21 00:00:00', '2020-07-21 00:00:00', 'alat'),
(2, 'Motor Hidrolik', 'Motor_hidrolik.jpg', '2020-07-21 00:00:00', '2020-07-21 00:00:00', 'alat'),
(3, 'Pompa Hidrolik', 'Pompa_hidrolik.jpg', '2020-07-21 00:00:00', '2020-07-21 00:00:00', 'alat'),
(4, 'Valve Hidrolik', 'Valve_hidrolik.jpg', '2020-07-21 00:00:00', '2020-07-21 00:00:00', 'alat'),
(5, 'Perkakas', 'Perkakas.jpg', '2020-07-21 00:00:00', '2020-07-21 00:00:00', 'alat'),
(6, 'Suku Cadang Mesin', 'Suku_Cadang_Mesin.jpg', '2020-07-21 00:00:00', '2020-07-21 00:00:00', 'alat'),
(7, 'Mesin Rig', 'Unit_Rig.jpg', '2020-07-21 00:00:00', '2020-07-21 00:00:00', 'alat');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `token` varchar(128) NOT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id` int(11) NOT NULL,
  `metode` varchar(255) NOT NULL,
  `id_bank` int(11) NOT NULL,
  `logo_rek` varchar(255) NOT NULL,
  `no_rek` varchar(255) NOT NULL,
  `nama_rek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id`, `metode`, `id_bank`, `logo_rek`, `no_rek`, `nama_rek`) VALUES
(1, 'Transfer Bank BCA', 1, '/icons/ic_bca.png', '6500370520', 'Tokowadah Nusantara CV'),
(2, 'Transfer Bank BNI', 2, '/icons/ic_bni.png', '0800649079', 'Tokowadah Nusantara CV');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(255) UNSIGNED NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` text COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mitra`
--

CREATE TABLE `mitra` (
  `id` int(11) NOT NULL,
  `uuid_mitra` varchar(128) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `token_mitra` varchar(128) NOT NULL,
  `status_akun` enum('0','1') DEFAULT NULL COMMENT '0=nonaktif, 1=aktif',
  `roles` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=mitra,1=admin',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mitra`
--

INSERT INTO `mitra` (`id`, `uuid_mitra`, `email`, `password`, `token_mitra`, `status_akun`, `roles`, `created_at`, `updated_at`) VALUES
(5, 'a27e6a70-aa5b-4cf5-974b-1088e05033f8', 'anggiedwikiannisa11@gmail.com', '$2y$10$Ec7.LCeRSB5JzL9Q10aC2uutLwOKbOR.CdCb4zZHqQDv0a/m8sBi.', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFuZ2dpZWR3aWtpYW5uaXNhMTFAZ21haWwuY29tYTI3ZTZhNzAtYWE1Yi00Y2Y1LTk3NGItMTA4OGUwNTAzM2Y4Ig.', '1', '0', '2019-08-15 10:28:22', '2019-08-15 10:28:22'),
(6, 'dbb3cedb-f4a9-4db3-aeed-32e0cb7d0ddf', 'admin@gmail.com', '$2y$10$MuS6KSxUKaI59EWMfOZvfuU0YDfOvFepnxoGJGqXzqls8PbBBQjYK', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkbWluQGdtYWlsLmNvbWRiYjNjZWRiLWY0YTktNGRiMy1hZWVkLTMyZTBjYjdkMGRkZiI.xzLEbfjo7edBRdLuPDJ', '1', '1', '2019-08-15 11:02:02', '2019-08-15 11:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `mitra_metadata`
--

CREATE TABLE `mitra_metadata` (
  `id` int(11) NOT NULL,
  `user_id_mitra` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname_pic` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname_pic` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '0=men,1=girls',
  `alamat_pic` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_hp_pic` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profil_pic` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `instagram` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mitra_metadata`
--

INSERT INTO `mitra_metadata` (`id`, `user_id_mitra`, `firstname_pic`, `lastname_pic`, `tgl_lahir`, `jk`, `alamat_pic`, `no_hp_pic`, `profil_pic`, `instagram`, `facebook`) VALUES
(4, 'a27e6a70-aa5b-4cf5-974b-1088e05033f8', 'Anggie Dwiki', 'Annisa', '1995-08-10', '1', 'The border spinner uses currentColor for its border-color, meaning you can customize the color', '08120191829', 'pp.jpeg', 'anggiedwikiannisa', 'anggiedwikiannisa'),
(5, 'dbb3cedb-f4a9-4db3-aeed-32e0cb7d0ddf', 'Admin', 'LTE', '2019-08-15', '0', 'admin', '081310191826', 'user.png', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id_track` int(11) NOT NULL,
  `id_trx` int(11) NOT NULL,
  `id_pengiriman` int(11) NOT NULL,
  `activity` text NOT NULL,
  `activity_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`id_track`, `id_trx`, `id_pengiriman`, `activity`, `activity_date`) VALUES
(1, 0, 1, 'Pesanan dibuat', '2020-10-02 08:00:00'),
(2, 0, 1, 'pesanan dikemas', '2020-10-02 08:20:00'),
(3, 0, 1, 'pesanan dikirim via JNE', '2020-10-02 09:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `id_trx` int(11) DEFAULT NULL,
  `id_metode_bayar` int(11) NOT NULL,
  `nominal_bayar` bigint(20) NOT NULL,
  `payment_created_date` datetime DEFAULT NULL,
  `payment_updated_date` datetime NOT NULL,
  `bukti_bayar` varchar(128) DEFAULT NULL,
  `status_bayar` enum('0','1') NOT NULL COMMENT '0=belum bayar, 1=sudahbayar',
  `nama_pengirim` varchar(255) NOT NULL,
  `id_bank_bayar` int(11) NOT NULL,
  `no_rek_bayar` int(11) NOT NULL,
  `no_invoice` varchar(100) NOT NULL,
  `file_invoice` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `nama_pengirim` varchar(255) NOT NULL,
  `no_resi` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `durasi` int(11) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`id_pengiriman`, `nama_pengirim`, `no_resi`, `ongkir`, `durasi`, `gambar`) VALUES
(1, 'JNE', '1122334455667788', 0, 3, '/icons/ic_jne.png');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan`
--

CREATE TABLE `permintaan` (
  `id` int(11) NOT NULL,
  `namalengkap` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_handphone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama_produk` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jml_produk` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `harga_pengiriman` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT NULL,
  `gambar1` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gambar2` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gambar3` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gambar4` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permintaan`
--

INSERT INTO `permintaan` (`id`, `namalengkap`, `email`, `alamat`, `no_handphone`, `nama_produk`, `jml_produk`, `budget`, `harga_pengiriman`, `gambar1`, `gambar2`, `gambar3`, `gambar4`, `created_at`) VALUES
(12, 'adi', 'ady.chandra94@gmail.com', 'kebun jeruk', '081310191817', 'batu cinta', '0', 5000, '0', 'pp.jpeg', 'photo-1554136310-2464e64fd97f.jpeg', 'user.png', '1', '2019-08-15 12:14:30'),
(13, 'Rigel Rawawa', 'rigel.direktori@gmail.com', 'MNC PLAY, Tanjung Sari, Medan City, North Sumatra, Indonesia', '081310191822', 'engine', '1', 12000000, '1', 'pp1.jpeg', 'user1.png', '', '', '2019-08-15 12:25:09'),
(14, 'rigel pawallo', 'rigel.direktori@gmail.com', 'jl.pesona anggrek blok f6 no.9', '081288534991', 'Wrench Ridgid 18 Inch', '2 pcs', 1850000, '0', '1.jpg', '2.jpg', '', '', '2019-08-15 12:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_trx` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `id_voucher_trx` int(11) DEFAULT NULL,
  `id_pengiriman` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` bigint(20) NOT NULL,
  `total_harga_before` bigint(20) NOT NULL,
  `total_diskon` bigint(20) DEFAULT NULL,
  `trx_created_date` datetime NOT NULL,
  `trx_updated_date` datetime DEFAULT NULL,
  `status` enum('0','1','2','3','4','5','6') NOT NULL COMMENT '0=belum bayar,1=sudah pilih pembayaran,2=sudah bayar,3=pesanan dikemas, 4=pesanan dikirm, 5=pesanan telah sampai, 6=selesai'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `user_id_mitra` varchar(128) COLLATE latin1_general_ci NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '0=not approve; 1 approve',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `user_id_mitra`, `nama_produk`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '', 'Diesel Engine Kubota D722', '1', '2020-07-21 00:01:00', NULL),
(2, '1', '', 'Diesel Engine Kubota D905', '1', '0000-00-00 00:00:00', NULL),
(3, '1', '', 'Diesel Engine Kubota V1505', '1', '0000-00-00 00:00:00', NULL),
(4, '1', '', 'Diesel Engine Kubota V2203', '1', '2020-07-21 00:02:00', NULL),
(5, '1', '', 'Diesel Engine Kubota V3300', '1', '0000-00-00 00:00:00', NULL),
(6, '1', '', 'Diesel Engine Kubota Z482', '1', '0000-00-00 00:00:00', NULL),
(7, '1', '', 'Diesel Engine Loncin 2 Cylinder / 22 Hp', '1', '2020-07-23 00:00:00', NULL),
(8, '1', '', 'Diesel Engine Loncin G 160 + Concrete Vibrator', '1', '0000-00-00 00:00:00', NULL),
(9, '1', '', 'Diesel Engine Loncin LC80WB30-4.5Q', '1', '0000-00-00 00:00:00', NULL),
(10, '1', '', 'Diesel Engine Tropic R 175 / 7 Hp', '1', '0000-00-00 00:00:00', NULL),
(11, '1', '', 'Diesel Engine Yanmar TF 155 R', '1', '0000-00-00 00:00:00', NULL),
(12, '1', '', 'Diesel Engine Yanmar TF 65 R', '1', '0000-00-00 00:00:00', NULL),
(13, '1', '', 'Diesel Engine Yanmar TF 85 R', '1', '0000-00-00 00:00:00', NULL),
(14, '2', '', 'Motor Hidrolik Nucleo 100 CC', '1', '0000-00-00 00:00:00', NULL),
(15, '2', '', 'Motor Hidrolik Nucleo 125 CC', '1', '0000-00-00 00:00:00', NULL),
(16, '2', '', 'Motor Hidrolik Nucleo 160 CC', '1', '2020-07-21 00:00:00', NULL),
(17, '2', '', 'Motor Hidrolik Nucleo Body Kotak 100 CC', '1', '2020-07-22 00:00:00', NULL),
(18, '2', '', 'Motor Hidrolik Nucleo Body Kotak 130 CC', '1', '2020-07-23 00:00:00', NULL),
(19, '2', '', 'Motor Hidrolik Nucleo Body Kotak 245 CC', '1', '0000-00-00 00:00:00', NULL),
(20, '3', '', 'Pompa Hidrolik Jaguar 19 CC', '1', '2020-07-20 00:00:00', NULL),
(21, '3', '', 'Pompa Hidrolik Jaguar 23 CC', '1', '2020-07-22 00:00:00', NULL),
(22, '3', '', 'Pompa Hidrolik Jaguar 25 CC', '1', '2020-07-23 00:00:00', NULL),
(23, '3', '', 'Pompa Hidrolik Marzocchi 18 CC', '1', '0000-00-00 00:00:00', NULL),
(24, '3', '', 'Pompa Hidrolik Marzocchi 20 CC', '1', '0000-00-00 00:00:00', NULL),
(25, '3', '', 'Pompa Hidrolik Marzocchi 28 CC', '1', '0000-00-00 00:00:00', NULL),
(26, '4', '', 'Handle Control Valves Nucleo 1/2\" 1 Bank Ditent 40 LPM', '1', '0000-00-00 00:00:00', NULL),
(27, '4', '', 'Handle Control Valves Nucleo 1/2\" 1 Bank Ditent 80 LPM', '1', '0000-00-00 00:00:00', NULL),
(28, '4', '', 'Handle Control Valves Nucleo 1/2\" 1 Bank Spring 40 LPM', '1', '0000-00-00 00:00:00', NULL),
(29, '4', '', 'Handle Control Valves Nucleo 1/2\" 1 Bank Spring 80 LPM', '1', '0000-00-00 00:00:00', NULL),
(30, '4', '', 'Relief Valve Hidrolik VMP-03', '1', '0000-00-00 00:00:00', NULL),
(31, '4', '', 'Relief Valve Hidrolik VMP-04', '1', '0000-00-00 00:00:00', NULL),
(32, '4', '', 'Relief Valve Hidrolik VMP-05', '1', '0000-00-00 00:00:00', NULL),
(33, '5', '', 'Kunci Pipa Ridgid 24IN', '1', '0000-00-00 00:00:00', NULL),
(34, '5', '', 'Kunci Pipa Ridgid 36IN', '1', '0000-00-00 00:00:00', NULL),
(35, '5', '', 'Kunci Pipa Ridgid 18IN', '1', '0000-00-00 00:00:00', NULL),
(36, '6', '', 'Sparepart Bor Chemical Bentonite', '1', '0000-00-00 00:00:00', NULL),
(37, '6', '', 'Sparepart Bor Core Box Galvalum', '1', '0000-00-00 00:00:00', NULL),
(38, '6', '', 'Sparepart Bor Chemical Liquid Polymer', '1', '0000-00-00 00:00:00', NULL),
(39, '7', '', 'Mesin Rig Bor Type 75', '1', '0000-00-00 00:00:00', NULL),
(40, '7', '', 'Mesin Rig Bor Type 175', '1', '0000-00-00 00:00:00', NULL),
(41, '7', '', 'Mesin Rig Bor Type 200', '1', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistik`
--

CREATE TABLE `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1,
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `email` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `created_at`) VALUES
(6, 'admin', '2019-06-05 01:03:54'),
(5, 'admin', '2019-06-05 01:00:53'),
(4, 'adichan', '2019-05-29 07:50:27'),
(7, 'admin', '2019-06-05 01:05:36'),
(8, 'admin', '2019-06-05 01:06:18'),
(9, 'admin', '2019-06-05 01:34:16'),
(10, 'admin', '2019-06-05 01:35:38'),
(11, 'admin', '2019-06-05 01:35:41'),
(12, 'd@klo.com', '2019-06-05 01:37:26'),
(13, 'ady.chandra94@gmail.com', '2019-06-05 01:37:48'),
(14, 'add@mail.com', '2019-06-13 12:14:27'),
(15, 'ady.chandra94@gmail.com', '2019-07-03 01:57:15'),
(16, 'igetspot.com', '2019-07-03 01:57:48'),
(17, 'chadnay@gmail.com', '2019-10-21 08:17:11'),
(18, 'kjmsb@msn.com', '2019-10-26 11:07:16'),
(19, 'robtoir@gmail.com', '2019-10-26 08:30:44'),
(20, 'annegrete.frigstad@nordiccollections.no', '2019-10-27 01:14:14'),
(21, 'randyldudley@att.net', '2019-11-07 02:04:16'),
(22, 'bdubya_24@yahoo.com', '2019-11-08 03:07:58'),
(23, 'daryl.tunno@us.belfor.com', '2019-11-08 04:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id_testimonial` int(16) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `pesan` varchar(128) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id` int(11) NOT NULL,
  `user_id_mitra` varchar(128) DEFAULT NULL,
  `nama_toko` varchar(32) DEFAULT NULL,
  `alamat_toko` text DEFAULT NULL,
  `no_telp_toko` varchar(16) DEFAULT NULL,
  `logo_toko` varchar(128) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `bidang_usaha` text DEFAULT NULL,
  `gambar_toko` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(128) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `email`, `password`, `access_token`, `created_at`, `updated_at`) VALUES
(11, '0c372cdd-c426-4a79-901a-e3bb9ffbba4e', 'ady.chandra94@gmail.com', '2b9a9b0515d25a6636cddc57f5472d9a', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkeS5jaGFuZHJhOTRAZ21haWwuY29tMGMzNzJjZGQtYzQyNi00YTc5LTkwMWEtZTNiYjlmZmJiYTRlIg.CGQ-MOE4', '2019-05-28 11:19:19', '2019-08-19 08:56:09'),
(12, '49fc105f-e5c0-45c7-929f-f5b2e3a9a18b', 'anggiedwikiannisa11@gmail.com', '$2y$10$zfnkgAM2ddu2yfJTdkaWa.Lev/XKjCipwQznuI8BYXIg8vLlbB2DC', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFuZ2dpZWR3aWtpYW5uaXNhMTFAZ21haWwuY29tNDlmYzEwNWYtZTVjMC00NWM3LTkyOWYtZjViMmUzYTlhMThiIg.', '2019-05-28 11:23:21', '2019-06-25 02:44:45'),
(13, 'fc891315-ddd7-42a4-b16b-4448599dc755', 'morningtea@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', '2019-05-28 11:25:20', '2019-05-28 11:25:20'),
(14, '202fb57a-254f-4c89-b711-84c059c6f847', 'naning@mail.com', '$2y$10$OybCzcC0C4RpnjMYeByUQORjVeTE9FHtEXgJ5ZXHToSSwVCFlTqES', '', '2019-06-12 11:35:31', '2019-06-12 11:35:31'),
(15, '91c375a6-34c9-42a7-9adb-4d61f6b67232', 'rigel.direktori@gmail.com', '2b9a9b0515d25a6636cddc57f5472d9a', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.InJpZ2VsLmRpcmVrdG9yaUBnbWFpbC5jb205MWMzNzVhNi0zNGM5LTQyYTctOWFkYi00ZDYxZjZiNjcyMzIi.Ch_FQK', '2019-06-15 12:59:43', '2019-11-11 02:46:52'),
(16, '59c85553-045c-43ae-9ee4-6850c5e2fa76', 'kimoraaddrena@gmail.com', '$2y$10$8iv8.MRHwW0T5oPQpNlpJe/9Tod6jjNKhSzEoajQYTL3EYGe2M0zy', '', '2019-06-24 12:12:18', '2019-06-24 12:12:18'),
(17, '1122334455', 'nightcake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 14:07:28', '0000-00-00 00:00:00'),
(18, '78db8c8f-48cb-4376-a060-4bc03477240c', 'aku@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 14:28:25', '0000-00-00 00:00:00'),
(19, 'a868bcb0-e316-4c1a-badf-c9571c779050', '1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 14:31:11', '0000-00-00 00:00:00'),
(20, 'ac5a0823-1511-49ec-a2dd-3680e5d4341e', '1234@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 14:44:03', '0000-00-00 00:00:00'),
(21, 'bfb41f6f-20e1-4718-9267-74205d210d70', 'coba@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 15:15:58', '0000-00-00 00:00:00'),
(22, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 15:54:42', '0000-00-00 00:00:00'),
(23, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 15:56:55', '0000-00-00 00:00:00'),
(24, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 15:58:32', '0000-00-00 00:00:00'),
(25, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 15:59:47', '0000-00-00 00:00:00'),
(26, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:00:45', '0000-00-00 00:00:00'),
(27, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:01:32', '0000-00-00 00:00:00'),
(28, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:02:33', '0000-00-00 00:00:00'),
(29, '1122334455', 'cake@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:16:28', '0000-00-00 00:00:00'),
(30, '8dc6d295-813a-4ba1-aed3-01aa88fdee4e', 'sore@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:20:00', '0000-00-00 00:00:00'),
(31, '8dc6d295-813a-4ba1-aed3-01aa88fdee4e', 'sore@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:20:05', '0000-00-00 00:00:00'),
(32, 'baf07f47-6498-4d1f-a9e4-8387f57f71e0', 'dua@dua.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:29:11', '0000-00-00 00:00:00'),
(33, 'baf07f47-6498-4d1f-a9e4-8387f57f71e0', 'dua@dua.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:29:14', '0000-00-00 00:00:00'),
(34, '27ce2869-b0c9-4c30-9afc-8de37f2678f8', 'tiga@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:34:34', '0000-00-00 00:00:00'),
(35, '27ce2869-b0c9-4c30-9afc-8de37f2678f8', 'tiga@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:34:37', '0000-00-00 00:00:00'),
(36, 'd5103be5-a939-4435-bfac-a854d49b5c28', 'empat@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:36:52', '0000-00-00 00:00:00'),
(37, 'd5103be5-a939-4435-bfac-a854d49b5c28', 'empat@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:36:55', '0000-00-00 00:00:00'),
(38, '3d6d58fd-a864-4682-9edc-2a311cd5d650', 'empat@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:38:34', '0000-00-00 00:00:00'),
(39, '3d6d58fd-a864-4682-9edc-2a311cd5d650', 'empat@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 16:38:35', '0000-00-00 00:00:00'),
(40, '8fb7cf60-27b6-4a23-96e4-d797a1e41229', 'malam@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 19:21:53', '0000-00-00 00:00:00'),
(41, '35acc70f-a685-40e2-a045-be41bbde2acf', 'malam2@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-02 19:35:43', '0000-00-00 00:00:00'),
(42, '5ad42ab4-6aab-4d66-b056-211c2f46027b', 'rigel@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-04 22:31:53', '0000-00-00 00:00:00'),
(43, '5ad42ab4-6aab-4d66-b056-211c2f46027b', 'rigel@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '2020-10-04 22:31:55', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_metadata`
--

CREATE TABLE `users_metadata` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `image_bg` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_metadata`
--

INSERT INTO `users_metadata` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `address`, `image`, `image_bg`) VALUES
(13, '0c372cdd-c426-4a79-901a-e3bb9ffbba4e', 'Morning', 'Coffee', '081310191826', 'Citra raya perum dwipa bali blok A3 no 53 Cikupa Kab Tangerang', 'invoker.png', ''),
(16, '202fb57a-254f-4c89-b711-84c059c6f847', 'naning', 'sulistyowati', '081310191826', 'undefined', 'TsubasaJUS.png', ''),
(14, '49fc105f-e5c0-45c7-929f-f5b2e3a9a18b', 'adi chandra', 'setiawan', '081310191826', 'kadsadsadsa', 'Screen.png', ''),
(15, 'fc891315-ddd7-42a4-b16b-4448599dc755', 'Morning', 'Tea', '081310191826', 'kadsadsadsa', 'TsubasaJUS.png', 'banner.png'),
(17, '91c375a6-34c9-42a7-9adb-4d61f6b67232', 'rigel', 'pawallo', '081296591638', 'undefined', '99mm_pdc_bit.jpg', ''),
(18, '59c85553-045c-43ae-9ee4-6850c5e2fa76', 'kimora Adrena', 'Saila', '081310191826', 'undefined', 'avatar_aang.jpg', ''),
(19, '1122334455', 'Night Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(20, '78db8c8f-48cb-4376-a060-4bc03477240c', 'aku', NULL, '082216998002', 'babakan sukaasih', NULL, ''),
(21, 'a868bcb0-e316-4c1a-badf-c9571c779050', '123', NULL, '1', '1', NULL, ''),
(22, 'ac5a0823-1511-49ec-a2dd-3680e5d4341e', '1234', NULL, '', '', NULL, ''),
(23, 'bfb41f6f-20e1-4718-9267-74205d210d70', 'coba', NULL, '', '', NULL, ''),
(24, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(25, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(26, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(27, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(28, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(29, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(30, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(31, '1122334455', 'Cake', NULL, '', 'Babakan Sukawargi', '1122334455.jpeg', 'profile_bg.png'),
(32, '8dc6d295-813a-4ba1-aed3-01aa88fdee4e', 'sore', NULL, '', '', '8dc6d295-813a-4ba1-aed3-01aa88fdee4e.png', 'profile_bg.png'),
(33, '8dc6d295-813a-4ba1-aed3-01aa88fdee4e', 'sore', NULL, '', '', '8dc6d295-813a-4ba1-aed3-01aa88fdee4e.png', 'profile_bg.png'),
(34, 'baf07f47-6498-4d1f-a9e4-8387f57f71e0', 'dua', NULL, '', '', NULL, ''),
(35, 'baf07f47-6498-4d1f-a9e4-8387f57f71e0', 'dua', NULL, '', '', NULL, ''),
(36, '27ce2869-b0c9-4c30-9afc-8de37f2678f8', 'tiga', NULL, '', '', NULL, ''),
(37, '27ce2869-b0c9-4c30-9afc-8de37f2678f8', 'tiga', NULL, '', '', NULL, ''),
(38, 'd5103be5-a939-4435-bfac-a854d49b5c28', 'empat', NULL, '', '', 'd5103be5a9394435bfaca854d49b5c28.png', 'profile_bg.png'),
(39, 'd5103be5-a939-4435-bfac-a854d49b5c28', 'empat', NULL, '', '', 'd5103be5a9394435bfaca854d49b5c28.png', 'profile_bg.png'),
(40, '3d6d58fd-a864-4682-9edc-2a311cd5d650', 'empat', NULL, '', '', '3d6d58fda86446829edc2a311cd5d650.png', 'profile_bg.png'),
(41, '3d6d58fd-a864-4682-9edc-2a311cd5d650', 'empat', NULL, '', '', '3d6d58fda86446829edc2a311cd5d650.png', 'profile_bg.png'),
(42, '8fb7cf60-27b6-4a23-96e4-d797a1e41229', 'Malam Malam', NULL, '081234567890', 'Babakan Sukasuka', 'profile_8fb7cf6027b64a2396e4d797a1e41229.png', 'profile_bg_8fb7cf6027b64a2396e4d797a1e41229.png'),
(43, '35acc70f-a685-40e2-a045-be41bbde2acf', 'malam2', NULL, '', '', 'profile.png', 'profile_bg.jpg'),
(44, '5ad42ab4-6aab-4d66-b056-211c2f46027b', 'Rigel', NULL, '081122334455', 'Planet Bekasi Utara 123446', 'profile_5ad42ab46aab4d66b056211c2f46027b.png', 'profile_bg_5ad42ab46aab4d66b056211c2f46027b.png'),
(45, '5ad42ab4-6aab-4d66-b056-211c2f46027b', 'Rigel', NULL, '081122334455', 'Planet Bekasi Utara 123446', 'profile_5ad42ab46aab4d66b056211c2f46027b.png', 'profile_bg_5ad42ab46aab4d66b056211c2f46027b.png');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` int(11) NOT NULL,
  `jenis_voucher` enum('1','2') NOT NULL COMMENT '1=nominal, 2=persentase',
  `nama_voucher` varchar(255) NOT NULL,
  `persentase` float DEFAULT NULL,
  `nominal` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id_voucher`, `jenis_voucher`, `nama_voucher`, `persentase`, `nominal`, `created_at`, `updated_at`) VALUES
(1, '1', 'SATU', 0, 500000, '2020-08-09 22:44:22', NULL),
(2, '2', 'DUA', 0.1, 0, '2020-08-09 22:44:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_trx`
--

CREATE TABLE `voucher_trx` (
  `id_voucher_trx` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `id_voucher` int(11) NOT NULL,
  `trx_created_date` datetime NOT NULL,
  `trx_updated_date` datetime NOT NULL,
  `status` enum('0','1') NOT NULL COMMENT '0=belum digunakan, 1=sudah digunakan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_trx`
--

INSERT INTO `voucher_trx` (`id_voucher_trx`, `user_id`, `id_voucher`, `trx_created_date`, `trx_updated_date`, `status`) VALUES
(1, '5ad42ab4-6aab-4d66-b056-211c2f46027b', 1, '2020-08-30 00:00:00', '2020-10-04 22:39:20', '1'),
(2, '5ad42ab4-6aab-4d66-b056-211c2f46027b', 2, '2020-08-30 00:00:00', '2020-08-30 18:25:25', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `total` int(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `id_produk`, `jml`, `harga`, `total`, `created_at`) VALUES
(3, '0c372cdd-c426-4a79-901a-e3bb9ffbba4e', 75, 1, 14550000, 14550000, '2019-07-03 01:55:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`id_datauser`);

--
-- Indexes for table `detailproduk`
--
ALTER TABLE `detailproduk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id_image`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitra`
--
ALTER TABLE `mitra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitra_metadata`
--
ALTER TABLE `mitra_metadata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id_track`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indexes for table `permintaan`
--
ALTER TABLE `permintaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_trx`,`id_cart`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id_testimonial`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_metadata`
--
ALTER TABLE `users_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- Indexes for table `voucher_trx`
--
ALTER TABLE `voucher_trx`
  ADD PRIMARY KEY (`id_voucher_trx`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `datauser`
--
ALTER TABLE `datauser`
  MODIFY `id_datauser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detailproduk`
--
ALTER TABLE `detailproduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id_image` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mitra`
--
ALTER TABLE `mitra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mitra_metadata`
--
ALTER TABLE `mitra_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id_track` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permintaan`
--
ALTER TABLE `permintaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users_metadata`
--
ALTER TABLE `users_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `voucher_trx`
--
ALTER TABLE `voucher_trx`
  MODIFY `id_voucher_trx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
