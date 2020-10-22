<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Invoice extends CI_Controller {

    // construct
    public function __construct(){
        parent::__construct();
        $this->load->model('MTrans');
    }

	public function getInv($idTrxEncoded)
	{
//	    $urlDecoded = urldecode($idTrxEncoded);
//        $idTrx = base64_decode($urlDecoded);
        $result['data']=$this->MTrans->getInvoice($idTrxEncoded);
		$this->load->view('v_invoice', $result);
	}
}
