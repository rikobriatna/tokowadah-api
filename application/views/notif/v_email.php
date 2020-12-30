<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
    <meta charset="utf-8"> <!-- utf-8 works for most cases -->
    <meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn't be necessary -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
    <meta name="x-apple-disable-message-reformatting">  <!-- Disable auto-scale in iOS 10 Mail entirely -->
    <title></title> <!-- The title tag shows in email notifications, like Android 4.4. -->

    <link href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,400,500,600,700" rel="stylesheet">

    <!-- CSS Reset : BEGIN -->
    <style>

        /* What it does: Remove spaces around the email design added by some email clients. */
        /* Beware: It can remove the padding / margin and add a background color to the compose a reply window. */
        html,
        body {
            margin: 0 auto !important;
            padding: 0 !important;
            height: 100% !important;
            width: 100% !important;
            background: #f1f1f1;
        }

        /* What it does: Stops email clients resizing small text. */
        * {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }

        /* What it does: Centers email on Android 4.4 */
        div[style*="margin: 16px 0"] {
            margin: 0 !important;
        }

        /* What it does: Stops Outlook from adding extra spacing to tables. */
        table,
        td {
            mso-table-lspace: 0pt !important;
            mso-table-rspace: 0pt !important;
        }

        /* What it does: Fixes webkit padding issue. */
        table {
            border-spacing: 0 !important;
            border-collapse: collapse !important;
            table-layout: fixed !important;
            margin: 0 auto !important;
        }

        /* What it does: Uses a better rendering method when resizing images in IE. */
        img {
            -ms-interpolation-mode: bicubic;
        }

        /* What it does: Prevents Windows 10 Mail from underlining links despite inline CSS. Styles for underlined links should be inline. */
        a {
            text-decoration: none;
        }

        /* What it does: A work-around for email clients meddling in triggered links. */
        *[x-apple-data-detectors], /* iOS */
        .unstyle-auto-detected-links *,
        .aBn {
            border-bottom: 0 !important;
            cursor: default !important;
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        /* What it does: Prevents Gmail from displaying a download button on large, non-linked images. */
        .a6S {
            display: none !important;
            opacity: 0.01 !important;
        }

        /* What it does: Prevents Gmail from changing the text color in conversation threads. */
        .im {
            color: inherit !important;
        }

        /* If the above doesn't work, add a .g-img class to any image in question. */
        img.g-img + div {
            display: none !important;
        }

        /* What it does: Removes right gutter in Gmail iOS app: https://github.com/TedGoas/Cerberus/issues/89  */
        /* Create one of these media queries for each additional viewport size you'd like to fix */

        /* iPhone 4, 4S, 5, 5S, 5C, and 5SE */
        @media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
            u ~ div .email-container {
                min-width: 320px !important;
            }
        }

        /* iPhone 6, 6S, 7, 8, and X */
        @media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
            u ~ div .email-container {
                min-width: 375px !important;
            }
        }

        /* iPhone 6+, 7+, and 8+ */
        @media only screen and (min-device-width: 414px) {
            u ~ div .email-container {
                min-width: 414px !important;
            }
        }

    </style>

    <!-- CSS Reset : END -->

    <!-- Progressive Enhancements : BEGIN -->
    <style>

        .primary {
            background: #f34949;
        }

        .bg_white {
            background: #ffffff;
        }

        .bg_light {
            background: #f7fafa;
        }

        .bg_black {
            background: #000000;
        }

        .bg_dark {
            background: rgba(0, 0, 0, .8);
        }

        .email-section {
            padding: 2.5em;
        }

        /*BUTTON*/
        .btn {
            padding: 3px 10px;
            display: inline-block;
        }

        .btn.btn-primary {
            border-radius: 5px;
            background: #f34949;
            color: #ffffff;
        }

        .btn.btn-white {
            border-radius: 5px;
            background: #ffffff;
            color: #000000;
        }

        .btn.btn-white-outline {
            border-radius: 5px;
            background: transparent;
            border: 1px solid #fff;
            color: #fff;
        }

        .btn.btn-black-outline {
            border-radius: 0px;
            background: transparent;
            border: 2px solid #000;
            color: #000;
            font-weight: 700;
        }

        .btn-custom {
            color: rgba(0, 0, 0, .3);
            text-decoration: underline;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Work Sans', sans-serif;
            color: #000000;
            margin-top: 0;
            font-weight: 400;
        }

        body {
            font-family: 'Work Sans', sans-serif;
            font-weight: 400;
            font-size: 15px;
            line-height: 1.8;
            color: rgba(0, 0, 0, .4);
        }

        a {
            color: #f34949;
        }

        table {
        }

        /*LOGO*/

        .logo h1 {
            margin: 0 0 20px 0;
        }

        .logo h1 a {
            color: #000;
            font-size: 24px;
            font-weight: 300;
            font-family: 'Work Sans', sans-serif;
        }

        /*HERO*/
        .hero {
            position: relative;
            z-index: 0;
        }

        .hero .text {
            color: rgba(0, 0, 0, .3);
        }

        .hero .text h2 {
            color: #000;
            font-size: 34px;
            margin-bottom: 15px;
            font-weight: 300;
            line-height: 1.2;
        }

        .hero .text h3 {
            font-size: 24px;
            font-weight: 200;
        }

        .hero .text h2 span {
            font-weight: 600;
            color: #000;
        }


        /*PRODUCT*/
        .product-entry {
            display: block;
            position: relative;
            float: left;
            padding-top: 20px;
        }

        .product-entry .text {
            width: calc(100% - 125px);
            padding-left: 20px;
        }

        .product-entry .text h3 {
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .product-entry .text p {
            margin-top: 0;
        }

        .product-entry .text span {
            color: #000;
            font-size: 14px;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 10px;
        }

        .product-entry img, .product-entry .text {
            float: left;
        }

        ul.social {
            padding: 0;
        }

        ul.social li {
            display: inline-block;
            margin-right: 10px;
        }

        /*FOOTER*/

        .footer {
            color: rgba(0, 0, 0, .5);
        }

        .footer .heading {
            color: #000;
            font-size: 20px;
        }

        .footer ul {
            margin: 0;
            padding: 0;
        }

        .footer ul li {
            list-style: none;
            margin-bottom: 10px;
        }

        .footer ul li a {
            color: rgba(0, 0, 0, 1);
        }


        @media screen and (max-width: 500px) {


        }


    </style>


</head>

<body width="100%" style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #f1f1f1;">
<center style="width: 100%; background-color: #f1f1f1;">
    <div style="display: none; font-size: 1px;max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; mso-hide: all; font-family: sans-serif;">
        &zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;
    </div>
    <div style="max-width: 600px; margin: 0 auto;" class="email-container">
        <!-- BEGIN BODY -->
        <?php
        $createDate = null;
        $totalHarga = null;
        $metodeBayar = null;
        $tglBayar = null;
        foreach ($data as $row) {
            $createDate = $row->trx_created_date;
            $totalHarga = $row->total_harga;
            $metodeBayar = $row->metode;
            $tglBayar = $row->payment_updated_date;
        }
        if($sequence == "1"){ //belum bayar
            $judul = "Mohon segera selesaikan pembayaran Anda";
            $detail = "Checkout berhasil pada tanggal ".$createDate;
        } elseif($sequence == "2"){ //sudah bayar
            $judul = "Terima kasih pembayaran Anda telah terverifikasi";
            $detail = "Pembayaran pada tanggal ".$tglBayar;
        } elseif($sequence == "3"){ //dikirim
            $judul = "Hore, pesanan Anda sudah dikirim";
            $detail = "";
        } elseif($sequence == "4"){ //diterima
            $judul = "Halo, info dari kurir pesanan telah diterima";
            $detail = "Pastikan barang telah sesuai dan konfirmasi ya";
        } elseif($sequence == "5"){ //selesai
            $judul = "Pesanan telah selesai";
            $detail = "Terima kasih ya, Kami tunggu order berikutnya";
        } else {
            $judul = "";
            $detail = "";
        }
        ?>
        <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%"
               style="margin: auto;">
            <tr>
                <td valign="top" class="bg_white" style="padding: 1em 2.5em 0 2.5em;">
                    <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td class="logo" style="text-align: left;">
                                <img src="<?php echo base_url() . '/upload/icons/' ?>ic_logo.png" width="75"
                                     height="75">
                                <!--			            <h1><a href="#">Minimart.</a></h1>-->
                            </td>
                        </tr>
                    </table>
                </td>
            </tr><!-- end tr -->
            <tr>
                <td valign="middle" class="hero bg_white">
                    <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="padding: 0 2.5em; text-align: left;">
                                <div class="text">
                                    <h2> <?php echo $judul; ?> </h2>
                                    <h3> <?php echo $detail; ?> </h3>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr><!-- end tr -->
            <tr>
                <td valign="middle" class="hero bg_white">
                    <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="padding: 0 2.5em; text-align: left;">
                                <h4> Total Pembayaran </h4>
                            </td>
                            <td style="padding: 0 2.5em; text-align: left;">
                                <h4> Metode Pembayaran </h4>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 0 2.5em; text-align: left;">
                                <h3> <?php echo "Rp. " . number_format($totalHarga, 0, ',', '.'); ?> </h3>
                            </td>
                            <td style="padding: 0 2.5em; text-align: left;">
                                <h3> <?php echo $metodeBayar; ?> </h3>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr><!-- end tr -->
            <tr>
                <td valign="middle" class="hero bg_white" style="padding: 1em 0 0 2.5em;">
                    <h4><b> Detail Order </b></h4>
                </td>
            </tr>
            <tr>
                <td class="bg_white" style="padding: 0 0 4em 0;">
                    <table class="bg_white" role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <?php
                        foreach ($data as $row) {
                            $baseUrlImage = "https://api.tokowadah.com/upload/product";
                            $imageUrl = $baseUrlImage . $row->gambar;
                            ?>
                            <tr style="border-bottom: 1px solid rgba(0,0,0,.05);">
                                <td valign="middle" width="70%" style="text-align:left; padding: 0 2.5em;">
                                    <div class="product-entry">
                                        <img src="<?php echo $imageUrl; ?>" alt=""
                                             style="width: 100px; max-width: 600px; height: auto; margin-bottom: 20px; display: block;">
                                        <div class="text">
                                            <h3> <?php echo $row->nama_produk; ?> </h3>
                                        </div>
                                    </div>
                                </td>
                                <td valign="middle" width="30%" style="text-align:center; padding-right: 2.5em;">
                                <span class="price"
                                      style="color: #f34949; font-size: 20px; display: block;"> <?php echo "Rp. " . number_format($row->harga, 0, ',', '.'); ?> </span>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                    </table>
                </td>
            </tr><!-- end tr -->
            <!-- 1 Column Text + Button : END -->
        </table>
        <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%"
               style="margin: auto;">
            <tr>
                <td valign="middle" class="bg_light footer email-section">
                    <table>
                        <tr>
                            <td valign="top" width="50%" style="padding-top: 20px;">
                                <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="text-align: left; padding-right: 10px;">
                                            <h3 class="heading">Tentang Kita</h3>
                                            <p>Tokowadah merupakan situs bisnis online B2B alat industrial untuk
                                                pengadaan dan penjualan material atau suku cadang yang berkonsentrasi
                                                saat ini pada bidang pengeboran dan konstruksi</p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top" width="50%" style="padding-top: 20px;">
                                <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="text-align: left; padding-left: 5px; padding-right: 5px;">
                                            <h3 class="heading">Info Kontak</h3>
                                            <ul>
                                                <li><span class="text">Jl. Pesona Anggrek, Blok F6/9, Harapan Jaya, Bekasi Utara, Indonesia</span>
                                                </li>
                                                <li><span class="text">+6281296591638</span></a></li>
                                                <li><span class="text">info@tokowadah.com</span></a></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr><!-- end: tr -->
        </table>

    </div>
</center>
</body>
</html>