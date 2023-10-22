<?php
session_start();
//koneksi ke database
include 'koneksi.php';

// Jika tidak ada session pelanggan (belum login)
if(!isset($_SESSION['pelanggan']) OR empty($_SESSION['pelanggan'])){
	echo "<script>alert('Silahkan login');</script>";
	echo "<script>location='login.php';</script>";
	exit();
}

// if(!isset($_SESSION["keranjang"])){
//   // Diarahkan ke ke index.php
//   echo "<script>alert('Belum ada riwayat pembayaran!')</script>";
//   echo "<script>location='index.php';</script>";
// }

// echo "<pre>";
// print_r($_SESSION['pelanggan']);
// echo "</pre>";

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Riwayat Belanja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <?php include 'templates/navbar.php'; ?>

    <section class="content">
        <div class="container mt-3">
            <h3>Riwayat Belanja <?= $_SESSION['pelanggan']['nama_pelanggan']; ?></h3>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Status</th>
                        <th>Total</th>
                        <th>Opsi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
				$no = 1;
				// Mendapatkan id_pelanggan yang login dari session
				$id_pelanggan = $_SESSION['pelanggan']['id_pelanggan'];
				$ambil = $koneksi->query("SELECT * FROM pembelian WHERE id_pelanggan='$id_pelanggan'");
				if($ambil->num_rows == 0):
				?>
                    <tr>
                        <td colspan="5">Tidak ada data riwayat... </td>
                    </tr>
                    <?php endif; ?>
                    <?php
				while($pecah = $ambil->fetch_assoc()):
				?>
                    <tr>
                        <th><?= $no++; ?></th>
                        <td><?= date("d F Y", strtotime($pecah['tanggal_pembelian'])); ?></td>
                        <td>
                            <?= $pecah['status_pembelian']; ?><br>
                            <?php if(!empty($pecah['resi_pengiriman'])): ?>
                            Resi : <?= $pecah['resi_pengiriman']; ?>
                            <?php endif; ?>
                        </td>
                        <td>Rp. <?= number_format($pecah['total_pembelian']); ?>,-</td>
                        <td>
                            <a href="nota.php?id=<?= $pecah['id_pembelian']; ?>" class="btn btn-info">Nota</a>

                            <?php if($pecah['status_pembelian'] == 'pending'): ?>
                            <a href="pembayaran.php?id=<?= $pecah['id_pembelian']; ?>" class="btn btn-success">Input
                                Pembayaran</a>
                            <?php else: ?>
                            <a href="lihat-pembayaran.php?id=<?= $pecah['id_pembelian']; ?>"
                                class="btn btn-warning">Lihat Pembayaran</a>
                            <?php endif; ?>

                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>

        </div>
    </section>
    <br><br><br><br><br><br><br><br><br><br><br>
    <?php include 'templates/footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>

</html>