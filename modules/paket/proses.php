<!-- Aplikasi Steam Mobil dan Motor
**********************************************
* Developer    : Indra Styawantoro
* Company      : Indra Studio
* Release Date : 5 Maret 2017
* Website      : www.indrasatya.com
* E-mail       : indra.setyawantoro@gmail.com
* Phone        : +62-856-6991-9769
-->

<?php
session_start();

// Panggil koneksi database.php untuk koneksi database
require_once "../../config/database.php";

// fungsi untuk pengecekan status login user 
// jika user belum login, alihkan ke halaman login dan tampilkan pesan = 1
if (empty($_SESSION['username']) && empty($_SESSION['password'])){
    echo "<meta http-equiv='refresh' content='0; url=index.php?alert=1'>";
}
// jika user sudah login, maka jalankan perintah untuk insert, update, dan delete
else {
    if ($_GET['act']=='insert') {
        if (isset($_POST['simpan'])) {
            // ambil data hasil submit dari form
            $nama_paket      = mysqli_real_escape_string($mysqli, trim($_POST['nama_paket']));
            $jenis_kendaraan = mysqli_real_escape_string($mysqli, trim($_POST['jenis_kendaraan']));
            $harga           = str_replace('.', '', trim($_POST['harga']));
            
            // perintah query untuk menyimpan data ke tabel paket
            $query = mysqli_query($mysqli, "INSERT INTO is_paket(nama_paket,jenis_kendaraan,harga)
                                            VALUES('$nama_paket','$jenis_kendaraan','$harga')")
                                            or die('Ada kesalahan pada query insert : '.mysqli_error($mysqli));    

            // cek query
            if ($query) {
                // jika berhasil tampilkan pesan berhasil simpan data
                header("location: ../../main.php?module=paket&alert=1");
            }   
        }   
    }
    
    elseif ($_GET['act']=='update') {
        if (isset($_POST['simpan'])) {
            if (isset($_POST['id_paket'])) {
                // ambil data hasil submit dari form
                $id_paket        = mysqli_real_escape_string($mysqli, trim($_POST['id_paket']));
                $nama_paket      = mysqli_real_escape_string($mysqli, trim($_POST['nama_paket']));
                $jenis_kendaraan = mysqli_real_escape_string($mysqli, trim($_POST['jenis_kendaraan']));
                $harga           = str_replace('.', '', trim($_POST['harga']));

                // perintah query untuk mengubah data pada tabel paket
                $query = mysqli_query($mysqli, "UPDATE is_paket SET nama_paket      = '$nama_paket',
                                                                    jenis_kendaraan = '$jenis_kendaraan',
                                                                    harga           = '$harga'
                                                              WHERE id_paket        = '$id_paket'")
                                                or die('Ada kesalahan pada query update : '.mysqli_error($mysqli));

                // cek query
                if ($query) {
                    // jika berhasil tampilkan pesan berhasil update data
                    header("location: ../../main.php?module=paket&alert=2");
                }         
            }
        }
    }

    elseif ($_GET['act']=='delete') {
        if (isset($_GET['id'])) {
            $id_paket = $_GET['id'];
    
            // perintah query untuk menghapus data pada tabel paket
            $query = mysqli_query($mysqli, "DELETE FROM is_paket WHERE id_paket='$id_paket'")
                                            or die('Ada kesalahan pada query delete : '.mysqli_error($mysqli));

            // cek hasil query
            if ($query) {
                // jika berhasil tampilkan pesan berhasil delete data
                header("location: ../../main.php?module=paket&alert=3");
            }
        }
    }       
}       
?>