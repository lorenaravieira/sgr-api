<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CEOStoreRequest extends FormRequest
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
            'company_name' => 'required|min:3',
            'name' => 'required|string|max:50',
            'year' => 'required'
        ];
    }

     /**
     * Custom message for validation
     *
     * @return array
     */
    public function messages()
    {
        return [
            'company_name.required' => 'Company Name is required!',
            'name.required' => 'Name is required!',
            'year.required' => 'Year is required!'
        ];
    }
}
