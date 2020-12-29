<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utils extends CI_Controller
{

    // construct
    public function __construct()
    {
        parent::__construct();
        $this->load->model('MTrans');
    }

    public function kirimEmail($idTrx)
    {
        $result['data'] = $this->MTrans->getDetailMyOrderEmail($idTrx);
//        var_dump($result);
//        $msg = $this->load->view('notif/v_test', $result);
        $msg = $this->load->view('notif/v_test', $result, true);
        $from = "info@tokowadah.com";
        $to = "rikobriatna01@gmail.com";
        $subject = "Checking PHP mail";
        $message = $msg;
//        $headers = "From:" . $from;
        // Always set content-type when sending HTML email
        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
// More headers
        $headers .= 'From: <info@tokowadah.com>' . "\r\n";
        mail($to, $subject, $message, $headers);
        echo "Pesan email sudah terkirim.";

    }
}
