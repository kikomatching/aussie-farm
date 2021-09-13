<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pet extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'nickname', 'gender', 'birthday','weight', 'height', 'color', 'friendly'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'friendly' => 'boolean',
    ];

    /**
     * Creats a one-to-many relationship with Pet model class.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function type()
    {
        return $this->belongsTo(PetType::class);
    }
}
