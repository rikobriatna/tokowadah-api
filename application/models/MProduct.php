<?php

// extends class Model
class MProduct extends CI_Model
{

    // response jika field ada yang kosong
    public function empty_response()
    {
        $response['status'] = 502;
        $response['error'] = true;
        $response['message'] = 'Field tidak boleh kosong';
        return $response;
    }

    public function getLatestProduct($kategori, $jumlah)
    {

        $response = null;
        $where = "";

        if ($kategori) {
            $where = array(
                "a.id_kategori" => $kategori,
                "b.active" => "0"
            );
        } else {
            $where = array(
                "b.active" => "0"
            );
        }

        $this->db->select('a.id_produk, a.nama_produk, b.harga, b.harga_diskon, b.gambar');
        $this->db->from('produk a');
        $this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
        $this->db->where($where);
        $this->db->order_by('a.updated_at', 'DESC');
        $this->db->limit($jumlah);
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['product'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get product';
        }

        return $response;

    }

    public function getAllProduct()
    {

        $response = null;

        $where = array(
            "b.active" => "0"
        );

        $this->db->select('a.id_produk, a.nama_produk, b.harga, b.harga_diskon, b.gambar');
        $this->db->from('produk a');
        $this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
        $this->db->where($where);
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['product'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get product';
        }

        return $response;

    }

    public function getProductByCategory($id)
    {

        if (empty($id)) {

            return $this->empty_response();

        } else {

            $response = null;
            $where = array(
                "a.id_kategori" => $id,
                "b.active" => "0"
            );

            $this->db->select('a.id_produk, a.nama_produk, b.harga, b.harga_diskon, b.gambar, c.nama_kategori');
            $this->db->from('produk a');
            $this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
            $this->db->join('kategori c', 'a.id_kategori = c.id_kategori');
            $this->db->where($where);
            $query = $this->db->get();

            if ($query->result()) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['product'] = $query->result();
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed get product';
            }

            return $response;
        }

    }

    public function getImagesBanner()
    {

        $response = null;

        $where = array(
            "image_category" => "banner"
        );

        $this->db->select('*');
        $this->db->from('gambar');
        $this->db->where($where);
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['images'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get product';
        }

        return $response;

    }

    public function getDetailProductByIdProduct($id)
    {

        $response = null;

        $where = array(
            "a.id_produk" => $id,
            "b.active" => "0"
        );

        $this->db->select('a.id_produk, a.id_kategori, a.nama_produk, b.*');
        $this->db->from('produk a');
        $this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
        $this->db->where($where);
        $query = $this->db->get();

        if ($query->result()) {
            $response['status'] = 200;
            $response['error'] = false;
            $response['product'] = $query->result();
        } else {
            $response['status'] = 501;
            $response['error'] = true;
            $response['message'] = 'Failed get product';
        }

        return $response;

    }

    public function getRelatedProduct($id)
    {

        $response = null;

        //first select product category
        $where = array(
            "id_produk" => $id
        );
        $this->db->select('id_kategori');
        $this->db->from('produk');
        $this->db->where($where);
        $query = $this->db->get();
        $results = $query->result();
        $idKategori = "";
        foreach ($results as $row) {
            $idKategori = $row->id_kategori;
        }

        return $this->getProductByCategory($idKategori);

    }

    public function getProductSearch($txt)
    {

        if (empty($txt)) {

            return $this->empty_response();

        } else {

            $txt = strtolower($txt);

            $response = null;
            $where = array(
                "LOWER(a.nama_produk)" => $txt,
                "b.active" => "0"
            );

            $this->db->select('a.id_produk, a.nama_produk, b.harga, b.harga_diskon, b.gambar, c.nama_kategori');
            $this->db->from('produk a');
            $this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
            $this->db->join('kategori c', 'a.id_kategori = c.id_kategori');
            $this->db->like($where);
            $query = $this->db->get();

            if ($query->result()) {
                $response['status'] = 200;
                $response['error'] = false;
                $response['product'] = $query->result();
            } else {
                $response['status'] = 501;
                $response['error'] = true;
                $response['message'] = 'Failed get product';
            }

            return $response;
        }

    }

    public function requestProduct($name, $email, $phone, $address, $productName, $productAmount, $budget,
                                   $ongkir, $imageProduct1, $imageProduct2, $imageProduct3, $imageProduct4)
    {
        $response = null;

        if ($name != "" && $email != "" && $phone != "" && $address != "" && $productName != "" &&
            $productAmount != "" && $budget != "" && $ongkir != "") {

            $currentTime = date("Y-m-d H:i:s");

            $data = array(
                'namalengkap' => $name,
                'email' => $email,
                'alamat' => $address,
                'no_handphone' => $phone,
                'nama_produk' => $productName,
                'jml_produk' => $productAmount,
                'budget' => $budget,
                'harga_pengiriman' => $ongkir,
                'created_at' => $currentTime
            );

            //insert into table users
            $execute = $this->db->insert('permintaan', $data);

            if ($execute) {

                $id = $this->db->insert_id();

                $imgName1 = "";
                $imgName2 = "";
                $imgName3 = "";
                $imgName4 = "";

                $nama = str_replace(" ","_", $name);
                $nama = strtolower($nama);

                if ($imageProduct1 != "") {
                    if (preg_match('/^data:image\/(\w+);base64,/', $imageProduct1, $type)) {
                        $data = substr($imageProduct1, strpos($imageProduct1, ',') + 1);
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
                    $imgName1 = $nama . "_1" . ".{$type}";
                    $path = "upload/permintaan/" . $imgName1;

                    write_file($path, $data);

                }

                if ($imageProduct2 != "") {
                    if (preg_match('/^data:image\/(\w+);base64,/', $imageProduct2, $type)) {
                        $data = substr($imageProduct2, strpos($imageProduct2, ',') + 1);
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
                    $imgName2 = $nama . "_2" . ".{$type}";
                    $path = "upload/permintaan/" . $imgName2;

                    write_file($path, $data);

                }

                if ($imageProduct3 != "") {
                    if (preg_match('/^data:image\/(\w+);base64,/', $imageProduct3, $type)) {
                        $data = substr($imageProduct3, strpos($imageProduct3, ',') + 1);
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
                    $imgName3 = $nama . "_3" . ".{$type}";
                    $path = "upload/permintaan/" . $imgName3;

                    write_file($path, $data);

                }

                if ($imageProduct4 != "") {
                    if (preg_match('/^data:image\/(\w+);base64,/', $imageProduct4, $type)) {
                        $data = substr($imageProduct4, strpos($imageProduct4, ',') + 1);
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
                    $imgName4 = $nama . "_4" . ".{$type}";
                    $path = "upload/permintaan/" . $imgName4;

                    write_file($path, $data);

                }

                $data = array(
                    'gambar1' => $imgName1,
                    'gambar2' => $imgName2,
                    'gambar3' => $imgName3,
                    'gambar4' => $imgName4
                );

                $where = array(
                    "id" => $id
                );

                //update profile image
                $this->db->update('permintaan', $data, $where);

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

}

?>
