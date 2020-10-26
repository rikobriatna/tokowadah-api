-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2020 at 04:34 PM
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
-- Table structure for table `chart`
--

CREATE TABLE `chart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `total` int(12) NOT NULL,
  `pengiriman` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
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
-- Table structure for table `detailproduct`
--

CREATE TABLE `detailproduct` (
  `id` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` int(30) DEFAULT NULL,
  `stok` varchar(64) DEFAULT NULL,
  `berat` varchar(32) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id_image` int(16) NOT NULL,
  `image_url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `image_name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `gambar` varchar(128) DEFAULT NULL
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
  `status` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '0=not approve; 1 approve'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
  `address` varchar(128) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `chart`
--
ALTER TABLE `chart`
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
-- Indexes for table `detailproduct`
--
ALTER TABLE `detailproduct`
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
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan`
--
ALTER TABLE `permintaan`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chart`
--
ALTER TABLE `chart`
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
-- AUTO_INCREMENT for table `detailproduct`
--
ALTER TABLE `detailproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id_image` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mitra`
--
ALTER TABLE `mitra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mitra_metadata`
--
ALTER TABLE `mitra_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permintaan`
--
ALTER TABLE `permintaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_metadata`
--
ALTER TABLE `users_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
