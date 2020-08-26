<?php

require APPPATH . 'libraries/REST_Controller.php';

class App extends REST_Controller{

  // construct
  public function __construct(){
    parent::__construct();
//    $this->load->model('MUser');
  }

  public function version_get(){
    $response = array(
			"version"=> "1.0.0"
		);
    $this->response($response);
  }
  
}

?>
