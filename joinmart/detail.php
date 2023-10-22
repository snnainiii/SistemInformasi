<?php
session_start();

// Koneksi ke database
include 'koneksi.php';

// Mendapatkan id_produk dari url
$id_produk = $_GET['id'];

// Query ambil data
$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
$detail = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($detail);
// echo "</pre>";

// Jika tombol beli di klik
if(isset($_POST['beli'])){
  // Mendapatkan jumlah yang diinputkan
  $jumlah = $_POST['jumlah'];

  // Masukkan ke keranjang belanja
  $_SESSION['keranjang'][$id_produk] = $jumlah;

  echo "<div class='alert alert-success'>Produk telah masuk ke keranjang</div>";
  echo "<meta http-equiv='refresh' content='1;url=keranjang.php'>";
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Produk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
pre {
    font-family: Arial, sans-serif;
}
</style>

<body>

    <!-- navbar -->
    <?php include 'templates/navbar.php'; ?>

    <section class="content">
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-6">
                    <img src="foto_produk/<?= $detail['foto_produk']; ?>" class="img-responsive" style="width:500px;">
                </div>
                <div class=" col-md-6">
                    <h2><?= $detail['nama_produk']; ?></h2>
                    <h4 class="text-success">Rp. <?= number_format($detail['harga_produk']); ?>,-</h4>
                    <h5 class="text-danger">Stok : <?= $detail['stok_produk']; ?></h5>
                    <form action="" method="post">
                        <div class="form-group">
                            <div class="input-group mt-3">
                                <input type="number" min="1" max="<?= $detail['stok_produk']; ?>" class="form-control"
                                    name="jumlah">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary" name="beli">beli</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <br>
                    <pre><?= $detail['deskripsi_produk']; ?></pre>

                </div>
            </div>
        </div>
    </section>
    <br><br><br>
    <!-- footer -->
    <?php include 'templates/footer.php'; ?>
    <script src=" https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>

</html>