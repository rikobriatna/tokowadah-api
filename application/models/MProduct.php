<?php

// extends class Model
class MProduct extends CI_Model{

  // response jika field ada yang kosong
  public function empty_response(){
    $response['status']=502;
    $response['error']=true;
    $response['message']='Field tidak boleh kosong';
    return $response;
  }
  
  public function getLatestProduct($kategori, $jumlah){

    $response = null;
	$where = "";
	
	if($kategori) {
		$where = array(
			"a.id_kategori"	=> $kategori,
			"b.active"		=> "0" 
		);
	} else {
		$where = array(
			"b.active"=> "0" 
		);
	}
		
	$this->db->select('a.id_produk, a.nama_produk, b.harga, b.harga_diskon, b.gambar');
	$this->db->from('produk a');
	$this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
	$this->db->where($where);
	$this->db->order_by('a.updated_at', 'DESC');
	$this->db->limit($jumlah); 
	$query = $this->db->get();
	
	if($query->result()){
		$response['status']=200;
		$response['error']=false;
		$response['product']=$query->result();
	} else{
		$response['status']=501;
		$response['error']=true;
		$response['message']='Failed get product';
	}
	
	return $response;

  }
  
  public function getAllProduct(){

    $response = null;
	
	$where = array(
			"b.active"=> "0" 
		);
		
	$this->db->select('a.id_produk, a.nama_produk, b.harga, b.harga_diskon, b.gambar');
	$this->db->from('produk a');
	$this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
	$this->db->where($where);
	$query = $this->db->get();
	
	if($query->result()){
		$response['status']=200;
		$response['error']=false;
		$response['product']=$query->result();
	} else{
		$response['status']=501;
		$response['error']=true;
		$response['message']='Failed get product';
	}
	
	return $response;

  }

  public function getProductByCategory($id){

    if(empty($id)){
      
	  return $this->empty_response();
	  
    } else{
		
		$response = null;
		$where = array(
			"a.id_kategori"=>$id,
			"b.active"=> "0"
		);
		
		$this->db->select('a.id_produk, a.nama_produk, b.harga, b.harga_diskon, b.gambar, c.nama_kategori');
		$this->db->from('produk a');
		$this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
		$this->db->join('kategori c', 'a.id_kategori = c.id_kategori');
		$this->db->where($where);
		$query = $this->db->get();
		
		if($query->result()){
			$response['status']=200;
			$response['error']=false;
			$response['product']=$query->result();
		} else{
			$response['status']=501;
			$response['error']=true;
			$response['message']='Failed get product';
		}
		
		return $response;
    }

  }
  
  public function getImagesBanner(){

    $response = null;
	
	$where = array(
			"image_category"=> "banner" 
		);
		
	$this->db->select('*');
	$this->db->from('gambar');
	$this->db->where($where);
	$query = $this->db->get();
	
	if($query->result()){
		$response['status']=200;
		$response['error']=false;
		$response['images']=$query->result();
	} else{
		$response['status']=501;
		$response['error']=true;
		$response['message']='Failed get product';
	}
	
	return $response;

  }
  
  public function getDetailProductByIdProduct($id){

    $response = null;
	
	$where = array(
			"a.id_produk" 	=> $id,
			"b.active"		=> "0" 
		);
		
	$this->db->select('a.id_produk, a.id_kategori, a.nama_produk, b.*');
	$this->db->from('produk a');
	$this->db->join('detailproduk b', 'a.id_produk = b.id_produk');
	$this->db->where($where);
	$query = $this->db->get();
	
	if($query->result()){
		$response['status']=200;
		$response['error']=false;
		$response['product']=$query->result();
	} else{
		$response['status']=501;
		$response['error']=true;
		$response['message']='Failed get product';
	}
	
	return $response;

  }
  
  public function getRelatedProduct($id){

    $response = null;
	
	//first select product category
	$where = array(
			"id_produk" 	=> $id
		);
	$this->db->select('id_kategori');
	$this->db->from('produk');
	$this->db->where($where);
	$query = $this->db->get();
	$results = $query->result();
	$idKategori = "";
	foreach ($results as $row)
	{
		$idKategori = $row->id_kategori;
	}
	
	return $this->getProductByCategory($idKategori);

  }

}

?>
