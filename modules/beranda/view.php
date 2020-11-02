<!-- Aplikasi Steam Mobil dan Motor
**********************************************
* Developer    : Indra Styawantoro
* Company      : Indra Studio
* Release Date : 5 Maret 2017
* Website      : www.indrasatya.com
* E-mail       : indra.setyawantoro@gmail.com
* Phone        : +62-856-6991-9769
-->

  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-home icon-title"></i> Beranda
    </h1>
    <ol class="breadcrumb">
      <li><a href="?module=beranda"><i class="fa fa-home"></i> Beranda</a></li>
    </ol>
  </section>
  
  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-lg-12 col-xs-12">
        <div class="alert alert-info alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <p style="font-size:15px">
            <i class="icon fa fa-user"></i> Selamat datang <strong><?php echo $_SESSION['nama_user']; ?></strong> di Aplikasi Steam Mobil dan Motor.
          </p>        
        </div>
      </div>
    </div>
    <br><br>
    <div class="row">
      <div class="col-lg-12 col-xs-12">
        <div style="text-align: center">
          <img src="assets/img/bg.png" alt="">
        </div>
      </div>
    </div>
  </section><!-- /.content -->