<?php

require APPPATH . 'libraries/REST_Controller.php';

class Product extends REST_Controller{

  // construct
  public function __construct(){
    parent::__construct();
    $this->load->model('MProduct');
  }
  
  public function authenticate($apiKey){
	if($apiKey == "3bf65cb5dfb7a643e75079cf5cde147f") {
		$response['status']=200;
		$response['error']=true;
		$response['message']='OK';
	} else {
		$response['status']=401;
		$response['error']=true;
		$response['message']='Access denied';
	}
    return $response;
  }
  
  public function getLatestProduct_post(){
	
	$auth = $this->authenticate($this->post('apiKey'));
	
	if($auth["status"] != 200){
		$response = $auth;
	} else {
		$response = $this->MProduct->getLatestProduct(
			$this->post('kategori'),
			$this->post('jumlah')
		);
	}
    
    $this->response($response);
  }
  
  public function getAllProduct_post(){
	
	$auth = $this->authenticate($this->post('apiKey'));
	
	if($auth["status"] != 200){
		$response = $auth;
	} else {
		$response = $this->MProduct->getAllProduct();
	}	
	
    $this->response($response);
  }

  public function getProductByCategory_post(){
	
	$auth = $this->authenticate($this->post('apiKey'));
	
	if($auth["status"] != 200){
		$response = $auth;
	} else {
		$response = $this->MProduct->getProductByCategory(
			$this->post('kategori')
		  );
	}
	
    $this->response($response);
  }
  
  public function getImagesBanner_post(){
	
	$auth = $this->authenticate($this->post('apiKey'));
	
	if($auth["status"] != 200){
		$response = $auth;
	} else {
		$response = $this->MProduct->getImagesBanner();
	}	
	
    $this->response($response);
  }
  
  public function getDetailProductByIdProduct_post(){
	
	$auth = $this->authenticate($this->post('apiKey'));
	
	if($auth["status"] != 200){
		$response = $auth;
	} else {
		$response = $this->MProduct->getDetailProductByIdProduct(
			$this->post('idProduk')
		  );
	}
	
    $this->response($response);
  }
  
	public function getRelatedProduct_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
	
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MProduct->getRelatedProduct(
				$this->post('idProduk')
			  );
		}
		
		$this->response($response);
	}

	public function search_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MProduct->getProductSearch(
				$this->post('textSearch')
			);
		}

		$this->response($response);
	}
  
}

?>
