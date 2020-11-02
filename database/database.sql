-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05 Mar 2017 pada 12.46
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `i_steam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `is_paket`
--

CREATE TABLE `is_paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(30) NOT NULL,
  `jenis_kendaraan` enum('Mobil','Motor') NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `is_paket`
--

INSERT INTO `is_paket` (`id_paket`, `nama_paket`, `jenis_kendaraan`, `harga`) VALUES
(1, 'Paket Motor Biasa', 'Motor', 20000),
(2, 'Paket Motor Spesial', 'Motor', 50000),
(3, 'Paket Mobil Biasa', 'Mobil', 50000),
(4, 'Paket Mobil Spesial', 'Mobil', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `is_transaksi`
--

CREATE TABLE `is_transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `no_plat_kendaraan` varchar(15) NOT NULL,
  `paket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `is_transaksi`
--

INSERT INTO `is_transaksi` (`id_transaksi`, `tanggal`, `nama_pelanggan`, `no_plat_kendaraan`, `paket`) VALUES
('TR-00001', '2017-03-01', 'Iskadina Eka Putri', 'BE 1122 YX', 2),
('TR-00002', '2017-03-02', 'Rio Rinaldo', 'BE 1122 XX', 3),
('TR-00003', '2017-03-04', 'Rinaldi', 'BE 4477 YN', 4),
('TR-00004', '2017-03-04', 'Fajar Nugraha', 'BE 2244 ND', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `is_user`
--

CREATE TABLE `is_user` (
  `id_user` int(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `hak_akses` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `is_user`
--

INSERT INTO `is_user` (`id_user`, `username`, `password`, `nama_user`, `hak_akses`) VALUES
(1, 'indrasatya', '41504508b3cec65b1313905001118579', 'Indra Styawantoro', 'admin'),
(2, 'danang', '6a17faad3b1275fd2558d5435c58440e', 'Danang Kesuma', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `is_paket`
--
ALTER TABLE `is_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `is_transaksi`
--
ALTER TABLE `is_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `paket` (`paket`);

--
-- Indexes for table `is_user`
--
ALTER TABLE `is_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `is_paket`
--
ALTER TABLE `is_paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `is_user`
--
ALTER TABLE `is_user`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `is_transaksi`
--
ALTER TABLE `is_transaksi`
  ADD CONSTRAINT `is_transaksi_ibfk_1` FOREIGN KEY (`paket`) REFERENCES `is_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
