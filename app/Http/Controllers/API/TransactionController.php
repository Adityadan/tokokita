<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\TransactionItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TransactionController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $status = $request->input('status');

        # CEK APAKAH REQ ID ADA
        if ($id) {
            #CEK APAKAH REQ ID ADA PADA DB
            $transaction = Transaction::with(['items.product'])->find($id);

            # APABILA ADA MAKA AMBIL DATA JSON TRANSACTION
            if ($transaction) {
                return ResponseFormatter::success(
                    $transaction,
                    'Data Transaksi Berhasil Diambil'
                );
            }
            # JIKA TIDAK MAKA BERI INFO BAHWA DATA TIDAK ADA
            else {
                return ResponseFormatter::error([
                    null,
                    'Data Transaksi Tidak Ada',
                    404
                ]);
            }
        }

        # MENGAMBIL DATA TRANSASKSI SESUAI DENGAN ID USER LOGIN
        $transaction = Transaction::with(['items.product'])->where('users_id', Auth::user()->id);

        # MENGAMBIL DATA TRANSASKSI BERDASARKAN STATUS
        if ($status) {
            $transaction->where('status', $status);
        }

        # JIKA ADA DATA TRANSAKSI MAKA KIRIM DATA JSON TRANSAKSI
        return ResponseFormatter::success([
            $transaction->paginate($limit)
        ], 'data list transaksi berhasil diambil');
    }

    public function checkout(Request $request)
    {
        $request->validate([
            'items' => 'required|array',
            'items.*.id' => 'exists:products,id',
            'total_price' => 'required',
            'shipping_price' => 'required',
            'status' => 'required|in:PENDING,SUCCESS,CANCELED,FAILED,SHIPPING,SHIPPED'
        ]);

        $transaction = Transaction::create([
            'users_id' => Auth::user()->id,
            'address' => $request->address,
            'total_price' => $request->total_price,
            'shipping_price' => $request->shipping_price,
            'status' => $request->status,
        ]);

        // dd($request->items);
        foreach ($request->items as $product) {
            # code...
            TransactionItem::create([
                'users_id' => Auth::user()->id,
                'products_id' => $product['id'],
                'transactions_id' => $transaction->id,
                'quantity' => $product['quantity'],
            ]);
        }
        return ResponseFormatter::success($transaction->load('items.product'), 'Transaction Berhasil');
    }
}
