<?php
require APPPATH . 'libraries/REST_Controller.php';
defined('BASEPATH') OR exit('No direct script access allowed');

class Utils extends REST_Controller
{

    // construct
    public function __construct()
    {
        parent::__construct();
        $this->load->model('MTrans');
    }

    public function authenticate($apiKey)
    {
        if ($apiKey == "3bf65cb5dfb7a643e75079cf5cde147f") {
            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'OK';
        } else {
            $response['status'] = 401;
            $response['error'] = true;
            $response['message'] = 'Access denied';
        }
        return $response;
    }

    public function kirimEmail_post()
    {
        $response = null;
        $idTrx = $this->post('idTrx');
        $sequence = $this->post('sequence');

        $auth = $this->authenticate($this->post('apiKey'));

        if ($auth["status"] != 200) {
            $response = $auth;
        } else {

            $result['sequence'] = $sequence;
            $result['data'] = $this->MTrans->getDetailMyOrderEmail($idTrx);
            $email = $this->MTrans->getEmailByTrx($idTrx);
//        $this->load->view('notif/v_email', $result);
            $msg = $this->load->view('notif/v_email', $result, true);
            $to = $email;
            $subject = $this->getSubjectBySequence($sequence);
            $message = $msg;
            // Always set content-type when sending HTML email
            $headers = "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
            $headers .= 'From: Tokowadah.com <info@tokowadah.com>' . "\r\n";
            mail($to, $subject, $message, $headers);

            $response['status'] = 200;
            $response['error'] = false;
            $response['message'] = 'Email terkirim.';
        }

        $this->response($response);

    }

    private function getSubjectBySequence($sequence)
    {
        $subject = "";
        if ($sequence == "1") {
            $subject = "Menunggu Pembayaran";
        } elseif ($sequence == "2") {
            $subject = "Pembayaran terverifikasi";
        } elseif ($sequence == "3") {
            $subject = "Pesanan dikirim";
        } elseif ($sequence == "4") {
            $subject = "Konfirmasi pesanan telah diterima";
        } else {
            $subject = "Pesanan selesai";
        }
        return $subject;
    }
}
