<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Invoice</title>
    <link rel="stylesheet" href="<?php echo base_url().'/assets/css/'?>style_notif.css" media="all" />
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