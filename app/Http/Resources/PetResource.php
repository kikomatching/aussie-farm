<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;

class PetResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'name' => $this->name,
            'birthday' => Carbon::createFromFormat('Y-m-d', $this->birthday)->toFormattedDateString(),
            'weight' => $this->weight,
            'height' => $this->height,
            'friendly' => $this->friendly == true ? __('pets.friendly.yes') : __('pets.friendly.no'),
        ];
    }
}
