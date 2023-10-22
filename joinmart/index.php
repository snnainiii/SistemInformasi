<?php
session_start();
//koneksi ke database
include 'koneksi.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JoinMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</head>

<body>


    <?php include 'templates/navbar.php'; ?>

    <!-- konten   -->
    <div class="container mt-3">
        <h1>Produk Terbaru</h1>

        <div class="my-5">
            <div class="row">
                <?php
                  $ambil = $koneksi->query("SELECT * FROM produk");
                  while($perproduk = $ambil->fetch_assoc()):
                ?>
                <div class="col-lg-2 col-md-4 col-sm-4 mb-3">
                    <div class="card h-100">
                        <img src="foto_produk/<?= $perproduk['foto_produk']; ?>" class="card-img-top " draggable="false"
                            style="height:150px" alt="...">
                        <div class="card-body">
                            <h6><?= $perproduk['nama_produk']; ?></h6>
                            <h6 class="text-success">Rp. <?= number_format($perproduk['harga_produk']); ?>,-</h6>
                            <h6 class="text-danger">Stok : <?= $perproduk['stok_produk']; ?></h6>
                            <a href="beli.php?id=<?= $perproduk['id_produk']; ?>" class="btn btn-primary">beli</a>
                            <a href="detail.php?id=<?= $perproduk['id_produk']; ?>" class="btn btn-warning">detail</a>
                        </div>
                    </div>
                </div>
                <?php endwhile; ?>
            </div>
        </div>
    </div>
    <?php include 'templates/footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>

</html>