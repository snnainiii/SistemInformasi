<?php
//koneksi ke database
include 'koneksi.php';

// Jika tombol daftar ditekan
if(isset($_POST['daftar'])){
  // Mengambil isian nama, email, password, alamat, telepon
  $nama = $_POST['nama'];
  $email = $_POST['email'];
  $password = $_POST['password'];
  $alamat = $_POST['alamat'];
  $telepon = $_POST['telepon'];

  // Cek apakah email sudah digunakan atau belum
  $ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan='$email'");
  $yangcocok = $ambil->num_rows;
  if($yangcocok == 1){
    echo "<div class='alert alert-danger'>Pendaftaran gagal, email sudah digunakan!</div>";
		echo "<meta http-equiv='refresh' content='1;url=daftar.php'>";
  }
  else{
    // Insert ke tabel pelanggan
    $koneksi->query("INSERT INTO pelanggan(email_pelanggan, password_pelanggan, nama_pelanggan, telepon_pelanggan, alamat_pelanggan) VALUES('$email', '$password', '$nama', '$telepon', '$alamat')");
    echo "<div class='alert alert-success'>Pendaftaran sukses, Silahkan login</div>";
		echo "<meta http-equiv='refresh' content='1;url=login.php'>";
  }

}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Pelanggan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>

    <!-- navbar -->
    <?php include 'templates/navbar.php'; ?>

    <section class="content">
        <div class="container mt-5 ">
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-md-offset-2">
                    <div class="card ">
                        <div class="card-header">
                            <h3 class="card-title">Daftar Pelanggan</h3>
                        </div>
                        <div class="card-body">
                            <form action="" method="post" class="form-horizontal">
                                <div class=" form-group mb-3 row">
                                    <label for="nama" class="control-label col-md-3 fw-bold">Nama</label>
                                    <div class="col-md-7">
                                        <input type="text" class="form-control" name="nama" required>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label for=" email" class="control-label col-md-3 fw-bold">Email</label>
                                    <div class="col-md-7">
                                        <input type="email" class="form-control" name="email" required>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label for=" password" class="control-label col-md-3 fw-bold">Password</label>
                                    <div class="col-md-7">
                                        <input type="password" class="form-control" name="password" required>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label for=" alamat" class="control-label col-md-3 fw-bold">Alamat</label>
                                    <div class="col-md-7">
                                        <textarea name="alamat" id="" cols="30" rows="4" class="form-control"
                                            required></textarea>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label for=" telepon" class="control-label col-md-3 fw-bold">Telepon / HP</label>
                                    <div class="col-md-7">
                                        <input type="text" class="form-control" name="telepon" required>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <div class="col-md-7 d-grid gap-2 d-md-flex justify-content-md-end">
                                        <button class=" btn btn-primary" name=" daftar">Daftar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br><br><br>
    <!-- footer -->
    <?php include 'templates/footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>

</html>