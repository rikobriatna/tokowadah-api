<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utils extends CI_Controller {

    // construct
    public function __construct(){
        parent::__construct();
        $this->load->model('MTrans');
    }

    public function kirimEmail(){
        $result['data']=$this->MTrans->getInvoice("2");
        $msg = $this->load->view('notif/v_belum_bayar', $result);
        $from = "info@tokowadah.com";
        $to = "rikobriatna01@gmail.com";
        $subject = "Checking PHP mail";
        $message = $msg;
        $headers = "From:" . $from;
        mail($to,$subject,$message, $headers);
        echo "Pesan email sudah terkirim.";

    }
}
