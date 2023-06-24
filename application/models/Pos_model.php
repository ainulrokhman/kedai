<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Pos_model extends CI_Model
{
    public function getBookingByInvoice($invoice)
    {
        $query = $this->db->query("SELECT * FROM booking WHERE no_invoice = '$invoice'");
        return $query->row();
    }
    public function getTransaksiByInvoice($invoice)
    {
        $query = $this->db->query("SELECT * FROM menu_dibooking md JOIN menu as m ON md.nama_makanan = m.nama_menu where md.no_invoice = '$invoice'");
        return $query->result_array();
    }
    public function getPemesanByInvoice($invoice)
    {
        $query = $this->db->query("SELECT * FROM booking where no_invoice = '$invoice'");
        return $query->result_array();
    }

    public function getAllMenuTersedia()
    {
        $query = $this->db->query("SELECT * FROM menu WHERE stok = 'Tersedia'");
        return $query->result_array();
    }
}
