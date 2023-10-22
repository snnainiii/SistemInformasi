-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 04:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokoonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin@gmail.com', 'admin', 'alam200N');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Perawatan Tubuh'),
(2, 'Makanan Pokok'),
(3, 'Minuman'),
(4, 'Snack'),
(5, 'Alat Tulis'),
(6, 'Pembersih Rumah');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Demak', 20000),
(2, 'Cirebon', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(100) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'doddy@gmail.com', 'doddy', 'Doddy Setiawan', '08888123123', ''),
(2, 'erik@gmail.com', 'erik', 'Erik Candra', '0888111111', ''),
(3, 'yudi@contoh.com', '1234', 'Yudi Saputra', '0746356643', 'Jogja'),
(4, 'doni@contoh.com', '1234', 'Doni', '0761888888', 'Semarang'),
(5, 'erwin@contoh.com', '1234', 'Erwin', '088867553', 'Demak'),
(6, 'alam@gmail.com', 'alam', 'Alam', '081929211812', 'tlanakan'),
(7, 'aini@gmail.com', 'aini', 'Aini', '012345678901', 'Bojonogoro'),
(8, 'nana@gmail.com', 'nana', 'Nana', '095289473843', 'Gresik');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(4, 11, 'Erik', 'Mandiri', 2020000, '2020-08-05', '20200805165815tugas3.png'),
(5, 13, 'Erik', 'Mandiri', 6020000, '2020-08-08', '20200808173932punya-putri.png'),
(6, 18, 'Doni', 'Mandiri', 6044000, '2020-09-15', '20200915032134database.png'),
(7, 19, 'Erwin', 'Mandiri', 3024000, '2020-09-15', '20200915045855database.png'),
(8, 2, 'Alam', 'bca', 2, '2022-11-29', '20221129084459Database Login.jpg'),
(9, 3, 'Alam', 'mandiri', 1, '2022-11-29', '20221129084736Screenshot 2022-11-29 144546.jpg'),
(10, 5, '', '', 0, '2022-12-10', '20221210090714'),
(11, 4, 'Aini', 'BRI', 73400, '2022-12-10', '20221210091106Screenshot (2).png');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(1, 7, '2022-11-28', 18400, '', 'pending', '', 100, 'Jawa Barat', 'Karawang', 'Kabupaten', '41311', 'jne', 'REG', 17000, '3-4'),
(2, 6, '2022-11-28', 18400, '', 'lunas', '', 100, 'Jawa Barat', 'Bekasi', 'Kota', '17121', 'jne', 'REG', 17000, '2-3'),
(3, 6, '2022-11-29', 20400, '', 'barang dikirim', '', 100, 'Jawa Barat', 'Banjar', 'Kota', '46311', 'tiki', 'REG', 19000, '3'),
(4, 7, '2022-11-30', 73400, '', 'sudah kirim pembayaran', '', 250, 'Jawa Timur', 'Kediri', 'Kota', '64125', 'tiki', 'REG', 18000, '3'),
(5, 7, '2022-12-10', 87400, '', 'sudah kirim pembayaran', '', 250, 'Bali', 'Gianyar', 'Kabupaten', '80519', 'pos', 'Pos Reguler', 32000, '6 HARI');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 7, 1, 'Nuvo Sabun Batang Anti Bacterial Family Total Protect', 1400, 100, 100, 1400),
(2, 2, 7, 1, 'Nuvo Sabun Batang Anti Bacterial Family Total Protect', 1400, 100, 100, 1400),
(3, 3, 7, 1, 'Nuvo Sabun Batang Anti Bacterial Family Total Protect', 1400, 100, 100, 1400),
(4, 4, 8, 1, 'SUNSILK Shampoo Soft & Smooth 650ml', 55400, 250, 250, 55400),
(5, 5, 8, 1, 'SUNSILK Shampoo Soft & Smooth 650ml', 55400, 250, 250, 55400);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(7, 1, 'Nuvo Sabun Batang Anti Bacterial Family Total Protect', 1400, 100, 'sabun.jpg', 'NUVO ANTIBACTERIAL SOAP FAMILY TOTAL PROTECT 76gr\r\n100% ORIGINAL PRODUCT\r\n\r\n3X Perlindungan NUVO, dengan TCC + Fanesol\r\n\r\nKulit yang terlihat bersih belum tentu bebas kuman.\r\n\r\nNUVO Family dengan bahan aktif TCC & Fanesol terbukti dapat melawan kuman.\r\n\r\nVarian sesuai persediaan stok ya, dikirimkan random ^^\r\n\r\nBPOM NA18160500719', 17),
(8, 1, 'SUNSILK Shampoo Soft & Smooth 650ml', 55400, 250, 'Screenshot 2022-11-24 111127.jpg', 'Sunsilk Shampoo Soft & Smooth . \r\n\r\n\r\nSUNSILK Shampoo Soft & Smooth merupakan sampo untuk melembutkan rambut yang kering \r\nagar tetap halus, lembut dan berkilau. Sampo Sunsilk ini memiliki Moisture-Lock Technology dan \r\nkandungan 5 minyak alami yang membuat rambut halus dan lembut. Sampo ini ringan dan tidak \r\nlengket di rambut dan menutrisi hingga ke dalam helai rambut. Gunakan selalu sampo dari Sunsilk \r\nagar rambut Anda selalu terlihat indah.\r\n\r\n\r\nDetail\r\n\r\n- Sampo\r\n\r\n- Mengandung Ceramide MAcademia Nutri-Complex dan 5 Natural Oils (Almond, Argan, \r\nBabassu, Camelia & Coconut Oils)\r\n\r\n- Ringan & tidak lengket di rambut\r\n\r\n- Untuk menutrisi hingga ke dalam helai rambut\r\n\r\n- Melembutkan rambut yang kering agar tetap halus, lembut, dan berkilau\r\n#sunsilkshampoo #samposunsilk #', 8),
(9, 1, 'Pepsodent Pasta Gigi White 225G', 12000, 250, 'Screenshot 2022-11-24 111301.jpg', 'Deskripsi Produk\r\nPasta gigi Pepsodent Pencegah Gigi Berlubang, bantu melawan kuman/bakteri dan beri \r\nperlindungan maksimal dari gigi berlubang\r\n\r\nFormula Double action diperkaya dengan Mikro Kalsium Aktif dan Pro-fluoride kompleks untuk \r\nmemberikan perlindungan terbaik bagi keluarga Anda di siang dan malam hari\r\n\r\nDua kali lebih efektif dalam memperbaiki lubang kecil tak kasat mata sebelum berkembang menjadi \r\ngigi berlubang\r\n\r\nHappy Shoping :)) ', 20),
(10, 1, 'CIPTADENT Toothbrush Total Clean isi 3 ORIGINAL ', 7500, 150, 'Screenshot 2022-11-24 111629.jpg', 'CIPTADENT Toothbrush Total Clean isi 3 ORIGINAL / Sikat Gigi Family Pack Tooth Brush \r\n\r\nBulu sikat lebih halus sehingga lebih lembut untuk penyikatan gigi dan untuk gusi \r\nsehingga bisa menjangkau area terjauh di dalam mulut dan gagang sikat yang nyaman untuk \r\ndigunakan ketika menyikat gigi. Pemakaian dua kali sehari secara teratur.', 12),
(11, 4, 'Tango Wafer Tanggo Vanilla 120Gr', 5000, 120, 'tango.jpg', '\r\nCocok untuk hajatan, syukuran, harga di bawah glosir beli banyak lebih murah lagi\r\n\r\nHarga: 96.000 /dus isi 24 ,chat aja yaa untuk pembelian per duss, bisa ecer 5ribuan aja\r\n\r\n*Mohon Chat Terlebih Dahulu Untuk Memastikan Apakah Stok Yang Anda Pesan Masih Tersedia :)', 25),
(12, 4, 'Wafello Coklat Chocolate Wafer 114gram', 4500, 114, 'Screenshot 2022-11-24 111921.jpg', 'Wafello Coklat 135gr.\r\nSELALU READY boleh langsung dipesan.\r\nExpire date jauh, barang rutin datang.', 15),
(13, 5, 'ZEBRA MECHANIC PENCIL 052', 8000, 50, 'Screenshot 2022-11-24 112416.jpg', '0.5mm Mechanical pencil\r\nSoft rubber grip for writing comfort\r\nSturdy metal clip\r\nClear barrel for visible leads supply\r\nBuilt in Eraser', 5),
(14, 1, 'Sugarpot x Saga Everyday Gentle Cleanser/ Sabun Cuci Muka/ Face Wash 100 ml', 32800, 100, 'Screenshot 2022-11-24 112548.jpg', 'Saga Everyday Gentle Cleanser merupakan pembersih wajah lembut untuk membersihkan wajah dari \r\nminyak berlebih, kotoran dan sisa make up di wajah.\r\nMembersihkan tanpa membuat kulit kering. Kulit tampak lebih halus dan kenyal. Ideal digunakan \r\nsetiap hari pada pagi dan malam.\r\nCocok untuk semua jenis kulit.\r\n\r\nCara Penggunaan:\r\nTuang ke telapak tangan yang basah dan gosok hingga berbusa. Aplikasikan pada wajah dan pijat\r\nsecara lembut lalu bilas dengan bersih.\r\n\r\nKomposisi:\r\nAqua, Cocamidopropyl Betaine, Cocamide DEA, Disodium Cocoyl Glutamate, Sodium PCA, Centella\r\nAsiatica Extract, Glycerin, PEG-120 Methyl Glucose Dioleate, Disodium Cocoamphodiacetate, PEG-\r\n40 Hydrogenated Castor Oil, Lauryl Glucoside, Phenoxyethanol, Acrylates Copolymer, Panthenol,\r\nChamomilla Recutita (Matricaria) Flower Extract, Aloe Barbadensis Leaf Juice, Butylene Glycol,\r\nSodium Benzoate, Allantoin, Bisabolol, Polyquaternium-7, Hexamidine Diisethionate, Plukenetia\r\nVolubilis Seed Oil, Tetrasodium EDTA, Glucosyl Ceramide, Polyglyceryl-10 Laurate\r\n\r\nPOM NA18201202536', 5),
(15, 5, 'BUKU OKTAVO 100 LEMBAR', 10500, 200, 'Screenshot 2022-11-24 112653.jpg', 'Value Plus Buku Oktavo Yang Berguna Untuk Keperluan Kantor Atau Lainnya Dengan Harga \r\nYang Terjangkau Dan Kualitas Baik', 10),
(16, 6, 'Sapu Dan Pengki Putih', 85000, 400, 'Screenshot 2022-11-24 112846.jpg', 'Siapa nih yang lagi cari peralatan kebersihan, tapi kepingin yang tampil estetik, biar tambah \r\nsemangat bebenah rumah? Di KJ Perabot tersedia sapu, pengki, ember hingga gayung dengan \r\nwarna putih berbahan plastik tebal yang estetik. Yuk miliki sekarang perabot-perabot transparan ini.\r\n\r\nCOOGER PENGKI+SAPU CSM2618 WHITE\r\n\r\nTinggi Sapu : 89 cm\r\nPanjang Serokan : 23 cm\r\nLebar : 23 cm\r\nTinggi Serokan : 78.5 cm\r\n.\r\nHAWAI PEL KARET KLEENTIX L 7203 PUTIH\r\n\r\nTinggi Keseluruhan : 118 cm\r\nLebar : 40 cm\r\n.\r\nHAWAI PENGKI VIESTA 7153 GG PUTIH\r\n\r\nTinggi Keseluruhan : 81 cm\r\nPengki : 23 x 22.7 cm\r\n.\r\nHAWAII SAPU AYANA GAGANG METAL 7165 PUTIH\r\n\r\nBahan : nilon, gagang besi\r\nTinggi : 95,5 cm\r\n.\r\nHAWAII SAPU SAFARI 7103 PUTIH\r\n\r\nTinggi : 123 cm\r\nLebar Sapu : 23 cm', 4),
(17, 3, 'TEH PUCUK JASMINE 1.5L', 12000, 1500, 'tehpucuk.jpg', 'Minuman Teh Instan Aroma Jasmine Yang Segar Mudah Di Bawa Kemana Saja Ideal Untuk \r\nDinikmati Saat Santai Bersama Keluarga', 20),
(18, 4, 'Potabee Selection Keripik Kentang Black Truffle 65 gr', 9000, 65, 'potabee.jpg', '          Potabee Selections Black Truffle adalah keripik kentang pertama di Indonesia dengan rasa dan \r\naroma jamur truffle hitam yang mewah, dibuat dengan V-Cut technology dan bertabur \r\nbits truffle asli.\r\n\r\nPotabee Black Truffle, kriuknya pecah, rasanya mewah!        ', 12),
(19, 6, 'Goto Ramona Broom Sapu Pel Pembersih Lantai Otomatis Penyedot Debu', 90000, 9000, 'penyedotdebu.jpg', 'Mau tahu cara menyapu modern dan praktis?\r\n\r\nYang hemat tenaga dan bikin lantai cepat bersih?\r\n\r\nMembuat tugas menyapu jadi ringan tanpa repot?\r\n\r\n \r\n\r\nSaatnya mengubah cara menyapu lama dengan yang super praktis menggunakan \r\nGOTO Broom Ramona.  Kenapa?\r\n\r\n \r\n\r\n1. Cocok digunakan untuk berbagai lantai seperti kayu, keramik, marbel, sampai semen.\r\n\r\n2. Sistem membersihkan hemat tenaga dalam menyapu debu lebih cepat serta menyerap kotoran lebih baik.\r\n\r\n3. Gagang yang dapat ditekuk mengikuti penggunaan sapu untuk membersihkan secara menyeluruh.\r\n\r\n4. Terdapat sikat pembersih yang lembut dan mampu menyapu lantai dengan baik.\r\n\r\n5. Dilengkapi tempat penyimpan debu yang kedap udara, debu mudah dibersihkan dan dibuang\r\n\r\n \r\n\r\nFaktanya banyak yang puas beli apapun di GOTO Living. Kenapa? \r\n\r\n1. Karena GOTO Living barangnya bener-bener berkualitas dan orisinil. \r\n\r\n2. Karena GOTO Living bener-bener tidak pernah mengecewakan selama 20 tahun.\r\n\r\n3. Karena GOTO Living Hebat - Hemat Banget. \r\n\r\n4. Karena Customer Service nya GOTO Living bener-bener ramah dan fast response.\r\n\r\n5. Karena pengemasan barangnya GOTO Living bener-bener rapih dan aman. \r\n\r\n \r\n\r\nSpesifikasi\r\n\r\nMaterial	: PP + SS201\r\n\r\nUkuran	: 33 x 16.3 x 113cm\r\n\r\n \r\n\r\nFAQ \r\n\r\n1. Apa saja pilihan warna yang tersedia? \r\n\r\n- Black\r\n\r\n- Pink\r\n\r\n \r\n\r\n2. Apa saja yang didapat dalam satu kemasan? \r\n\r\n1 x Tongkat Sapu\r\n\r\n1 x Alat Sapu Lantai\r\n\r\n \r\n\r\n3. Apakah pengemasan dijamin aman? \r\n\r\nSebelum barang dikirim akan melalui tahap pemeriksaan. Setelah itu barang akan \r\ndikemas rapi, dan hampir semua barang dilapisi bubble wrap yang melindungi barang\r\n tetap aman sampai di tujuan.', 6);

-- --------------------------------------------------------

--
-- Table structure for table `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(2, 8, 'vinicius-amnx-amano-fdiXdOdYtLE-unsplash.jpg'),
(3, 8, 'sincerely-media-CXYPfveiuis-unsplash.jpg'),
(5, 8, '20200905085618sincerely-media-CXYPfveiuis-unsplash.jpg'),
(6, 6, 'sincerely-media-CXYPfveiuis-unsplash.jpg'),
(7, 7, 'sabun.jpg'),
(8, 8, 'Screenshot 2022-11-24 111127.jpg'),
(9, 9, 'Screenshot 2022-11-24 111301.jpg'),
(10, 10, 'Screenshot 2022-11-24 111629.jpg'),
(11, 11, 'tango.jpg'),
(12, 12, 'Screenshot 2022-11-24 111921.jpg'),
(13, 13, 'Screenshot 2022-11-24 112416.jpg'),
(14, 14, 'Screenshot 2022-11-24 112548.jpg'),
(15, 15, 'Screenshot 2022-11-24 112653.jpg'),
(16, 16, 'Screenshot 2022-11-24 112846.jpg'),
(17, 17, 'tehpucuk.jpg'),
(19, 18, '20221210173229potabee.jpg'),
(20, 19, 'penyedotdebu.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
