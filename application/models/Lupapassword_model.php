<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Lupapassword_model extends CI_Model
{

    public function getEmail($email)
    {
        $this->db->select('*');
        $this->db->from('admin');
        $this->db->where('email', $email);
        $this->db->limit(1);

        $query = $this->db->get();
        if ($query->num_rows() == 1) {
            return $query->result();
        } else {
            return false;
        }
    }
}

/* End of file Lupapassword_model.php */
