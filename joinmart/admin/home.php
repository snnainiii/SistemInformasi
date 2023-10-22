<style>
.card-data {
    border: solid 1px;
    padding: 20px 50px;
    color: #fff;
}

.card-data.book {
    background-color: #800040;
}

.card-data.category {
    background-color: #004080;
}

.card-data.user {
    background-color: #004000;
}

.card-data i {
    font-size: 80px;
}

.card-desc {
    font-size: 30px;
}

.card-count {
    font-size: 30px;
}
</style>

<h2>Selamat datang Administrator</h2>

<div class="row my-5">
    <div class="col-lg-4">
        <div class="card-data book">
            <div class="row">
                <div class="col-6"><i class="bi bi-journal-album"></i></div>
                <div class="col-6 d-flex flex-column justify-content-center align-items-end">
                    <div class="card-desc">Produk</div>
                    <div class="card-count">10</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="card-data category">
            <div class="row">
                <div class="col-6"><i class="bi bi-list-check"></i></div>
                <div class="col-6 d-flex flex-column justify-content-center align-items-end">
                    <div class="card-desc">Kategori</div>
                    <div class="card-count">6</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="card-data user">
            <div class="row">
                <div class="col-6"><i class="bi bi-person-fill-gear"></i></div>
                <div class="col-6 d-flex flex-column justify-content-center align-items-end">
                    <div class="card-desc">Pembelian</div>
                    <div class="card-count">5</div>
                </div>
            </div>
        </div>
    </div>
</div>