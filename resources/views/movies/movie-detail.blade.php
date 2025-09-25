@extends('master')
@section('title', $movie->title)
@section('content')

    <div class="container mt-5">
        <div class="row g-4">
            {{-- Poster --}}
            <div class="col-lg-4 col-md-5">
                <div class="card shadow-sm">
                    <img src="{{ asset('images/posters/' . $movie->poster . '.jpg') }}" class="card-img-top rounded"
                        alt="{{ $movie->title }}">
                </div>
            </div>

            {{-- Detail Movie --}}
            <div class="col-lg-8 col-md-7">
                <h2 class="fw-bold">{{ $movie->title }} <small class="text-muted">({{ $movie->year }})</small></h2>

                <h5>Description</h5>
                <p>{{ $movie->description }}</p>

                @if ($movie->trailer_url)
                    <div class="ratio ratio-16x9 mt-3">
                        <iframe src="{{ $movie->trailer_url }}" frameborder="0" allowfullscreen></iframe>
                    </div>
                @endif

                <div class="mt-4">
                    <a href="#" class="btn btn-primary me-2">Watch Now</a>
                    <a href="#" class="btn btn-outline-secondary">Add to Watchlist</a>
                </div>
            </div>
        </div>

        {{-- Comments --}}
        <div class="mt-5">
            <h4>Comments ({{ $movie->comments->count() }})</h4>

            @auth
                <form action="{{ route('comments.store', $movie->id) }}" method="POST" class="mb-4">
                    @csrf
                    <textarea name="body" rows="4" class="form-control mb-2" placeholder="Join the discussion" required></textarea>
                    <button type="submit" class="btn btn-danger">Post Comment</button>
                </form>
            @else
                <p><a href="{{ route('login') }}">Login</a> untuk menambahkan komentar.</p>
            @endauth

            @foreach ($movie->comments()->latest()->get() as $comment)
                <div class="d-flex mb-3 align-items-start">
                    <div class="me-2">
                        <img src="https://www.gravatar.com/avatar/{{ md5($comment->user->email) }}?s=50&d=mp"
                            class="rounded-circle">
                    </div>

                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <strong>{{ $comment->user->name }}</strong>
                                <small class="text-muted">{{ $comment->created_at->format('d M, Y H:i') }}</small>
                            </div>

                            @if (auth()->check() && auth()->id() === $comment->user_id)
                                <form action="{{ route('comments.destroy', $comment->id) }}" method="POST" class="ms-2">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-outline-danger"><i class="nav-icon fas fa-trash"></i></button>
                                </form>
                            @endif
                        </div>

                        <p class="mt-1">{{ $comment->body }}</p>
                    </div>
                </div>
            @endforeach
        </div>


    </div>

@endsection
