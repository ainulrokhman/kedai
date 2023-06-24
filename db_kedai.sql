-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2023 at 09:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kedai`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `jabatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_pegawai`, `nama`, `email`, `alamat`, `password`, `telepon`, `jenis_kelamin`, `jabatan`) VALUES
(3, 'Bos Admin', 'admin@gmail.com', 'Jl. Anggrek 51 Malang', '0192023a7bbd73250516f069df18b500', '0851248238', 'Pria', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_metode_pembayaran` int(11) DEFAULT NULL,
  `id_meja` int(11) NOT NULL,
  `no_invoice` varchar(17) NOT NULL,
  `nama_pemesan` varchar(250) NOT NULL,
  `nomor_hp` varchar(250) NOT NULL,
  `tanggal_pesan` datetime NOT NULL,
  `tanggal_reservasi` date NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `total_sudah_dibayar` int(11) NOT NULL,
  `batas_pembayaran_dp` datetime NOT NULL,
  `status_pembayaran` varchar(250) NOT NULL,
  `bukti_pembayaran` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `id_pegawai`, `id_metode_pembayaran`, `id_meja`, `no_invoice`, `nama_pemesan`, `nomor_hp`, `tanggal_pesan`, `tanggal_reservasi`, `total_pembayaran`, `total_sudah_dibayar`, `batas_pembayaran_dp`, `status_pembayaran`, `bukti_pembayaran`) VALUES
(1, NULL, 7, 1, 'INV20230624232221', 'Mela Nurul Afwa', '0', '2023-06-24 23:22:21', '2023-06-24', 30000, 30000, '2023-06-25 23:22:21', 'Pesanan Selesai', '24062023182247ayambakar.jpg'),
(2, 3, 1, 3, 'INV20230625020701', 'Mela Nurul Afwa', '0', '2023-06-25 02:07:01', '2023-06-25', 30000, 30000, '2023-06-26 02:07:01', 'Pesanan Selesai', 'Kosong');

-- --------------------------------------------------------

--
-- Table structure for table `gambar_menu`
--

CREATE TABLE `gambar_menu` (
  `id_gambar` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `gambar` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gambar_menu`
--

INSERT INTO `gambar_menu` (`id_gambar`, `id_menu`, `gambar`) VALUES
(1, 1, '20052023183208WhatsAppImage2023-05-20at22.03.12.jpg'),
(3, 2, '20052023185823765b3b4f-f40c-4308-b3ba-c66c87114d50.jpg'),
(4, 3, '20052023190034fce60d15-4220-40f7-96c9-4c9fc94dadfd.jpg'),
(5, 4, '20052023190218sosis.jpg'),
(6, 5, '20052023190349miejawaspesial15.jpg'),
(7, 6, '20052023190551ayamgorengserundeng.jpg'),
(8, 7, '20052023190741ayambakar.jpg'),
(16, 8, '22052023063908KentangGoreng.jpg'),
(17, 14, '22052023063946capucinno.jpg'),
(18, 13, '22052023064008cofeemix.jpg'),
(19, 10, '22052023064031EsJeruk.jpg'),
(20, 9, '22052023064050EsTeh.jpg'),
(21, 12, '22052023064112KapalApi.jpg'),
(22, 11, '22052023064134LemonTea.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `id_meja` int(11) NOT NULL,
  `nomor_meja` varchar(50) NOT NULL,
  `kapasitas_meja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id_meja`, `nomor_meja`, `kapasitas_meja`) VALUES
(1, '1', 2),
(3, '5', 2),
(4, '3', 2),
(5, '2', 2),
(6, '4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `detail_menu` text NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `stok` varchar(50) NOT NULL DEFAULT 'Tersedia',
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `detail_menu`, `kategori`, `stok`, `harga`) VALUES
(1, 'Sapi Lada Hitam', 'Hidangan Utama', 'Makanan', 'Tersedia', 20000),
(2, 'Roti Bakar', 'Camilan', 'Makanan', 'Tersedia', 10000),
(3, 'Burger Meosi', 'Camilan', 'Makanan', 'Tersedia', 11000),
(4, 'Sosis', 'Camilan', 'Makanan', 'Tersedia', 10000),
(5, 'Mie Jawa Spesial', 'Hidangan Utama', 'Makanan', 'Tersedia', 15000),
(6, 'Ayam Goreng Srundeng', 'Hidangan Utama', 'Makanan', 'Tersedia', 15000),
(7, 'Ayam Bakar', 'Hidangan Utama', 'Makanan', 'Tersedia', 15000),
(8, 'Kentang Goreng', 'Camilan', 'Makanan', 'Tersedia', 10000),
(9, 'Es Teh', 'Minuman', 'Minuman', 'Tersedia', 4000),
(10, 'Es Jeruk', 'Minuman', 'Minuman', 'Tersedia', 6000),
(11, 'Lemon Tea', 'Minuman', 'Minuman', 'Tersedia', 7000),
(12, 'Kopi Kapal Api', 'Minuman', 'Minuman', 'Tersedia', 3000),
(13, 'Coffee Mix', 'Minuman', 'Minuman', 'Tersedia', 3000),
(14, 'Coffe Capuccino', 'Minuman', 'Minuman', 'Tersedia', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `menu_dibooking`
--

CREATE TABLE `menu_dibooking` (
  `id` int(11) NOT NULL,
  `no_invoice` varchar(17) NOT NULL,
  `nama_makanan` varchar(250) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `sub_total` int(12) NOT NULL,
  `status_order` varchar(255) NOT NULL DEFAULT 'success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_dibooking`
--

INSERT INTO `menu_dibooking` (`id`, `no_invoice`, `nama_makanan`, `jumlah`, `sub_total`, `status_order`) VALUES
(1, 'INV20230624232221', 'Sapi Lada Hitam', 1, 20000, 'success'),
(2, 'INV20230624232221', 'Roti Bakar', 1, 10000, 'success'),
(3, 'INV20230624232221', 'Roti Bakar', 1, 10000, 'success'),
(4, 'INV20230625020701', 'Ayam Goreng Srundeng', 1, 15000, 'success'),
(5, 'INV20230625020701', 'Mie Jawa Spesial', 1, 15000, 'success');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id` int(11) NOT NULL,
  `nama_merchant` varchar(250) NOT NULL,
  `atas_nama` varchar(250) NOT NULL,
  `kode_pembayaran` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id`, `nama_merchant`, `atas_nama`, `kode_pembayaran`) VALUES
(1, 'Dana', 'Budi S', '085212349852'),
(2, 'Bank BCA', 'Budi Sudiman', '8952317234'),
(4, 'LinkAja', 'Siti Nurjanah', '082398521045'),
(5, 'GoPay', 'Budi Sudirman', '085912394855'),
(7, 'Cash', 'Kedai Meosi', '-');

-- --------------------------------------------------------

--
-- Table structure for table `profil_usaha`
--

CREATE TABLE `profil_usaha` (
  `id` int(12) NOT NULL,
  `nama_usaha` varchar(250) NOT NULL,
  `deskripsi` text NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `nomor_telepon` varchar(17) NOT NULL,
  `email` varchar(100) NOT NULL,
  `instagram` varchar(50) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `maps_link` text NOT NULL,
  `foto_usaha_1` text NOT NULL,
  `foto_usaha_2` text NOT NULL,
  `foto_usaha_3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profil_usaha`
--

INSERT INTO `profil_usaha` (`id`, `nama_usaha`, `deskripsi`, `alamat`, `nomor_telepon`, `email`, `instagram`, `whatsapp`, `maps_link`, `foto_usaha_1`, `foto_usaha_2`, `foto_usaha_3`) VALUES
(1, 'Kedai Meosi', 'Kedai Meosi adalah kedai atau tempat nongkrong cafe yang menawarkan makanan dan minuman serta camilan untuk anak-anak muda. tempatnya yang berada di pojok atau persimpangan jalan, dengan harga yang terjangkau', 'Jl. Majapahit Kalierang no 11', '081326449570', 'kedaimeosi@gmail.com', 'kedai_meosi', '6281326449570', 'https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3957.8443679141446!2d109.00662656414845!3d-7.258546973324354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sJl.%20Majapahit%20No.11%2C%20Pesantren%2C%20Kalierang%2C%20Kec.%20Bumiayu%2C%20Kabupaten%20Brebes%2C%20Jawa%20Tengah%2052273!5e0!3m2!1sid!2sid!4v1684598923836!5m2!1sid!2sid', '22052023061740kedai1.jpg', '22052023061711kedai2.jpg', '22052023061723kedai3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `saran_kritik`
--

CREATE TABLE `saran_kritik` (
  `id_saran` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `saran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saran_kritik`
--

INSERT INTO `saran_kritik` (`id_saran`, `nama_pelanggan`, `email`, `tanggal`, `saran`) VALUES
(15, 'Nay', 'znyh@gmail.com', '2021-09-20', 'Rumah makan atau restoran adalah istilah umum untuk menyebut usaha gastronomi yang menyajikan hidangan kepada masyarakat dan menyediakan tempat untuk menikmati hidangan tersebut serta menetapkan tarif tertentu untuk makanan dan pelayanannya. Meski pada umumnya rumah makan menyajikan makanan di tempat, tetapi ada juga beberapa yang menyediakan layanan take-out dining dan delivery service sebagai salah satu bentuk pelayanan kepada konsumennya. Rumah makan biasanya memiliki spesialisasi dalam jenis makanan yang dihidangkannya. Sebagai contoh yaitu rumah makan chinese food, rumah makan Padang, rumah makan cepat saji (fast food restaurant) dan sebagainya.'),
(16, 'Yuni Kurnia Taramita', 'yuni186@gmail.com', '2021-10-01', 'Restoran ini tempatnya nyaman dan bersih. Pelayanannya pun sangat baik dan ramah. Dan tentunya menu yang ditawarkan juga enak. '),
(17, 'Ardan', 'ardananjungkusuma@gmail.com', '2021-10-04', 'Tolong kebersihan ditingkatkan'),
(23, 'Ardan', 'ardanak@gmail.com', '2021-11-09', 'Tolong kebersihan sampahnya dijaga');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_invoice` (`no_invoice`),
  ADD KEY `id_metode_pembayaran` (`id_metode_pembayaran`),
  ADD KEY `id_meja` (`id_meja`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `gambar_menu`
--
ALTER TABLE `gambar_menu`
  ADD PRIMARY KEY (`id_gambar`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id_meja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `menu_dibooking`
--
ALTER TABLE `menu_dibooking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_invoice` (`no_invoice`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profil_usaha`
--
ALTER TABLE `profil_usaha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saran_kritik`
--
ALTER TABLE `saran_kritik`
  ADD PRIMARY KEY (`id_saran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gambar_menu`
--
ALTER TABLE `gambar_menu`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `id_meja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `menu_dibooking`
--
ALTER TABLE `menu_dibooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `profil_usaha`
--
ALTER TABLE `profil_usaha`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saran_kritik`
--
ALTER TABLE `saran_kritik`
  MODIFY `id_saran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_metode_pembayaran`) REFERENCES `metode_pembayaran` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_meja`) REFERENCES `meja` (`id_meja`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `admin` (`id_pegawai`);

--
-- Constraints for table `gambar_menu`
--
ALTER TABLE `gambar_menu`
  ADD CONSTRAINT `gambar_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE;

--
-- Constraints for table `menu_dibooking`
--
ALTER TABLE `menu_dibooking`
  ADD CONSTRAINT `menu_dibooking_ibfk_1` FOREIGN KEY (`no_invoice`) REFERENCES `booking` (`no_invoice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
