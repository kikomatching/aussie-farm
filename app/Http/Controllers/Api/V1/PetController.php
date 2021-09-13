<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\StorePetRequest;
use App\Http\Requests\UpdatePetRequest;
use App\Http\Resources\PetListResource;
use App\Http\Resources\PetResource;
use App\Models\Pet;
use App\Models\PetType;
use App\Services\ResponseHandler\Response;

class PetController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pets = Pet::all();
        $petResource = PetListResource::collection($pets);

        return Response::success($petResource);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePetRequest $request)
    {
        $petType = PetType::find($request->input('pet_type_id'));

        $pet = $petType->pets()->create($request->validated());
        $petResource = new PetResource($pet);

        return Response::success($petResource);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pet = Pet::find($id);

        if (empty($pet)) {
            return Response::failed([], __('errors.pet.not_found'));
        }

        $petResource = new PetResource($pet);

        return Response::success($petResource);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePetRequest $request, $id)
    {
        $pet = Pet::find($id);

        if (empty($pet)) {
            return Response::failed([], __('errors.pet.not_found'));
        }

        $pet->update($request->validated());

        $petResource = new PetResource($pet->fresh());

        return Response::success($petResource);
    }
}
