<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RotaStoreRequest extends FormRequest {

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'company_name' => 'required|min:3',
            'name' => 'required|string|max:50',
            'year' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'company_name.required' => 'Company Name is required!',
            'name.required' => 'Name is required!',
            'year.required' => 'Year is required!'
        ];
    }
}
