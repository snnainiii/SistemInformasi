<?php
session_start();
//koneksi ke database
include 'koneksi.php';

$id_pembelian = $_GET['id'];

$ambil = $koneksi->query("SELECT * FROM pembayaran JOIN pembelian ON pembayaran.id_pembelian=pembelian.id_pembelian WHERE pembelian.id_pembelian='$id_pembelian'");
$detbay = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($detbay);
// echo "</pre>";

// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";

// Jika belum ada pembayaran
if(empty($detbay)){
  echo "<script>alert('Belum ada data pembayaran!');</script>";
  echo "<script>location='riwayat.php';</script>";
}

// Jika data pelanggan yang bayar tidak sesuai yang login
if($_SESSION['pelanggan']['id_pelanggan'] != $detbay['id_pelanggan']){
  echo "<script>alert('Akses ditolak!');</script>";
  echo "<script>location='riwayat.php';</script>";
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lihat Pembayaran</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>

    <?php include 'templates/navbar.php'; ?>

    <section class="content">
        <div class="container mt-3">
            <h3>Lihat Pembayaran</h3>
            <div class="row">
                <div class="col-md-6">
                    <table class="table">
                        <tr>
                            <th>Nama</th>
                            <td><?= $detbay['nama']; ?></td>
                        </tr>
                        <tr>
                            <th>Bank</th>
                            <td><?= $detbay['bank']; ?></td>
                        </tr>
                        <tr>
                            <th>Tanggal</th>
                            <td><?= $detbay['tanggal']; ?></td>
                        </tr>
                        <tr>
                            <th>Jumlah</th>
                            <td class="text-danger">Rp. <?= number_format($detbay['jumlah']); ?>,-</td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6">
                    <img src="bukti_pembayaran/<?= $detbay['bukti']; ?>" alt="" class="img-responsive"
                        style="width: 600px ;">
                </div>
            </div>
    </section>
    <br><br><br><br><br><br><br><br><br><br><br>
    <?php include 'templates/footer.php'; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>

</html>