@extends('master')
@section('title', 'Top Movies')
@section('content')

    <div class="container mt-4">
        <h2 class="mb-4 text-center">
            @if (!empty($search))
                Search results for "{{ $search }}"
            @else
                @switch($type)
                    @case('movie')
                        Top Movies
                    @break

                    @case('tv_show')
                        Top TV Shows
                    @break

                    @default
                        Featured Movies
                @endswitch
            @endif
        </h2>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 g-4">
            @foreach ($movies as $movie)
                <div class="col">
                    <div class="card h-100 shadow-sm bg-dark text-white">
                        <a href="{{ route('movies.show', $movie->id) }}">
                            <img src="{{ asset('images/posters/' . $movie->poster . '.jpg') }}" class="card-img-top img-fluid"
                                style="height: 300px; object-fit: cover;" alt="{{ $movie->title }}">
                        </a>
                        <div class="card-body text-center">
                            <a href="{{ route('movies.show', $movie->id) }}" class="text-white text-decoration-none">
                                <h6 class="card-title">{{ $movie->title }}</h6>
                            </a>
                            <small class="text-muted">{{ $movie->year }}</small>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>


        <div class="mt-4">
            {{ $movies->links('vendor.pagination.custom') }}
        </div>

    </div>

@endsection
