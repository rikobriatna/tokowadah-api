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

    public function kirimEmail($email, $idTrx, $sequence)
    {
        $result['data'] = $this->MTrans->getDetailMyOrderEmail($idTrx);
//        $msg = $this->load->view('notif/v_test', $result);
        $msg = $this->load->view('notif/v_test', $result, true);
        $from = "info@tokowadah.com";
        $to = $email;
        $subject = $this->getSubjectBySequence($sequence);
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

    private function getSubjectBySequence($sequence){
        $subject = "";
        if($sequence == "1"){
            $subject = "Menunggu Pembayaran";
        } elseif($sequence == "2"){
            $subject = "Pembayaran terverifikasi";
        } elseif($sequence == "3"){
            $subject = "Pesanan dikirim";
        } elseif($sequence == "4"){
            $subject = "Konfirmasi pesanan telah diterima";
        } else {
            $subject = "Pesanan selesai";
        }
        return $subject;
    }
}
