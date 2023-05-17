<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class transactions extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'id_user',
        'address',
        'payment',
        'total_price',
        'shipping_price',
        'status',
    ];

    public function user()
    {
        $this->belongsTo(Produk::class, 'id_user', 'id');
    }

    public function detail_transaksi()
    {
        return $this->hasMany(DetailTransaksi::class, 'id_transaksi', 'id');
    }
}
