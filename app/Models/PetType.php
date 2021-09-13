<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PetType extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array    /**
     */
    protected $fillable = ['name'];

    /**
     * Creats a one-to-many relationship with Pet model class.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function pets()
    {
        return $this->hasMany(Pet::class);
    }
}
