<?php

// extends class Model
class MTrans extends CI_Model
{

    // response jika field ada yang kosong
    public function empty_response()
    {
        $response['status'] = 502;
        $response['error'] = true;
        $response['message'] = 'Field tidak boleh kosong';
        return $response;
    }

    public function getMyCart($userId)
    {

        $response = null;

        if ($userId) {

            $where = array(
                "a.user_id" => $userId,
                "a.status" => "1"
            );

            $this->db->select('a.*, b.nama_produk, c.gambar as gambar_produk');
            $this->db->from('cart a');
            $this->db->join('produk b', 'a.id_produk = b.id_produk');
            $this->db->join('detailproduk c', 'b.id_produk = c.id_produk');
            $this->db->where($where);
            $query = $this->db->get();

            //		var_dump($query->result());

            if ($query->result()) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Success';
                $response['order'] = $query->result();
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed get data';
                $response['order'] = '';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function addToCart($userId, $idProduk, $jml, $harga, $total, $pengiriman)
    {

        $response = null;

        if ($userId != "" && $idProduk != "" && $jml != "" && $harga != "" && $total != "") {

            $currentTime = date("Y-m-d	H:i:s");

            //check if product already added
            $where = array(
                "user_id" => $userId,
                "id_produk" => $idProduk
            );

            $this->db->select('*');
            $this->db->from('cart');
            $this->db->where($where);
            $query = $this->db->get();
            $results = $query->result();
            $resultsArray = $query->result_array();

            if ($results) {

                //product already exist then update

                $_jml = 0;
                $_harga = 0;
                $_total = 0;
                $_status = 0;

                foreach ($resultsArray as $result) {
                    $_jml = $result['jml'];
                    $_harga = $result['harga'];
                    $_total = $result['total'];
                    $_status = $result['status'];
                }

                if ($_status == 0) {

                    $data = array(
                        'jml' => $jml,
                        'total' => $total,
                        'updated_at' => $currentTime,
                        'status' => "1"
                    );

                } else if ($_status == 1) {

                    $_jml = $_jml + $jml;
                    $_total = $_jml * $_harga;

                    $data = array(
                        'jml' => $_jml,
                        'total' => $_total,
                        'updated_at' => $currentTime
                    );

                } else {

                    $response['status'] = 300;
                    $response['error'] = false;
                    $response['message'] = 'Already checkout';

                    return $response;
                }

                $execute = $this->db->update('cart', $data, $where);

            } else {

                $data = array(
                    'user_id' => $userId,
                    'id_produk' => $idProduk,
                    'jml' => $jml,
                    'harga' => $harga,
                    'total' => $total,
                    'pengiriman' => $pengiriman,
                    'created_at' => $currentTime,
                    'status' => 1, //satu status keranjang
                );

                $execute = $this->db->insert('cart', $data);
            }

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data inserted';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function updateCartItem($idCart, $jml, $total, $status)
    {

        $response = null;

        if ($idCart != "" && $jml != "" && $total != "" && $status != "") {

            $currentTime = date("Y-m-d	H:i:s");

            //check if product already added
            $where = array(
                "id" => $idCart
            );

            $data = array(
                'jml' => $jml,
                'total' => $total,
                'updated_at' => $currentTime,
                'status' => $status
            );

            $execute = $this->db->update('cart', $data, $where);

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function updateStatusCartItem($idCart, $status)
    {

        $response = null;

        if ($idCart != "" && $status != "") {

            $currentTime = date("Y-m-d	H:i:s");

            //check if product already added
            $where = array(
                "id" => $idCart
            );

            $data = array(
                'updated_at' => $currentTime,
                'status' => $status
            );

            $execute = $this->db->update('cart', $data, $where);

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function addVoucher($jenisVoucher, $namaVoucher, $persentase, $nominal)
    {

        $response = null;

        if ($jenisVoucher != "" && $namaVoucher != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $data = array(
                'jenis_voucher' => $jenisVoucher,
                'nama_voucher' => $namaVoucher,
                'persentase' => $persentase,
                'nominal' => $nominal,
                'created_at' => $currentTime
            );

            $execute = $this->db->insert('voucher', $data);

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data inserted';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function addVoucherTrx($userId, $idVoucher)
    {

        $response = null;

        if ($userId != "" && $idVoucher != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $data = array(
                'user_id' => $userId,
                'id_voucher' => $idVoucher,
                'trx_created_date' => $currentTime,
                'status' => '0'
            );

            $execute = $this->db->insert('voucher_trx', $data);

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data inserted';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getVoucherTrx($userId, $namaVoucher)
    {

        $response = null;

        if ($userId) {

            $where = array(
                "a.user_id" => $userId,
                "b.nama_voucher" => $namaVoucher
            );

            $this->db->select('*');
            $this->db->from('voucher_trx a');
            $this->db->join('voucher b', 'a.id_voucher = b.id_voucher');
            $this->db->where($where);
            $query = $this->db->get();

            //		var_dump($query->result());

            if ($query->result()) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Success';
                $response['data'] = $query->result();
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed get data';
                $response['data'] = '';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function updateVoucherTrx($idVoucherTrx, $status)
    {

        $response = null;

        if ($idVoucherTrx != "" && $status != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $where = array(
                "id_voucher_trx" => $idVoucherTrx
            );

            $data = array(
                'status' => '1',
                'trx_updated_date' => $currentTime
            );

            $execute = $this->db->update('voucher_trx', $data, $where);

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getIdNextOrder()
    {
        $id = 0;

        $this->db->select_max('id_trx');
        $query = $this->db->get('pesanan');
        $result = $query->result();

        $id = $result[0]->id_trx;
        $id++;

        return $id;
    }


    public function insertOrder($idCart, $userId, $totalItem, $totalHargaBefore, $totalHarga, $idVoucherTrx, $totalDiskon)
    {

        $response = null;

        if ($idCart != "" && $userId != "" && $totalItem != "" && $totalHargaBefore != "" && $totalHarga != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $this->updateVoucherTrx($idVoucherTrx, '1');

            $carts = explode(",", $idCart);

            $execute = false;
            $idTrx = $this->getIdNextOrder();

            foreach ($carts as $id) {

                if ($id) {
                    //update idCart
                    $this->updateStatusCartItem($id, '2');

                    //insert order
                    $data = array(
                        'id_trx' => $idTrx,
                        'id_cart' => $id,
                        'user_id' => $userId,
                        'id_voucher_trx' => $idVoucherTrx,
                        'total_item' => $totalItem,
                        'total_harga' => $totalHarga,
                        'total_harga_before' => $totalHargaBefore,
                        'total_diskon' => $totalDiskon,
                        'trx_created_date' => $currentTime,
                        'status' => '0'
                    );

                    $execute = $this->db->insert('pesanan', $data);

                    //insert order tracking
                    $data = array(
                        'id_trx' => $idTrx,
                        'id_pengiriman' => '0',
                        'activity' => 'Pesanan dibuat',
                        'activity_date' => $currentTime
                    );

                    $execute = $this->db->insert('order_tracking', $data);

                }
            }

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data inserted';
                $response['idTrx'] = $idTrx;
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed insert data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getDetailOrder($idTrx)
    {

        $response = null;

        if ($idTrx) {

            $where = array(
                "a.id_trx" => $idTrx
            );

            $this->db->select('a.*, b.id_produk, b.jml, b.harga, b.total, c.nama_produk, d.gambar as gambar_produk');
            $this->db->from('pesanan a');
            $this->db->join('cart b', 'a.id_cart = b.id', 'left');
            $this->db->join('produk c', 'b.id_produk = c.id_produk', 'left');
            $this->db->join('detailproduk d', 'c.id_produk = d.id_produk', 'left');
            $this->db->where($where);
            $query = $this->db->get();

            //		var_dump($query->result());

            if ($query->result()) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Success';
                $response['order'] = $query->result();
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed get data';
                $response['order'] = '';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function choosePaymentMethod($idTrx, $nominalBayar, $metodeBayar)
    {

        $response = null;

        if ($idTrx != "" && $nominalBayar != "" && $metodeBayar != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $where = array(
                "id_trx" => $idTrx
            );

            $data = array(
                'status' => '1',
                'trx_updated_date' => $currentTime
            );

            $execute = $this->db->update('pesanan', $data, $where);

            if ($execute) {

                //random 3 digit
                $rand3 = rand(1, 1000);
                $nominalRand = substr_replace($nominalBayar, $rand3, -3);

                //check if already choose payment method
                $where = array(
                    "id_trx" => $idTrx
                );

                $this->db->select('*');
                $this->db->from('pembayaran');
                $this->db->where($where);
                $query = $this->db->get();
                $result = $query->result();

                if ($result) {
                    //already exist then update
                    $where = array(
                        "id_trx" => $idTrx
                    );

                    $data = array(
                        'id_metode_bayar' => $metodeBayar,
                        'nominal_bayar' => $nominalRand,
                        'payment_updated_date' => $currentTime
                    );

                    $execute = $this->db->update('pembayaran', $data, $where);
                } else {
                    //not exist then insert

                    $data = array(
                        'id_trx' => $idTrx,
                        'id_metode_bayar' => $metodeBayar,
                        'nominal_bayar' => $nominalRand,
                        'payment_created_date' => $currentTime,
                        'status_bayar' => '0'
                    );

                    $execute = $this->db->insert('pembayaran', $data);
                }

                //insert order tracking
                $data = array(
                    'id_trx' => $idTrx,
                    'id_pengiriman' => '0',
                    'activity' => 'Menunggu konfirmasi pembayaran',
                    'activity_date' => $currentTime
                );

                $execute = $this->db->insert('order_tracking', $data);

                if ($execute) {
                    $response['status'] = 200;
                    $response['error'] = false;
                    $response['message'] = 'Success choose payment method';
                } else {
                    $response['status'] = 300;
                    $response['error'] = false;
                    $response['message'] = 'Failed choose payment method';
                }

            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed update trx';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getListPaymentMethod()
    {

        $response = null;

        $this->db->select('*');
        $this->db->from('metode_pembayaran');
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Success';
            $response['data'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get data';
            $response['data'] = '';
        }

        return $response;

    }

    public function getPaymentData($idTrx)
    {

        $response = null;

        $where = array(
            "id_trx" => $idTrx
        );

        $this->db->select('a.*, b.metode, b.id_bank, b.logo_rek, b.no_rek, b.nama_rek');
        $this->db->from('pembayaran a');
        $this->db->join('metode_pembayaran b', 'a.id_metode_bayar = b.id', 'left');
        $this->db->where($where);
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Success';
            $response['data'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get data';
            $response['data'] = '';
        }

        return $response;

    }

    public function uploadPaymentReceipt($idTrx, $base64Image, $namaPengirim, $idBank, $noRek)
    {

        $response = null;

        $currentTime = date("Y-m-d	H:i:s");

        if ($idTrx != "" && $base64Image != "" && $namaPengirim != "" && $idBank != "" && $noRek != "") {

            if (preg_match('/^data:image\/(\w+);base64,/', $base64Image, $type)) {
                $data = substr($base64Image, strpos($base64Image, ',') + 1);
                $type = strtolower($type[1]); // jpg, png, gif

                if (!in_array($type, array('jpg', 'jpeg', 'gif', 'png'))) {
                    $response['status'] = 303;
                    $response['error'] = true;
                    $response['message'] = 'invalid image type';
                    throw new \Exception('invalid image type');
                }

                $data = base64_decode($data);

                if ($data === false) {
                    $response['status'] = 304;
                    $response['error'] = true;
                    $response['message'] = 'base64_decode failed';
                    throw new \Exception('base64_decode failed');
                }
            } else {
                $response['status'] = 305;
                $response['error'] = true;
                $response['message'] = 'did not match data URI with image data';
                throw new \Exception('did not match data URI with image data');
            }

            $path = "upload/pembayaran/" . $idTrx . ".{$type}";

            if (!write_file($path, $data)) {

                $response['status'] = 300;
                $response['error'] = true;
                $response['message'] = 'Failed upload';
            } else {
                $where = array(
                    "id_trx" => $idTrx
                );

                $data = array(
                    'payment_updated_date' => $currentTime,
                    'bukti_bayar' => '/' . $path,
                    'status_bayar' => '1',
                    'nama_pengirim' => $namaPengirim,
                    'id_bank_bayar' => $idBank,
                    'no_rek_bayar' => $noRek
                );

                $data_pesan = array(
                    'status' => "3"
                );

                $execute = $this->db->update('pembayaran', $data, $where);

                $execute = $this->db->update('pesanan', $data_pesan, $where);

                //insert order tracking
                $data = array(
                    'id_trx' => $idTrx,
                    'id_pengiriman' => '0',
                    'activity' => 'Pembayaran telah terverifikasi',
                    'activity_date' => $currentTime
                );

                $execute = $this->db->insert('order_tracking', $data);

                //insert order tracking
                $data = array(
                    'id_trx' => $idTrx,
                    'id_pengiriman' => '0',
                    'activity' => 'Pesanan dikemas',
                    'activity_date' => $currentTime
                );

                $execute = $this->db->insert('order_tracking', $data);

                //update no_invoice
                $noInvoice = $this->generateNoInvoice();
                $data = array(
                    "no_invoice" => $noInvoice
                );
                $execute = $this->db->update('pembayaran', $data, $where);

                if ($execute) {
                    $response['status'] = 200;
                    $response['error'] = false;
                    $response['message'] = 'Success upload';
                } else {
                    $response['status'] = 301;
                    $response['error'] = true;
                    $response['message'] = 'Failed update data';
                }

            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getListBank()
    {

        $response = null;

        $this->db->select('*');
        $this->db->from('bank');
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Success';
            $response['data'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get data';
            $response['data'] = '';
        }

        return $response;

    }

    public function getMyOrder($userId)
    {

        $response = null;

        $where = array(
            "p.user_id" => $userId
        );

        $this->db->select('p.id_trx, p.id_cart, p.total_item, p.total_harga, p.trx_created_date, p.trx_updated_date, p.status, count(p.id_trx) as jumlah, d.nama_produk, e.gambar, b.no_invoice');
        $this->db->from('pesanan p');
        $this->db->join('cart c', 'p.id_cart = c.id', 'left');
        $this->db->join('produk d', 'c.id_produk = d.id_produk', 'left');
        $this->db->join('detailproduk e', 'd.id_produk = e.id', 'left');
        $this->db->join('pembayaran b', 'p.id_trx = b.id_trx', 'left');
        $this->db->where($where);
        $this->db->group_by("p.id_trx");
        $this->db->order_by("p.trx_updated_date", "DESC");
        $query = $this->db->get();

//		print_r($this->db->last_query());

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Success';
            $response['data'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get data';
            $response['data'] = '';
        }

        return $response;

    }

    public function getDetailMyOrder($idTrx)
    {

        $response = null;

        $where = array(
            "p.id_trx" => $idTrx
        );

        $this->db->select('p.*, d.id_produk, d.nama_produk, e.gambar, c.jml, c.harga, m.metode, b.nominal_bayar, b.no_invoice, b.file_invoice,
				u.firstname, u.lastname, u.phone, u.address, n.nama_pengirim, n.no_resi, n.ongkir, n.durasi');
        $this->db->from('pesanan p');
        $this->db->join('pembayaran b', 'p.id_trx = b.id_trx', 'left');
        $this->db->join('metode_pembayaran m', 'b.id_metode_bayar = m.id', 'left');
        $this->db->join('pengiriman n', 'p.id_pengiriman = n.id_pengiriman', 'left');
        $this->db->join('users_metadata u', 'p.user_id = u.user_id', 'left');
        $this->db->join('cart c', 'p.id_cart = c.id', 'left');
        $this->db->join('produk d', 'c.id_produk = d.id_produk', 'left');
        $this->db->join('detailproduk e', 'd.id_produk = e.id', 'left');
        $this->db->where($where);
//        $this->db->group_by("p.id_trx");
        $this->db->order_by("p.trx_updated_date", "DESC");
        $query = $this->db->get();

//		print_r($this->db->last_query());

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Success';
            $response['data'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get data';
            $response['data'] = '';
        }

        return $response;

    }

    public function trackMyOrder($idTrx)
    {

        $response = null;

        $where = array(
            "o.id_trx" => $idTrx
        );

        $this->db->select('*');
        $this->db->from('order_tracking o');
        $this->db->join('pengiriman p', 'o.id_pengiriman = p.id_pengiriman', 'left');
        $this->db->where($where);
        $this->db->order_by("o.activity_date", "DESC");
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Success';
            $response['data'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get data';
            $response['data'] = '';
        }

        return $response;

    }

    public function getInvoice($idTrx)
    {

        $where = array(
            "p.id_trx" => $idTrx
        );

        $this->db->select('p.*, d.id_produk, d.nama_produk, e.berat, e.gambar, c.jml, c.harga, c.total as subtotal_harga, m.metode, 
								b.nominal_bayar, b.no_invoice, b.file_invoice, b.payment_updated_date as tgl_bayar,
								u.firstname, u.lastname, u.phone, u.address, n.nama_pengirim, n.no_resi, n.ongkir, n.durasi');
        $this->db->from('pesanan p');
        $this->db->join('pembayaran b', 'p.id_trx = b.id_trx', 'left');
        $this->db->join('metode_pembayaran m', 'b.id_metode_bayar = m.id', 'left');
        $this->db->join('pengiriman n', 'p.id_pengiriman = n.id_pengiriman', 'left');
        $this->db->join('users_metadata u', 'p.user_id = u.user_id', 'left');
        $this->db->join('cart c', 'p.id_cart = c.id', 'left');
        $this->db->join('produk d', 'c.id_produk = d.id_produk', 'left');
        $this->db->join('detailproduk e', 'd.id_produk = e.id', 'left');
        $this->db->where($where);
        $this->db->group_by("p.id_trx");
        $this->db->order_by("p.trx_updated_date", "DESC");
        $query = $this->db->get();

//		print_r($this->db->last_query());

        return $query->result();

    }

    public function generateNoInvoice()
    {

        $noInvoice = "";

        $currentTime = date("Y-m-d	H:i:s");

        $this->db->select('no_invoice');
        $this->db->from('pembayaran');
        $this->db->order_by("no_invoice", "DESC");
        $this->db->limit(1);
        $query = $this->db->get();
        $results = $query->result();
        $resultsArray = $query->result_array();
        $_noInv = "";

        if ($results) {

            foreach ($resultsArray as $result) {
                $_noInv = $result['no_invoice'];
            }
        }

        if ($_noInv == "") {
            $_noInv = "0/INV-TN/II/2020";
        }

        $arrInv = explode("/", $_noInv);

        $noInv = $arrInv[0];
        $noInv = $noInv + 1;

        $noInvoice = $noInv . "/" . $arrInv[1] . "/" . $arrInv[2] . "/" . date("Y");

        return $noInvoice;

    }

    public function updatePengiriman($idTrx, $kurir, $noResi, $ongkir, $durasi, $gambar)
    {

        $response = null;

        if ($idTrx != "" && $kurir != "" && $noResi != "" && $ongkir != "" && $durasi != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $data = array(
                'nama_pengirim' => $kurir,
                'no_resi' => $noResi,
                'ongkir' => $ongkir,
                'durasi' => $durasi,
                'gambar' => $gambar
            );

            $execute = $this->db->insert('pengiriman', $data);

            $id = $this->db->insert_id();

            $where = array(
                "id_trx" => $idTrx
            );
            $data = array(
                'id_pengiriman' => $id
            );
            $execute = $this->db->update('pesanan', $data, $where);
            $execute = $this->db->update('order_tracking', $data, $where);

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed update data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getTrxByUser($name, $date)
    {

        if (empty($name) || empty($date)) {

            return $this->empty_response();

        } else {

            $name = strtolower($name);

            $response = null;
            $where = array(
                "LOWER(b.firstname)" => $name,
                "a.trx_created_date" => $date
            );

            $this->db->select('a.id_trx, a.id_pengiriman, a.trx_created_date as trx_date, b.firstname as customer_name, b.phone, b.address, d.nama_produk');
            $this->db->from('pesanan a');
            $this->db->join('users_metadata b', 'a.user_id = b.user_id', 'left');
            $this->db->join('cart c', 'a.id_cart = c.id', 'left');
            $this->db->join('produk d', 'c.id_produk = d.id_produk', 'left');
            $this->db->like($where);
            $query = $this->db->get();

            if ($query->result()) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['data'] = $query->result();
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['data'] = 'Failed get data';
            }

            return $response;
        }

    }

    public function updateOrderTrack($idTrx, $activity)
    {

        $response = null;

        if ($idTrx != "" && $activity != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $idKirim = $this->getIdKirimByTrx($idTrx);

            $data = array(
                'id_trx' => $idTrx,
                'id_pengiriman' => $idKirim,
                'activity' => $activity,
                'activity_date' => $currentTime
            );

            $execute = $this->db->insert('order_tracking', $data);

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed update data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function finishOrder($idTrx)
    {

        $response = null;

        if ($idTrx != "") {

            $currentTime = date("Y-m-d	H:i:s");

            $where = array(
                "id_trx" => $idTrx
            );

            $data = array(
                'status' => '6'
            );

            $execute = $this->db->update('pesanan', $data, $where);

            $where = array(
                "id_trx" => $idTrx
            );

            $this->db->select('id_cart');
            $this->db->from('pesanan');
            $this->db->where($where);
            $query = $this->db->get();
            $resultsArray = $query->result_array();

            foreach ($resultsArray as $result) {
                $idCart = $result['id_cart'];
            }

            $where = array(
                "id" => $idCart
            );

            $data = array(
                'status' => '3'
            );

            $execute = $this->db->update('cart', $data, $where);

            $this->updateOrderTrack($idTrx, "Order Selesai");

            if ($execute) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['message'] = 'Data updated';
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed update data';
            }

        } else {
            $response = $this->empty_response();
        }

        return $response;

    }

    public function getIdKirimByTrx($idTrx)
    {

        $idKirim = "";

        $where = array(
            "id_trx" => $idTrx
        );

        $this->db->select('id_pengiriman');
        $this->db->from('pesanan');
        $this->db->where($where);
        $query = $this->db->get();
        $resultsArray = $query->result_array();

        foreach ($resultsArray as $result) {
            $idKirim = $result['id_pengiriman'];
        }

        return $idKirim;
    }

    public function getDetailMyOrderEmail($idTrx)
    {

        $response = null;

        $where = array(
            "p.id_trx" => $idTrx
        );

        $this->db->select('p.*, d.id_produk, d.nama_produk, e.gambar, c.jml, c.harga, m.metode, b.nominal_bayar, b.no_invoice, b.file_invoice,
				b.payment_updated_date, u.firstname, u.lastname, us.email, u.phone, u.address, n.nama_pengirim, n.no_resi, n.ongkir, n.durasi');
        $this->db->from('pesanan p');
        $this->db->join('pembayaran b', 'p.id_trx = b.id_trx', 'left');
        $this->db->join('metode_pembayaran m', 'b.id_metode_bayar = m.id', 'left');
        $this->db->join('pengiriman n', 'p.id_pengiriman = n.id_pengiriman', 'left');
        $this->db->join('users us', 'p.user_id = us.uuid', 'left');
        $this->db->join('users_metadata u', 'p.user_id = u.user_id', 'left');
        $this->db->join('cart c', 'p.id_cart = c.id', 'left');
        $this->db->join('produk d', 'c.id_produk = d.id_produk', 'left');
        $this->db->join('detailproduk e', 'd.id_produk = e.id', 'left');
        $this->db->where($where);
//        $this->db->group_by("p.id_trx");
        $this->db->order_by("p.trx_updated_date", "DESC");
        $query = $this->db->get();

        return $query->result();

    }

    public function getEmailByTrx($idTrx)
    {

        $email = null;

        $where = array(
            "p.id_trx" => $idTrx
        );

        $this->db->select('us.email');
        $this->db->from('pesanan p');
        $this->db->join('users us', 'p.user_id = us.uuid', 'left');
        $this->db->where($where);
        $this->db->group_by("p.id_trx");
        $this->db->order_by("p.trx_updated_date", "DESC");
        $query = $this->db->get();
        $resultsArray = $query->result_array();

        foreach ($resultsArray as $result) {
            $email = $result['email'];
        }

        return $email;

    }

}

?>
