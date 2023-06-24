<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Pegawai_model extends CI_Model
{

    public function getAllPegawai()
    {
        $query = $this->db->get("admin");
        return $query->result_array();
    }

    public function getPegawaiById($id)
    {
        $query = $this->db->query("SELECT * FROM admin WHERE id_pegawai = $id");
        return $query->row();
    }
    public function get_pegawai_by_id($id)
    {
        $query = $this->db->query("SELECT * FROM admin where id_pegawai = $id");
        return $query->result_array();
    }
    public function tambah_pegawai()
    {
        $data = [
            'nama' => $this->input->post('nama'),
            'email' => $this->input->post('email'),
            'alamat' => $this->input->post('alamat'),
            "password" => htmlspecialchars(MD5($this->input->post('password'))),
            'telepon' => $this->input->post('telepon'),
            'jenis_kelamin' => $this->input->post('jenis_kelamin'),
            'jabatan' => 'pegawai'
        ];
        $this->db->insert('admin', $data);
    }
    public function ubah_password_pegawai()
    {
        $data = [
            'password' => htmlspecialchars(MD5($this->input->post('password')))
        ];
        $this->db->where('id_pegawai', $this->input->post('id_pegawai'));
        $this->db->update('admin', $data);
    }

    public function hapus_pegawai($id)
    {
        $this->db->where('id_pegawai', $id);
        $this->db->delete('admin');
    }
    public function editMyProfile()
    {
        $data = [
            'nama' => $this->input->post('nama'),
            'alamat' => $this->input->post('alamat'),
            'telepon' => $this->input->post('telepon')
        ];
        $this->db->where('id_pegawai', $this->input->post('id_pegawai'));
        $this->db->update('admin', $data);
    }

    public function ubahPassword()
    {
        // Fitur ubah password pegawai
        $data = [
            "password" => htmlspecialchars(MD5($this->input->post('password')))
        ];
        $this->db->where('id_pegawai', $this->session->userdata('id_pegawai'));
        $this->db->update('admin', $data);
    }
}

/* End of file Pegawai_model.php */
