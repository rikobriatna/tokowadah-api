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

    public function kirimEmail()
    {
        $result['data'] = $this->MTrans->getInvoice("2");
        $msg = $this->load->view('notif/v_belum_bayar', $result, TRUE);
        $from = "info@tokowadah.com";
        $to = "rikobriatna01@gmail.com";
        $subject = "Checking PHP mail";
        $message = $msg;
        $headers = "From:" . $from;
        mail($to, $subject, $message, $headers);
        echo "Pesan email sudah terkirim.";

    }

    public function htmlmail()
    {

        $config = Array(
            'protocol' => 'sendmail',
            'smtp_host' => 'mail.tokowadah.com',
            'smtp_port' => 25,
            'smtp_user' => 'info@tokowadah.com',
            'smtp_pass' => 'tokowadah01',
            'smtp_timeout' => '4',
            'mailtype' => 'html',
            'charset' => 'iso-8859-1'

        );

        $this->load->library('email', $config);

        $this->email->set_newline("\r\n");


        $this->email->from('info@tokowadah.com', 'Tokowadah.com');

        $this->email->to("rikobriatna01@gmail.com"); // replace it with receiver mail id

        $this->email->subject("Test Email"); // replace it with relevant subject


        $result['data'] = $this->MTrans->getInvoice("2");
        $body = $this->load->view('notif/v_belum_bayar', $result, TRUE);

        $this->email->message($body);

        $this->email->send();

    }
}
