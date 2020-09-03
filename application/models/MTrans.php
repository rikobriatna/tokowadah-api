<?php

// extends class Model
class MTrans extends CI_Model{

	// response jika field ada yang kosong
	public function empty_response(){
		$response['status']=502;
		$response['error']=true;
		$response['message']='Field tidak boleh kosong';
		return $response;
	}
  
	public function getMyCart($userId){
	
		$response = null;
		
		if($userId){
		
			$where = array(
					"a.user_id"=> $userId,
					"a.status"=> "1"
				);
				
			$this->db->select('a.*, b.nama_produk, c.gambar as gambar_produk');
			$this->db->from('cart a');
			$this->db->join('produk b', 'a.id_produk = b.id_produk');
			$this->db->join('detailproduk c', 'b.id_produk = c.id_produk');
			$this->db->where($where);
			$query = $this->db->get();
			
	//		var_dump($query->result());
			
			if($query->result()){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Success';
				$response['order']=$query->result();
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed get data';
				$response['order']= '';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
  
	public function addToCart($userId, $idProduk, $jml, $harga, $total, $pengiriman){
	
		$response = null;
		
		if($userId != "" && $idProduk != "" && $jml != "" && $harga != "" && $total != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
			
			//check if product already added
			$where = array(
					"user_id"=> $userId,
					"id_produk"=> $idProduk
				);
				
			$this->db->select('*');
			$this->db->from('cart');
			$this->db->where($where);
			$query = $this->db->get();
			$results = $query->result();
			$resultsArray = $query->result_array();
			
			if($results){
				
				//product already exist then update
				
				$_jml = 0;
				$_harga = 0;
				$_total = 0;
				$_status = 0;
				
				foreach($resultsArray as $result){
					$_jml = $result['jml'];
					$_harga = $result['harga'];
					$_total = $result['total'];
					$_status = $result['status'];
				}
				
				if($_status == 0){
					
					$data = array(
						'jml' => $jml,
						'total' => $total,
						'updated_at' => $currentTime,
						'status' => "1"
					);
					
				} else if($_status == 1){
				
					$_jml = $_jml + $jml;
					$_total = $_jml * $_harga;
					
					$data = array(
						'jml' => $_jml,
						'total' => $_total,
						'updated_at' => $currentTime
					);
				
				} else {
					
					$response['status']=300;
					$response['error']=false;
					$response['message']='Already checkout';
					
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
			
			if($execute){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Data inserted';
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed insert data';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
  
	public function updateCartItem($idCart, $jml, $total, $status){
	
		$response = null;
		
		if($idCart != "" && $jml != "" && $total != "" && $status != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
			
			//check if product already added
			$where = array(
					"id"=> $idCart
				);
				
			$data = array(
				'jml' => $jml,
				'total' => $total,
				'updated_at' => $currentTime,
				'status' => $status
			);
			
			$execute = $this->db->update('cart', $data, $where);
			
			if($execute){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Data updated';
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed insert data';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
	
	public function updateStatusCartItem($idCart, $status){
	
		$response = null;
		
		if($idCart != "" && $status != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
			
			//check if product already added
			$where = array(
					"id"=> $idCart
				);
				
			$data = array(
				'updated_at' => $currentTime,
				'status' => $status
			);
			
			$execute = $this->db->update('cart', $data, $where);
			
			if($execute){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Data updated';
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed insert data';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
  
	public function addVoucher($jenisVoucher, $namaVoucher, $persentase, $nominal){
	
		$response = null;
		
		if($jenisVoucher != "" && $namaVoucher != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
				
			$data = array(
				'jenis_voucher' => $jenisVoucher,
				'nama_voucher' => $namaVoucher,
				'persentase' => $persentase,
				'nominal' => $nominal,
				'created_at' => $currentTime
			);
			
			$execute = $this->db->insert('voucher', $data);
			
			if($execute){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Data inserted';
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed insert data';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
  
	public function addVoucherTrx($userId, $idVoucher){
	
		$response = null;
		
		if($userId != "" && $idVoucher != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
				
			$data = array(
				'user_id' => $userId,
				'id_voucher' => $idVoucher,
				'trx_created_date' => $currentTime,
				'status' => '0'
			);
			
			$execute = $this->db->insert('voucher_trx', $data);
			
			if($execute){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Data inserted';
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed insert data';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
  
	public function getVoucherTrx($userId, $namaVoucher){
	
		$response = null;
		
		if($userId){
		
			$where = array(
					"a.user_id"=> $userId,
					"b.nama_voucher"=> $namaVoucher
				);
				
			$this->db->select('*');
			$this->db->from('voucher_trx a');
			$this->db->join('voucher b', 'a.id_voucher = b.id_voucher');
			$this->db->where($where);
			$query = $this->db->get();
			
	//		var_dump($query->result());
			
			if($query->result()){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Success';
				$response['data']=$query->result();
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed get data';
				$response['data']= '';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
  
	public function updateVoucherTrx($idVoucherTrx, $status){
	
		$response = null;
		
		if($idVoucherTrx != "" && $status != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
			
			$where = array(
					"id_voucher_trx"=> $idVoucherTrx
				);
				
			$data = array(
				'status' => '1',
				'trx_updated_date' => $currentTime
			);
			
			$execute = $this->db->update('voucher_trx', $data, $where);
			
			if($execute){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Data updated';
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed insert data';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
	
	public function getIdNextOrder(){
		$id = 0;
		
		$this->db->select_max('id_trx');
		$query = $this->db->get('pesanan');
		$result = $query->result();
		
		$id = $result[0]->id_trx;
		$id++;
		
		return $id;
	}

	
	public function insertOrder($idCart, $userId, $totalItem, $totalHarga, $idVoucherTrx, $totalDiskon){
	
		$response = null;
		
		if($idCart != "" && $userId != "" && $totalItem != "" && $totalHarga != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
			
			$this->updateVoucherTrx($idVoucherTrx, '1');
			
			$carts = explode(",",$idCart);
			
			$execute = false;
			$idTrx = $this->getIdNextOrder();
			
			foreach($carts as $id){
				
				if($id){
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
						'total_diskon' => $totalDiskon,
						'trx_created_date' => $currentTime,
						'status' => '0'
					);
					
					$execute = $this->db->insert('pesanan', $data);
			
				}
			}
			
			if($execute){
				$response['status']= 200;
				$response['error']= false;
				$response['message']= 'Data inserted';
				$response['idTrx']= $idTrx;
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed insert data';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
	
	public function getDetailOrder($idTrx){
	
		$response = null;
		
		if($idTrx){
		
			$where = array(
					"a.id_trx"=> $idTrx
				);
				
			$this->db->select('a.*, b.id_produk, b.jml, b.harga, b.total, c.nama_produk, d.gambar as gambar_produk');
			$this->db->from('pesanan a');
			$this->db->join('cart b', 'a.id_cart = b.id');
			$this->db->join('produk c', 'b.id_produk = c.id_produk');
			$this->db->join('detailproduk d', 'c.id_produk = d.id_produk');
			$this->db->where($where);
			$query = $this->db->get();
			
	//		var_dump($query->result());
			
			if($query->result()){
				$response['status']=200;
				$response['error']=false;
				$response['message']='Success';
				$response['order']=$query->result();
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed get data';
				$response['order']= '';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
	
	public function choosePaymentMethod($idTrx, $nominalBayar, $metodeBayar){
	
		$response = null;
		
		if($idTrx != "" && $nominalBayar != "" && $metodeBayar != ""){
			
			$currentTime = date("Y-m-d	H:i:s");
			
			$where = array(
					"id_trx"=> $idTrx
				);
				
			$data = array(
				'status' => '1',
				'trx_updated_date' => $currentTime
			);
			
			$execute = $this->db->update('pesanan', $data, $where);
			
			if($execute){
				
				//random 3 digit
				$rand3 = rand(1,1000);
				$nominalRand = substr_replace($nominalBayar, $rand3, -3);
				
				//check if already choose payment method
				$where = array(
					"id_trx"=> $idTrx
				);
				
				$this->db->select('*');
				$this->db->from('pembayaran');
				$this->db->where($where);
				$query = $this->db->get();
				$result = $query->result();
				
				if($result){
					//already exist then update
					$where = array(
								"id_trx"=> $idTrx
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
				
				if($execute){
					$response['status']= 200;
					$response['error']= false;
					$response['message']= 'Success choose payment method';
				} else {
					$response['status']= 300;
					$response['error']= false;
					$response['message']= 'Failed choose payment method';
				}
				
			} else{
				$response['status']=501;
				$response['error']=true;
				$response['message']='Failed update trx';
			}
		
		} else {
			$response =	$this->empty_response();
		}
		
		return $response;

	}
	
	public function getListPaymentMethod(){
	
		$response = null;
			
		$this->db->select('*');
		$this->db->from('metode_pembayaran');
		$query = $this->db->get();
	
		if($query->result()){
			$response['status']=200;
			$response['error']=false;
			$response['message']='Success';
			$response['data']=$query->result();
		} else{
			$response['status']=501;
			$response['error']=true;
			$response['message']='Failed get data';
			$response['data']= '';
		}
		
		return $response;

	}

	public function getPaymentData($idTrx){
		
		$response = null;

		$where = array(
			"id_trx"=> $idTrx
		);

		$this->db->select('a.*, b.metode, b.nama_bank, b.logo_rek, b.no_rek, b.nama_rek');
		$this->db->from('pembayaran a');
		$this->db->join('metode_pembayaran b', 'a.id_metode_bayar = b.id');
		$this->db->where($where);
		$query = $this->db->get();

		if($query->result()){
			$response['status']=200;
			$response['error']=false;
			$response['message']='Success';
			$response['data']=$query->result();
		} else{
			$response['status']=501;
			$response['error']=true;
			$response['message']='Failed get data';
			$response['data']= '';
		}

		return $response;

	}

	public function uploadPaymentReceipt($idTrx, $base64Image){

		$response = null;

		if($idTrx != "" && $base64Image != ""){
			
			if (preg_match('/^data:image\/(\w+);base64,/', $base64Image, $type)) {
				$data = substr($base64Image, strpos($base64Image, ',') + 1);
				$type = strtolower($type[1]); // jpg, png, gif

				if (!in_array($type, array('jpg', 'jpeg', 'gif', 'png'))) {
					throw new \Exception('invalid image type');
				}

				$data = base64_decode($data);

				if ($data === false) {
					throw new \Exception('base64_decode failed');
				}
			} else {
				throw new \Exception('did not match data URI with image data');
			}

//			file_put_contents(base_url("upload/pembayaran/".$idTrx.".{$type}"), $data);
			if ( ! write_file("upload/pembayaran/".$idTrx.".{$type}", $data))
			{
				$response['status']=300;
				$response['error']=true;
				$response['message']='Failed upload';
			}
			else
			{
				$response['status']=200;
				$response['error']=false;
				$response['message']='Success upload';
			}

		} else {
			$response =	$this->empty_response();
		}

		return $response;

	}

}

?>
