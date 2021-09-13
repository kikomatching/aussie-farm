<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

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
        $data = parent::toArray($request);

        return array_merge($data, [
            'friendly' => $this->friendly == true ? __('pets.friendly.yes') : __('pets.friendly.no'),
        ]);
    }
}
