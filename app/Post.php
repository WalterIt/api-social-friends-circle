<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = ['content', 'visibility'];

    const VISIBILITY_STATUS_PUBLIC = 100; // public

    const VISIBILITY_STATUS_FRIENDS = 200; // ONLY FRIENDS CAN SEE

    public function author()
    {
        return $this->belongsTo('App\User');
    }

    public function isPublic()
    {
        return $this->visibility === Post::VISIBILITY_STATUS_PUBLIC;
    }



}
