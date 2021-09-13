<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdatePetRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {        
        return [
            'pet_type_id' => 'required|exists:pet_types,id',
            'name' => 'required|string|unique:pets,name,' . $this->route('pet') . ',id',
            'nickname' => '',
            'weight' => 'required|numeric',
            'height' => 'required|numeric',
            'gender' => [
                'required',
                Rule::in(['Male', 'Female']),
            ],
            'color' => '',
            'friendly' => 'boolean',
            'birthday' => 'required|date|date_format:Y-m-d',
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages()
    {    
        return [
            'pet_type_id.exists' => __('errors.pet_type.not_found'),
        ];
    }
}
