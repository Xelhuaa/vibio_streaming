<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    public function edit()
    {
        $user = Auth::user();
        return view('user.profile', compact('user'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:100',
        ]);

        /** @var User $user */
        $user       = Auth::user();
        $user->name = $request->name;
        $user->save();

        return back()->with('success', 'Profile berhasil diperbaharui.');
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|string|min:6|confirmed',
        ], [
            'new_password.min'       => 'Password baru minimal 6 karakter.',
            'new_password.confirmed' => 'Konfirmasi password tidak cocok.',
        ]);

        /** @var User $user */
        $user = Auth::user();

        if (! Hash::check($request->old_password, $user->password)) {
            return back()->with('error', 'Password lama salah.');
        }

        if (Hash::check($request->new_password, $user->password)) {
            return back()->with('error', 'Password baru tidak boleh sama dengan password lama.');
        }

        $user->password = Hash::make($request->new_password);
        $user->save();

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('dashboard');
    }

}
