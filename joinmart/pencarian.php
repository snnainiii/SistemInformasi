<?php
include 'koneksi.php';

$keyword = $_GET['keyword'];

$semuadata = array();
$ambil = $koneksi->query("SELECT * FROM produk WHERE nama_produk LIKE '%$keyword%' OR deskripsi_produk LIKE '%$keyword%'");
while($pecah = $ambil->fetch_assoc()){
  $semuadata[] = $pecah;
}



?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pencarian</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <?php include 'templates/navbar.php'; ?>

    <section class="content">
        <div class="container mt-3 ">
            <h3>Hasil Pencarian: <?= $keyword; ?></h3>

            <?php if(empty($semuadata)): ?>
            <div class="alert alert-danger">Produk <strong><?= $keyword; ?></strong> tidak ditemukan</div>
            <?php endif; ?>
            <div class="my-5">
                <div class="row">
                    <?php foreach($semuadata as $key => $value): ?>
                    <div class="col-lg-2 col-md-4 col-sm-4 mb-3">
                        <div class="card h-100">
                            <img src="foto_produk/<?= $value['foto_produk']; ?>" draggable="false" style="height:150px"
                                class="card-img-top">
                            <div class="card-body">
                                <h6><?= $value['nama_produk']; ?></h6>
                                <h6 class="text-success">Rp. <?= number_format($value['harga_produk']); ?>,-</h6>
                                <a href="beli.php?id=<?= $value['id_produk']; ?>" class="btn btn-primary">beli</a>
                                <a href="detail.php?id=<?= $value['id_produk']; ?>" class="btn btn-warning">detail</a>
                            </div>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>
    </section>
    <br><br><br>
    <?php include 'templates/footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>

</html>