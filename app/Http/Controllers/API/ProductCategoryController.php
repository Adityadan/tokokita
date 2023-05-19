<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\ProductCategory;
use Illuminate\Http\Request;

class ProductCategoryController extends Controller
{
    public function all(Request $request)
    {
        # code...
        // dd($request->all());
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');
        $show_product = $request->input('show_product');

        # JIKA ID KATEGORI ADA DAN SESUAI DENGAN ID REQUEST
        if ($id) {
            # MAKA CEK ID KATEGORI DENGAN RELASI PRODUK SESUAI DENGAN ID REQUEST
            $category = ProductCategory::with(['products'])->find($id);

            # JIKA ADA MAKA KIRIM ARRAY JSON BERISI DATA KATEGORI DAN STATUS
            if ($category)
                return ResponseFormatter::success(
                    $category,
                    'Data kategori berhasil diambil'
                );
            else
                # JIKA TIDAK ADA MAKA KIRIM ARRAY JSON BERISI DATA KATEGORI NULL DAN STATUS
                return ResponseFormatter::error(
                    null,
                    'Data kategori tidak ada',
                    404
                );
        }


        # FILTER ID KATEGORI BERDASARKAN NAMA DAN PRODUK
        $category = ProductCategory::query();
        // dd($category);
        if ($name)
            $category->where('name', 'like', '%' . $name . '%');

        if ($show_product) {
            $category->with('products');
        }

        return ResponseFormatter::success(
            $category->paginate($limit),
            'Data list Category berhasil diambil'
        );
    }
}
