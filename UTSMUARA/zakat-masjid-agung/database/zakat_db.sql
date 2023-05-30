-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Bulan Mei 2022 pada 19.49
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zakat_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(10) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`) VALUES
(1, 'hilmi', '12345678'),
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran_zakat`
--

CREATE TABLE `tb_pembayaran_zakat` (
  `id_pembayaran` int(10) NOT NULL,
  `id_admin` int(10) NOT NULL,
  `id_zakat` int(10) NOT NULL,
  `nominal` int(15) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat_email` varchar(30) NOT NULL,
  `nama_bank` varchar(30) NOT NULL,
  `no_rekening` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pembayaran_zakat`
--

INSERT INTO `tb_pembayaran_zakat` (`id_pembayaran`, `id_admin`, `id_zakat`, `nominal`, `nama_lengkap`, `no_hp`, `alamat_email`, `nama_bank`, `no_rekening`) VALUES
(12, 2, 2, 100000000, 'Maulana Al Hilmi', '2312312', 'hilmi@gmail.com', 'bca', 232132),
(13, 2, 1, 2500000, 'Marwan Al Fikri', '081253634637', 'fikri@gmail.com', 'BRI', 5443126),
(14, 2, 1, 3500000, 'Rama Alfara Alfan', '081256787632', 'Rama@gmail.com', 'BNI', 785535),
(15, 2, 2, 200000000, 'Tuti Ernawati', '085367863546', 'tuti@gmail.com', 'BSI', 8767523),
(16, 2, 1, 5000000, 'Naharuddin', '081275678934', 'nahar@gmail.com', 'CIMB NIAGA', 744545),
(17, 2, 2, 30000000, 'Dwi Sarumaha', '081234567888', 'dwi12@gmail.com', 'BUKOPIN', 8907654);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_zakat`
--

CREATE TABLE `tb_zakat` (
  `id_zakat` int(10) NOT NULL,
  `jenis_zakat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_zakat`
--

INSERT INTO `tb_zakat` (`id_zakat`, `jenis_zakat`) VALUES
(1, 'Zakat Penghasilan'),
(2, 'Zakat Maal'),
(3, 'Zakat Fitrah');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_pembayaran_zakat`
--
ALTER TABLE `tb_pembayaran_zakat`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_zakat` (`id_zakat`);

--
-- Indeks untuk tabel `tb_zakat`
--
ALTER TABLE `tb_zakat`
  ADD PRIMARY KEY (`id_zakat`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_pembayaran_zakat`
--
ALTER TABLE `tb_pembayaran_zakat`
  MODIFY `id_pembayaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_zakat`
--
ALTER TABLE `tb_zakat`
  MODIFY `id_zakat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran_zakat`
--
ALTER TABLE `tb_pembayaran_zakat`
  ADD CONSTRAINT `tb_pembayaran_zakat_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id_admin`),
  ADD CONSTRAINT `tb_pembayaran_zakat_ibfk_2` FOREIGN KEY (`id_zakat`) REFERENCES `tb_zakat` (`id_zakat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
