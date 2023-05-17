<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Produk;
use Illuminate\Http\Request;

class ProdukController extends Controller
{
    public function all(Request $request)
    {
        $id  = $request->input('id');
        $limit  = $request->input('limit');
        $deskripsi  = $request->input('deskripsi');
        $tags  = $request->input('tags');
        $kategori_produk  = $request->input('kategori_produk');
        $kategori_produk  = $request->input('kategori_produk');
        $harga_mulai  = $request->input('harga_mulai');
        $harga_akhir  = $request->input('harga_akhir');

        if ($id) {
            # code...
            $produk = Produk::with('kategori_produk', 'galeri_produk')->find($id);

            if ($produk) {
                # code...
                return ResponseFormatter::success(
                    $produk,
                    'Data Produk Berhasil Diambil'
                );
            } else {
                return ResponseFormatter::error(
                    null,
                    'Data Produk Tidak Ada',
                    404
                );
            }
        }
    }
}
