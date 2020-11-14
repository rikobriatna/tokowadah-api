<?php

require APPPATH . 'libraries/REST_Controller.php';

class User extends REST_Controller{

  // construct
  public function __construct(){
    parent::__construct();
    $this->load->model('MUser');
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

  public function login_post(){
	
	$auth = $this->authenticate($this->post('apiKey'));
	
	if($auth["status"] != 200){
		$response = $auth;
	} else {
		$response = $this->MUser->login(
			$this->post('email'),
			$this->post('password')
		);
	}
    
    $this->response($response);
	
  }

  public function register_post(){

	$auth = $this->authenticate($this->post('apiKey'));

	if($auth["status"] != 200){
		$response = $auth;
	} else {
		$response = $this->MUser->register(
			$this->post('userId'),
			$this->post('email'),
			$this->post('password'),
			$this->post('name'),
			$this->post('phone'),
			$this->post('address'),
			$this->post('profileImage')
		);
	}

    $this->response($response);

  }

	public function getUserById_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MUser->getUserById(
				$this->post('userId')
			);
		}

		$this->response($response);

	}

	public function updateUser_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MUser->updateUser(
				$this->post('userId'),
				$this->post('email'),
				$this->post('name'),
				$this->post('phone'),
				$this->post('address'),
				$this->post('profileImage'),
				$this->post('profileImageBg')
			);
		}

		$this->response($response);

	}

	public function registerMitra_post(){

		$auth = $this->authenticate($this->post('apiKey'));

		if($auth["status"] != 200){
			$response = $auth;
		} else {
			$response = $this->MUser->registerMitra(
				$this->post('userIdMitra'),
				$this->post('email'),
				$this->post('password'),
				$this->post('firstName'),
				$this->post('lastName'),
				$this->post('phone'),
				$this->post('address'),
				$this->post('sosmedIG'),
				$this->post('sosmedFB'),
				$this->post('bidangBisnis'),
				$this->post('namaToko'),
				$this->post('namaPerusahaan'),
				$this->post('imageToko')
			);
		}

		$this->response($response);

	}
  
}

?>
