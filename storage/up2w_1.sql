-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2025 at 01:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `up2w_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1749546166),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1749546166;', 1749546166);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `nama_alias` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nama_customer`, `nama_alias`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'PLN Indonesia Power UBP Suralaya PGU, PT', 'PLTU Suralaya 1-7', NULL, NULL, NULL, NULL),
(2, 'PLN (Persero) Divisi Operasi Jawa Bagian Barat (RJK), PT', 'DIV KIT - Kantor Pusat', NULL, NULL, NULL, NULL),
(3, 'PLN (Persero) Divisi Operasi Jawa Bagian Tengah (RJK), PT', 'DIV KIT - Kantor Pusat', NULL, NULL, NULL, NULL),
(4, 'PLN Indonesia Power UBP BANTEN 1 SURALAYA', 'PLTU Suralaya 8', NULL, NULL, NULL, NULL),
(5, 'PLN (Persero) Unit Induk Pembangkitan Sumatera Bagian Selatan, PT', 'UIP SBS', NULL, NULL, NULL, NULL),
(6, 'PLN (Persero) Unit Induk Pembangkitan Sumatera Bagian Utara, PT', 'UIP SBU', NULL, NULL, NULL, NULL),
(7, 'PLN Indonesia Power UJP PLTU Banten 2 Labuan, PT', 'PLTU Labuan', NULL, NULL, NULL, NULL),
(8, 'PLN Nusantara Power UPK TARAHAN', 'PLTU Tarahan', NULL, NULL, NULL, NULL),
(9, 'PLN (Persero) Pembangkitan dan EBT Regional Jawa, Madura dan Bali, PT', 'UPJB', NULL, NULL, NULL, NULL),
(10, 'PLN Indonesia Power UBP JABAR 2 PELABUHAN RATU', 'PLTU Pelabuhan Ratu', NULL, NULL, NULL, NULL),
(11, 'PT Indonesia Power UBP PANGKALAN SUSU', 'PLTU Pangkalan Susu', NULL, NULL, NULL, NULL),
(12, 'PLN Indonesia Power UBP BANTEN 3 LONTAR', 'PLTU Lontar', NULL, NULL, NULL, NULL),
(13, 'PT PLN Nusantara Power UP TENAYAN', 'PLTU Tenayan', NULL, NULL, NULL, NULL),
(14, 'PLN Nusantara Power UP INDRAMAYU', 'PLTU Indramayu', NULL, NULL, NULL, NULL),
(15, 'PLN Nusantara Power UPK Sebalang', 'PLTU Sebalang', NULL, NULL, NULL, NULL),
(16, 'Crompton Prima Switchgear Indonesia (CPSI), PT', 'CPSI', NULL, NULL, NULL, NULL),
(17, 'PLN Indonesia Power UBP CILEGON', 'PLTGU Cilegon', NULL, NULL, NULL, NULL),
(18, 'PT Indonesia Power UBP LABUHAN ANGIN', 'PLTU Labuhan Angin', NULL, NULL, NULL, NULL),
(19, 'PLN Nusantara Power UPK NAGAN RAYA', 'PLTU Nagan Raya', NULL, NULL, NULL, NULL),
(20, 'Pelayaran Bahtera Adhiguna, PT', 'BAG', NULL, NULL, NULL, NULL),
(21, 'PLN (Persero) Unit Induk Pembangkitan dan Penyaluran Kalimantan, PT', 'UIKL Kalimantan', NULL, NULL, NULL, NULL),
(22, 'PLN (Persero) Pusat Penelitian dan Pengembangan Ketenagalistrikan, PT', 'Puslitbang', NULL, NULL, NULL, NULL),
(23, 'PLN Nusantara Power UP TANJUNG AWAR-AWAR', 'PLTU Tanjung Awar-Awar', NULL, NULL, NULL, NULL),
(24, 'PLN Indonesia Power UBP ADIPALA', 'PLTU Adipala', NULL, NULL, NULL, NULL),
(25, 'PLN (Persero) Unit Induk Wilayah Papua dan Papua Barat, PT', 'UIW Papua dan Papua Barat', NULL, NULL, NULL, NULL),
(26, 'PLN Indonesia Power UBP OMBILIN', 'PLTU Ombilin', NULL, NULL, NULL, NULL),
(27, 'PLN (Persero) Unit Induk Pembangunan Kalimantan Bagian Timur (UIP Kalbagtim)', 'UIP Kalbagtim', NULL, NULL, NULL, NULL),
(28, 'PLN (Persero) Unit Induk Transmisi Jawa Bagian Barat (UIT JBB), PT', 'UIT JBB', NULL, NULL, NULL, NULL),
(29, 'PLN (Persero) Unit Induk Distribusi Jakarta Raya, PT', 'UID JAYA', NULL, NULL, NULL, NULL),
(30, 'PLN (Persero) Unit Induk Distribusi Banten, PT', 'UID Banten', NULL, NULL, NULL, NULL),
(31, 'PLN Nusantara Power PLTGU Muara Karang 2 dan Peaker (3)(RJK), PT', 'PLTGU Muara Karang', NULL, NULL, NULL, NULL),
(32, 'PLN (Persero) Unit Induk Wilayah Bangka Belitung, PT', 'UIW Bangka Belitung', NULL, NULL, NULL, NULL),
(33, 'Rekadaya Elektrika, PT', 'Rekadaya Elektrika', NULL, NULL, NULL, NULL),
(34, 'PLN Nusantara Power UP PAITON', 'PLTU Paiton', NULL, NULL, NULL, NULL),
(35, 'PLN Nusantara Power UP ARUN', 'PLTU Arun', NULL, NULL, NULL, NULL),
(36, 'PLN Indonesia Power UBP BENGKULU', 'PLTU Bengkulu', NULL, NULL, NULL, NULL),
(37, 'PLN (Persero) Unit Induk Wilayah Nusa Tenggara Timur, PT', 'UIW NTT', NULL, NULL, NULL, NULL),
(38, 'PLN Nusantara Power UP PACITAN', 'PLTU Pacitan', NULL, NULL, NULL, NULL),
(39, 'PLN (Persero) Unit Induk Pembangkitan dan Penyaluran Sulawesi, PT', 'UIKL Sulawesi', NULL, NULL, NULL, NULL),
(40, 'PLN Indonesia Power UBP BARRU', 'PLTU BARRU', NULL, NULL, '2025-05-22 00:04:10', '2025-05-22 00:04:10'),
(41, 'PLN NP UMRO', 'PLN NP UMRO', NULL, NULL, '2025-05-22 00:09:08', '2025-05-22 00:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `dkmj`
--

CREATE TABLE `dkmj` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_amp` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(50) DEFAULT 'Draft',
  `disusun_oleh` varchar(100) DEFAULT NULL,
  `menyetujui` varchar(100) DEFAULT NULL,
  `tanggal_dkmj` varchar(20) DEFAULT NULL,
  `disetujui_tanggal` varchar(20) DEFAULT NULL,
  `kota_unit` varchar(50) DEFAULT NULL,
  `no_wbs` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `no_dkmj` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dkmj`
--

INSERT INTO `dkmj` (`id`, `no_amp`, `status`, `disusun_oleh`, `menyetujui`, `tanggal_dkmj`, `disetujui_tanggal`, `kota_unit`, `no_wbs`, `created_by`, `updated_by`, `no_dkmj`, `created_at`, `updated_at`) VALUES
(6, 3, 'Draft', NULL, NULL, '2025-05-25', NULL, NULL, NULL, NULL, NULL, '25181101-6', '2025-05-24 19:59:17', '2025-05-24 19:59:17'),
(7, 4, 'Draft', NULL, NULL, '2025-05-23', NULL, NULL, NULL, NULL, NULL, '25171101-7', '2025-05-24 20:14:45', '2025-05-24 20:14:45'),
(8, 3, 'Draft', NULL, NULL, '2025-05-01', NULL, NULL, NULL, NULL, NULL, '25181101-8', '2025-05-24 22:27:22', '2025-05-24 22:27:22'),
(9, 3, 'Draft', NULL, NULL, '2025-05-25', NULL, NULL, NULL, NULL, NULL, '25181101-9', '2025-05-25 00:59:37', '2025-05-25 00:59:37'),
(10, 7, 'Draft', NULL, NULL, '2025-05-01', NULL, NULL, NULL, NULL, NULL, '25158101-10', '2025-05-25 19:46:37', '2025-05-25 19:46:37'),
(11, 21, 'Draft', NULL, NULL, '2025-05-26', NULL, NULL, NULL, NULL, NULL, '25087101-11', '2025-05-26 06:47:38', '2025-05-26 06:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `dkmj_detail`
--

CREATE TABLE `dkmj_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_dkmj` bigint(20) UNSIGNED NOT NULL,
  `no_material` bigint(20) UNSIGNED NOT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `spesifikasi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dkmj_detail`
--

INSERT INTO `dkmj_detail` (`id`, `no_dkmj`, `no_material`, `satuan`, `qty`, `spesifikasi`, `created_at`, `updated_at`) VALUES
(3, 6, 1, NULL, 45, NULL, '2025-05-24 19:59:17', '2025-05-24 19:59:17'),
(4, 7, 1, NULL, 34, NULL, '2025-05-24 20:14:45', '2025-05-24 20:14:45'),
(5, 7, 2, NULL, 45, NULL, '2025-05-24 20:14:45', '2025-05-24 20:14:45'),
(6, 8, 1, NULL, 33, NULL, '2025-05-24 22:27:22', '2025-05-24 22:27:22'),
(7, 8, 2, NULL, 5, NULL, '2025-05-24 22:27:22', '2025-05-24 22:27:22'),
(8, 9, 1, NULL, 45, 'detei', '2025-05-25 00:59:37', '2025-05-25 01:15:24'),
(9, 10, 1, NULL, 12, NULL, '2025-05-25 19:46:37', '2025-05-25 19:46:37'),
(10, 10, 2, NULL, 23, NULL, '2025-05-25 19:46:37', '2025-05-25 19:47:00'),
(11, 11, 1, NULL, 23, NULL, '2025-05-26 06:47:38', '2025-05-26 06:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hpe`
--

CREATE TABLE `hpe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_hpe` varchar(255) NOT NULL,
  `no_dkmj` bigint(20) UNSIGNED NOT NULL,
  `tanggal_hpe` date NOT NULL,
  `nilai_hpe` decimal(18,2) NOT NULL,
  `nilai_ppn` decimal(18,2) NOT NULL,
  `disusun_oleh` varchar(255) DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `approved_at` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hpe`
--

INSERT INTO `hpe` (`id`, `no_hpe`, `no_dkmj`, `tanggal_hpe`, `nilai_hpe`, `nilai_ppn`, `disusun_oleh`, `approved_by`, `approved_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'HPE-20250610-jnp9', 11, '2025-06-10', 1035000.00, 113850.00, NULL, NULL, NULL, NULL, NULL, '2025-06-10 04:05:54', '2025-06-10 04:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `hpe_detail`
--

CREATE TABLE `hpe_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_hpe` bigint(20) UNSIGNED NOT NULL,
  `no_material` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hpe_detail`
--

INSERT INTO `hpe_detail` (`id`, `no_hpe`, `no_material`, `qty`, `satuan`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 23, 'Buah', 45000.00, '2025-06-10 04:05:54', '2025-06-10 04:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kontrak`
--

CREATE TABLE `kontrak` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_kontrak` varchar(255) NOT NULL,
  `no_hpe` bigint(20) UNSIGNED NOT NULL,
  `judul_kontrak` varchar(255) NOT NULL,
  `tgl_kontrak_awal` date NOT NULL,
  `tgl_kontrak_akhir` date NOT NULL,
  `id_vendor` bigint(20) UNSIGNED NOT NULL,
  `nilai_kontrak` decimal(18,2) NOT NULL,
  `nilai_ppn` decimal(18,2) NOT NULL,
  `no_gl` bigint(20) UNSIGNED DEFAULT NULL,
  `no_pr` bigint(20) UNSIGNED DEFAULT NULL,
  `no_po` bigint(20) UNSIGNED DEFAULT NULL,
  `no_nota_dinas` varchar(255) NOT NULL,
  `jenis_kontrak` varchar(255) NOT NULL,
  `status_kontrak` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kontrak_detail`
--

CREATE TABLE `kontrak_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_kontrak` bigint(20) UNSIGNED NOT NULL,
  `no_material` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_material` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `nama_material`, `satuan`, `jenis`, `created_by`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 'MCB 1 Phase 4A', 'Buah', 'Material', NULL, NULL, '2025-05-21 06:44:14', '2025-05-21 06:44:14'),
(2, 'MCB 1 Phase - 6A ', 'Buah', 'Jasa', NULL, NULL, '2025-05-21 21:17:50', '2025-05-21 21:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_21_065857_create_materials_table', 1),
(5, '2025_05_21_071935_create_vendors_table', 1),
(6, '2025_05_21_073248_create_customers_table', 1),
(7, '2025_05_21_074620_create_penugasans_table', 1),
(8, '2025_05_21_080508_create_work_orders_table', 1),
(9, '2025_05_21_081719_create_dkmjs_table', 1),
(10, '2025_05_21_082212_create_dkmj_details_table', 1),
(11, '2025_05_21_085353_create_spbls_table', 1),
(12, '2025_05_21_092127_create_spbl_details_table', 1),
(13, '2025_05_21_092716_create_hpes_table', 1),
(14, '2025_05_21_095730_create_hpe_details_table', 1),
(15, '2025_05_21_100534_create_kontraks_table', 1),
(16, '2025_05_21_103102_create_kontrak_details_table', 1),
(17, '2025_05_22_011245_add_role_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penugasan`
--

CREATE TABLE `penugasan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_amp` bigint(20) UNSIGNED NOT NULL,
  `nama_penugasan` varchar(255) NOT NULL,
  `no_surat_penugasan` varchar(255) DEFAULT NULL,
  `tanggal_penugasan` date DEFAULT NULL,
  `batas_waktu_penugasan` date DEFAULT NULL,
  `nilai_penugasan` decimal(20,2) DEFAULT NULL,
  `no_wbs` varchar(255) DEFAULT NULL,
  `pic_ren` varchar(255) DEFAULT NULL,
  `pic_mek` varchar(255) DEFAULT NULL,
  `status_penugasan` varchar(255) DEFAULT NULL,
  `id_customer` bigint(20) UNSIGNED NOT NULL,
  `status_progress` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penugasan`
--

INSERT INTO `penugasan` (`id`, `no_amp`, `nama_penugasan`, `no_surat_penugasan`, `tanggal_penugasan`, `batas_waktu_penugasan`, `nilai_penugasan`, `no_wbs`, `pic_ren`, `pic_mek`, `status_penugasan`, `id_customer`, `status_progress`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 25181101, 'Penugasan Sementara Pekerjaan Jasa Pengadaan Material dan Perbaikan Part Desalination Feed Pump PLTU Tarahan [incl. Pemasangan]', NULL, '2025-05-26', '2025-08-12', 784000000.00, NULL, NULL, NULL, 'Penugasan Sementara', 8, 'Not Started', NULL, NULL, NULL, NULL),
(4, 25171101, 'Penugasan Sementara Hardfacing Outer Grinding Tyre Unit 1-4 PLTU Lontar', NULL, '2025-05-09', '2025-06-26', 863000000.00, '-', NULL, NULL, 'Penugasan Sementara', 12, 'On Progress', NULL, NULL, NULL, NULL),
(5, 25169101, 'Penugasan Sementara Pembuatan Elbow Coal Pipe PLTU Pangkalan Susu Unit 4 [SPMK]', NULL, '2025-05-26', '2025-12-30', 6540000000.00, NULL, NULL, NULL, 'Penugasan Sementara', 11, 'Not Started', NULL, NULL, NULL, NULL),
(6, 25159101, 'Penugasan Sementara Pengadaan 2 Set Rotary Throat Ring, Legde Cover dan Outerwall Pulverizer Unit 1-4 UBP Suralaya Unit 1 7', NULL, '2025-05-05', '2025-08-04', 1300000000.00, 'I.8411.25.02.9991.180.60', NULL, NULL, 'Penugasan Sementara', 4, 'On Progress', NULL, NULL, NULL, NULL),
(7, 25158101, 'Penugasan Pembuatan Sprocket Bucket Elevator PLTU Nagan Raya ', NULL, '2025-04-30', '2025-06-12', 134900000.00, 'I.8411.25.02.9990.175.60', NULL, NULL, 'Penugasan', 19, 'On Progress', NULL, NULL, NULL, NULL),
(8, 25157101, 'Penugasan Pembuatan Scrapper Bottom Ash PLTU Nagan Raya', NULL, '2025-04-30', '2025-08-31', 604000000.00, 'I.8411.25.02.9990.178.60', NULL, NULL, 'Penugasan', 19, 'On Progress', NULL, NULL, NULL, NULL),
(9, 25156101, 'Penugasan Tetap Pembuatan 1 Set Strainer Sea Water Feed Pump PLTGU Cilegon', NULL, '2025-04-08', '2025-06-09', 129900000.00, 'I.8411.25.06.9991.179.60', NULL, NULL, 'Penugasan Tetap', 17, 'Not Started', NULL, NULL, NULL, NULL),
(10, 25140101, 'Penugasan Sementara Pengadaan Spare Part Mechanical ESP PLTU SEBALANG', NULL, '2025-04-23', '2025-07-14', 416000000.00, 'I.8411.25.02.9990.165.60', NULL, NULL, 'Penugasan Sementara', 15, 'On Progress', NULL, NULL, NULL, NULL),
(11, 25139101, 'Penugasan Tetap Rekondisi Grinding Tyre Mill Tahap 1 PLTU Suralaya 8', NULL, '2025-04-23', '2025-05-29', 151000000.00, 'I.8411.25.02.9991.170.60', NULL, NULL, 'Penugasan Tetap', 1, '100% Done', NULL, NULL, NULL, NULL),
(12, 25122101, 'Penugasan Sementara Pengadaan Tyre dan GRS Mill Suralaya Unit 1 4', NULL, '2025-04-15', '2025-08-20', 1278000000.00, 'I.8411.25.02.9991.149.60', NULL, NULL, 'Penugasan Sementara', 1, 'On Progress', NULL, NULL, NULL, NULL),
(13, 25121101, 'Penugasan Sementara Pengadaan Pilot Valve ARV BFP Unit 1-4 Suralaya', NULL, '2025-04-15', '2025-05-15', 170500000.00, 'I.8411.25.02.9991.154.60', NULL, NULL, 'Penugasan Sementara', 1, '100% Done', NULL, NULL, NULL, NULL),
(14, 25117101, 'Penugasan Tetap Pengadaan Clearing Coal Feeder (Chain Scrapper) PLTU Tenayan', NULL, '2025-04-03', '2025-08-08', 673000000.00, 'I.8411.25.02.9990.150.60', NULL, NULL, 'Penugasan Tetap', 13, 'On Progress', NULL, NULL, NULL, NULL),
(15, 25114101, 'Penugasan Replacement Strategic Part Grinding Table Mill dan Tyre Mill Unit 1-2 PLTU Pangkalan Susu', NULL, '2025-03-31', '2025-09-10', 2338000000.00, 'I.8411.25.02.9991.131.60', NULL, NULL, 'Penugasan', 11, 'On Progress', NULL, NULL, NULL, NULL),
(16, 25113101, 'Penugasan Replacement Strategic Part Grinding Tyre and Table Mill Unit 3-4 PLTU Pangkalan Susu', NULL, '2025-04-02', '2025-08-25', 1368000000.00, 'I.8411.25.02.9991.130.60', NULL, NULL, 'Penugasan', 11, 'On Progress', NULL, NULL, NULL, NULL),
(17, 25110101, 'Penugasan Tetap Pekerjaan Revitalisasi Ship Unloader PLTU Labuhan Angin [SPMK]', NULL, '2025-03-18', '2025-09-14', 3980000000.00, 'I.8411.25.02.9991.129.60', NULL, NULL, 'Penugasan Tetap', 18, 'On Progress', NULL, NULL, NULL, NULL),
(18, 25100101, 'Penugasan Tetap Pembuatan Tangga Water Intake PLTGU Cilegon', NULL, '2025-03-24', '2025-05-16', 186600000.00, 'I.8411.25.06.9991.140.60', NULL, NULL, 'Penugasan Tetap', 17, '100% Done', NULL, NULL, NULL, NULL),
(19, 25098101, 'Penugasan Pengadaan 2 (Dua) Set Fender Jetty PLTU Nagan Raya', NULL, '2025-03-24', '2025-07-09', 1513000000.00, 'I.8411.25.02.9990.143.60', NULL, NULL, 'Penugasan', 19, 'On Progress', NULL, NULL, NULL, NULL),
(20, 25088101, 'Penugasan Tetap Pembuatan Nozzle Burner dan Pulley HP Fan PLN NP Sebalang', NULL, '2025-03-20', '2025-05-30', 183800000.00, 'I.8411.25.02.9990.133.60', NULL, NULL, 'Penugasan Tetap', 15, '100% Done', NULL, NULL, NULL, '2025-05-22 08:01:14'),
(21, 25087101, 'Penugasan Pengadaan Plate Inlet &amp; Rubber Seal Inlet Valve PLN NP UPK Tarahan ', NULL, '2025-03-20', '2025-05-31', 813400000.00, 'I.8411.25.02.9990.137.60', NULL, NULL, 'Penugasan', 8, 'On Progress', NULL, NULL, NULL, NULL),
(22, 25082101, 'Penugasan Tetap Pengadaan Hammer &amp; Cage Bar Crusher PLN NP UPK Tarahan', NULL, '2025-03-17', '2025-07-15', 472000000.00, 'I.8411.25.02.9990.108.60', NULL, NULL, 'Penugasan Tetap', 8, 'On Progress', NULL, NULL, NULL, NULL),
(23, 25078101, 'Penugasan Tetap Pembuatan Wear Part Screen Water Pump (SWP) UBP Banten 1 Suralaya ', NULL, '2025-03-14', '2025-06-08', 485000000.00, 'I.8411.25.02.9991.117.60', NULL, NULL, 'Penugasan Tetap', 1, 'On Progress', NULL, NULL, NULL, NULL),
(24, 25074101, 'Penugasan Tetap Pekerjaan Rekondisi 4 Buah Grinding Roll PLN IP UBP Ombilin', NULL, '2025-03-14', '2025-05-04', 370000000.00, 'I.8411.25.02.9991.095.60', NULL, NULL, 'Penugasan Tetap', 26, 'BAPP', NULL, NULL, NULL, NULL),
(25, 25073101, 'Penugasan Tetap Pekerjaan Replacement Elbow Coal Pipe PLTU Pangkalan Susu Unit 3 [SPMK]', NULL, '2025-03-14', '2025-08-15', 4100000000.00, 'I.8411.25.02.9991.100.60', NULL, NULL, 'Penugasan Tetap', 11, 'On Progress', NULL, NULL, NULL, NULL),
(26, 25069101, 'Penugasan Tetap Pengadaan Jasa Perbaikan Struktur Pondasi Desalination Feed Pump (DFP) PLTU Tarahan ', NULL, '2025-03-14', '2025-05-17', 357500000.00, 'I.8411.25.02.9990.104.60', NULL, NULL, 'Penugasan Tetap', 8, '100% Done', NULL, NULL, NULL, NULL),
(27, 25068101, 'Penugasan Tetap Pengadaan Jasa 1 (BH) Stopgate Segment Travelling Screen Unit 3 PLTU Tarahan', NULL, '2025-03-14', '2025-05-27', 637000000.00, 'I.8411.25.02.9990.103.60', NULL, NULL, 'Penugasan Tetap', 8, '100% Done', NULL, NULL, NULL, NULL),
(28, 25066101, 'Penugasan Tetap Jasa Rekondisi Tyre dan GRS Mill Unit 7 Tahun 2025 UBP Suralaya', NULL, '2025-03-09', '2025-05-05', 600000000.00, 'I.8411.25.02.9991.078.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(29, 25063101, 'Penugasan Tetap Pengadaan Material Tyre dan GRS Pulverizer UBP Suralaya Unit 7 ', NULL, '2025-03-13', '2025-08-20', 1585000000.00, 'I.8411.25.02.9991.105.60', NULL, NULL, 'Penugasan Tetap', 1, 'On Progress', NULL, NULL, NULL, NULL),
(30, 25062101, 'Penugasan Sementara Pengadaan &amp; Pemasangan 5 Titik Fender Jetty PLTU Pangkalan Susu 3-4', NULL, '2025-03-13', '2025-07-31', 2400000000.00, 'I.8411.25.02.9991.092.60', NULL, NULL, 'Penugasan Sementara', 11, 'On Progress', NULL, NULL, NULL, NULL),
(31, 25061101, 'Penugasan Tetap Pengadaan 3 Set Rotary Throat Ring, Legde Cover dan Outerwall Pulverizer Unit 1-7 UBP Suralaya', NULL, '2025-03-12', '2025-06-05', 1950000000.00, 'I.8411.25.02.9991.090.60', NULL, NULL, 'Penugasan Tetap', 1, 'On Progress', NULL, NULL, NULL, NULL),
(32, 25059101, 'Penugasan Tetap Pembuatan Chain Scrapper Feeder PLTU Sebalang', NULL, '2025-03-10', '2025-05-24', 680000000.00, 'I.8411.25.02.9990.093.60', NULL, NULL, 'Penugasan Tetap', 15, '100% Done', NULL, NULL, NULL, '2025-05-22 08:01:10'),
(33, 25058101, 'Penugasan Tetap Pengadaan Rotary Throat Ring, Ledge Cover dan Outerwall Pulverizer Unit 1-7 UBP Suralaya', NULL, '2025-03-12', '2025-06-05', 650000000.00, 'I.8411.25.02.9991.083.60', NULL, NULL, 'Penugasan Tetap', 1, 'On Progress', NULL, NULL, NULL, NULL),
(34, 25053101, 'Penugasan Tetap Perbaikan 3 Pcs Grinding Roller dan 12 Pcs Table Mill (Finishing Hardfacing) PLTU Indramayu', NULL, '2025-04-11', '2025-05-30', 431000000.00, 'I.8411.25.02.9990.109.60', NULL, NULL, 'Penugasan Tetap', 14, 'BAPP', NULL, NULL, NULL, NULL),
(35, 25047101, 'Penugasan Tetap Pembuatan Spring Vibrating Feeder UBP Banten 1 Suralaya', NULL, '2025-03-03', '2025-04-19', 176500000.00, 'I.8411.25.02.9991.070.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(36, 25046107, 'Penugasan Tetap Pekerjaan Inner Part Mill (6 Set Rekondisi Grinding Tyre) PLTU Pelabuhan Ratu', NULL, '2025-03-03', '2025-10-15', 970000000.00, 'I.8411.25.02.9991.072.60', NULL, NULL, 'Penugasan Tetap', 10, 'Not Started', NULL, NULL, NULL, NULL),
(37, 25046106, 'Penugasan Tetap Pekerjaan Inner Part Mill (12 Set Journal Housing Liner New Design) PLTU Pelabuhan Ratu', NULL, '2025-03-03', '2025-10-15', 850000000.00, 'I.8411.25.02.9991.072.60', NULL, NULL, 'Penugasan Tetap', 10, 'On Progress', NULL, NULL, NULL, NULL),
(38, 25046105, 'Penugasan Tetap Pekerjaan Inner Part Mill (7 Set Journal Head Liner) PLTU Pelabuhan Ratu', NULL, '2025-03-03', '2025-10-15', 875000000.00, 'I.8411.25.02.9991.072.60', NULL, NULL, 'Penugasan Tetap', 10, 'On Progress', NULL, NULL, NULL, NULL),
(39, 25046104, 'Penugasan Tetap Pekerjaan Inner Part Mill (6 Set Grinding Table) PLTU Pelabuhan Ratu', NULL, '2025-03-03', '2025-06-13', 750000000.00, 'I.8411.25.02.9991.072.60', NULL, NULL, 'Penugasan Tetap', 10, 'On Progress', NULL, NULL, NULL, NULL),
(40, 25046103, 'Penugasan Tetap Pekerjaan Inner Part Mill (3 Set Journal Skirt Assembly) PLTU Pelabuhan Ratu', NULL, '2025-03-03', '2025-06-13', 680000000.00, 'I.8411.25.02.9991.072.60', NULL, NULL, 'Penugasan Tetap', 10, 'On Progress', NULL, NULL, NULL, NULL),
(41, 25046102, 'Penugasan Tetap Pekerjaan Inner Part Mill (6 Set Journal Housing Liner New Design) PLTU Pelabuhan Ratu', NULL, '2025-03-03', '2025-06-13', 425000000.00, 'I.8411.25.02.9991.072.60', NULL, NULL, 'Penugasan Tetap', 10, 'On Progress', NULL, NULL, NULL, NULL),
(42, 25046101, 'Penugasan Tetap Pekerjaan Inner Part Mill (6 Set Journal Bearing Head Liner) PLTU Pelabuhan Ratu', NULL, '2025-03-03', '2025-06-13', 750000000.00, 'I.8411.25.02.9991.072.60', NULL, NULL, 'Penugasan Tetap', 10, 'On Progress', NULL, NULL, NULL, NULL),
(43, 25042101, 'Pembuatan 28 Unit T-Plate DDCC Banten 1 Suralaya', NULL, '2025-03-14', '2025-05-19', 78500000.00, NULL, NULL, NULL, 'Penugasan', 1, 'BAPP', NULL, NULL, NULL, NULL),
(44, 25041101, 'Penugasan Tetap Pembuatan Hammer Coal Crusher Banten 1 Suralaya', NULL, '2025-03-03', '2025-06-18', 390000000.00, 'I.8411.25.02.9991.067.60', NULL, NULL, 'Penugasan Tetap', 1, 'On Progress', NULL, NULL, NULL, NULL),
(45, 25031101, 'Penugasan Tetap Pengadaan Material Air Nozzle dan Pemasangan Vortex Finder Cyclone PLTU Nagan Raya Unit 1', NULL, '2025-02-24', '2025-10-18', 3900000000.00, 'I.8411.25.02.9990.062.60', NULL, NULL, 'Penugasan Tetap', 19, 'On Progress', NULL, NULL, NULL, NULL),
(46, 25026101, 'Penugasan Pembuatan &amp; Pemasangan Vortex Finder Cyclone PLTU Sebalang [SPMK]', NULL, '2025-02-13', '2025-07-20', 4880000000.00, 'I.8411.25.04.9990.055.60', NULL, NULL, 'Penugasan', 15, 'On Progress', NULL, NULL, NULL, NULL),
(47, 25019101, 'Penugasan Tetap Pengadaan Material Air Nozzle dan Long Tube PLTU Nagan Raya', NULL, '2025-02-10', '2025-07-13', 1655000000.00, 'I.8411.25.02.9990.045.60', NULL, NULL, 'Penugasan Tetap', 19, '100% Done', NULL, NULL, NULL, NULL),
(48, 25011103, 'Penugasan Sementara 1 Set Jasa Rekondisi Tyre (3 Buah) &amp; Jasa Rekondisi GRS (12 Buah) PLN IP UBP Suralaya - TAHAP 3', NULL, '2025-04-17', '2025-05-22', 300000000.00, 'I.8411.25.02.9991.044.60', NULL, NULL, 'Penugasan Sementara', 4, 'BAPP', NULL, NULL, NULL, NULL),
(49, 25011102, 'Penugasan Sementara 1 Set Jasa Rekondisi Tyre (3 Buah) &amp; Jasa Rekondisi GRS (12 Buah) PLN IP UBP Suralaya -TAHAP 2', NULL, '2025-03-10', '2025-04-14', 300000000.00, 'I.8411.25.02.9991.044.60', NULL, NULL, 'Penugasan Sementara', 4, 'BAPP', NULL, NULL, NULL, NULL),
(50, 25011101, 'Penugasan Sementara 1 Set Jasa Rekondisi Tyre (3 Buah) &amp; Jasa Rekondisi GRS (12 Buah) PLN IP UBP Suralaya - TAHAP 1', NULL, '2025-01-30', '2025-03-06', 300000000.00, 'I.8411.25.02.9991.044.60', NULL, NULL, 'Penugasan Sementara', 4, 'BAPP', NULL, NULL, NULL, NULL),
(51, 25003101, 'Penugasan Pembuatan Roller Conveyor PLTU Nagan Raya (Tahap 1)', NULL, '2025-01-17', '2025-03-28', 409000000.00, 'I.8411.25.02.9990.032.60', NULL, NULL, 'Penugasan', 19, 'BAPP', NULL, NULL, NULL, NULL),
(52, 25002101, 'Penugasan Tetap Pembuatan Grill Anti Wear PLTU Tenayan', NULL, '2025-01-15', '2025-04-16', 356000000.00, 'I.8411.25.02.9990.031.60', NULL, NULL, 'Penugasan Tetap', 13, '100% Done', NULL, NULL, NULL, NULL),
(53, 24703101, 'Penugasan Penggantian Silincer PAF B SE TAHUN 2025 UBP Banten 1 Suralaya [SPMK]', NULL, '2025-01-06', '2025-03-21', 935000000.00, 'I.8411.25.02.9991.015.60', NULL, NULL, 'Penugasan', 1, '100% Done', NULL, NULL, NULL, NULL),
(54, 24651101, 'Penugasan Tetap Pengadaan Material 1 Set Tyre dan 1 Set GRS Mill Unit 3 UBP Suralaya', NULL, '2024-12-04', '2025-05-21', 1278000000.00, 'I.8411.24.02.9991.689.60', NULL, NULL, 'Penugasan Tetap', 1, '100% Done', NULL, NULL, NULL, NULL),
(55, 24650101, 'Penugasan Tetap Rekondisi Grinding Tyre Mill Tahap 3 UBP Banten 1 Suralaya', NULL, '2024-12-02', '2024-12-10', 138000000.00, 'I.8411.24.02.9991.672.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(56, 24634101, 'Penugasan Tetap Pengadaan Material,  Fabrikasi dan Pemasangan 3 Set Rotary Anti Blocking Before Feeder UBP Banten 1 Suralaya [SPMK]', NULL, '2024-11-22', '2025-03-20', 3460656146.00, 'I.8411.24.02.9991.658.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(57, 24602101, 'Penugasan Pekerjaan Jasa Pembuatan dan Pemasangan 1 Set Fender Jetty PLTU Nagan Raya', NULL, '2024-11-06', '2025-02-06', 760400000.00, 'I.8411.24.02.9990.624.60', NULL, NULL, 'Penugasan', 19, 'BAPP', NULL, NULL, NULL, NULL),
(58, 24594101, 'Penugasan Tetap Jasa Pembuatan Shaft Roller, Pin Roller dan Roller Traveliing Screen UBP Banten 1 Suralaya ', NULL, '2024-11-01', '2024-12-06', 102000000.00, 'I.8411.24.02.9991.610.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(59, 24586101, 'Penugasan Tetap Pengadaan Material, Fabrikasi dan Pemasangan 3 Set Rotary Antiblocking After Feeder Unit 6 UBP Suralaya [SPMK]', NULL, '2024-10-30', '2025-04-19', 2366031667.00, 'I.8411.24.02.9991.625.60', NULL, NULL, 'Penugasan Tetap', 1, '100% Done', NULL, NULL, NULL, NULL),
(60, 24583101, 'Penugasan Tetap Pengadaan Head Sprocket Bucket Elevator, Bend Pulley A-2BC Dan Roller CAH UP Tarahan', NULL, '2024-10-21', '2025-02-13', 1090000000.00, 'I.8411.24.02.9990.618.60', NULL, NULL, 'Penugasan Tetap', 8, 'BAPP', NULL, NULL, NULL, NULL),
(61, 24572101, 'Penugasan Perbaikan 2 (Dua) Set Grinding Roll dan Table Mill ME#3 PLTU Indramayu', NULL, '2024-11-04', '2025-01-13', 868000000.00, NULL, NULL, NULL, 'Penugasan', 14, 'BAPP', NULL, NULL, NULL, NULL),
(62, 24569101, 'Penugasan Tetap Jasa Rekondisi 2 Set Tyre dan GRS PLTU Suralaya 5-7 (SO-10)', NULL, '2024-10-24', '2024-12-23', 600000000.00, 'I.8411.24.02.9991.598.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(63, 24568101, 'Penugasan Tetap Jasa Modifikasi Pipeline Desalination Feed Pump PLTU Tarahan', NULL, '2024-10-21', '2025-01-25', 675000000.00, 'I.8411.24.02.9990.596.60', NULL, NULL, 'Penugasan Tetap', 8, 'BAPP', NULL, NULL, NULL, NULL),
(64, 24562101, 'Penugasan Tetap Pengadaan Material Tyre &amp; GRS Pulverizer Unit 6 Tahap 2 Tahun 2024 (HB.5) UBP Suralaya', NULL, '2024-10-17', '2025-03-27', 1600000000.00, 'I.8411.24.02.9991.590.60', NULL, NULL, 'Penugasan Tetap', 1, '100% Done', NULL, NULL, NULL, NULL),
(65, 24560101, 'Penugasan Pembuatan 1500 (Seribu Lima Ratus) Set Bolt Line Exhaust To Bellow Dan Bolt Bellow Big - PLTMG Arun', NULL, '2024-10-16', '2024-11-27', 210000000.00, 'I.8411.24.01.9990.589.60', NULL, NULL, 'Penugasan', 35, 'BAPP', NULL, NULL, NULL, NULL),
(66, 24550101, 'Penugasan Pembuatan 200 buah Bolt Elbows Small PLTMG Arun', NULL, '2024-10-10', '2024-11-27', 92000000.00, 'I.8411.24.01.9990.574.60', NULL, NULL, 'Penugasan', 35, 'BAPP', NULL, NULL, NULL, NULL),
(67, 24545102, 'Penugasan Sementara Pekerjaan Unplanned MI Jasa Rekondisi Tyre dan GRS Mill Unit 1-4 (1 Set) UBP Suralaya Tahap 2', NULL, '2024-10-11', '2024-12-05', 300000000.00, 'I.8411.24.02.9991.570.60', NULL, NULL, 'Penugasan Sementara', 1, '100% Done', NULL, NULL, NULL, NULL),
(68, 24545101, 'Penugasan Sementara Pekerjaan Unplanned MI Jasa Rekondisi Tyre dan GRS Mill Unit 1-4 (1 Set) UBP Suralaya Tahap 1', NULL, '2024-10-11', '2024-11-06', 300000000.00, 'I.8411.24.02.9991.570.60', NULL, NULL, 'Penugasan Sementara', 1, '100% Done', NULL, NULL, NULL, NULL),
(69, 24544101, 'Penugasan Tetap Pengadaan Flight Bar dan Chain Submerged Scrapper Conveyor Unit 1-2 UBP Pangkalan Susu', NULL, '2024-10-10', '2024-12-06', 861000000.00, 'I.8411.24.02.9991.571.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(70, 24538101, 'Penugasan Pembuatan 1 (Satu) Set Chain Ship Unloader - PLTU Tenayan', NULL, '2024-09-30', '2024-12-05', 487000000.00, 'I.8411.24.02.9990.557.60', NULL, NULL, 'Penugasan', 13, 'BAPP', NULL, NULL, NULL, NULL),
(71, 24533101, 'Penugasan Tetap Pemasangan 1 Set Rotary Anti Blocking Coal Bungker D UBP Banten 1 Suralaya [SPMK]', NULL, '2024-10-11', '2024-10-20', 308000000.00, 'I.8411.24.02.9991.556.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(72, 24518101, 'Penugasan Tetap Jasa Rekondisi Tyre dan GRS PLTU Suralaya Unit 1 7 (SO-9)', NULL, '2024-09-18', '2024-10-15', 300000000.00, 'I.8411.24.02.9991.545.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(73, 24512101, 'Penugasan Tetap Pengadaan Scrapper SSC PLTU Pelabuhan Ratu (Rekomposisi 2024)', NULL, '2024-09-11', '2024-11-30', 875000000.00, 'I.8411.24.02.9991.541.60', NULL, NULL, 'Penugasan Tetap', 10, 'BAPP', NULL, NULL, NULL, NULL),
(74, 24511101, 'Penugasan Tetap Rekondisi Grinding Tyre PLTU Pelabuhan Ratu (Rekomposisi 2024)', NULL, '2024-09-11', '2024-11-30', 996000000.00, 'I.8411.24.02.9991.539.60', NULL, NULL, 'Penugasan Tetap', 10, 'BAPP', NULL, NULL, NULL, NULL),
(75, 24510101, 'Penugasan Tetap Reverse Engineering Journal Head Liner Assembly PLTU Pelabuhan Ratu (Rekomposisi 2024)', NULL, '2024-09-11', '2024-11-30', 1024000000.00, 'I.8411.24.02.9991.540.60', NULL, NULL, 'Penugasan Tetap', 10, 'BAPP', NULL, NULL, NULL, NULL),
(76, 24505101, 'Penugasan Tetap Jasa Scanning dan Pembuatan Special Tools Part Mill Unit 3 UBP Barru', NULL, '2024-09-20', '2024-11-20', 232500000.00, 'I.8411.24.02.9991.542.60', NULL, NULL, 'Penugasan Tetap', 40, 'BAPP', NULL, NULL, NULL, NULL),
(77, 24502101, 'Penugasan Tetap Repair 3 Unit Grinding Roll PLTU Tanjung Awar-Awar', NULL, '2024-09-27', '2024-12-31', 353800000.00, 'I.8411.24.02.9990.522.60', NULL, NULL, 'Penugasan Tetap', 23, 'BAPP', NULL, NULL, NULL, NULL),
(78, 24498101, 'Penugasan Tetap Pengadaan Material Yoke dan Ring Seat Mill Unit 1-4 UBP Suralaya', NULL, '2024-09-12', '2025-08-31', 2650000000.00, 'I.8411.24.02.9991.521.60', NULL, NULL, 'Penugasan Tetap', 1, '100% Done', NULL, NULL, NULL, NULL),
(79, 24486101, 'Penugasan Tetap Pembuatan 1 Set Stop Gate Intake UBP Banten 1 Suralaya', NULL, '2024-09-09', '2024-12-02', 996000000.00, 'I.8411.24.02.9991.512.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(80, 24476101, 'Penugasan Tetap Pembuatan Elbow Coal Pipe R900 Dan R1350 PLTU Pangkalan Susu 3-4', NULL, '2024-09-03', '2024-11-04', 980000000.00, 'I.8411.24.02.9991.490.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(81, 24475101, 'Penugasan Tetap Pengadaan Material Throatring 3 Set, Ledge Cover  4 Set dan Fixed Outerwall 4 Set Unit 1-7 UBP Suralaya (PO-7)', NULL, '2024-08-30', '2024-11-25', 2370000000.00, 'I.8411.24.02.9991.489.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(82, 24473101, 'Penugasan Tetap Pengadaan Pilot Valve ARF BFP UBP Suralaya Unit 1-4 (HT1)', NULL, '2024-08-30', '2024-10-10', 165000000.00, 'I.8411.24.02.9991.506.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(83, 24465101, 'Penugasan Tetap Material OH ME Bullring dan Bowl Extension Fabrikasi PLTU Banten 2 Labuan', NULL, '2024-09-26', '2025-01-15', 439060000.00, 'I.8411.24.02.9991.504.60', NULL, NULL, 'Penugasan Tetap', 7, 'BAPP', NULL, NULL, NULL, NULL),
(84, 24464101, 'Penugasan Tetap Jasa Rekondisi Tyre dan GRS PLTU Suralaya Unit 1-7 (SO-8)', NULL, '2024-08-27', '2024-09-18', 300000000.00, 'I.8411.24.02.9991.487.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(85, 24463101, 'Jasa Scanning Blade PLTU Nagan Raya', NULL, '2024-07-10', '2024-08-05', 53000000.00, 'I.8411.24.02.9990.493.60', NULL, NULL, 'Penugasan', 41, '100% Done', NULL, NULL, NULL, NULL),
(86, 24458101, 'Penugasan Tetap Pembuatan 72 (Tujuh Puluh Dua) Set U-Clamp Cooling Tower PLTU Tenayan ', NULL, '2024-08-26', '2024-11-14', 106000000.00, 'I.8411.24.02.9990.488.60', NULL, NULL, 'Penugasan Tetap', 13, 'BAPP', NULL, NULL, NULL, NULL),
(87, 24457101, 'Penugasan Tetap Pembuatan 78 (Tujuh Puluh Delapan) Flight Bar PLTU Pangkalan Susu 3-4', NULL, '2024-08-26', '2024-11-28', 1013000000.00, 'I.8411.24.02.9991.491.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(88, 24438101, 'Penugasan Pembuatan Scrapper Bottom Ash PLTU Nagan Raya', NULL, '2024-08-14', '2024-11-20', 605000000.00, 'I.8411.24.02.9990.457.60', NULL, NULL, 'Penugasan', 19, 'BAPP', NULL, NULL, NULL, NULL),
(89, 24437101, 'Penugasan Tetap Pembuatan 650 Buah Flight Bar Case Conveyor UPK Tarahan ', NULL, '2024-08-14', '2024-11-30', 618000000.00, 'I.8411.24.02.9990.468.60', NULL, NULL, 'Penugasan Tetap', 8, 'BAPP', NULL, NULL, NULL, NULL),
(90, 24436101, 'Penugasan Tetap Replacement Nozzle Compact UBP Labuhan Angin', NULL, '2024-08-14', '2024-11-02', 800000000.00, 'I.8411.24.02.9991.469.60', NULL, NULL, 'Penugasan Tetap', 18, 'BAPP', NULL, NULL, NULL, NULL),
(91, 24434101, 'Penugasan Tetap Pengadaan Rotary Throat Ring  Unit 5 7 UBP Suralaya (PO ke-6)', NULL, '2024-08-14', '2024-11-04', 255000000.00, 'I.8411.24.02.9991.458.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(92, 24398101, 'Penugasan Tetap Pengadaan Material dan Perbaikan Part Desalination Feed Pump (DFP) PLTU Tarahan', NULL, '2024-07-30', '2024-12-06', 667000000.00, 'I.8411.24.02.9990.419.60', NULL, NULL, 'Penugasan Tetap', 8, 'BAPP', NULL, NULL, NULL, NULL),
(93, 24397101, 'Penugasan Tetap Jasa Rekondisi Tyre dan GRS PLTU Suralaya Unit 1-7 (SO-7)', NULL, '2024-07-25', '2024-08-21', 300000000.00, 'I.8411.24.02.9991.420.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(94, 24384101, 'Penugasan Tetap Pembuatan 1000 (Seribu) Set Bolt Head Line Exhaust to Bellow dan Bolt Bellow Big PLTMG Arun', NULL, '2024-07-19', '2024-09-25', 144000000.00, 'I.8411.24.04.9990.408.60', NULL, NULL, 'Penugasan Tetap', 35, 'BAPP', NULL, NULL, NULL, NULL),
(95, 24377101, 'Penugasan Tetap Pengadaan Material Throatring, Ledge Cover dan Outerwall Unit 1-4 UBP Suralaya PO-5', NULL, '2024-07-16', '2024-10-10', 656000000.00, 'I.8411.24.06.9991.392.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(96, 24375101, 'Penugasan Tetap Pengadaan Repeat Order Rubber Seal Upper Inlet Valve UPK Tarahan', NULL, '2024-07-16', '2024-09-01', 77000000.00, 'I.8411.24.02.9990.389.60', NULL, NULL, 'Penugasan Tetap', 8, 'BAPP', NULL, NULL, NULL, NULL),
(97, 24359101, 'Penugasan Tetap Jasa DED Line Conveyor Feeding Biomass PLTU Tarahan', NULL, '2024-07-10', '2024-08-30', 302000000.00, 'I.8411.24.02.9990.384.60', NULL, NULL, 'Penugasan Tetap', 8, 'BAPP', NULL, NULL, NULL, NULL),
(98, 24349101, 'Penugasan Tetap Rekondisi 3 (Tiga) Buah Grinding Tyre Mill Tahap 2 PLTU Suralaya 8', NULL, '2024-07-04', '2024-08-04', 143000000.00, 'I.8411.24.02.9991.370.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(99, 24347101, 'Penugasan Tetap Rebuild Journal Shaft Mill Pulverizer UBP Banten 1 Suralaya', NULL, '2024-07-04', '2024-08-09', 156000000.00, 'I.8411.24.02.9991.372.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(100, 24330101, 'Penugasan Tetap Jasa Rekondisi Tyre dan GRS PLTU Suralaya Unit 1-4 (SO-6)', NULL, '2024-06-24', '2024-07-24', 296000000.00, 'I.8411.24.02.9991.347.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(101, 24328101, 'Penugasan Tetap Bypass Orifice ARV BFP UBP Suralaya Unit 1-2', NULL, '2024-06-24', '2024-07-18', 34000000.00, 'I.8411.24.06.9991.326.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(102, 24327101, 'Penugasan Tetap Jasa Hardfacing Outer Journal Head Liner PLTU Lontar', NULL, '2024-06-21', '2024-07-03', 68000000.00, 'I.8411.24.02.9991.332.60', NULL, NULL, 'Penugasan Tetap', 12, 'BAPP', NULL, NULL, NULL, NULL),
(103, 24326101, 'Penugasan Tetap Penggantian Frame Trolley SU 02 UBP Suralaya', NULL, '2024-08-01', '2025-06-30', 4300000000.00, 'I.8411.24.02.9991.345.60', NULL, NULL, 'Penugasan Tetap', 1, 'On Progress', NULL, NULL, NULL, NULL),
(104, 24296101, 'Penugasan Tetap Pengadaan Hammer Coal Crusher UBP Banten 1 Suralaya', NULL, '2024-06-19', '2024-10-17', 394000000.00, 'I.8411.24.02.9991.338.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(105, 24295101, 'Penugasan Tetap Pengadaan Screen Coal Crusher UBP Banten 1 Suralaya', NULL, '2024-06-19', '2024-09-17', 219000000.00, 'I.8411.24.02.9991.336.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(106, 24291101, 'Penugasan Tetap Pengadaan Spring Vibrating Feeder UBP Banten 1 Suralaya', NULL, '2024-06-19', '2024-08-08', 155000000.00, 'I.8411.24.02.9991.340.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(107, 24285101, 'Penugasan Tetap Pembuatan Inner Part TBS UBP Banten 2 Labuan ', NULL, '2024-06-12', '2024-10-07', 1668000000.00, 'I.8411.24.02.9991.291.60', NULL, NULL, 'Penugasan Tetap', 7, 'BAPP', NULL, NULL, NULL, NULL),
(108, 24283101, ' Penugasan Tetap Revitalisasi Hydraulic System SSC Unit 4 (Pengadaan HPU Shut Off Gate Damper dan HPU Tension) PLTU Pangkalan Susu', NULL, '2024-06-11', '2024-12-16', 559000000.00, 'I.8411.24.02.9991.292.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(109, 24282101, 'Penugasan Tetap Revitalisasi Hydraulic System SSC Unit 4 (Pembuatan Cylinder Hydraulic Damper) PLTU Pangkalan Susu', NULL, '2024-06-11', '2024-12-16', 770000000.00, 'I.8411.24.02.9991.299.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(110, 24280101, 'Penugasan Tetap Pembuatan Chain dan Bucket Ship Unloader PLTU Tenayan', NULL, '2024-06-11', '2024-08-27', 652000000.00, 'I.8411.24.02.9990.298.60', NULL, NULL, 'Penugasan Tetap', 13, 'BAPP', NULL, NULL, NULL, NULL),
(111, 24267102, 'Penugasan Tetap Pekerjaan Pembuatan dan Instalasi Travelling Screen PLTU Sebalang [AMD]', NULL, '2024-06-19', '2025-10-03', 5000000000.00, 'I.8411.24.02.9990.320.60', NULL, NULL, 'Penugasan Tetap', 15, 'On Progress', NULL, NULL, NULL, NULL),
(112, 24267101, 'Penugasan Tetap Supervisi Pekerjaan 1 Set Modifikasi Sistem Filterasi Intake dengan 150 Buah Tetrapod PLTU Sebalang [AMD]', NULL, '2024-06-19', '2025-10-03', 200000000.00, 'I.8411.24.02.9990.320.60', NULL, NULL, 'Penugasan Tetap', 15, 'On Progress', NULL, NULL, NULL, NULL),
(113, 24262101, 'Penugasan Tetap Nozzle Spray TBS PLTGU Cilegon', NULL, '2024-05-30', '2024-07-11', 171970000.00, 'I.8411.24.06.9991.288.60', NULL, NULL, 'Penugasan Tetap', 17, 'BAPP', NULL, NULL, NULL, NULL),
(114, 24260101, 'Penugasan Tetap Perbaikan 4 Titik Fender Jetty dan Penggantian 5 Buah Frontal Frame Fender Jetty PLTU Sebalang', NULL, '2024-06-06', '2024-11-30', 4839000000.00, 'I.8411.24.02.9990.275.60', NULL, NULL, 'Penugasan Tetap', 15, 'BAPP', NULL, NULL, NULL, NULL),
(115, 24256101, 'Penugasan Tetap Jasa Rekondisi Tyre dan GRS PLTU Suralaya Unit 1-4 (SO-5)', NULL, '2024-05-27', '2024-06-23', 296000000.00, 'I.8411.24.02.9991.265.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(116, 24255101, 'Penugasan Tetap Penggantian Fender Jetty PLTU Indramayu [SPMK]', NULL, '2024-06-06', '2024-08-14', 1820000000.00, 'I.8411.24.02.9990.276.60', NULL, NULL, 'Penugasan Tetap', 14, 'BAPP', NULL, NULL, NULL, NULL),
(117, 24251101, 'Penugasan Tetap Pengadaan Material Tyre dan GRS Pulverizer Unit 6 Tahun 2024 (HB.5) UBP Suralaya', NULL, '2024-05-27', '2024-10-31', 1194000000.00, 'I.8411.24.02.9991.290.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(118, 24248101, 'Penugasan Tetap Pengadaan 3 Set Material Throatring, Ledge Cover dan Outerwall Unit 1-7 UBP Suralaya PO ke 3', NULL, '2024-05-21', '2024-08-05', 1968000000.00, 'I.8411.24.02.9991.245.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(119, 24245101, 'Penugasan Tetap Replacement Grinding Tyre Mill Unit 3 dan 4 PLTU Pangkalan Susu', NULL, '2024-06-03', '2024-09-07', 2825000000.00, 'I.8411.24.02.9991.278.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(120, 24244101, 'Penugasan Tetap Replacement Part Grinding Tyre Mill Unit 1 dan 2 PLTU Pangkalan Susu', NULL, '2024-06-03', '2024-09-15', 1960000000.00, 'I.8411.24.02.9991.277.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(121, 24243101, 'Penugasan Tetap Pengadaan RE Part TBS PLTU Pelabuhan Ratu', NULL, '2024-05-27', '2024-09-09', 1762000000.00, 'I.8411.24.02.9991.289.60', NULL, NULL, 'Penugasan Tetap', 10, 'BAPP', NULL, NULL, NULL, NULL),
(122, 24239101, 'Penugasan Tetap Pengadaan Strategic Part Mill - Hardfacing Grinding Tyre PLTU Adipala', NULL, '2024-05-20', '2024-09-13', 276000000.00, 'I.8411.24.02.9991.259.60', NULL, NULL, 'Penugasan Tetap', 24, 'BAPP', NULL, NULL, NULL, NULL),
(123, 24230101, 'Penugasan Tetap Pengadaan Material Throatring, Ledge Cover dan Outerwall Unit 1-4 UBP Suralaya  PO 4', NULL, '2024-05-20', '2024-08-17', 656000000.00, 'I.8411.24.02.9991.260.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(124, 24223101, 'Penugasan Tetap Pengadaan 1 Set Stopgate Intake CWP Sisi Indoor UBP Suralaya Unit 5-7', NULL, '2024-05-20', '2024-08-23', 775000000.00, 'I.8411.24.02.9991.247.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(125, 24222101, 'Penugasan Tetap Pembuatan 1 (Satu) Set Cooler Generator PLTU Tenayan', NULL, '2024-05-13', '2025-01-25', 880000000.00, 'I.8411.24.02.9990.241.60', NULL, NULL, 'Penugasan Tetap', 13, 'BAPP', NULL, NULL, NULL, NULL),
(126, 24220101, 'Penugasan Tetap Replacement Nozzle Furnace PLTU Labuhan Angin Unit 2', NULL, '2024-05-13', '2024-11-20', 5525000000.00, 'I.8411.24.02.9991.242.60', NULL, NULL, 'Penugasan Tetap', 18, 'BAPP', NULL, NULL, NULL, NULL),
(127, 24217101, 'Penugasan Tetap Pembuatan 1 Set Vortex Finder dan Pemasangan PLTU Sebalang Unit 2 [SMPK]', NULL, '2024-05-13', '2025-07-31', 4880000000.00, 'I.8411.24.02.9990.231.60', NULL, NULL, 'Penugasan Tetap', 15, 'On Progress', NULL, NULL, NULL, NULL),
(128, 24212101, 'Penugasan Tetap Replacement Strategic Part Ship Unloader ( 22 Pcs Bucket Ship Unloader ) Unit 3-4 PLTU Pangkalan Susu', NULL, '2024-05-16', '2024-06-30', 468000000.00, 'I.8411.24.02.9991.238.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(129, 24211101, 'Penugasan Tetap Pengadaan Inner Parts Recirculation Valve BFP  PLTU Suralaya Unit 1-4', NULL, '2024-05-13', '2024-08-01', 813000000.00, 'I.8411.24.02.9991.237.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(130, 24209101, 'Penugasan Tetap Retrofit Boiler Burner System PLTU Pelabuhan Ratu', NULL, '2024-05-30', '2024-08-14', 2115000000.00, 'I.8411.24.02.9991.236.60', NULL, NULL, 'Penugasan Tetap', 10, 'BAPP', NULL, NULL, NULL, NULL),
(131, 24202101, 'Penugasan Tetap 7 (Tujuh) Set Coal Burner dan Coal Burner Housing PLTU Labuan', NULL, '2024-05-03', '2024-10-13', 3920000000.00, 'I.8411.24.02.9991.217.60', NULL, NULL, 'Penugasan Tetap', 7, 'BAPP', NULL, NULL, NULL, NULL),
(132, 24201101, 'Penugasan Tetap Pengadaan Material Throat Ring, Ledge Cover dan Outerwall Unit 1-4 UBP Suralaya (PO-2)', NULL, '2024-04-26', '2024-07-27', 656000000.00, 'I.8411.24.02.9991.218.60', NULL, NULL, 'Penugasan Tetap', 4, 'BAPP', NULL, NULL, NULL, NULL),
(133, 24194101, 'Penugasan Tetap Replacement Fender Jetty dan Lintasan Lokomotive Small Car PLN IP UBP Labuhan Angin [SPMK]', NULL, '2024-04-25', '2025-04-30', 2590000000.00, 'I.8411.24.02.9991.213.60', NULL, NULL, 'Penugasan Tetap', 18, '100% Done', NULL, NULL, NULL, NULL),
(134, 24192101, 'Penugasan Tetap Repeat Order 50 (Lima Puluh) Set Nozzle Furnace PLTU Tenayan', NULL, '2024-04-25', '2024-09-30', 159000000.00, 'I.8411.24.02.9990.216.60', NULL, NULL, 'Penugasan Tetap', 13, 'BAPP', NULL, NULL, NULL, NULL),
(135, 24185101, 'Penugasan Tetap Repair 3 (Tiga) Unit Grinding Roll dan 12 Unit Table Mill PLTU Indramayu', NULL, '2024-04-30', '2024-06-09', 435000000.00, 'I.8411.24.02.9990.203.60', NULL, NULL, 'Penugasan Tetap', 14, 'BAPP', NULL, NULL, NULL, NULL),
(136, 24184101, 'Penugasan Tetap Pembuatan 4 Buah Incline Coal Pipe PLTU Tenayan', NULL, '2024-04-16', '2024-07-27', 402000000.00, 'I.8411.24.02.9990.199.60', NULL, NULL, 'Penugasan Tetap', 13, 'BAPP', NULL, NULL, NULL, NULL),
(137, 24181101, 'Penugasan Tetap Repair 8 Buah Inner Diameter Grinding Tyre PLTU Lontar', NULL, '2024-04-16', '2024-06-20', 368000000.00, 'I.8411.24.02.9991.198.60', NULL, NULL, 'Penugasan Tetap', 12, 'BAPP', NULL, NULL, NULL, NULL),
(138, 24177101, 'Penugasan Tetap Pengadaan Tyre &amp; GRS Mill (HB1) Suralaya 1-4', NULL, '2024-04-05', '2024-09-01', 1360000000.00, 'I.8411.24.02.9991.202.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(139, 24172101, 'Penugasan Tetap Rekondisi Grinding Roll PLTU Ombilin', NULL, '2024-04-26', '2024-10-10', 175000000.00, 'I.8411.24.02.9991.189.60', NULL, NULL, 'Penugasan Tetap', 26, 'BAPP', NULL, NULL, NULL, NULL),
(140, 24157101, 'Penugasan Tetap Pembuatan Ulang 12 Buah Rough Crusher dan Fine Crusher PLTU Nagan Raya', NULL, '2024-04-01', '2024-06-24', 340000000.00, 'I.8411.24.02.9990.165.60', NULL, NULL, 'Penugasan Tetap', 19, 'BAPP', NULL, NULL, NULL, NULL),
(141, 24155101, 'Penugasan Tetap Pembuatan 2 (Dua) Set Chain Scrapper Coal Feeder PLTU Tenayan', NULL, '2024-04-01', '2024-09-03', 345000000.00, 'I.8411.24.02.9990.179.60', NULL, NULL, 'Penugasan Tetap', 13, 'BAPP', NULL, NULL, NULL, NULL),
(142, 24148101, 'Penugasan Pengadaan Fabrikasi Sprocket Travelling Band Screen PLTGU Cilegon', NULL, '2024-03-28', '2024-05-03', 99000000.00, 'I.8411.24.06.9991.167.60', NULL, NULL, 'Penugasan', 17, 'BAPP', NULL, NULL, NULL, NULL),
(143, 24147101, 'Penugasan Pembuatan Filter Strainer Chamber Desalination Plant PLTGU Cilegon', NULL, '2024-03-28', '2024-05-13', 120000000.00, 'I.8411.24.06.9991.166.60', NULL, NULL, 'Penugasan', 17, 'BAPP', NULL, NULL, NULL, NULL),
(144, 24141101, 'Penugasan Tetap Jasa Pembuatan dan Pemasangan 1  Set Rotary Anti Blocking Chute Coal Feeder &amp; 1 Set Anti Plugging After Feeder Unit 4*', NULL, '2024-03-26', '2024-08-19', 2475000000.00, 'I.8411.24.02.9991.136.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(145, 24134101, 'Penugasan Tetap Rekondisi 1 Set Tyre dan GRS Mill PLTU Suralaya Unit 1-4 (SO 4)', NULL, '2024-03-25', '2024-04-22', 300000000.00, 'I.8411.24.02.9991.151.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(146, 24133101, 'Penugasan Tetap Pengadaan Material Throatring, Ledge Cover dan Outerwall Unit 1-2 UBP Suralaya', NULL, '2024-03-25', '2024-07-05', 655000000.00, 'I.8411.24.02.9991.152.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(147, 24125101, 'Penugasan Tetap Jasa Scanning dan Pembuatan Dummy Shroud L-1 LP Turbin UBP Suralaya Unit 5 (HT.5)', NULL, '2024-03-18', '2024-05-31', 31000000.00, 'I.8411.24.02.9991.131.60', NULL, NULL, 'Penugasan Tetap', 1, 'BAPP', NULL, NULL, NULL, NULL),
(148, 24124101, 'Penugasan Revitalisasi Track Rack System UBP Suralaya Unit 8', NULL, '2024-03-20', '2024-10-18', 3600000000.00, 'I.8411.24.02.9991.128.60', NULL, NULL, 'Penugasan', 1, 'BAPP', NULL, NULL, NULL, NULL),
(149, 24121101, 'Penugasan Tetap Replacement Grinding Table Mill Unit 3-4 PLTU Pangkalan Susu', NULL, '2024-03-15', '2024-09-07', 1220000000.00, 'I.8411.24.02.9991.127.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(150, 24120101, 'Penugasan Tetap Replacement Grinding Table Mill Unit 1-2 PLTU Pangkalan Susu', NULL, '2024-03-15', '2024-10-02', 1385000000.00, 'I.8411.24.02.9991.133.60', NULL, NULL, 'Penugasan Tetap', 11, 'BAPP', NULL, NULL, NULL, NULL),
(151, 24105102, 'Penugasan Repeat Order 6 set Bull Ring (Grinding Table) PLTU Pelabuhan Ratu (Termin II)', NULL, '2024-03-12', '2024-08-10', 765000000.00, 'I.8411.24.02.9991.119.60', NULL, NULL, 'Penugasan', 10, 'BAPP', NULL, NULL, NULL, NULL),
(152, 24105101, 'Penugasan Repeat Order 6 set Bull Ring (Grinding Table) PLTU Pelabuhan Ratu (Termin I)', NULL, '2024-03-12', '2024-04-23', 765000000.00, 'I.8411.24.02.9991.119.60', NULL, NULL, 'Penugasan', 10, 'BAPP', NULL, NULL, NULL, NULL),
(153, 24102101, 'Penugasan Repeat Order 36 set Journal House Liner New Design PLTU Pelabuhan Ratu', NULL, '2024-03-12', '2024-04-23', 600000000.00, 'I.8411.24.02.9991.121.60', NULL, NULL, 'Penugasan', 10, 'BAPP', NULL, NULL, NULL, NULL),
(154, 24093102, 'Penugasan Rekondisi 9 buah Grinding Tyre PLTU Pelabuhan Ratu (Termin II)', NULL, '2024-03-06', '2024-08-10', 505000000.00, 'I.8411.24.02.9991.111.60', NULL, NULL, 'Penugasan', 10, 'BAPP', NULL, NULL, NULL, NULL),
(155, 24093101, 'Penugasan Rekondisi 9 buah Grinding Tyre PLTU Pelabuhan Ratu (Termin I)', NULL, '2024-03-06', '2024-04-23', 505000000.00, 'I.8411.24.02.9991.111.60', NULL, NULL, 'Penugasan', 10, 'BAPP', NULL, NULL, NULL, NULL),
(156, 24065101, 'Penugasan Jasa Rekondisi 1 set Tyre dan GRS Mill PLTU Suralaya Unit 1-4 (SO 2)', NULL, '2024-02-26', '2024-03-25', 300000000.00, 'I.8411.24.02.9991.079.60', NULL, NULL, 'Penugasan', 1, 'BAPP', NULL, NULL, NULL, NULL),
(157, 24063101, 'Penugasan Jasa Rekondisi 1 Set Tyre dan GRS Mill PLTU Suralaya Unit 5-7 (SO 1)', NULL, '2024-02-26', '2024-03-21', 300000000.00, 'I.8411.24.02.9991.080.60', NULL, NULL, 'Penugasan', 1, 'BAPP', NULL, NULL, NULL, NULL),
(158, 24061102, 'Penugasan Jasa Pemeliharaan Travelling Screen Unit 3 PLTU Tarahan', NULL, '2024-02-22', '2024-10-25', 4420000000.00, 'I.8411.24.02.9990.081.60', NULL, NULL, 'Penugasan', 8, 'BAPP', NULL, NULL, NULL, NULL),
(159, 24061101, 'Penugasan Pembuatan 2 (Dua) Buah Stoplog Unit 3 PLTU Tarahan', NULL, '2024-02-22', '2024-10-25', 1485000000.00, 'I.8411.24.02.9990.081.60', NULL, NULL, 'Penugasan', 8, 'BAPP', NULL, NULL, NULL, NULL),
(160, 24052101, 'Penugasan Pembuatan Grill Anti Wear (Vertical Grill 1000 Pcs dan Horizontal Grill 2500 Pcs) PLTU Tenayan', NULL, '2024-02-20', '2024-03-31', 257000000.00, 'I.8411.24.02.9990.069.60', NULL, NULL, 'Penugasan', 13, 'BAPP', NULL, NULL, NULL, NULL),
(161, 24044101, 'Penugasan Tetap Repeat Order Pembuatan Part Liner Crusher PLTU Tarahan', NULL, '2024-02-15', '2024-09-13', 240000000.00, 'I.8411.24.02.9990.064.60', NULL, NULL, 'Penugasan Tetap', 8, 'BAPP', NULL, NULL, NULL, NULL),
(162, 24040101, 'Penugasan Pengadaan Inlet Valve dan Membran Fluidzing PLTU Tarahan', NULL, '2024-02-12', '2024-05-25', 415000000.00, 'I.8411.24.02.9990.050.60', NULL, NULL, 'Penugasan', 8, 'BAPP', NULL, NULL, NULL, NULL),
(163, 24036101, 'Penugasan Pengadaan 42 buah Cage Bar PLTU Tarahan', NULL, '2024-02-12', '2024-06-08', 260000000.00, 'I.8411.24.02.9990.049.60', NULL, NULL, 'Penugasan', 8, 'BAPP', NULL, NULL, NULL, NULL),
(164, 24035101, 'Penugasan Pembuatan 52 buah Center Hammer &amp; 8 buah End Hammer Crusher PLTU Tarahan', NULL, '2024-02-12', '2024-06-08', 225000000.00, 'I.8411.24.02.9990.047.60', NULL, NULL, 'Penugasan', 8, 'BAPP', NULL, NULL, NULL, NULL),
(165, 24033101, 'Penugasan Pembuatan 100 Set Nozzle Sealpot (4 Hole) dan 100 Set Nozzle Sealpot (6 Hole) PLTU Tenayan', NULL, '2024-02-12', '2024-05-29', 303000000.00, 'I.8411.24.02.9990.060.60', NULL, NULL, 'Penugasan', 13, 'BAPP', NULL, NULL, NULL, NULL),
(166, 24032101, 'Penugasan Repeat Order 100 (seratus) Set Nozzle Furnace PLTU Tenayan', NULL, '2024-02-12', '2024-07-13', 318000000.00, 'I.8411.24.02.9990.057.60', NULL, NULL, 'Penugasan', 13, 'BAPP', NULL, NULL, NULL, NULL),
(167, 24022101, 'Penugasan Jasa Rekondisi Tyre dan GRS Mill  1Set PLTU Suralaya Unit 5-7 (SO 3)', NULL, '2024-02-05', '2024-03-01', 300000000.00, 'I.8411.24.02.9991.041.60', NULL, NULL, 'Penugasan', 1, 'BAPP', NULL, NULL, NULL, NULL),
(168, 24013101, 'Penugasan Repeat Order Rekondisi 15 (Lima Belas) Buah Grinding Tyre Mill PLTU Lontar', NULL, '2024-01-24', '2024-04-20', 810000000.00, 'I.8411.24.02.9991.025.60', NULL, NULL, 'Penugasan', 12, 'BAPP', NULL, NULL, NULL, NULL),
(169, 24012101, 'Penugasan Repeat Order Pembuatan 22 (Dua Puluh Dua) Buah Long Scrapper PLTU Lontar', NULL, '2024-01-24', '2024-04-20', 237000000.00, 'I.8411.24.02.9991.024.60', NULL, NULL, 'Penugasan', 12, 'BAPP', NULL, NULL, NULL, NULL),
(170, 24008101, 'Penugasan Rekondisi Grinding Tyre Mill PLN Indonesia Power Banten 1 Suralaya', NULL, '2024-01-26', '2024-02-27', 149000000.00, 'I.8411.24.02.9991.023.60', NULL, NULL, 'Penugasan', 4, 'BAPP', NULL, NULL, NULL, NULL),
(171, 24007102, 'Penugasan Tetap Pembuatan  Coal Pipe PLTU Indramayu Unit 2 (Termin 2) **', NULL, '2024-02-09', '2024-04-02', 299000000.00, 'I.8411.24.02.9990.037.60', NULL, NULL, 'Penugasan Tetap', 14, 'BAPP', NULL, NULL, NULL, NULL),
(172, 24007101, 'Penugasan Tetap Pembuatan Coal Pipe PLTU Indramayu Unit 2 (Termin 1) **', NULL, '2024-02-06', '2024-03-15', 299000000.00, 'I.8411.24.02.9990.037.60', NULL, NULL, 'Penugasan Tetap', 14, 'BAPP', NULL, NULL, NULL, NULL),
(173, 24005101, 'Penugasan Pembuatan 1 Set Impeller PA Fan PLTU Pangkalan Susu', NULL, '2024-01-29', '2024-04-30', 402000000.00, 'I.8411.24.02.9991.034.60', NULL, NULL, 'Penugasan', 11, 'BAPP', NULL, NULL, NULL, NULL),
(174, 23480101, 'Perbaikan Grinding Roller dan Table Mill dengan Finishing Hardfacing terkait SI #3 PLTU Indramayu', NULL, '2024-01-05', '2024-02-02', 440000000.00, 'I.8411.24.02.9990.006.60', NULL, NULL, 'Penugasan', 14, 'BAPP', NULL, NULL, NULL, NULL),
(175, 23466101, 'Penugasan Perbaikan 6 Titik Fender Jetty PLTU Sebalang (Revisi 1)', NULL, '2023-10-27', '2023-11-13', 133000000.00, 'I.8411.23.02.9990.604.60', NULL, NULL, 'Penugasan', 15, '', NULL, NULL, NULL, NULL),
(176, 23456101, 'Penugasan Tetap  Pengadaan Jasa Hardfacing Coal Pipe PLTU Indramayu Unit 3 *', NULL, '2023-12-13', '2024-01-10', 288045000.00, 'I.8411.23.02.9990.588.60', NULL, NULL, 'Penugasan Tetap', 14, 'BAPP', NULL, NULL, NULL, NULL),
(177, 23421101, 'Penugasan Pengadaan Material Tyre dan GRS Pulverizer Suralaya PGU Unit 5-7 Tahun 2024 (HB.5)', NULL, '2023-11-22', '2024-04-26', 1270000000.00, 'I.8411.23.02.9991.556.60', NULL, NULL, 'Penugasan', 1, 'BAPP', NULL, NULL, NULL, NULL),
(178, 23398101, 'Penugasan Jasa Rekondisi GRS (12 Buah) dan Rekondisi Tyre (3 Buah)  Tahap VI Suralaya PGU', NULL, '2023-11-03', '2023-12-03', 295000000.00, 'I.8411.23.02.9991.541.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(179, 23387101, 'Penugasan Pembuatan Grill Anti Wear (Vertical 1.046 buah dan Horizontal 5.150 buah) PLTU Tenayan', NULL, '2023-10-27', '2023-12-07', 458000000.00, 'I.8411.23.02.9990.528.60', NULL, NULL, 'Penugasan', 13, 'BAPP', NULL, NULL, NULL, NULL),
(180, 23376101, 'Penugasan Jasa Investigasi Travelling Band Screen UPK Tarahan', NULL, '2023-10-12', '2023-11-15', 307000000.00, 'I.8411.23.02.9990.505.60', NULL, NULL, 'Penugasan', 8, '', NULL, NULL, NULL, NULL),
(181, 23374101, 'Penugasan Jasa Rekondisi GRS (12 Buah) Tahap V Suralaya 1-7', NULL, '2023-10-06', '2023-10-29', 65000000.00, 'I.8411.23.02.9991.507.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(182, 23373101, 'Penugasan Jasa Rekondisi Tyre Mill Suralaya Unit 1-7 Tahap IV', NULL, '2023-10-06', '2023-11-07', 228000000.00, 'I.8411.23.02.9991.509.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(183, 23367101, 'Penugasan Pembuatan Part Traveling Band Screen CWP PLTU Pelabuhan Ratu', NULL, '2023-10-13', '2024-01-24', 1550000000.00, 'I.8411.23.02.9991.481.60', NULL, NULL, 'Penugasan', 10, 'BAPP', NULL, NULL, NULL, NULL),
(184, 23359101, 'Penugasan Repeat Order Pengadaan Dumper dan Rubber Seal Valve PLTU Tarahan ', NULL, '2023-09-29', '2023-11-23', 155000000.00, 'I.8411.23.02.9990.586.60', NULL, NULL, 'Penugasan', 8, '', NULL, NULL, NULL, NULL),
(185, 23354101, 'Penugasan Fabrikasi Static Blade IDF PLTU Lontar', NULL, '2023-09-25', '2024-02-07', 338000000.00, 'I.8411.23.02.9991.479.60', NULL, NULL, 'Penugasan', 12, 'BAPP', NULL, NULL, NULL, NULL),
(186, 23353101, 'Penugasan Fabrikasi Coal Burner dan Burner Tip PLTU Lontar', NULL, '2023-09-25', '2024-02-07', 685000000.00, 'I.8411.23.02.9991.478.60', NULL, NULL, 'Penugasan', 12, 'BAPP', NULL, NULL, NULL, NULL),
(187, 23343101, 'Penugasan Perbaikan Flash Gate Headpon PLTA Musi', NULL, '2023-10-02', '2023-11-03', 11700000.00, 'I.8411.23.01.9991.475.60', NULL, NULL, 'Penugasan', 36, 'Completed', NULL, NULL, NULL, NULL),
(188, 23332101, 'Penugasan Jasa Pembuatan 1 Set Inner Part CWP PLTU Sebalang', NULL, '2023-09-13', '2023-11-28', 364000000.00, 'I.8411.23.02.9990.463.60', NULL, NULL, 'Penugasan', 15, '', NULL, NULL, NULL, NULL),
(189, 23330101, 'Penugasan Jasa Pembuatan Shaft No 2 - 6 CWP PLTU Sebalang', NULL, '2023-09-13', '2023-11-28', 382000000.00, 'I.8411.23.02.9990.465.60', NULL, NULL, 'Penugasan', 15, '', NULL, NULL, NULL, NULL),
(190, 23327101, 'Penugasan DED Optimalisasi Trashrack PLTU Suralaya', NULL, '2023-09-11', '2023-12-02', 330000000.00, 'I.8411.23.02.9991.460.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(191, 23320101, 'Penugasan Pembuatan 1 (Satu) Buah Grinding Roll PLTU Pangkalan Susu #1', NULL, '2023-09-05', '2023-12-16', 250000000.00, 'I.8411.23.02.9991.457.60', NULL, NULL, 'Penugasan', 11, 'Completed', NULL, NULL, NULL, NULL),
(192, 23307101, 'Penugasan Repeat Order Pembuatan 1700 (Seribu Tujuh Ratus) Buah Air Cap Nozzle dan Long Tube Furnace PLTU Nagan Raya', NULL, '2023-08-22', '2023-12-23', 7980000000.00, 'I.8411.23.02.9990.337.60', NULL, NULL, 'Penugasan', 19, 'BAPP', NULL, NULL, NULL, NULL),
(193, 23279101, 'Penugasan Pengadaan Inner Parts Recirculation Valve Unit 3-4 Semester 2 Tahun 2023 PLTU Suralaya', NULL, '2023-08-04', '2023-11-03', 485000000.00, 'I.8411.23.02.9991.300.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(194, 23275101, 'Penugasan Pembuatan 2 (Dua) Buah Impeller CWP PLTU Sebalang', NULL, '2023-08-01', '2023-10-08', 250000000.00, 'I.8411.23.02.9990.289.60', NULL, NULL, 'Penugasan', 15, '', NULL, NULL, NULL, NULL),
(195, 23264101, 'Penugasan Pengadaan Scrapper Conveyor Bottom Ash PLTU Nagan Raya', NULL, '2023-07-21', '2023-12-26', 615000000.00, 'I.8411.23.02.9990.278.60', NULL, NULL, 'Penugasan', 19, 'BAPP', NULL, NULL, NULL, NULL),
(196, 23262101, 'Penugasan Fabrikasi Long Scrapper PLTU Lontar', NULL, '2023-07-19', '2023-09-14', 108000000.00, 'I.8411.23.02.9991.277.60', NULL, NULL, 'Penugasan', 12, 'Completed', NULL, NULL, NULL, NULL),
(197, 23260101, 'Penugasan Rekondisi Grinding Tyre Mill PLTU Lontar', NULL, '2023-07-17', '2023-09-14', 485000000.00, 'I.8411.23.02.9991.276.60', NULL, NULL, 'Penugasan', 12, 'Completed', NULL, NULL, NULL, NULL),
(198, 23232101, 'Pembuatan Grinding Tyre &amp; Grinding Ring Segment Tyre Standart PLTU Suralaya Unit 5-7 ', NULL, '2023-07-07', '2023-12-01', 1269000000.00, 'I.8411.23.02.9991.259.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(199, 23231101, 'Penugasan Pembuatan Stop Gate Intake CWP Sisi Outdoor PLTU Suralaya Unit 5-7', NULL, '2023-07-06', '2023-11-27', 1838000000.00, 'I.8411.23.02.9991.242.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(200, 23227101, 'Penugasan Jasa Rekondisi Tyre &amp; GRS Mill Suralaya Unit 1-7 (Kontrak Payung Tahun 2023) PO Tahap III', NULL, '2023-07-03', '2023-09-30', 524000000.00, 'I.8411.23.02.9991.224.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(201, 23220101, ' Pembuatan 1 Buah Stoplog PLTU Labuhan Angin', NULL, '2023-07-07', '2024-01-17', 575000000.00, 'I.8411.23.02.9991.231.60', NULL, NULL, 'Penugasan', 18, 'Completed', NULL, NULL, NULL, NULL),
(202, 23216101, 'Penugasan Pengadaan Dismantling Joint CW Pipe PLTU Suralaya 8', NULL, '2023-07-06', '2023-11-08', 2700000000.00, 'I.8411.23.02.9991.243.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(203, 23195101, 'Penugasan Pengadaan Strategic Part Mill - Hardfacing Grinding Ring Segment PLTU Adipala', NULL, '2023-06-19', '2024-03-18', 617000000.00, 'I.8411.23.02.9991.210.60', NULL, NULL, 'Penugasan', 24, 'BAPP', NULL, NULL, NULL, NULL),
(204, 23191101, 'Penugasan Repeat Order Pembuatan  30 (Tiga Puluh) Buah Scrapper SSC PLTU Pelabuhan Ratu', NULL, '2023-06-14', '2023-11-30', 89000000.00, 'I.8411.23.02.9991.199.60', NULL, NULL, 'Penugasan', 10, 'Completed', NULL, NULL, NULL, NULL),
(205, 23190101, 'Penugasan Rekondisi 3 Buah Grinding Tyre Mill PLTU Banten 1 Suralaya 8 (Tahap II)', NULL, '2023-06-09', '2023-07-22', 149000000.00, 'I.8411.23.02.9991.198.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(206, 23189101, 'Pekerjaan Rebuild 1 Pcs Journal Shaft PLTU Suralaya 8', NULL, '2023-06-09', '2023-08-01', 102000000.00, 'I.8411.23.02.9991.200.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(207, 23165101, 'Pengadaan Material Adaptor ARV BFP Unit 1-4 PLTU Suralaya PGU', NULL, '2023-05-30', '2023-07-15', 159000000.00, 'I.8411.23.02.9991.177.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(208, 23162101, 'Penugasan Rekondisi Grinding Roll PLTU Ombilin', NULL, '2023-05-26', '2023-11-09', 247000000.00, 'I.8411.23.02.9991.175.60', NULL, NULL, 'Penugasan', 26, 'Completed', NULL, NULL, NULL, NULL);
INSERT INTO `penugasan` (`id`, `no_amp`, `nama_penugasan`, `no_surat_penugasan`, `tanggal_penugasan`, `batas_waktu_penugasan`, `nilai_penugasan`, `no_wbs`, `pic_ren`, `pic_mek`, `status_penugasan`, `id_customer`, `status_progress`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(209, 23161101, 'Penugasan Pembuatan Chain dan Bucket Ship Unloader PLTU Labuhan Angin.', NULL, '2023-05-26', '2023-12-28', 1690000000.00, 'I.8411.23.02.9991.174.60', NULL, NULL, 'Penugasan', 18, 'Completed', NULL, NULL, NULL, NULL),
(210, 23160101, 'Pengadaan Reverse Engineering 2 Set Bucket Strainer Backwash Discharge PLTGU Cilegon', NULL, '2023-05-26', '2023-09-04', 41550000.00, 'I.8411.23.06.9991.161.60', NULL, NULL, 'Penugasan', 17, 'Completed', NULL, NULL, NULL, NULL),
(211, 23159101, 'Pengadaan Penggantian 1 (Satu) Set Inlet Chlorine Piping System PLTGU Cilegon', NULL, '2023-05-23', '2023-07-17', 345000000.00, 'I.8411.23.06.9991.160.60', NULL, NULL, 'Penugasan', 17, 'Completed', NULL, NULL, NULL, NULL),
(212, 23149101, 'Pembuatan Grill Anti Wear PLTU Tenayan', NULL, '2023-05-19', '2023-07-15', 530000000.00, 'I.8411.23.02.9990.152.60', NULL, NULL, 'Penugasan', 13, 'Completed', NULL, NULL, NULL, NULL),
(213, 23143101, 'Jasa Rekondisi Grinding Tyre dan GRS MIll Unit 5-7 PO Tahap II (Kontrak Payung Tahun 2023)  ', NULL, '2023-05-18', '2023-07-20', 566000000.00, 'I.8401.23.02.9991.155.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(214, 23121101, 'Jasa Rekondisi Grinding Tyre dan GRS MIll Unit 1-4 PO Tahap I (Kontrak Payung Tahun 2023)  ', NULL, '2023-04-26', '2023-06-06', 283000000.00, 'I.8411.23.02.9991.133.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(215, 23119101, 'Pembuatan 2 Set Chain Scrapper Coal Feeder PLTU Tenayan', NULL, '2023-04-26', '2023-08-24', 310000000.00, 'I.8411.23.02.9990.122.60', NULL, NULL, 'Penugasan', 13, 'Completed', NULL, NULL, NULL, NULL),
(216, 23114101, 'Repeat Order Pembuatan 1060 Buah Long Tube Furnace PLTU Nagan Raya', NULL, '2023-04-19', '2023-07-29', 2310000000.00, 'I.8411.23.02.9990.123.60', NULL, NULL, 'Penugasan', 19, 'Completed', NULL, NULL, NULL, NULL),
(217, 23113101, 'Repeat Order Pembuatan 520 Buah Air Cap Nozzle Furnace PLTU Nagan Raya', NULL, '2023-04-19', '2023-07-29', 1318000000.00, 'I.8411.23.02.9990.124.60', NULL, NULL, 'Penugasan', 19, 'Completed', NULL, NULL, NULL, NULL),
(218, 23112101, 'Pembuatan Grinding Table 2 Set PLTU Pangkalan Susu 1-2', NULL, '2023-04-19', '2023-10-02', 795000000.00, 'I.8411.23.02.9991.130.60', NULL, NULL, 'Penugasan', 11, 'Completed', NULL, NULL, NULL, NULL),
(219, 23111101, 'Pembuatan Grinding Tyre 5 Pcs PLTU Pangkalan Susu 1-2', NULL, '2023-04-19', '2023-10-02', 1080000000.00, 'I.8411.23.02.9991.131.60', NULL, NULL, 'Penugasan', 11, 'Completed', NULL, NULL, NULL, NULL),
(220, 23107101, 'Pembuatan 2 Set Liner Crusher PLTU Tarahan', NULL, '2023-04-14', '2023-08-19', 310000000.00, 'I.8411.23.02.9990.113.60', NULL, NULL, 'Penugasan', 8, 'Completed', NULL, NULL, NULL, NULL),
(221, 23106102, 'Pembuatan 10 Set Membrance Fluidizing  PLTU Tarahan', NULL, '2023-04-14', '2023-05-29', 51000000.00, 'I.8411.23.02.9990.103.60', NULL, NULL, 'Penugasan', 8, 'Completed', NULL, NULL, NULL, NULL),
(222, 23106101, 'Repeat Order Pembuatan Dumper dan Rubber Seal Inlet Valve (AV-12) PLTU Tarahan', NULL, '2023-04-14', '2023-06-23', 163000000.00, 'I.8411.23.02.9990.103.60', NULL, NULL, 'Penugasan', 8, 'Completed', NULL, NULL, NULL, NULL),
(223, 23092101, 'Jasa Rekondisi 3 Buah Grinding Tyre PLTU Banten 1 Suralaya ', NULL, '2023-04-10', '2023-05-13', 140000000.00, 'I.8411.23.02.9991.116.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(224, 23091101, 'Penugasan Pembuatan 2.158 Set Nozzle Furnace PLTU Labuhan Angin', NULL, '2023-04-13', '2023-09-08', 4465000000.00, 'I.8411.23.02.9991.101.60', NULL, NULL, 'Penugasan', 18, 'Completed', NULL, NULL, NULL, NULL),
(225, 23078101, 'Pembuatan 40 bh Journal Housing Liner New Design PLTU Pelabuhan Ratu', NULL, '2023-03-23', '2023-05-16', 639000000.00, 'I.8411.23.02.9991.078.60', NULL, NULL, 'Penugasan', 10, 'Completed', NULL, NULL, NULL, NULL),
(226, 23077101, 'Perbaikan 6 Titik Fender Jetty PLTU Sebalang', NULL, '2023-03-31', '2023-08-16', 4560000000.00, 'I.8411.23.02.9990.087.60', NULL, NULL, 'Penugasan', 15, '', NULL, NULL, NULL, NULL),
(227, 23076101, 'Pembuatan 2 Buah Oil Burner PLTU Pelabuhan Ratu', NULL, '2023-03-28', '2023-05-26', 363000000.00, 'I.8411.23.02.9991.076.60', NULL, NULL, 'Penugasan', 10, 'Completed', NULL, NULL, NULL, NULL),
(228, 23075101, 'Pembuatan 1 set Coal Burner PLTU Pelabuhan Ratu', NULL, '2023-03-28', '2023-05-26', 244000000.00, 'I.8411.23.02.9991.077.60', NULL, NULL, 'Penugasan', 10, 'Completed', NULL, NULL, NULL, NULL),
(229, 23061102, 'Pembuatan 52 Buah Center Hammer dan 8 Buah End Hammer PLTU Tarahan', NULL, '2023-03-22', '2023-07-20', 219000000.00, 'I.8411.23.02.9990.072.60', NULL, NULL, 'Penugasan', 8, 'Completed', NULL, NULL, NULL, NULL),
(230, 23061101, 'Pembuatan 42 Cage Bar PLTU Tarahan', NULL, '2023-03-22', '2023-08-19', 254000000.00, 'I.8411.23.02.9990.072.60', NULL, NULL, 'Penugasan', 8, 'Completed', NULL, NULL, NULL, NULL),
(231, 23056101, 'Pembuatan 1 Set (3 Pcs) Grinding Tyre PLTU Pangkalan Susu 3-4', NULL, '2023-03-20', '2023-07-16', 265000000.00, 'I.8411.23.02.9991.065.60', NULL, NULL, 'Penugasan', 11, 'Completed', NULL, NULL, NULL, NULL),
(232, 23055101, 'Pembuatan 1 Set Grinding Table PLTU Pangkalan Susu 3-4', NULL, '2023-03-20', '2023-07-16', 380000000.00, 'I.8411.23.02.9991.063.60', NULL, NULL, 'Penugasan', 11, 'Completed', NULL, NULL, NULL, NULL),
(233, 23051101, 'Pekerjaan Pembuatan 2 (dua) set Bowl Ring Extension MSM PLTU Labuan', NULL, '2023-03-20', '2023-09-09', 250000000.00, 'I.8411.23.02.9991.068.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(234, 23050101, 'Pembuatan 1 (satu) buah Burner Assembly PLTU Labuan (Reorder)', NULL, '2023-03-20', '2023-09-09', 290000000.00, 'I.8411.23.02.9991.067.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(235, 23047101, 'Pembuatan Leg dan Body Ektension Tower Type DDR+3, DD+12 dan DDR2+6 UIP Kalbagtim', NULL, '2023-03-15', '2023-07-31', 445000000.00, 'I.8411.23.09.7200.058.60', NULL, NULL, 'Penugasan', 27, 'Completed', NULL, NULL, NULL, NULL),
(236, 23040101, 'Pembuatan 1 (satu) set short Scrapper PLTU Labuan (Reorder)', NULL, '2023-03-01', '2023-09-09', 68500000.00, 'I.8411.23.02.9991.047.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(237, 23039101, 'Pembuatan 1 (satu) Set Long Scrapper PLTU Labuan (Reorder)', NULL, '2023-03-01', '2023-09-09', 138000000.00, 'I.8411.23.02.9991.048.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(238, 23038101, 'Pembuatan 1 (satu) Set Journal Head Liner PLTU Labuan (Reorder)', NULL, '2023-03-08', '2023-09-09', 134000000.00, 'I.8411.23.02.9991.049.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(239, 23037101, 'Pembuatan 2 (dua) Set Bull Ring PLTU Labuan (Reorder)', NULL, '2023-03-09', '2023-09-09', 362000000.00, 'I.8411.23.02.9991.050.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(240, 23034101, 'Pekerjaan Repair 3 Inner dan 5 Outer Grinding Roll PLTU Pacitan', NULL, '2023-02-25', '2023-03-25', 300500000.00, 'I.8411.23.02.9990.055.60', NULL, NULL, 'Penugasan', 38, 'Completed', NULL, NULL, NULL, NULL),
(241, 23012101, 'Penggantian Nozzle Furnace dan Sealpot untuk PJB UBJ O&M PLTU Tenayan', NULL, '2023-01-30', '2023-05-27', 852000000.00, 'I.8411.23.02.9990.022.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(242, 23008102, 'Penugasan Penggantian Outlet Coal Pipe #2 PLTU Indramayu (Termin 2)*', NULL, '2023-03-29', '2023-04-16', 1143000000.00, 'I.8411.23.02.9990.021.60', NULL, NULL, 'Penugasan', 14, 'Completed', NULL, NULL, NULL, NULL),
(243, 23008101, 'Penugasan Penggantian Outlet Coal Pipe #2 PLTU Indramayu (Termin 1)*', NULL, '2023-01-26', '2023-03-21', 1465000000.00, 'I.8411.23.02.9990.021.60', NULL, NULL, 'Penugasan', 14, 'Completed', NULL, NULL, NULL, NULL),
(244, 23004101, 'Pengadaan dan Pemasangan Fasilitas Kabel Onshore Connection', NULL, '2023-01-13', '2023-12-31', 413000000.00, 'I.8411.23.09.9994.010.60', NULL, NULL, 'Penugasan', 20, '100% Done', NULL, NULL, NULL, NULL),
(245, 22447101, 'Penugasan Pengadaan Inner Parts Recirculation Valve BFP PLTU Suralaya Unit 1-4 Semester 1 2023', NULL, '2023-01-06', '2023-04-05', 750000000.00, 'I.8411.22.02.9991.460.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(246, 22432101, 'Pekerjaan Pengadaan dan Pemasangan Anjungan Listrik Mandiri (ALMA) On Shore Connection Kapal Jetty Suralaya UID Banten', NULL, '2022-12-22', '2023-05-13', 1900000000.00, 'I.8411.22.09.5600.445.60', NULL, NULL, 'Penugasan', 30, 'Completed', NULL, NULL, NULL, NULL),
(247, 22424101, 'Pengadaan dan Fabrikasi 2 Unit Incinerator (PLTD Semau dan PLTD Nule) PLN UIW NTT*', NULL, '2023-08-10', '2023-09-30', 285000000.00, 'I.8411.23.09.7800.441.60', NULL, NULL, 'Penugasan', 37, 'BAPP', NULL, NULL, NULL, NULL),
(248, 22411101, 'Penugasan Reverse Engineering 500 (Lima Ratus) Buah Air Cap dan 1,000 (Seribu) Buah Long Tube Nozzle Furnace PLTU Nagan Raya', NULL, '2022-11-25', '2023-04-09', 3970000000.00, 'I.8411.22.02.2000.426.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(249, 22407101, 'Penugasan Supervisi Pekerjaan 3D scan Blade &amp; shaft LP 1,2 Turbin unit 7', NULL, '2022-11-25', '2023-04-01', 7000000.00, 'I.8411.22.02.9991.428.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(250, 22398101, 'Penugasan Supervisi Pekerjaan 1500 buah Tiang Listrik Baja Ukuran 11/200 dAN UID Jakarta Raya', NULL, '2022-11-23', '2023-01-31', 500000000.00, 'I.8411.22.09.5400.433.60', NULL, NULL, 'Penugasan', 29, 'Completed', NULL, NULL, NULL, NULL),
(251, 22375101, 'Manufaktur Kelengkapan Material Tower SUTT 150 kV incomer GI Kandangan Type AA+3, BB+12, CC+12 PLN UIP Kalbagtim', NULL, '2022-11-25', '2023-02-28', 249700000.00, 'I.8411.22.09.4J00.285.60', NULL, NULL, 'Penugasan', 27, 'Completed', NULL, NULL, NULL, NULL),
(252, 22368101, ' Penugasan Pembuatan Grating CWP pit &amp; jembatan CWP PLTU Suralaya 8', NULL, '2022-10-17', '2022-11-28', 380000000.00, 'I.8411.22.02.1000.389.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(253, 22367101, 'Penugasan Pemasangan Inner Cone Mill B (Tahap II) Suralaya 8', NULL, '2022-10-14', '2022-10-28', 158000000.00, 'I.8411.22.02.1000.390.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(254, 22359101, 'Pengadaan Kabel dan Perakitan Panel On Shore Kapal Sartika Baruna', NULL, '2022-10-13', '2023-05-26', 1250000000.00, 'I.8411.22.09.9994.382.60', NULL, NULL, 'Penugasan', 20, 'Completed', NULL, NULL, NULL, NULL),
(255, 22358101, 'Penugasan Reverse Engineering 3 Buah Pyrite Transport Trolley PLTU Suralaya 8', NULL, '2022-10-10', '2022-11-13', 115000000.00, 'I.8411.22.02.1000.374.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(256, 22357101, ' Penugasan Reverse Engineering 32 (Tiga Puluh Dua) Buah Spring Vibrating Feeder PLTU Suralaya 8 ', NULL, '2022-10-10', '2022-11-28', 185000000.00, 'I.8411.22.02.1000.373.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(257, 22356101, 'Penugasan Reverse Engineering 30 (Tiga Puluh) Buah Roller dan Inner Roller Traveling Screen PLTU Suralaya 8', NULL, '2022-10-10', '2022-11-18', 63000000.00, 'I.8411.22.02.1000.375.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(258, 22355101, 'Penugasan Reverse Engineering 30 (Tiga Puluh) Linkage Traveling Screen PLTU Suralaya 8', NULL, '2022-10-10', '2022-11-13', 78000000.00, 'I.8411.22.02.1000.377.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(259, 22351101, 'Pengadaan Material Coalescer Filter Intake Air GTG Lantai 2 PLTGU Muara Karang', NULL, '2022-10-05', '2022-12-16', 246000000.00, 'I.8411.22.06.1000.371.60', NULL, NULL, 'Penugasan', 31, 'Completed', NULL, NULL, NULL, NULL),
(260, 22345101, 'Pekerjaan Pembuatan Karya Inovasi Delta Step Bolt PT PLN (Persero) UIT JBB', NULL, '2022-10-05', '2022-12-22', 1170000000.00, 'I.8411.22.16.3400.369.60', NULL, NULL, 'Penugasan', 28, 'Completed', NULL, NULL, NULL, NULL),
(261, 22314101, 'Jasa rekondisi 3 (Tiga) buah Grinding Tyre Mill PLTU Suralaya 8 (Tahap 3)', NULL, '2022-09-13', '2022-10-17', 155000000.00, 'I.8411.22.02.1000.335.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(262, 22306101, 'Penugasan Perbaikan dan Coating Stoplog PLTGU Cilegon', NULL, '2022-09-05', '2022-10-15', 220000000.00, 'I.8411.22.06.1000.329.60', NULL, NULL, 'Penugasan', 17, 'Completed', NULL, NULL, NULL, NULL),
(263, 22302101, 'Penugasan Pengadaaan dan Pemasangan Panel ACB,LBS dan Connecting On Shore Kapal Sartika Baruna', NULL, '2022-09-02', '2022-09-30', 503000000.00, 'I.8411.22.09.9994.327.60', NULL, NULL, 'Penugasan', 20, 'Completed', NULL, NULL, NULL, NULL),
(264, 22301101, 'Pekerjaan Fender Jetty PLTU Sebalang Tahun 2022', NULL, '2022-09-12', '2023-02-20', 4050000000.00, 'I.8411.22.02.2100.330.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(265, 22298101, 'Jasa Rekondisi 2 set Tyre Mill Unit 1-7  (Kontrak Payung Tahun 2022) (PO THP 5)', NULL, '2022-08-29', '2022-10-18', 449000000.00, 'I.8411.22.02.9991.317.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(266, 22253101, 'Penugasan Pemasangan Inner Cone Mill C PLTU Suralaya 8', NULL, '2022-07-27', '2022-08-09', 158000000.00, 'I.8411.22.02.1000.268.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(267, 22247101, 'Pembuatan Inlet Valve (Dumper) Fly Ash, Rubber Seal Upper &amp; Lower, Center Hammer, dan Cage Bar PLTU Tarahan', NULL, '2022-08-01', '2022-12-05', 310000000.00, 'I.8411.22.02.2100.233.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(268, 22246101, 'Pembuatan dan Pemasangan Elbow Inlet Electric Filter CCCW PLTU Suralaya 8', NULL, '2022-07-26', '2023-03-29', 425000000.00, 'I.8411.22.02.1000.263.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(269, 22245101, 'Pembuatan 3 Set Pyrite Box Mill PLTU Suralaya 8', NULL, '2022-07-25', '2022-09-09', 295000000.00, 'I.8411.22.02.1000.244.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(270, 22244101, 'Pembuatan 7 (tujuh) buah Flange Outlet Pyrite Gate PLTU Suralaya 8', NULL, '2022-07-25', '2022-08-31', 145000000.00, 'I.8411.22.02.1000.243.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(271, 22243101, 'Pembuatan T-Plate DDCC PLTU Suralaya 8', NULL, '2022-07-29', '2022-10-31', 115000000.00, 'I.8411.22.02.1000.247.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(272, 22242101, 'Pembuatan Travelling Band Screen Segment PLTU Banten 1 Suralaya', NULL, '2022-07-28', '2022-10-24', 1100000000.00, 'I.8411.22.02.1000.246.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(273, 22241101, 'Pembuatan 2 Set Inner Cone Mill PLTU  Banten 1 Suralaya OMU ', NULL, '2022-07-27', '2022-10-14', 690000000.00, 'I.8411.22.02.1000.245.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(274, 22236101, 'Pembuatan 2 Set Damper Primary Air Fan Unit 2 PLTU Pangkalan Susu OMU', NULL, '2022-07-27', '2022-10-11', 471000000.00, 'I.8411.22.02.9991.232.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(275, 22228101, 'Pengadaan dan Pemasangan 1 (Satu) Set Mesin Fasilitas Co-Firing (BBJP Plant) PLN UIW Bangka Belitung', NULL, '2022-07-27', '2022-11-06', 690000000.00, 'I.8411.22.19.6600.264.60', NULL, NULL, 'Penugasan', 32, 'Completed', NULL, NULL, NULL, NULL),
(276, 22227101, 'Reverse Engineering Short Scrapper PLTU Labuan', NULL, '2022-07-29', '2022-10-31', 29000000.00, 'I.8411.22.02.1000.261.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(277, 22226101, 'Reverse Engineering 4 (Empat) Pcs Long Scrapper PLTU Labuan', NULL, '2022-07-29', '2022-10-31', 45000000.00, 'I.8411.22.02.1000.262.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(278, 22225101, 'Reverse Engineering Rebuild 3 (Tiga) Pcs Rollwheel (Journal Shaft) PLTU Labuan', NULL, '2022-07-29', '2023-05-15', 375000000.00, 'I.8411.22.02.1000.259.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(279, 22224101, 'Reverse Engineering Pyrite box PLTU Labuan', NULL, '2022-07-26', '2022-09-30', 675000000.00, 'I.8411.22.02.1000.260.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(280, 22223101, 'Reverse Engineering Tyre Inner - Outer dan Modifikasi Lock Tyre PLTU Labuan', NULL, '2022-07-26', '2022-11-30', 1090000000.00, 'I.8411.22.02.1000.017.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(281, 22222101, 'Reverse Engineering Rebuild 2 (Dua) Pcs Rollwheel (Journal Shaft) PLTU Labuan', NULL, '2022-07-29', '2022-10-31', 250000000.00, 'I.8411.22.02.1000.257.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(282, 22221101, 'Reverse Engineering 2 (Dua) Pcs Long Scrapper PLTU Labuan', NULL, '2022-07-29', '2022-10-31', 22500000.00, 'I.8411.22.02.1000.258.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(283, 22219101, 'Reverse Engineering Journal Head PLTU Labuan', NULL, '2022-08-05', '2023-01-31', 47000000.00, 'I.8411.22.02.1000.256.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(284, 22218101, 'Reverse Engineering Bull Ring Segment PLTU Labuan', NULL, '2022-08-05', '2023-01-31', 200000000.00, 'I.8411.22.02.1000.255.60', NULL, NULL, 'Penugasan', 7, 'Completed', NULL, NULL, NULL, NULL),
(285, 22215101, 'Jasa Rekondisi Tyre Dan Grs Mill Unit 1-7 (Kontrak Payung Tahun 2022) (PO THP 4)', NULL, '2022-07-25', '2022-08-21', 284000000.00, 'I.8411.22.02.9991.242.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(286, 22204101, 'Pengadaan Inner Part, Pilot Valve dan Perapat Recirculation Valve BFP', NULL, '2022-07-11', '2022-10-14', 570900000.00, 'I.8411.22.02.9991.220.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(287, 22195101, 'Pembuatan 200 Pcs Long Tube Nozzle Furnace PLTU Nagan Raya', NULL, '2022-07-07', '2022-09-26', 765000000.00, 'I.8411.22.02.2000.217.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(288, 22194102, 'Penugasan Supervisi dan Pengiriman 2 Pcs Yoke Mill PLTU Pangkalan Susu Unit 1', NULL, '2022-08-01', '2023-04-12', 200000000.00, 'I.8411.23.02.9991.027.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(289, 22194101, 'Penugasan Supervisi dan Pengiriman 1 Pcs Yoke Mill PLTU Pangkalan Susu Unit 2', NULL, '2022-08-01', '2023-04-12', 100000000.00, 'I.8411.22.02.9991.272.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(290, 22193101, 'Penugasan Pembuatan 3 Pcs Grinding Tyre Mill PLTU Pangkalan Susu 1-2', NULL, '2022-08-03', '2023-04-12', 200100000.00, 'I.8411.22.02.9991.300.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(291, 22192101, 'Penugasan Pembuatan 4 Set Grinding Table PLTU Pangkalan Susu 3-4', NULL, '2022-08-03', '2023-01-16', 265000000.00, 'I.8411.22.02.9991.297.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(292, 22191101, 'Penugasan Pembuatan 6 Pcs Grinding Tyre Mill PLTU Pangkalan Susu 3-4', NULL, '2022-08-03', '2023-03-17', 495000000.00, 'I.8411.22.02.9991.299.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(293, 22190101, 'Penugasan Pembuatan 3 Set Grinding Table Mill PLTU Pangkalan Susu 1-2', NULL, '2022-08-03', '2023-04-12', 186000000.00, 'I.8411.22.02.9991.298.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(294, 22188101, 'Repair Inner Diameter 1 Buah Grinding Tyre PLTU Suralaya 8', NULL, '2022-07-04', '2022-08-02', 56000000.00, 'I.8411.22.02.1000.214.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(295, 22187101, 'Pekerjaan Repair dan Fabrikasi Part TBS PLTGU Cilegon', NULL, '2022-07-06', '2022-09-01', 350000000.00, 'I.8411.22.06.1000.218.60', NULL, NULL, 'Penugasan', 17, 'Completed', NULL, NULL, NULL, NULL),
(296, 22178101, 'Penugasan Jasa Rekondisi Tyre Dan Grs Mill Unit 1-7 (Kontrak Payung Tahun 2022) (PO THP 3)', NULL, '2022-06-23', '2022-08-16', 284000000.00, 'I.8411.22.02.9991.203.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(297, 22177101, 'Penugasan Pembuatan 2 Set Impeller ID Fan PLTU Tanjung Balai Karimun', NULL, '2022-06-24', '2022-09-12', 615000000.00, 'I.8411.22.02.2000.151.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(298, 22176103, 'Penugasan Pembuatan (Termin 3) 1 Pcs Grinding Roll PLTU Tanjung Awar - Awar', NULL, '2022-08-10', '2022-10-15', 217560000.00, 'I.8411.22.02.1000.209.60', NULL, NULL, 'Penugasan', 23, 'Completed', NULL, NULL, NULL, NULL),
(299, 22176102, 'Penugasan Machining (Termin 2) 3 buah Grinding Roll PLTU Tanjung Awar - Awar', NULL, '2022-07-01', '2022-07-30', 83250000.00, 'I.8411.22.02.1000.209.60', NULL, NULL, 'Penugasan', 23, 'Completed', NULL, NULL, NULL, NULL),
(300, 22176101, 'Penugasan Machining (Termin 1) 3 buah Grinding Roll PLTU Tanjung Awar - Awar', NULL, '2022-06-22', '2022-07-10', 83250000.00, 'I.8411.22.02.1000.209.60', NULL, NULL, 'Penugasan', 23, 'Completed', NULL, NULL, NULL, NULL),
(301, 22175101, 'Penugasan Supervisi Pembuatan 700 Pcs Nozzle Furnace PLTU Nagan Raya', NULL, '2022-06-22', '2022-09-04', 44500000.00, 'I.8411.22.02.2000.029.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(302, 22173102, 'Penugasan Pembuatan 10 Set Elbow Coal Pipe R1250 PLTU Indramayu (Termin II)', NULL, '2022-07-13', '2022-10-08', 1010499600.00, 'I.8411.22.02.1000.221.60', NULL, NULL, 'Penugasan', 14, 'Completed', NULL, NULL, NULL, NULL),
(303, 22173101, 'Penugasan Pembuatan 10 Set Elbow Coal Pipe R1250 PLTU Indramayu (Termin I)', NULL, '2022-07-06', '2022-09-18', 1010499600.00, 'I.8411.22.02.1000.221.60', NULL, NULL, 'Penugasan', 14, 'Completed', NULL, NULL, NULL, NULL),
(304, 22172101, 'Penugasan Pembuatan 20 buah Long Scrapper PLTU Lontar', NULL, '2022-06-17', '2022-07-20', 270000000.00, 'I.8411.22.02.1000.199.60', NULL, NULL, 'Penugasan', 12, 'Completed', NULL, NULL, NULL, NULL),
(305, 22171102, 'Penugasan Rekondisi 12 bh Grinding Tyre PLTU Lontar (Tahap II)', NULL, '2022-08-16', '2022-12-15', 720000000.00, 'I.8411.22.02.1000.155.60', NULL, NULL, 'Penugasan', 12, 'Completed', NULL, NULL, NULL, NULL),
(306, 22171101, 'Penugasan Rekondisi 6 bh Grinding Tyre PLTU Lontar (Tahap I)', NULL, '2022-06-20', '2022-08-15', 360000000.00, 'I.8411.22.02.1000.155.60', NULL, NULL, 'Penugasan', 12, 'Completed', NULL, NULL, NULL, NULL),
(307, 22170101, 'Penugasan Pembuatan 4 buah Cover Cooler Generator PLTU Teluk Sirih', NULL, '2022-06-10', '2022-06-25', 19000000.00, 'I.8411.22.02.2100.196.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(308, 22168101, 'Penugasan Jasa Rekondisi Tyre Dan Grs Mill Unit 1-7 (Kontrak Payung Tahun 2022) (PO THP 2)', NULL, '2022-06-15', '2022-07-12', 284000000.00, 'I.8411.22.02.9991.195.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(309, 22167101, 'Fabrikasi dan Pemasangan  Mesin Fasilitas Co - firing PLTU Ampana 1 unit dan PLTU Anggrek 1 Unit', NULL, '2022-06-21', '2022-08-02', 64600000.00, 'I.8411.22.02.2500.111.60', NULL, NULL, 'Penugasan', 39, 'Completed', NULL, NULL, NULL, NULL),
(310, 22166101, 'Perbaikan Gate Intake CWP PLTU Banten 1 Suralaya OMU', NULL, '2022-06-15', '2022-07-21', 142000000.00, 'I.8411.22.02.1000.194.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(311, 22158101, 'Penugasan Jasa rekondisi 3 (Tiga) buah Grinding Tyre Mill PLTU Suralaya 8 (Termin II)', NULL, '2022-06-06', '2022-07-12', 157000000.00, 'I.8411.22.02.1000.186.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(312, 22155101, 'Penugasan Pembuatan 3 buah Grinding Tyre PLTU Pelabuhan Ratu', NULL, '2022-06-15', '2022-09-30', 720000000.00, 'I.8411.22.02.1000.191.60', NULL, NULL, 'Penugasan', 10, 'Completed', NULL, NULL, NULL, NULL),
(313, 22146101, 'DED Water Intake PLTU Sebalang', NULL, '2022-06-15', '2022-10-06', 332000000.00, 'I.8411.21.02.2100.308.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(314, 22127101, 'Penugasan Pekerjaan Pemasangan Panel On Shore Charging Kapal BAG Tarahan', NULL, '2022-05-18', '2022-07-26', 1129000000.00, 'I.8411.22.09.9994.057.60', NULL, NULL, 'Penugasan', 20, 'Completed', NULL, NULL, NULL, NULL),
(315, 22121101, 'Pembutan 3 (tiga) buah Grinding Roll PLTU Bukit Asam Unit 3-4', NULL, '2022-05-10', '2022-09-29', 363720000.00, 'I.8411.21.02.2100.328.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(316, 22120101, 'Pembuatan 52 Pcs Linkage TBS PLTU Pelabuhan Ratu', NULL, '2022-04-27', '2022-09-30', 285000000.00, 'I.8411.22.02.1000.130.60', NULL, NULL, 'Penugasan', 10, 'Completed', NULL, NULL, NULL, NULL),
(317, 22113101, 'Fabrikasi dan Pemasangan 1 set Mesin Co-Firing UPK Singkawang', NULL, '2022-05-26', '2022-10-31', 386000000.00, 'I.8411.22.02.6800.158.60', NULL, NULL, 'Penugasan', 21, 'Completed', NULL, NULL, NULL, NULL),
(318, 22103101, ' Pembuatan 300 Pcs Nozzle Furnace PLTU Nagan Raya', NULL, '2022-04-26', '2022-06-07', 339300000.00, 'I.8411.22.02.2000.128.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(319, 22089101, 'Penugasan Pembuatan 1 Set Inner Cone Mill PLTU  Banten 1 Suralaya OMU', NULL, '2022-04-12', '2022-06-30', 347000000.00, 'I.8411.22.02.1000.110.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(320, 22086101, 'Pembuatan 3 set Journal Housing Liner New Design PLTU Pelabuhan Ratu', NULL, '2022-04-12', '2022-05-31', 87000000.00, 'I.8411.22.02.1000.107.60', NULL, NULL, 'Penugasan', 10, 'Completed', NULL, NULL, NULL, NULL),
(321, 22083101, 'Penugasan Pengadaan dan Pemasangan 1 set Mesin Co-Firing UPDK Balikpapan', NULL, '2022-05-09', '2022-06-11', 205000000.00, 'I.8411.22.02.2400.143.60', NULL, NULL, 'Penugasan', 21, 'Completed', NULL, NULL, NULL, NULL),
(322, 22081101, 'Penugasan Jasa Rekondisi 3 (Tiga) buah Grinding Tyre Mill PLTU Suralaya 8', NULL, '2022-04-08', '2022-05-01', 138500000.00, 'I.8411.22.02.1000.102.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(323, 22080101, 'Penugasan Rebuild Journal Shaft dan Housing Pulverizer PLTU Suralaya 8', NULL, '2022-04-12', '2022-07-07', 193000000.00, 'I.8411.22.02.1000.106.60', NULL, NULL, 'Penugasan', 4, 'Completed', NULL, NULL, NULL, NULL),
(324, 22061101, 'Pekerjaan Penggantian Rel Trash Rack Intake PLTA Tes', NULL, '2022-04-06', '2022-07-17', 140000000.00, 'I.8411.22.01.2100.089.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(325, 22059101, 'Penugasan Supervisi dan Pengiriman Embeded Plat Relokasi PLTG Grati ', NULL, '2022-03-21', '2022-04-06', 71000000.00, 'I.8411.22.04.9990.087.60', NULL, NULL, 'Penugasan', 33, 'Completed', NULL, NULL, NULL, NULL),
(326, 22046102, 'Pemasangan 1 (Satu) Set Mesin Fasilitas Co-Firing PLTU Pangkalan Susu', NULL, '2022-07-01', '2022-10-10', 111144000.00, 'I.8411.22.02.2000.058.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(327, 22046101, 'Pengadaan 1 (Satu) Set Mesin Fasilitas Co-Firing PLTU Pangkalan Susu (Tahap 1 - Pengadaan &amp; Pengiriman)', NULL, '2022-03-17', '2022-07-01', 298258000.00, 'I.8411.22.02.2000.058.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(328, 22045102, 'Pemasangan 1 (Satu) Set Mesin Fasilitas Co-Firing PLTU Tenayan Raya', NULL, '2022-07-01', '2022-10-10', 111144000.00, 'I.8411.22.02.2000.071.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(329, 22045101, 'Pengadaan 1 (Satu) Set Mesin Fasilitas Co-Firing PLTU Tenayan Raya (Tahap 1 - Pengadaan &amp; pengiriman)', NULL, '2022-03-17', '2022-07-01', 327808000.00, 'I.8411.22.02.2000.071.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(330, 22043102, 'Rekondisi 4 buah Inner Diameter Grinding Tyre Mill PLTU Lontar (Tahap II)', NULL, '2022-10-26', '2022-12-15', 265583076.00, 'I.8411.22.02.1000.063.60', NULL, NULL, 'Penugasan', 12, 'Completed', NULL, NULL, NULL, NULL),
(331, 22043101, 'Penugasan Rekondisi 2 buah Inner Diameter Grinding Tyre Mill PLTU Lontar', NULL, '2022-03-14', '2022-04-26', 130000000.00, 'I.8411.22.02.1000.063.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(332, 22036102, 'Perbaikan Penugasan Grinding Tyre PLTU Labuan', NULL, '2022-04-28', '2022-06-17', 1.00, NULL, NULL, NULL, 'Penugasan', 24, 'Completed', NULL, NULL, NULL, NULL),
(333, 22036101, 'Penugasan Rekondisi Grinding Tyre PLTU Adipala Tahun 2022', NULL, '2022-02-23', '2022-05-31', 485000000.00, 'I.8411.22.02.1000.045.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(334, 22026101, 'Repeat Order Pembuatan 12 set Journal Housing Liner PLTU Pelabuhan Ratu', NULL, '2022-02-14', '2022-05-31', 144000000.00, 'I.8411.22.02.1000.037.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(335, 22025101, 'Repeat Order Pembuatan Screen TBS PLTU Pelabuhan Ratu', NULL, '2022-02-21', '2022-09-30', 1465000000.00, 'I.8411.22.02.1000.036.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(336, 22024101, 'Repeat Order Pembuatan 10 buah Short Scrapper PLTU Pelabuhan Ratu', NULL, '2022-02-14', '2022-05-31', 96500000.00, 'I.8411.22.02.1000.033.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(337, 22023101, 'Repeat Order Pembuatan 10 buah Long Scrapper PLTU Pelabuhan Ratu', NULL, '2022-02-14', '2022-05-31', 105000000.00, 'I.8411.22.02.1000.032.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(338, 22022101, 'Penugasan Repeat Order Pembuatan 150 set Scrapper SSC PLTU Pelabuhan Ratu', NULL, '2022-02-21', '2022-06-15', 447000000.00, 'I.8411.22.02.1000.031.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(339, 22021101, 'Repeat Order Rekondisi 36 buah Grinding Tyre PLTU Pelabuhan Ratu', NULL, '2022-02-21', '2023-02-03', 1666000000.00, 'I.8411.22.02.1000.030.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(340, 22019101, 'Penugasan Jasa Rekondisi Tyre dan Grs Mill Suralaya Unit 1-7 (Kontrak Payung Tahun 2022) PO Tahap I', NULL, '2022-02-14', '2022-03-16', 291500000.00, 'I.8411.22.02.9991.026.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(341, 22003101, 'Penugasan Rekondisi Grinding Table / GRS PLTU Adipala', NULL, '2022-01-17', '2022-03-27', 196000000.00, 'I.8411.22.02.1000.004.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(342, 21318101, 'Rekondisi 6 Buah Grinding Tyre Mill PLTU Lontar (AO 2022)', NULL, '2021-11-23', '2022-03-31', 395000000.00, 'I.8411.21.02.1000.303.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(343, 21316101, 'Pekerjaan Pemasangan 1 Set Cone Mill PLTU Suralaya 8', NULL, '2021-11-10', '2021-11-30', 140000000.00, 'I.8411.21.02.1000.293.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(344, 21311101, 'Penugasan Pekerjaan Perbaikan Fender Jetty PLTU Teluk Sirih', NULL, '2021-11-21', '2023-10-31', 500000000.00, 'I.8411.21.02.2100.302.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(345, 21302101, 'Pengadaan Inner Parts Semester I, Pilot Valve dan Perapat Reciculation Valve BFP Unit 1-4 Suralaya Tahun 2022', NULL, '2021-11-06', '2022-02-01', 1363000000.00, 'I.8411.21.02.9991.289.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(346, 21298101, 'Perbaikan Flash Gate Headpon PLTA Musi', NULL, '2021-10-29', '2023-07-31', 330000000.00, 'I.8411.21.01.2100.285.60', NULL, NULL, 'Penugasan', 5, 'BAPP', NULL, NULL, NULL, NULL),
(347, 21286101, 'Rekondisi 2 Buah Inner Diameter Grinding Tyre PLTU Lontar', NULL, '2021-10-09', '2021-10-31', 130000000.00, 'I.8411.21.02.1000.267.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(348, 21269101, 'Pekerjaan Pembuatan Impeller CWP PLTU Sebalang', NULL, '2021-09-25', '2021-12-15', 219784800.00, 'I.8411.21.02.2100.007.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(349, 21263101, 'Penugasan Pembuatan 12 Pcs Travelling Band Screen Segment PLTU Suralaya 8', NULL, '2021-09-10', '2021-12-24', 660000000.00, 'I.8411.21.02.1000.237.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(350, 21257101, 'Penugasan Jasa Rekondisi Grinding Tyre dan GRS Mill Unit 1-7 (PO Tahap 6)', NULL, '2021-09-13', '2021-10-14', 284000000.00, 'I.8411.21.02.9991.236.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(351, 21255101, 'Pengadaan Inner Parts Recirculation Valve dan Guide Pin Variable Speed Coupling BFP Unit 1-4', NULL, '2021-09-17', '2021-11-30', 826000000.00, 'I.8411.21.02.9991.244.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(352, 21254101, 'Penugasan Rekondisi 3 Buah Grinding Roll PLTU Pangkalan Susu 1-2', NULL, '2021-09-10', '2021-10-10', 450000000.00, 'I.8411.21.02.2000.235.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(353, 21252101, 'Pembuatan 10 Buah Long Scrapper PLTU Labuan', NULL, '2021-09-12', '2021-11-29', 88000000.00, 'I.8411.21.02.1000.283.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(354, 21251101, 'Pembuatan 12 Buah Short Scrapper PLTU Labuan', NULL, '2021-09-12', '2021-11-29', 78000000.00, 'I.8411.21.02.1000.234.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(355, 21243101, 'Rekondisi Grinding Tyre PLTU Lontar Tahap 3 (6 Pcs)', NULL, '2021-09-03', '2021-12-30', 319000000.00, 'I.8411.21.02.1000.216.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(356, 21228101, 'Pembuatan Prototipe Bidang Pembangkitan - BELING', NULL, '2021-08-27', '2021-10-03', 15163000.00, 'I.8411.21.16.8100.211.60', NULL, NULL, 'Penugasan', 22, 'Completed', NULL, NULL, NULL, NULL),
(357, 21226101, 'Pembuatan Prototipe Bidang Pembangkitan - HOT AND MIX AIR DAMPER', NULL, '2021-08-30', '2021-11-17', 19322000.00, 'I.8411.21.16.8100.211.60', NULL, NULL, 'Penugasan', 22, 'Completed', NULL, NULL, NULL, NULL),
(358, 21213101, 'Jasa Rekondisi Grinding Tyre dan GRS Mill PLTU Suralaya Unit 1-7 (PO Tahap 5)', NULL, '2021-08-15', '2021-09-13', 282000000.00, 'I.8411.21.02.9991.204.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(359, 21188101, 'Pembuatan Part TBS PLTU Pelabuhan Ratu 2021', NULL, '2021-08-10', '2021-12-10', 1840000000.00, 'I.8411.21.02.1000.181.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(360, 21187101, 'Penugasan Pengadaan 150 set Scrapper SSC PLTU Pelabuhan Ratu', NULL, '2021-08-11', '2021-12-10', 450000000.00, 'I.8411.21.02.1000.182.60', NULL, NULL, 'Penugasan', 9, 'Completed', NULL, NULL, NULL, NULL),
(361, 21186101, 'Penugasan Pembuatan Lifting Stoplog PLTU Pelabuhan Ratu', NULL, '2021-08-09', '2021-12-10', 165000000.00, 'I.8411.21.02.1000.183.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(362, 21182101, 'Penugasan Pembuatan Produk Karya Inovasi Delta Step Bolt 761 Unit UIT JBB', NULL, '2021-08-06', '2021-10-24', 272000000.00, 'I.8411.21.16.2200.179.60', NULL, NULL, 'Penugasan', 28, 'Completed', NULL, NULL, NULL, NULL),
(363, 21170101, 'Pekerjaan Pengadaan Material Tyre &amp; Grinding Ring Segment Pulverizer unit 5-7', NULL, '2021-07-18', '2021-12-27', 1350000000.00, 'I.8411.21.02.9991.159.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(364, 21169101, 'Penugasan Pembuatan 20 Buah Long Scrapper PLTU Lontar', NULL, '2021-07-15', '2021-10-11', 270000000.00, 'I.8411.21.02.1000.160.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(365, 21166101, 'Supervisi dan Administrasi Jasa Assessment dan Pembuatan TOR,BOQ, Basic Drawing Fender Jetty PLTU Teluk Sirih (Administrasi)', NULL, '2021-08-11', '2021-10-22', 24982156.00, 'I.8411.21.02.2100.162.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(366, 21165101, 'Penugasan Pekerjaan Perbaikan dan Pemasangan Fender Jetty PLTU Sebalang', NULL, '2021-07-26', '2022-01-26', 1997865000.00, 'I.8411.21.02.2100.163.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(367, 21164101, 'Penugasan Pembuatan 10 Buah Screen TBS PLTU Pelabuhan Ratu', NULL, '2021-07-12', '2021-11-19', 345000000.00, 'I.8411.21.02.1000.164.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(368, 21162101, 'Penugasan Rekondisi 4 Buah Grinding Roll PLTU Pangkalan Susu 1-2', NULL, '2021-07-05', '2021-09-16', 415000000.00, 'I.8411.21.02.2000.156.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(369, 21161101, 'Penugasan Rekondisi 3 Set Grinding Table PLTU Pangkalan Susu 1-2', NULL, '2021-07-05', '2021-09-17', 375000000.00, 'I.8411.21.02.2000.157.60', NULL, NULL, 'Penugasan', 6, 'Completed', NULL, NULL, NULL, NULL),
(370, 21160101, 'Pembuatan 8 Buah Coal Burner Assembly PLTU Labuan  Unit 1', NULL, '2021-07-09', '2022-01-06', 2260000000.00, 'I.8411.21.02.9991.003.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(371, 21143101, 'Repair Inner Diameter 2 Buah Grinding Tyre PLTU Suralaya 8', NULL, '2021-06-21', '2021-07-30', 121000000.00, 'I.8411.21.02.1000.144.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(372, 21142101, 'Penugasan Rekondisi 6 Buah Grinding Tyre PLTU Suralaya 8', NULL, '2021-06-21', '2021-07-30', 310000000.00, 'I.8411.21.02.1000.143.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(373, 21137101, 'Penugasan Jasa Rekondisi Grinding Tyre dan GRS Mill Unit 1-7 (PO Tahap 4)', NULL, '2021-06-10', '2021-07-07', 285000000.00, 'I.8411.21.02.9991.131.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(374, 21107101, 'Penugasan Perbaikan 77 set Scrapper SSC PLTU Pelabuhan Ratu', NULL, '2021-06-02', '2021-06-30', 240000000.00, 'I.8411.21.02.1000.115.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(375, 21106101, 'Pembuatan 2 buah Pyrite Box PLTU Pelabuhan Ratu', NULL, '2021-06-02', '2021-06-30', 186000000.00, 'I.8411.21.02.1000.116.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(376, 21105101, 'Repair Inner Diameter Grinding Tyre PLTU Pelabuhan Ratu', NULL, '2021-05-31', '2021-07-14', 195000000.00, 'I.8411.21.02.1000.117.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(377, 21102102, 'Penugasan Rekondisi 3 (Tiga) Buah Grinding Tyre PLTU Lontar (Tahap 3)', NULL, '2021-06-02', '2021-07-21', 165000000.00, 'I.8411.21.02.1000.118.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(378, 21102101, 'Penugasan Rekondisi 3 (Tiga) Buah  Grinding Tyre PLTU Lontar (Tahap 2) ', NULL, '2021-06-02', '2021-06-25', 165000000.00, 'I.8411.21.02.1000.118.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(379, 21092101, 'PENUGASAN PENGADAAN PART CRUSHER COAL ASH HANDLING PLTU TARAHAN UNIT 3 DAN 4 TAHUN 2021 ', NULL, '2021-06-10', '2021-10-29', 1274000000.00, 'I.8411.21.02.2100.113.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(380, 21091101, 'Penugasan Pembuatan 180 set Scrapper SSC PLTU Pelabuhan Ratu', NULL, '2021-05-28', '2021-09-17', 674000000.00, 'I.8411.21.02.1000.107.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(381, 21077101, 'Penugasan Rekondisi 5 Buah Grinding Roll UPK Ombilin (CANCEL)', NULL, '2021-05-03', '2021-10-15', 0.00, 'I.8411.21.02.2100.126.60', NULL, NULL, 'Penugasan', 5, 'BAPP', NULL, NULL, NULL, NULL),
(382, 21076101, 'Jasa Rekondisi Tyre dan GRS Mill Unit 1-7 (PO Tahap 3)', NULL, '2021-05-03', '2021-06-06', 287380000.00, 'I.8411.21.02.9991.114.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(383, 21063101, 'Penugasan Tetap Pengadaan Perbaikan Frame Trash Bar Screen PLTGU Cilegon', NULL, '2021-04-14', '2021-06-11', 214000000.00, 'I.8411.21.06.1000.083.60', NULL, NULL, 'Penugasan Tetap', 2, 'Completed', NULL, NULL, NULL, NULL),
(384, 21059103, 'Penugasan 20 Buah Rekondisi Grinding Tyre PLTU Pelabuhan Ratu (Termin 3)', NULL, '2021-04-23', '2021-10-29', 918000000.00, 'I.8411.21.02.1000.073.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(385, 21059102, 'Penugasan 10 Buah Rekondisi Grinding Tyre PLTU Pelabuhan Ratu (Termin 2)', NULL, '2021-04-16', '2021-05-28', 459000000.00, 'I.8411.21.02.1000.073.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(386, 21059101, 'Penugasan 10 Buah Rekondisi Grinding Tyre PLTU Pelabuhan Ratu (Termin 1) ', NULL, '2021-04-09', '2021-04-30', 459000000.00, 'I.8411.21.02.1000.073.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(387, 21058102, 'Penugasan Repeat Order 17 buah Short Scrapper PLTU Pelabuhan Ratu (Termin 2)', NULL, '2021-04-23', '2021-10-29', 170000000.00, 'I.8411.21.02.1000.074.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(388, 21058101, 'Penugasan Repeat Order 18 buah Short Scrapper PLTU Pelabuhan Ratu (Termin 1)', NULL, '2021-04-09', '2021-05-28', 180000000.00, 'I.8411.21.02.1000.074.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(389, 21057102, 'Repeat Order 18 buah Long Scrapper PLTU Pelabuhan Ratu (Termin 2)', NULL, '2021-04-09', '2021-10-29', 194400000.00, 'I.8411.21.02.1000.075.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(390, 21057101, 'Repeat Order 18 buah Long Scrapper PLTU Pelabuhan Ratu (Termin 1)', NULL, '2021-04-09', '2021-05-28', 194400000.00, 'I.8411.21.02.1000.075.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(391, 21056102, 'Penugasan Repeat Order Pembuatan Journal Part Mill PLTU Pelabuhan Ratu (Termin 2)', NULL, '2021-04-09', '2021-10-29', 1011000000.00, 'I.8411.21.02.1000.078.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(392, 21056101, 'Penugasan Repeat Order Pembuatan Journal Part Mill PLTU Pelabuhan Ratu (Termin 1)', NULL, '2021-04-09', '2021-06-30', 1244000000.00, 'I.8411.21.02.1000.078.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(393, 21054101, 'Penugasan Repeat Order Pembuatan 3 Unit Pyrite Box PLTU Pelabuhan Ratu', NULL, '2021-04-09', '2021-05-31', 271500000.00, 'I.8411.21.02.1000.079.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(394, 21045101, 'Penugasan Rekondisi Grinding Tyre PLTU Adipala', NULL, '2021-04-03', '2021-07-01', 965000000.00, 'I.8411.21.02.1000.060.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(395, 21039101, 'PO Tahap 2 Jasa Rekondisi Tyre dan GRS Mill PLTU Suralaya 1-7 Tahun 2021', NULL, '2021-03-20', '2021-04-19', 287380000.00, 'I.8411.21.02.9991.051.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(396, 21022101, 'Penugasan Pekerjaan Pengadaan Spare Part Mechanical Seal PLTA Tes', NULL, '2021-03-09', '2021-10-15', 225000000.00, 'I.8411.21.01.2100.036.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(397, 21021101, 'Penugasan  Pekerjaan Penggantian Plat Membran Fluidizing Damper, Rubber Seal Ash Veyor ET 3,4,5 Froup Ash Handling Unit 3&amp;4 dan Part Hammer Crusher PLTU Tarahan', NULL, '2021-03-09', '2021-07-12', 632000000.00, 'I.8411.21.02.2100.037.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(398, 21014101, 'PO Tahap I Jasa Rekondisi Tyre dan GRS Mill PLTU Suralaya 1-7', NULL, '2021-02-08', '2021-04-12', 574762920.00, 'I.8411.21.02.9991.019.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(399, 21013101, 'Penugasan Rekondisi 3 Buah Grinding Tyre (Rekomposisi 2020) dan 3 Buah Grinding Tyre (Murni 2021) PLTU Lontar', NULL, '2021-02-10', '2021-04-02', 232507667.00, 'I.8411.21.02.9991.013.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(400, 21012101, 'Penugasan Pemasangan 2 Set Inner Cone Mill PLTU Suralaya 8', NULL, '2021-02-03', '2021-03-06', 279000000.00, 'I.8411.21.02.9991.012.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(401, 21011101, 'Rekondisi &amp; Repair Inner Diameter 1 buah Grinding Tyre PLTU Suralaya 8', NULL, '2021-01-25', '2021-02-19', 118000000.00, 'I.8411.21.02.9991.011.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(402, 21009101, 'Repeat Order Short Scrapper PLTU Pelabuhan Ratu (Rekomposisi)', NULL, '2021-01-25', '2021-03-05', 120000000.00, 'I.8411.21.02.1000.018.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(403, 21008101, 'Repeat Order Pembuatan Long Scrapper PLTU Pelabuhan Ratu (Rekomposisi)', NULL, '2021-01-25', '2021-03-05', 129000000.00, 'I.8411.21.02.1000.017.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(404, 20206101, 'Pekerjaan RE Pembuatan Elbow Outlet dan Inlet Heat Exchanger PLTU Suralaya 8', NULL, '2020-12-23', '2021-02-05', 427322466.00, 'I.8411.20.02.1000.256.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(405, 20204101, 'Pekerjaan RE Pembuatan 20 Buah Travelling Band Screen (TBS) PLTU Suralaya 8', NULL, '2020-12-23', '2021-02-16', 1100000000.00, 'I.8411.20.02.1000.257.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(406, 20203101, 'Penugasan Tetap Pekerjaan RE Pembuatan 10 buah Long Scrapper PLTU Lontar', NULL, '2021-03-03', '2021-05-23', 135000000.00, 'I.8411.21.02.1000.028.60', NULL, NULL, 'Penugasan Tetap', 2, 'Completed', NULL, NULL, NULL, NULL),
(407, 20202101, 'Penugasan Tetap Pekerjaan Rekondisi 3 Buah Grinding Tyre PLTU Lontar', NULL, '2021-03-16', '2021-04-16', 165000000.00, 'I.8411.21.02.1000.029.60', NULL, NULL, 'Penugasan Tetap', 2, 'Completed', NULL, NULL, NULL, NULL),
(408, 20184101, 'Rekondisi 6 (Enam) Buah Grinding Tyre PLTU Labuan', NULL, '2020-11-22', '2021-01-03', 366000000.00, 'I.8411.20.02.2100.227.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(409, 20177101, 'Penugasan Repeat Order Rekondisi Grinding Tyre PLTU Pelabuhan Ratu ', NULL, '2020-11-20', '2021-02-26', 840807000.00, 'I.8411.20.02.1000.220.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(410, 20176101, 'Penugasan Pengadaan Material Pilot Valve ARV BFP PLTU Suralaya Unit 1-4', NULL, '2020-11-23', '2021-04-05', 406800000.00, 'I.8411.20.02.9991.221.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(411, 20175101, 'Penugasan Jasa Fabrikasi dan Pemasangan Screen TC 05A Coal Handling PLTU Suralaya 1-7', NULL, '2020-11-09', '2020-12-26', 348084000.00, 'I.8411.20.02.9991.218.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(412, 20174101, 'Pengadaan Control Head &amp; Pilot Valve ARV PLTU Suralaya Unit 3-4', NULL, '2020-11-09', '2020-12-16', 273933000.00, 'I.8411.20.02.9991.219.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(413, 20172101, 'Penugasan Pekerjaan RE Pembuatan 1 Set Elbow Outlet Strainer PLTU Suralaya 8', NULL, '2020-10-26', '2020-12-18', 198500000.00, 'I.8411.20.02.1000.215.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(414, 20168101, 'Penugasan Pembuatan 1 Set Pyrite Box Mill PLTU Suralaya 8', NULL, '2020-10-24', '2020-12-18', 99500000.00, 'I.8411.20.02.1000.211.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(415, 20167101, 'Penugasan Rebuild 1 Buah Journal Shaft Pulverizer PLTU Suralaya 8', NULL, '2020-10-24', '2020-11-30', 96000000.00, 'I.8411.20.02.1000.210.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(416, 20166101, 'Penugasan Rebuild 2 Buah Journal Housing Pulverizer PLTU Suralaya 8', NULL, '2020-10-24', '2020-12-18', 245000000.00, 'I.8411.20.02.1000.209.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(417, 20165101, 'Penugasan Repair Inner Diameter 1 Buah Grinding Tyre PLTU Suralaya 8', NULL, '2020-10-24', '2020-12-18', 50000000.00, 'I.8411.20.02.1000.208.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(418, 20161101, 'Jasa Rekondisi Tyre dan GRS Mill PLTU Suralaya Unit 1-7 PO Tahap 4', NULL, '2020-10-19', '2020-11-17', 274100000.00, 'I.8411.20.02.9991.216.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(419, 20158101, 'Pekerjaan RE Travelling Band Screen (TBS) CWP PLTU Suralaya 8', NULL, '2020-10-02', '2020-10-31', 47112056.00, 'I.8411.20.02.1000.201.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(420, 20155101, 'Penugasan Rekondisi 2 (Dua) Buah Grinding Tyre PLTU Lontar', NULL, '2020-09-29', '2020-10-24', 108200000.00, 'I.8411.20.02.9991.199.60', NULL, NULL, 'Penugasan', 12, 'Completed', NULL, NULL, NULL, NULL),
(421, 20154101, 'Pengadaan Inner Part ARV BFP Unit 1-2 &amp; Adaptor ARV BFP Unit 1-4 PLTU Suralaya', NULL, '2020-10-05', '2020-12-14', 965000000.00, 'I.8411.20.02.9991.198.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(422, 20141101, 'Penugasan Pekerjaan Jasa Perbaikan dan Pemasangan Fender Jetty PLTU Sebalang', NULL, '2020-09-11', '2021-05-21', 2461000000.00, 'I.8411.20.02.2100.181.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(423, 20136101, 'Pekerjaan Pengadaan Erosion Shield, Difuser dan Deflector Burner PLTU Suralaya Unit 5', NULL, '2020-09-07', '2021-01-08', 566059000.00, 'I.8411.20.02.9991.172.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(424, 20128101, 'Jasa Rekondisi Tyre dan GRS Mill PLTU Suralaya Unit 1-7 PO Tahap 3', NULL, '2020-08-17', '2020-10-13', 548473000.00, 'I.8411.20.02.9991.163.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(425, 20127101, 'Pembuatan 3 Set Cone Inside Mill Pulverizer PLTU Suralaya 8', NULL, '2020-08-14', '2020-11-27', 798872920.00, 'I.8411.20.02.1000.161.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL);
INSERT INTO `penugasan` (`id`, `no_amp`, `nama_penugasan`, `no_surat_penugasan`, `tanggal_penugasan`, `batas_waktu_penugasan`, `nilai_penugasan`, `no_wbs`, `pic_ren`, `pic_mek`, `status_penugasan`, `id_customer`, `status_progress`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(426, 20126101, 'Pembuatan 18 Buah Long Scrapper PLTU Surayala 8', NULL, '2020-08-13', '2020-10-30', 283066564.00, 'I.8411.20.02.1000.160.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(427, 20110101, 'Pembuatan Blade PA Fan 34 buah PLTU Suralaya 8', NULL, '2020-06-19', '2020-11-20', 627612473.00, 'I.8411.20.02.1000.143.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(428, 20093101, 'Rekondisi 12 buah Grinding Tyre PLTU Suralaya 8', NULL, '2020-05-21', '2020-10-30', 348000000.00, 'I.8411.20.02.9991.126.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(429, 20080101, 'Jasa Rekondisi Tyre &amp; GRS PLTU Suralaya Unit 1-7 PO Tahap 2', NULL, '2020-04-30', '2020-08-08', 274200000.00, 'I.8411.20.02.9991.112.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(430, 20078101, 'Pembuatan 10 Set Rubber Seal Daily Silo PLTU Tarahan', NULL, '2020-05-02', '2020-09-14', 40500000.00, 'I.8411.20.02.2100.113.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(431, 20066102, 'Pembuatan 94 set T - Bar Sisi Laut Chain Grate PLTU Holtekamp', NULL, '2020-05-22', '2020-10-30', 92770000.00, 'I.8411.20.02.7600.103', NULL, NULL, 'Penugasan', 25, 'Completed', NULL, NULL, NULL, NULL),
(432, 20066101, 'Pembuatan 658 set L-Bar Chain Grate PLTU Holtekamp', NULL, '2020-04-27', '2020-10-30', 154950000.00, 'I.8411.20.02.7600.103.60', NULL, NULL, 'Penugasan', 25, 'Completed', NULL, NULL, NULL, NULL),
(433, 20064101, 'Penugasan Jasa Rekondisi Tyre dan GRS Mill Unit 1-7 PLTU Suralaya', NULL, '2020-04-10', '2020-04-30', 274200000.00, 'I.8411.20.02.9991.094.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(434, 20063101, 'Pengadaan Tire dan Grinding Ring Segmen Unit 5-7 PLTU Suralaya', NULL, '2020-04-21', '2020-08-21', 1120000000.00, 'I.8411.20.02.9991.095.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(435, 20053101, ' Pekerjaan Pembuatan Komponen Hammer Crusher dan Cage Bar For Rotor Mill PLTU Tarahan', NULL, '2020-04-08', '2020-09-14', 441000000.00, 'I.8411.20.02.2100.074.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(436, 20049101, 'Rekondisi 18 buah Grinding Roll PLTU Pelabuhan Ratu', NULL, '2020-04-03', '2020-07-06', 830000000.00, 'I.8411.20.02.1000.071.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(437, 20047101, 'Pembuatan 1400 Tripod Inlet Air Filter PLTGU Cilegon', NULL, '2020-04-06', '2020-10-23', 1600000000.00, 'I.8411.20.06.1000.070.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(438, 20044101, 'Pembuatan 36 Upper dan Lower Damper Fly Ash Valve PLTU Tarahan', NULL, '2020-04-02', '2020-06-30', 340163680.00, 'I.8411.20.02.2100.073.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(439, 20043101, 'Pembuatan 24 (Dua Puluh Empat) Set Membrance Fluidizing Type AV1-12 dan Type DAS PLTU Tarahan', NULL, '2020-03-30', '2020-06-30', 136000000.00, 'I.8411.20.02.2100.072.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(440, 20031101, 'Penugasan Tetap Rekondisi 12 buah Grinding Tyre PLTU Lontar', NULL, '2020-02-18', '2020-07-03', 486609320.00, 'I.8411.20.02.1000.047.60', NULL, NULL, 'Penugasan Tetap', 2, 'Completed', NULL, NULL, NULL, NULL),
(441, 20027101, 'Rekondisi 7 buah Grinding Tyre PLTU Ombilin', NULL, '2020-04-09', '2020-12-20', 480000000.00, 'I.8411.20.02.2100.056.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(442, 20017101, 'Rekondisi 3 (tiga) Buah Grinding Tyre PLTU Bukit Asam', NULL, '2020-02-14', '2020-10-30', 241728000.00, 'I.8411.20.02.2100.046.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(443, 20016101, 'Penugasan Tetap Repair Inner Diameter 5 Buah Grinding Tyre PLTU Lontar', NULL, '2020-01-27', '2020-07-03', 220467660.00, 'I.8411.20.02.1000.035.60', NULL, NULL, 'Penugasan Tetap', 2, 'Completed', NULL, NULL, NULL, NULL),
(444, 20007101, 'Penugasan Pembuatan 20 Buah Long Scrapper PLTU Lontar', NULL, '2020-01-16', '2020-04-09', 198591132.00, 'I.8411.20.02.1000.017.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(445, 19192108, 'Pembuatan Steel Support Current Transformer PT CPSI Tahap VIII', NULL, '2020-03-23', '2020-04-30', 19956715.00, 'I.8411.20.09.9996.069.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(446, 19192107, 'Pembuatan Steel Support Current Transformer PT CPSI Tahap VII', NULL, '2020-01-31', '2020-03-17', 175267400.00, 'I.8411.20.09.9996.036.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(447, 19192106, 'Pembuatan Steel Support Current Transformer PT CPSI Tahap VI', NULL, '2020-01-16', '2020-02-25', 261359250.00, 'I.8411.20.09.9996.020.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(448, 19192105, 'Pembuatan Steel Support Current Transformer PT CPSI Tahap V', NULL, '2020-01-16', '2020-02-25', 243234200.00, 'I.8411.20.09.9996.019.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(449, 19192104, 'Pembuatan Steel Support Current Transformer PT CPSI Tahap IV', NULL, '2020-01-16', '2020-02-25', 103899600.00, 'I.8411.20.09.9996.018.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(450, 19192103, 'Pembuatan Steel Support Current Transformer PT CPSI Tahap III', NULL, '2019-12-16', '2020-01-24', 193287000.00, 'I.8411.20.09.9996.013.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(451, 19192102, 'Pembuatan Steel Support Current Transformer PT CPSI Tahap II', NULL, '2019-12-09', '2020-01-20', 173290450.00, 'I.8411.20.09.9996.012.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(452, 19192101, 'Penugasan Pembuatan Steel Support Current Transformer PT CPSI Tahap I', NULL, '2019-10-21', '2019-11-08', 215283000.00, 'I.8411.19.09.9996.278.60', NULL, NULL, 'Penugasan', 16, 'Completed', NULL, NULL, NULL, NULL),
(453, 19190101, 'Penugasan Rekondisi 12 buah Grinding Tyre PLTU Lontar (Repeat Order) ', NULL, '2019-10-18', '2020-02-17', 717000000.00, 'I.8411.19.02.1000.277.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(454, 19188101, 'Pembuatan Baut Fix Diapragma PLTU Sebalang', NULL, '2019-10-15', '2019-12-01', 79728000.00, 'I.8411.19.02.2100.273.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(455, 19181101, 'Fabrikasi 8 (delapan) Buah Coal Burner PLTU Labuan (repeat order)', NULL, '2019-10-08', '2020-05-19', 1660516000.00, 'I.8411.19.02.1000.272.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(456, 19164101, 'SKI-Retrovit ARV BFP PLTU Suralaya Unit 3-4', NULL, '2019-09-13', '2019-12-12', 950180000.00, 'I.8411.19.02.9991.246.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(457, 19112101, 'Repair Grinding Roll sebanyak 3 (tiga) buah PLTU Adipala', NULL, '2019-07-01', '2019-09-27', 365687000.00, 'I.8411.19.02.1000.169.60', NULL, NULL, 'Penugasan', 21, 'Completed', NULL, NULL, NULL, NULL),
(458, 19110101, 'Pembuatan Hammer Crusher PLTU Tarahan', NULL, '2019-07-08', '2019-12-31', 554522400.00, 'I.8411.19.02.2100.177.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(459, 19065101, 'Pembuatan Delta Step Bolt UIT TJBB', NULL, '2019-04-09', '2019-09-24', 51500000.00, 'I.8411.19.09.8100.067.60', NULL, NULL, 'Penugasan', 22, 'Completed', NULL, NULL, NULL, NULL),
(460, 19057101, 'Penugasan Rekondisi Tyre 3 Buah dan GRS PLTU Suralaya 5-7', NULL, '2019-04-04', '2019-05-09', 322370059.00, 'I.8411.19.02.9991.107.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(461, 19054101, 'Rekondisi Tyre dan GRS PLTU Suralaya 1-4', NULL, '2019-03-21', '2019-12-31', 3969600000.00, 'I.8411.19.02.9991.086.60', NULL, NULL, 'Penugasan', 1, 'Completed', NULL, NULL, NULL, NULL),
(462, 19042118, 'Penugasan Tambahan Pekerjaan Pembuatan 12 (Dua Belas) Buah Spring Vibrating Feeder Suralaya 8', NULL, '2019-10-23', '2019-12-20', 70282600.00, 'I.8411.19.02.1000.284.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(463, 19042117, 'Penugasan Pembuatan 6 Buah Bucket Stacker Reclaimer PLTU Banten 1 Suralaya', NULL, '2019-10-18', '2020-02-11', 213026367.00, 'I.8411.19.02.1000.276.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(464, 19042116, 'Penugasan Pembuatan Blade Throat Ring PLTU Suralaya 8 (Repair Blade)', NULL, '2019-08-01', '2019-12-31', 200000000.00, 'I.8411.19.02.1000.105.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(465, 19042115, 'Penugasan Pekerjaan Pembuatan 32 Buah Spring Vibrating Feeder PLTU Suralaya 8', NULL, '2019-08-21', '2019-12-20', 191753600.00, 'I.8411.19.02.1000.217.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(466, 19042114, 'Penugasan Pekerjaan Pembuatan 10 Buah Dome Valve DN 200 PLTU Suralaya 8', NULL, '2019-08-21', '2019-12-17', 740000000.00, 'I.8411.19.02.1000.216.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(467, 19042113, 'Pembuatan 1 Set Screen Crusher PLTU Suralaya 8', NULL, '2019-07-01', '2020-01-31', 346100000.00, 'I.8411.19.02.1000.176.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(468, 19042112, '(CANCELLED) Penugasan Pembuatan 16 (Enam Belas) Buah Guide Roller Steel Belt (Short Roller) DAC PLTU Banten 3 Lontar', NULL, '2019-04-24', '2019-07-05', 0.00, NULL, NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(469, 19042111, 'Penugasan Pembuatan 2 (Dua) Set Crusher DAC PLTU Banten 3 Lontar', NULL, '2019-07-03', '2019-10-31', 109624000.00, 'I.8411.19.02.1000.113.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(470, 19042110, 'Penugasan Pembuatan 35 (Tiga Puluh Lima) Buah Guide Roller Bearing Cleaning Chain DAC PLTU Banten 3 Lontar', NULL, '2019-07-03', '2019-10-31', 99647750.00, 'I.8411.19.02.1000.115.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(471, 19042109, 'Penugasan Pembuatan 12 (Dua Belas) Buah Rekondisi Grinding Tyre PLTU Banten 3 Lontar', NULL, '2019-04-10', '2019-07-31', 719000000.00, 'I.8411.19.02.1000.028.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(472, 19042107, 'Penugasan Pembuatan 8 (Delapan) Buah Coal Burner PLTU Banten 2 Labuan', NULL, '2019-04-10', '2019-08-09', 1645153600.00, 'I.8411.19.02.1000.111.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(473, 19042106, 'Penugasan Pembuatan 18 (Delapan Belas) Buah Long Scrapper PLTU Banten 2 Labuan', NULL, '2019-04-10', '2019-07-15', 234148850.00, 'I.8411.18.02.1000.232.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(474, 19042105, 'Penugasan Pembuatan 1 (Satu) Set Housing TBS PLTU Banten 2 Labuan', NULL, '2019-04-10', '2019-05-10', 368890000.00, 'I.8411.18.02.1000.113.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(475, 19042103, '(Revisi) Penugasan Pembuatan1 (Satu) Set Inner Cone Mill PLTU Banten 1 Suralaya', NULL, '2019-07-03', '2019-12-23', 304738000.00, 'I.8411.19.02.1000.117.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(476, 19042102, 'Penugasan Pembuatan Grinding Roll (Tyre) Mill 6 (Enam) Buah PLTU Banten 1 Suralaya ', NULL, '2019-05-20', '2019-08-23', 306331200.00, 'I.8411.19.02.1000.129.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(477, 19042101, '(Revisi) Penugasan Pembuatan 24 (dua puluh empat) buah Long Scrapper Mill PLTU Banten 1 Suralaya', NULL, '2019-07-03', '2019-10-25', 436944000.00, 'I.8411.19.02.1000.130.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL),
(478, 19037101, 'Penugasan Pembuatan 45 Set Screen, Roller dan Linkage TBS PLTU Pelabuhan Ratu', NULL, '2019-04-23', '2019-10-31', 1859810000.00, 'I.8411.19.02.1000.114.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(479, 19036101, 'Pekerjaan Rekondisi Grinding Tyre PLTU Pelabuhan Ratu', NULL, '2018-12-14', '2019-01-21', 149838900.00, 'I.8411.18.02.9991.266.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(480, 19014108, 'Pembuatan Scrapper SSC Sebanyak 180 (Seratus Delapan Puluh) buah PLTU Palabuhan Ratu', NULL, '2020-05-15', '2020-12-11', 773500000.00, 'I.8411.20.02.1000.111.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(481, 19014107, 'Pembuatan Coal Burner Sebanyak 7 (Tujuh) Buah PLTU Palabuhan Ratu', NULL, '2020-05-06', '2020-08-28', 1660000000.00, 'I.8411.20.02.1000.110.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(482, 19014106, 'Penugasan Tooth Ring sebanyak 60 (enam puluh) buah dan Ring Hammer Sebanyak 54 (Lima Puluh Empat) buah PLTU Pelabuhan Ratu', NULL, '2020-06-01', '2021-05-24', 641000000.00, 'I.8411.20.02.1000.109.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(483, 19014105, 'Penugasan Pembuatan Scrapper SSC PLTU Palabuhan Ratu', NULL, '2019-02-27', '2019-08-30', 540000000.00, 'I.8411.19.02.1000.055.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(484, 19014104, 'Penugasan Pembuatan 8 bh Coal Nozzle PLTU Palabuhan Ratu', NULL, '2019-02-27', '2019-08-12', 1613454000.00, 'I.8411.19.02.1000.053.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(485, 19014103, 'Penugasan Pembuatan 36 set Journal Mill (Housing, Head, Skirt) PLTU Palabuhan Ratu', NULL, '2019-02-27', '2019-08-30', 2213946900.00, 'I.8411.19.02.1000.048.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(486, 19014102, 'Penugasan Pembuatan long scrapper PLTU Palabuhan Ratu', NULL, '2019-02-27', '2019-07-18', 401856840.00, 'I.8411.19.02.1000.049.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(487, 19014101, 'Penugasan Pembuatan short scrapper PLTU Palabuhan Ratu', NULL, '2019-02-27', '2019-07-18', 382085550.00, 'I.8411.19.02.1000.051.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(488, 19011101, 'Penugasan Pekerjaan Rekondisi Grinding Tyre Pulverize Mill PLTU Bukit Asam', NULL, '2019-02-27', '2019-12-31', 434909000.00, 'I.8411.18.02.2100.269.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(489, 19001101, 'Jasa Repair Grinding Roll', NULL, '2018-11-28', '2019-01-11', 158000000.00, 'I.8411.18.02.9990.257.60', NULL, NULL, 'Penugasan', 34, 'Completed', NULL, NULL, NULL, NULL),
(490, 18144102, 'Pembuatan Stoplog dan Assy Lifting Beam PLTA Musi', NULL, '2017-02-14', '2019-03-08', 1568009000.00, 'I.8411.18.01.2100.003.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(491, 18144101, 'Pengadaan Konstruksi Baja dan Lifting System Stoplog PLTA Musi', NULL, '2017-02-28', '2018-03-08', 2998704000.00, 'I.8411.18.01.2100.075.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(492, 18141101, 'Reverse Engineering Liner Mill PLTU Asam-Asam', NULL, '2018-12-11', '2019-02-08', 458808000.00, '1.8411.18.02.2400.265.60', NULL, NULL, 'Penugasan', 21, 'Completed', NULL, NULL, NULL, NULL),
(493, 18139101, 'Pembuatan Stoplog Intake PLTA Tes', NULL, '2019-01-03', '2019-10-20', 1677204000.00, 'I.8411.18.01.2100.007.60', NULL, NULL, 'Penugasan', 5, 'Completed', NULL, NULL, NULL, NULL),
(494, 18136101, 'Reverse Engineering Cover Journal PLTU Rembang ', NULL, '2018-12-07', '2019-02-18', 254993000.00, 'I.8411.18.02.1000.261.60', NULL, NULL, 'Penugasan', 3, 'Completed', NULL, NULL, NULL, NULL),
(495, 18129101, 'Reverse Engineering Screen TBS PLTU Labuan', NULL, '2018-11-01', '2019-02-28', 718000000.00, 'I.8411.18.02.1000.106.60', NULL, NULL, 'Penugasan', 2, 'Completed', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7eOmAxwS033PQ9lZpSJ8DLmmyd25RAmxc1hgkuE5', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiam9nN0d4QVRLTTVkVnhGUjdQWUs0eWJ2RzJGUGNzUllPRUZPOWJ4ZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHNJUmxhOVM2NFVJU2pGL0oyN3A5ZC5mYWVkeEN2d1pWanllaG1JY2FLeGFyNXNVSW0zTUlXIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2hwZXMiO31zOjg6ImZpbGFtZW50IjthOjA6e319', 1749554281);

-- --------------------------------------------------------

--
-- Table structure for table `spbl`
--

CREATE TABLE `spbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_spbl` varchar(255) DEFAULT NULL,
  `no_dkmj` bigint(20) UNSIGNED NOT NULL,
  `tanggal_spbl` date NOT NULL,
  `nama_spbl` varchar(150) DEFAULT NULL,
  `nilai_spbl` decimal(18,2) DEFAULT NULL,
  `nilai_ppn` decimal(18,2) DEFAULT NULL,
  `disusun_by` varchar(255) DEFAULT NULL,
  `persyaratan_pengadaan` text DEFAULT NULL,
  `no_vendor` bigint(20) UNSIGNED NOT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spbl`
--

INSERT INTO `spbl` (`id`, `no_spbl`, `no_dkmj`, `tanggal_spbl`, `nama_spbl`, `nilai_spbl`, `nilai_ppn`, `disusun_by`, `persyaratan_pengadaan`, `no_vendor`, `approved_by`, `approved_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'SPBL-20250526-EnPm', 10, '2025-05-26', 'Pengadaan 01', 8340000.00, 917400.00, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2025-05-25 23:22:05', '2025-05-27 19:18:48'),
(2, 'SPBL-20250526-ntQA', 10, '2025-05-26', 'Pengadaan 02', 40000000.00, 4400000.00, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2025-05-25 23:48:27', '2025-05-29 00:33:28'),
(3, 'SPBL-20250528-l000', 11, '2025-05-28', 'Pengadaan 04', 23340000.00, 2567400.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-05-27 19:55:57', '2025-05-27 19:55:57'),
(5, 'SPBL-20250528-1qBW', 11, '2025-05-28', 'Pengadaan 05', 120000000.00, 13200000.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-05-28 01:41:00', '2025-05-28 01:41:15'),
(6, 'SPBL-20250529-KZyS', 10, '2025-05-29', 'Pengadaan 06', 61020007.00, 6712200.77, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2025-05-29 00:41:51', '2025-05-29 00:41:51'),
(7, 'SPBL-20250529-6qZP', 10, '2025-05-29', 'Pengadaan 07', 10000000.00, 1100000.00, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2025-05-29 00:43:58', '2025-05-29 00:43:58'),
(8, 'SPBL-20250529-NqiA', 10, '2025-05-29', 'Pengadaan 07', 2000000.00, 220000.00, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2025-05-29 00:44:59', '2025-05-29 00:44:59'),
(9, 'SPBL-20250530-Nqdo', 10, '2025-05-30', 'Pengadaan 08', 17100.00, 1881.00, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2025-05-29 18:38:02', '2025-05-30 07:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `spbl_detail`
--

CREATE TABLE `spbl_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_material` bigint(20) UNSIGNED NOT NULL,
  `no_spbl` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spbl_detail`
--

INSERT INTO `spbl_detail` (`id`, `no_material`, `no_spbl`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 534, 10000.00, '2025-05-25 23:22:05', '2025-05-27 19:18:48'),
(2, 1, 2, 400, 100000.00, '2025-05-25 23:48:27', '2025-05-29 00:33:28'),
(3, 2, 1, 30, 100000.00, '2025-05-27 03:24:48', '2025-05-27 03:45:20'),
(4, 1, 3, 2334, 10000.00, '2025-05-27 19:55:57', '2025-05-27 19:55:57'),
(6, 1, 5, 12000, 10000.00, '2025-05-28 01:41:00', '2025-05-28 01:42:43'),
(7, 1, 6, 1, 61020007.00, '2025-05-29 00:41:51', '2025-05-29 18:35:49'),
(8, 1, 7, 1, 10000000.00, '2025-05-29 00:43:58', '2025-05-29 00:43:58'),
(9, 1, 8, 2, 2000000.00, '2025-05-29 00:44:59', '2025-05-29 18:49:21'),
(10, 2, 9, 100000, 17100.00, '2025-05-29 18:38:02', '2025-05-30 07:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@test.com', NULL, '$2y$12$sIRla9S64UISjF/J27p9d.faedxCvwZVjyehmIcaKxar5sUIm3MIW', 'Admin', NULL, '2025-05-21 06:28:06', '2025-05-21 19:06:45'),
(2, 'Taufik Hariadi', 'taufik.hariadi@gmail.com', NULL, '$2y$12$/ndWdez8twRloQzDyJoKJOOwwCA6qNTwT2Vhkwqreandajj5Pv.fK', 'User', NULL, '2025-05-21 18:37:24', '2025-05-21 21:42:59'),
(4, 'Zubair Gaming', 'zubair@gmail.com', NULL, '$2y$12$K0AWrctPLPhEPkjweVgP0umrVCpuWZ4sYPDQnS7jl7g.K6oaawVv2', 'Admin', NULL, '2025-05-21 19:07:13', '2025-05-21 19:23:44'),
(5, 'Test 1', 'test1@test.com', NULL, '$2y$12$pzkEMmJSfmlphK8K6uEYQ.aP2KaKSTb6xeXH80sa1lASxdaJBEGpy', 'User', NULL, '2025-05-21 21:17:12', '2025-05-21 21:17:12');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_vendor` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `nama_vendor`, `alamat`, `created_by`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 'PT. USAHA JAYA PRIMA KARYA', 'Komplek Golden Plaza Blok E No.30 Jl. RS Fatmawati No15, Kelurahan Gandaria Selatan , Kecamatan Cilandak, Jakarta Selatan 12420', NULL, NULL, '2025-05-21 22:53:27', '2025-05-21 22:53:27'),
(2, 'PT VISI MAJU GLOBALINDO', 'Green Sedayu Bizpark, Jl. Raya Daan Mogot KM 18 Blok DM1 No. 15, Jakarta Barat', NULL, NULL, '2025-05-21 22:54:10', '2025-05-21 22:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_amp` bigint(20) UNSIGNED NOT NULL,
  `no_wo` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `technical_requirment` text DEFAULT NULL,
  `task_plan_schedule` text DEFAULT NULL,
  `material` text DEFAULT NULL,
  `method` text DEFAULT NULL,
  `machine_tools_usage` text DEFAULT NULL,
  `tanggal_wo` varchar(255) DEFAULT NULL,
  `diterbitkan_oleh` varchar(255) DEFAULT NULL,
  `tanggal_diterbitkan` date DEFAULT NULL,
  `dilaksanakan_oleh` varchar(255) DEFAULT NULL,
  `dilaksanakan_tanggal` varchar(255) DEFAULT NULL,
  `ditutup_oleh` varchar(255) DEFAULT NULL,
  `ditutup_tanggal` date DEFAULT NULL,
  `user_created` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`id`, `no_amp`, `no_wo`, `kategori`, `technical_requirment`, `task_plan_schedule`, `material`, `method`, `machine_tools_usage`, `tanggal_wo`, `diterbitkan_oleh`, `tanggal_diterbitkan`, `dilaksanakan_oleh`, `dilaksanakan_tanggal`, `ditutup_oleh`, `ditutup_tanggal`, `user_created`, `created_at`, `updated_at`) VALUES
(2, 3, NULL, NULL, '<p>Test juga ah</p><p><br></p>', '<p>sadf</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-23 07:49:19', '2025-05-24 01:57:17'),
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-24 01:51:15', '2025-05-24 01:51:15'),
(5, 7, NULL, NULL, '<p>sikat</p><p><br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-25 19:46:08', '2025-05-25 19:46:08'),
(6, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-26 06:47:11', '2025-05-26 06:47:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dkmj`
--
ALTER TABLE `dkmj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dkmj_no_amp_foreign` (`no_amp`);

--
-- Indexes for table `dkmj_detail`
--
ALTER TABLE `dkmj_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dkmj_detail_no_dkmj_foreign` (`no_dkmj`),
  ADD KEY `dkmj_detail_no_material_foreign` (`no_material`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hpe`
--
ALTER TABLE `hpe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hpe_no_hpe_unique` (`no_hpe`),
  ADD KEY `hpe_no_dkmj_foreign` (`no_dkmj`);

--
-- Indexes for table `hpe_detail`
--
ALTER TABLE `hpe_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hpe_detail_no_hpe_foreign` (`no_hpe`),
  ADD KEY `hpe_detail_no_material_foreign` (`no_material`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontrak`
--
ALTER TABLE `kontrak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kontrak_no_kontrak_unique` (`no_kontrak`),
  ADD KEY `kontrak_no_hpe_foreign` (`no_hpe`),
  ADD KEY `kontrak_id_vendor_foreign` (`id_vendor`);

--
-- Indexes for table `kontrak_detail`
--
ALTER TABLE `kontrak_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kontrak_detail_no_kontrak_foreign` (`no_kontrak`),
  ADD KEY `kontrak_detail_no_material_foreign` (`no_material`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penugasan_no_amp_unique` (`no_amp`),
  ADD KEY `penugasan_customer_foreign` (`id_customer`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `spbl`
--
ALTER TABLE `spbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spbl_no_dkmj_foreign` (`no_dkmj`),
  ADD KEY `spbl_no_vendor_foreign` (`no_vendor`);

--
-- Indexes for table `spbl_detail`
--
ALTER TABLE `spbl_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spbl_detail_no_spbl_foreign` (`no_spbl`),
  ADD KEY `spbl_detail_no_material_foreign` (`no_material`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `work_orders_no_amp_unique` (`no_amp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `dkmj`
--
ALTER TABLE `dkmj`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dkmj_detail`
--
ALTER TABLE `dkmj_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hpe`
--
ALTER TABLE `hpe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hpe_detail`
--
ALTER TABLE `hpe_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontrak`
--
ALTER TABLE `kontrak`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontrak_detail`
--
ALTER TABLE `kontrak_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `penugasan`
--
ALTER TABLE `penugasan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496;

--
-- AUTO_INCREMENT for table `spbl`
--
ALTER TABLE `spbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `spbl_detail`
--
ALTER TABLE `spbl_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dkmj`
--
ALTER TABLE `dkmj`
  ADD CONSTRAINT `dkmj_no_amp_foreign` FOREIGN KEY (`no_amp`) REFERENCES `work_orders` (`no_amp`) ON DELETE CASCADE;

--
-- Constraints for table `dkmj_detail`
--
ALTER TABLE `dkmj_detail`
  ADD CONSTRAINT `dkmj_detail_no_dkmj_foreign` FOREIGN KEY (`no_dkmj`) REFERENCES `dkmj` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dkmj_detail_no_material_foreign` FOREIGN KEY (`no_material`) REFERENCES `material` (`id`);

--
-- Constraints for table `hpe`
--
ALTER TABLE `hpe`
  ADD CONSTRAINT `hpe_no_dkmj_foreign` FOREIGN KEY (`no_dkmj`) REFERENCES `dkmj` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hpe_detail`
--
ALTER TABLE `hpe_detail`
  ADD CONSTRAINT `hpe_detail_no_hpe_foreign` FOREIGN KEY (`no_hpe`) REFERENCES `hpe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hpe_detail_no_material_foreign` FOREIGN KEY (`no_material`) REFERENCES `material` (`id`);

--
-- Constraints for table `kontrak`
--
ALTER TABLE `kontrak`
  ADD CONSTRAINT `kontrak_id_vendor_foreign` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id`),
  ADD CONSTRAINT `kontrak_no_hpe_foreign` FOREIGN KEY (`no_hpe`) REFERENCES `hpe` (`id`);

--
-- Constraints for table `kontrak_detail`
--
ALTER TABLE `kontrak_detail`
  ADD CONSTRAINT `kontrak_detail_no_kontrak_foreign` FOREIGN KEY (`no_kontrak`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kontrak_detail_no_material_foreign` FOREIGN KEY (`no_material`) REFERENCES `material` (`id`);

--
-- Constraints for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD CONSTRAINT `penugasan_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `spbl`
--
ALTER TABLE `spbl`
  ADD CONSTRAINT `spbl_no_dkmj_foreign` FOREIGN KEY (`no_dkmj`) REFERENCES `dkmj` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spbl_no_vendor_foreign` FOREIGN KEY (`no_vendor`) REFERENCES `vendor` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `spbl_detail`
--
ALTER TABLE `spbl_detail`
  ADD CONSTRAINT `spbl_detail_no_material_foreign` FOREIGN KEY (`no_material`) REFERENCES `material` (`id`),
  ADD CONSTRAINT `spbl_detail_no_spbl_foreign` FOREIGN KEY (`no_spbl`) REFERENCES `spbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `work_orders_no_amp_foreign` FOREIGN KEY (`no_amp`) REFERENCES `penugasan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
