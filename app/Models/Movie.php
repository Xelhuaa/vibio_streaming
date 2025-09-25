<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'poster',
        'trailer_url',
        'year',
        'description',
        'type',
    ];
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

}
