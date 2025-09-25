<?php
namespace App\Http\Controllers;

use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index(Request $request)
    {
        $type   = $request->query('type');
        $search = $request->query('search');

        $movies = Movie::query()
            ->when($type, function ($query, $type) {
                $query->where('type', $type);
            })
            ->when($search, function ($query, $search) {
                $query->where('title', 'like', "%{$search}%");
            })
            ->paginate(15)
            ->withQueryString();

        return view('dashboard.dashboard', compact('movies', 'type', 'search'));
    }

    public function show(Movie $movie)
    {
        return view('movies.movie-detail', compact('movie'));
    }
}
