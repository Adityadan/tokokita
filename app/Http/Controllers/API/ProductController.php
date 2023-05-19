<?php

namespace App\Http\Controllers\API;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');
        $description = $request->input('description');
        $tags = $request->input('tags');
        $categories = $request->input('categories');

        $price_from = $request->input('price_from');
        $price_to = $request->input('price_to');

        # JIKA REQ ID ADA (MENGANDUNG VALUES)
        if ($id) {
            # CEK DATA PRODUK YANG MEMILIKI ID SESUAI REQ ID
            $product = Product::with(['category', 'galleries'])->find($id);

            # JIKA CEK DATA PRODUK ADA MAKA KIRIM JSON BERISI DATA PRODUK DAN STATUS
            if ($product)
                return ResponseFormatter::success(
                    $product,
                    'Data produk berhasil diambil'
                );
            # JIKA CEK DATA PRODUK TIDAK ADA MAKA KIRIM JSON BERISI DATA PRODUK NULL DAN STATUS
            else
                return ResponseFormatter::error(
                    null,
                    'Data produk tidak ada',
                    404
                );
        }

        # FILTER PRODUK BERDASARKAN NAMA, DESC, TAG, PRICE, DAN KATEGORI
        $product = Product::with(['category', 'galleries']);

        if ($name)
            $product->where('name', 'like', '%' . $name . '%');

        if ($description)
            $product->where('description', 'like', '%' . $description . '%');

        if ($tags)
            $product->where('tags', 'like', '%' . $tags . '%');

        if ($price_from)
            $product->where('price', '>=', $price_from);

        if ($price_to)
            $product->where('price', '<=', $price_to);

        if ($categories)
            $product->where('categories_id', $categories);

        // dd($product);
        return ResponseFormatter::success(
            $product->paginate($limit),
            'Data list produk berhasil diambil'
        );
    }
}
