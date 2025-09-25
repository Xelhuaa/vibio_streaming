@extends('master')
@section('title', 'User Profile')
@section('content')

    <div class="container mt-4">
        <h1 class="mb-4">My Profile</h1>

        {{-- Flash Messages --}}
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        @if ($errors->any())
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <div class="row">
            {{-- Update Profile --}}
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        Update Profile
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('profile.update') }}">
                            @csrf
                            @method('PUT')

                            <div class="mb-3">
                                <label for="name" class="form-label">Full Name</label>
                                <input type="text" class="form-control @error('name') is-invalid @enderror"
                                    id="name" name="name" value="{{ old('name', $user->name) }}" required>
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email (cannot be changed)</label>
                                <input type="email" class="form-control" id="email" value="{{ $user->email }}"
                                    disabled>
                            </div>

                            <button type="submit" class="btn btn-success w-100">Update Profile</button>
                        </form>
                    </div>
                </div>
            </div>

            {{-- Update Password --}}
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-dark">
                        Update Password
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('profile.updatePassword') }}">
                            @csrf
                            @method('PUT')

                            <div class="mb-3">
                                <label for="old_password" class="form-label">Old Password</label>
                                <input type="password" class="form-control @error('old_password') is-invalid @enderror"
                                    id="old_password" name="old_password" required>
                                @error('old_password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="new_password" class="form-label">New Password</label>
                                <input type="password" class="form-control @error('new_password') is-invalid @enderror"
                                    id="new_password" name="new_password" required>
                                @error('new_password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="new_password_confirmation" class="form-label">Confirm New Password</label>
                                <input type="password" class="form-control" id="new_password_confirmation"
                                    name="new_password_confirmation" required>
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Update Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
