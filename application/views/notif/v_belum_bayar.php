<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Invoice</title>
<!--    <link rel="stylesheet" href="--><?php //echo base_url().'/assets/css/'?><!--style_notif.css" media="all" />-->
      <style>
          @font-face {
              font-family: SourceSansPro;
              src: url(<?php echo base_url()?>/assets/fonts/SourceSansPro-Regular.ttf);
          }

          .clearfix:after {
              content: "";
              display: table;
              clear: both;
          }

          a {
              color: #0087C3;
              text-decoration: none;
          }

          body {
              position: relative;
              width: 21cm;
              height: 29.7cm;
              margin: 0 auto;
              color: #555555;
              background: #FFFFFF;
              font-family: Arial, sans-serif;
              font-size: 14px;
              font-family: SourceSansPro;
              overflow-x:hidden !important;
          }

          header {
              padding: 10px 0;
              margin-bottom: 20px;
              border-bottom: 1px solid #AAAAAA;
          }

          #logo {
              float: left;
              margin-top: 8px;
          }

          #logo img {
              height: 70px;
          }

          #company {
              float: right;
              text-align: right;
          }


          #details {
              margin-bottom: 50px;
          }

          #client {
              padding-left: 6px;
              border-left: 6px solid #0087C3;
              float: left;
          }

          #client .to {
              color: #777777;
          }

          p.name {
              font-size: 1.0em;
              font-weight: bold;
              margin: 5px 0 0 0;
          }

          #invoice {
              float: right;
              text-align: right;
          }

          #invoice h1 {
              color: #00008B;
              font-size: 1.0em;
              font-weight: normal;
              margin: 0  0 5px 0;
          }

          #invoice .date {
              font-size: 1.1em;
              color: #777777;
          }

          table {
              width: 100%;
              border-collapse: collapse;
              border-spacing: 0;
              margin-bottom: 20px;
          }

          table th,
          table td {
              padding: 20px;
              background: #FBFBFB;
              text-align: left;
              border-bottom: 1px solid #FFFFFF;
          }

          table th {
              white-space: nowrap;
              font-weight: normal;
          }

          table td {
              text-align: left;
          }

          table td h3{
              color: #57B223;
              font-size: 1.2em;
              font-weight: normal;
              margin: 0 0 0.2em 0;
          }

          table th.header {
              background: #EEEEEE;
          }

          table td.detail {
          }

          table .no {
              color: #FFFFFF;
              font-size: 1.6em;
              background: #57B223;
          }

          table .desc {
              text-align: left;
          }

          table .unit {
              background: #DDDDDD;
          }

          table .qty {
          }

          table .total {
              background: #00008B;
              color: #FFFFFF;
          }

          table td.unit,
          table td.qty,
          table td.total {
              font-size: 1.2em;
          }

          table tbody tr:last-child td {
              border: none;
          }

          table tfoot td {
              padding: 10px 20px;
              background: #FFFFFF;
              border-bottom: none;
              font-size: 1.2em;
              white-space: nowrap;
              border-top: 1px solid #AAAAAA;
          }

          table tfoot tr:first-child td {
              border-top: none;
          }

          table tfoot tr:last-child td {
              color: #454545;
              font-size: 1.4em;
              border-top: 1px solid #454545;

          }

          table tfoot tr td:first-child {
              border: none;
          }

          #thanks{
              font-size: 2em;
              margin-bottom: 50px;
          }

          #notices{
              padding-left: 6px;
              /*border-left: 6px solid #0087C3;*/
          }

          #notices .notice {
              font-size: 1.0em;
              font-style: italic;
          }

          footer {
              color: #777777;
              width: 100%;
              height: 30px;
              position: absolute;
              bottom: 0;
              border-top: 1px solid #AAAAAA;
              padding: 8px 0;
              text-align: center;
          }

      </style>
  </head>
  <body>
    <?php
        foreach($data as $row){
        }
        $name = $row->firstname."".$row->lastname;
        $address = $row->address;
        $phone = $row->phone;
        $noInv = $row->no_invoice;
        $tglInv = date("d-m-Y", strtotime($row->tgl_bayar));
        $subTotalHarga = "Rp " . number_format($row->total_harga_before,0,',','.');
        $subTotalDiskon = "Rp " . number_format($row->total_diskon,0,',','.');
        $subTotalOngkir = "Rp " . number_format($row->ongkir,0,',','.');
        $total = "Rp " . number_format($row->total_harga,0,',','.');
    ?>
    <header class="clearfix">
      <div id="logo">
        <img src="<?php echo base_url().'/upload/icons/'?>ic_logo.png">
      </div>
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to">Tujuan Pengiriman</div>
          <p class="name"> <?php echo $name ?> </p>
          <div class="address"> <?php echo $address ?> </div>
          <div class="email"> <?php echo $phone ?> </div>
        </div>
        <div id="invoice">
			Nomor Invoice <h1> <?php echo $noInv ?> </h1>
			<div class="date">Tanggal : <?php echo $tglInv ?> </div>
        </div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="header">Nama Produk</th>
            <th class="header">Berat</th>
            <th class="header">Jumlah</th>
			<th class="header">Harga Barang</th>
            <th class="header">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <?php foreach($data as $row){

            ?>
          <tr>
            <td class="detail"> <?php echo $row->nama_produk; ?>  </td>
            <td class="detail"> <?php echo $row->berat; ?> </td>
            <td class="detail"> <?php echo $row->jml; ?> </td>
            <td class="detail"> <?php echo "Rp " . number_format($row->harga,0,',','.'); ?> </td>
            <td class="detail"> <?php echo "Rp " . number_format($row->subtotal_harga,0,',','.'); ?> </td>
          </tr>
        <?php } ?>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">Subtotal Harga Barang</td>
            <td> <?php echo $subTotalHarga; ?> </td>
          </tr>
		  <tr>
            <td colspan="2"></td>
            <td colspan="2">Subtotal Potongan Harga</td>
            <td> <?php echo $subTotalDiskon; ?> </td>
          </tr>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">Subtotal Ongkos Kirim</td>
            <td> <?php echo $subTotalOngkir; ?> </td>
          </tr>
          <tr>
            <td colspan="2"></td>
            <td colspan="2">Total</td>
            <td> <?php echo $total; ?> </td>
          </tr>
        </tfoot>
      </table>
        <br> <br> <br> <br>
        <div id="notices">
            <div class="notice">
                tokowadah.com merupakan pasar daring yang menjadi perantara antar penjual dan pembeli. <br>
                tokowadah.com menyatakan bahwa bukti pembayaran ini menunjukkan harga sebenarnya dari barang yang diuraikan dan bahwa semua keterangan adalah benar dan tepat. <br>
                Bukti pembayaran ini dihasilkan oleh sistem dan tidak memerlukan tanda tangan.
            </div>
        </div>
    </main>
    <footer>
    </footer>
  </body>
</html>