@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Edit Kangaroo</div>

                <div class="card-body">
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Yay!</h4>
                        <p id="alert-success__message"></p>
                    </div>
                    <div class="alert alert-danger" role="alert">
                        <h4 class="alert-heading">Oops! The following errors were encountered.</h4>
                        <ul id="error-list"></ul>
                    </div>
                    <form method="POST" id="form__edit-pet">
                        <input type="hidden" id="pet_id" value="{{ $pet->id }}" />
                        <input type="hidden" id="pet_type_id" value="2" />
                        <div class="form-group">
                          <label for="name">{{ __('pets.name') }}</label>
                          <input type="text" value="{{ $pet->name }}" name="name" class="form-control" id="name" placeholder="Enter Name">
                        </div>
                        <div class="form-group">
                          <label for="nickname">{{ __('pets.nickname') }}</label>
                          <input type="text" value="{{ $pet->nickname }}" name="nickname" class="form-control" id="nickname" placeholder="Enter Nickname">
                        </div>
                        <div class="form-group">
                            <label for="gender">{{ __('pets.gender') }}</label>
                            <select class="form-control" name="gender" id="gender">
                                <option value="">Select Gender</option>
                                <option {{ $pet->gender == 'Male' ? 'selected' : '' }} value="Male">Male</option>
                                <option {{ $pet->gender == 'Female' ? 'selected' : '' }} value="Female">Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                          <label for="birthday">{{ __('pets.birthday') }}</label>
                          <input type="date" value="{{ $pet->birthday }}" name="birthday" class="form-control" id="birthday" placeholder="Enter Birthday">
                        </div>
                        <div class="form-group">
                          <label for="weight">{{ __('pets.weight') }}</label>
                          <input type="text" value="{{ $pet->weight }}" name="weight" class="form-control" id="weight" placeholder="Enter Weight">
                        </div>
                        <div class="form-group">
                          <label for="height">{{ __('pets.height') }}</label>
                          <input type="text" value="{{ $pet->height }}" name="height" class="form-control" id="height" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="friendly">Friendliness</label>
                            <select name="friendly" class="form-control" id="friendly">
                                <option {{ $pet->friendly ? 'selected' : '' }} value="0">Friendly</option>
                                <option {{ $pet->friendly ? 'selected' : '' }} value="1">Not Friendly</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('css')

@endpush

@push('js')
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="{{ asset('js/pets/edit.js')}}"></script>
@endpush
