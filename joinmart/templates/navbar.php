<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#052c65">
    <div class="container-fluid ml-13 mr-16 ">
        <a class="navbar-brand " href=" index.php">

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            JOINMART
        </a>
        <button class=" navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="keranjang.php">Keranjang</a>
                </li>
                <!-- Jika sudah login (ada login pelanggan) -->
                <?php if(isset($_SESSION["pelanggan"])): ?>
                <li class="nav-item">
                    <a class="nav-link active" href="logout.php">Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="riwayat.php">Riwayat Belanja</a>
                </li>
                <!-- Selain itu (belum login / belum ada session pelanggan) -->
                <?php else: ?>
                <li class="nav-item" <?php if($_GET['page']="login.php") { ?> class="active" <?php } ?>>
                    <a class="nav-link active" href="login.php">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="daftar.php">Daftar</a>
                </li>
                <?php endif; ?>
                <li class="nav-item">
                    <a class="nav-link active" href="checkout.php">Checkout</a>
                </li>
            </ul>
            <form action="pencarian.php" method="get" class=" d-flex navbar-form navbar-right">
                <input type="text" class="form-control me-2" name=" keyword" placeholder="Cari Produk">
                <button class="btn btn-success" type="submit">Cari</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </form>
        </div>
    </div>
</nav>