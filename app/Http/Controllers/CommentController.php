<?php
namespace App\Http\Controllers;

use App\Models\Movie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function store(Request $request, Movie $movie)
    {
        $request->validate([
            'body' => 'required|string|max:1500',
        ]);

        $user = Auth::user();

        $movie->comments()->create([
            'user_id' => $user->id,
            'body'    => $request->body,
        ]);

        return back()->with('success', 'Komentar berhasil dikirim!');
    }
    public function destroy(\App\Models\Comment $comment)
    {
        if ($comment->user_id !== Auth::id()) {
            abort(403, 'Unauthorized action.');
        }

        $comment->delete();

        return back()->with('success', 'Komentar berhasil dihapus!');
    }

}
