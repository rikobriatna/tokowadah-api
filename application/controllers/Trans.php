<?php

require APPPATH . 'libraries/REST_Controller.php';

class Trans extends REST_Controller{

	// construct
	public function __construct(){
		parent::__construct();
		$this->load->model('MTrans');
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
  
	public function getMyCart_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getMyCart(
				$this->post('userId')
			);
		}
		
		$this->response($response);
	}
  
	public function addToCart_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->addToCart(
				$this->post('userId'),
				$this->post('idProduk'),
				$this->post('jumlah'),
				$this->post('harga'),
				$this->post('total'),
				$this->post('pengiriman')
			);
		}
		
		$this->response($response);
	}
  
	public function updateCartItem_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->updateCartItem(
				$this->post('idCart'),
				$this->post('jumlah'),
				$this->post('total'),
				$this->post('status')
			);
		}
		
		$this->response($response);
	}
  
	public function addVoucher_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->addVoucher(
				$this->post('jenisVoucher'),
				$this->post('namaVoucher'),
				$this->post('persentase'),
				$this->post('nominal')
			);
		}
		
		$this->response($response);
	}
  
	public function addVoucherTrx_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->addVoucherTrx(
				$this->post('userId'),
				$this->post('idVoucher')
			);
		}
		
		$this->response($response);
	}
  
	public function getVoucherTrx_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getVoucherTrx(
				$this->post('userId'),
				$this->post('namaVoucher')
			);
		}
		
		$this->response($response);
	}
	
	public function updateVoucherTrx_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->updateVoucherTrx(
				$this->post('idVoucherTrx'),
				$this->post('status')
			);
		}
		
		$this->response($response);
	}
  
	public function insertOrder_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->insertOrder(
				$this->post('idCart'),
				$this->post('userId'),
				$this->post('totalItem'),
				$this->post('totalHargaBefore'),
				$this->post('totalHarga'),
				$this->post('idVoucherTrx'),
				$this->post('totalDiskon')
			);
		}
		
		$this->response($response);
	}
	
	public function getDetailOrder_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getDetailOrder(
				$this->post('idTrx')
			);
		}
		
		$this->response($response);
	}
	
	public function choosePaymentMethod_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->choosePaymentMethod(
				$this->post('idTrx'),
				$this->post('nominalBayar'),
				$this->post('metodeBayar')
			);
		}
		
		$this->response($response);
	}
	
	public function getListPaymentMethod_post(){
	
		$auth = $this->authenticate($this->post('apiKey'));
		
		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getListPaymentMethod();
		}
		
		$this->response($response);
	}

	public function getPaymentData_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getPaymentData(
				$this->post('idTrx')
			);
		}

		$this->response($response);
	}

	public function uploadPaymentReceipt_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->uploadPaymentReceipt(
				$this->post('idTrx'),
				$this->post('base64Image'),
				$this->post('namaPengirim'),
				$this->post('idBank'),
				$this->post('noRek')
			);
		}

		$this->response($response);
	}

	public function getListBank_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getListBank();
		}

		$this->response($response);
	}

	public function getMyOrder_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getMyOrder($this->post('userId'));
		}

		$this->response($response);
	}

	public function getDetailMyOrder_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->getDetailMyOrder($this->post('idTrx'));
		}

		$this->response($response);
	}

	public function trackMyOrder_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MTrans->trackMyOrder($this->post('idTrx'));
		}

		$this->response($response);
	}

}

?>
