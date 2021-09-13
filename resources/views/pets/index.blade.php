@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Kangaroos</div>

                <div class="card-body">                    
                    <a href="{{ route('pets.create') }}" class="btn btn-primary">Add New Kangaroo</a>
                    <hr />
                    <div id="dataGrid"></div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('css')
<!-- DevExtreme theme -->
<link rel="stylesheet" href="https://cdn3.devexpress.com/jslib/21.1.5/css/dx.light.css">
@endpush

@push('js')
<!-- ... -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- DevExtreme library -->
<script type="text/javascript" src="https://cdn3.devexpress.com/jslib/21.1.5/js/dx.all.js"></script>

<script type="text/javascript" src="{{ asset('js/pets/index.js')}}"></script>
@endpush
