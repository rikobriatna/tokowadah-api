<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utils extends CI_Controller {

    // construct
    public function __construct(){
        parent::__construct();
    }

    public function send_mail() {

        $from_email = "info@tokowadah.com";
        $to_email = "rikobriatna01@gmail.com";

        $config = Array(
            'protocol' => 'smtp',
            'smtp_host' => 'mail.tokowadah.com',
            'smtp_port' => 465,
            'smtp_user' => 'info@tokowadah.com',
            'smtp_pass' => 'tokowadah01',
            'mailtype'  => 'html',
            'charset'   => 'iso-8859-1'
        );

        $this->load->library('email', $config);
        $this->email->set_newline("\r\n");

        $this->email->from($from_email, "Info TokoWadah");
         $this->email->to($to_email);
         $this->email->subject('Test Pengiriman Email');
         $this->email->message("Coba mengirim Email dengan CodeIgniter.");

         //Send mail
         if($this->email->send()){
//             $this->session->set_flashdata("notif","Email berhasil terkirim.");
             echo "Email berhasil terkirim.";
         }else {
//             $this->session->set_flashdata("notif","Email gagal dikirim.");
             echo "Email gagal dikirim.";
             echo "<br>";
             echo $this->email->print_debugger();
         }
      }
}
