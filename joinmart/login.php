<?php
session_start();

//koneksi ke database
include 'koneksi.php';


// jika tombol login ditekan
if(isset($_POST['login'])){

  $email = $_POST['email'];
  $password = $_POST['password'];

  // Melakukan query pada tabel pelanggan
  $ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan='$email' AND password_pelanggan='$password'");

  // Mengecek akun yang cocok (email & password)
  $akunyangcocok = $ambil->num_rows;

  // Jika ada akun yang cocok
  if($akunyangcocok == 1){
    // Mendapatkan aku dalam bentuk array
    $akun = $ambil->fetch_assoc();

    // Simpan di session
    $_SESSION["pelanggan"] = $akun;
    echo "<div class='alert alert-success'>Login sukses</div>";

    // Jika sudah belanja
    if(isset($_SESSION['keranjang']) OR !empty($_SESSION['keranjang'])){
      echo "<meta http-equiv='refresh' content='1;url=checkout.php'>";
    }
    else{
      echo "<meta http-equiv='refresh' content='1;url=riwayat.php'>";
    }
  }
  else{
    // echo "<script>alert('Gagal login')</script>";
    // echo "<script>location='login.php';</script>";
    echo "<div class='alert alert-danger'>Login gagal!</div>";
		echo "<meta http-equiv='refresh' content='1;url=login.php'>";
  }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Pelanggan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>

    <?php include 'templates/navbar.php'; ?>

    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-4 col-md-offset-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Login Pelanggan</h3>
                    </div>
                    <div class="card-body">
                        <form action="" method="post">
                            <div class="form-group mt-3 ">
                                <label for="" class="fw-bold">Email</label>
                                <input type=" email" class="form-control" name="email">
                            </div>
                            <div class="form-group mt-3">
                                <label for="" class="fw-bold">Password</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" name="login" class="btn btn-primary form-control">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br>
    <?php include 'templates/footer.php'; ?>

    <script src=" https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>

</html>