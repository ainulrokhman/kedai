<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Lupapassword extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('pegawai_model');
        $this->load->model('lupapassword_model');
    }

    public function reset()
    {
        $this->load->model('lupapassword_model');
        $this->form_validation->set_rules('email', 'email', 'trim|required');

        if ($this->form_validation->run() == FALSE) {
            $data['title'] = 'Reset Password';
            $this->load->view('auth/layout/header', $data);
            $this->load->view('lupapassword/resetpassword');
            $this->load->view('auth/layout/footer');
        } else {
            $getEmail = $this->lupapassword_model->getEmail($this->input->post('email'));
            if ($getEmail) {
                foreach ($getEmail as $row);
                // $idPegawai = $row->id_pegawai;
                redirect("lupapassword/gantiPassword/{$row->id_pegawai}");
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
                Email tidak ditemukan
              </div>');
                redirect('lupapassword/reset');
            }
        }
    }

    public function gantiPassword($id)
    {
        $data['id'] = $this->pegawai_model->get_pegawai_by_id($id);
        $data['title'] = 'Ubah Password';
        $this->load->view('auth/layout/header', $data);
        $this->load->view('lupapassword/gantipasswordlama', $data);
        $this->load->view('auth/layout/footer');
    }
    public function prosesUbahPassword()
    {
        $this->pegawai_model->ubah_password_pegawai($this->input->post('id_pegawai'));
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
                Password anda telah diganti, silahkan login.
              </div>');
        redirect('auth/login');
    }
}

/* End of file Lupapassword.php */
