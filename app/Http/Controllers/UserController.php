<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(User::all());
    }

    public function friends()
    {
        // RETURN ONLY FRIENDS OF CURRENT LOGGED USER
        return response()->json(Auth::user()->friends);
    }

    public function addFriend($userId)
    {
        // First Find user passed in our route
        $friendToAdd = User::find($userId);
        $loggedUser = Auth::user();

        if (!$friendToAdd) {
            return response()->json([ 'error' => "There is no user you are trying to add to friends."], 400);
        }

        // NOT ALLOWED TO ADD YOURSELF TO FRIENDS
        if ($friendToAdd->id === $loggedUser->id) {
            return response()->json([ 'error' => "You can't add yourself to friends."], 400);
        }
        // UNFORBITTEN TO ADD SAME FRIENDS MORE THAN OUNCE
        if ($loggedUser->hasFriendWithId($friendToAdd->id)) {
            return response()->json([ 'error' => 'You are friends already.'], 400);
        }

        // IF EVERYTHING IS OK
        $loggedUser->addFriendById($friendToAdd->id);

        return response()->json([
            'success' => true
        ]);
    }

    public function removeFriend($userId)
    {
        $friendToRemove = User::find($userId);
        $loggedUser = Auth::user();

        if (!$friendToRemove) {
            return response()->json(
                ['error' => "There is no user you are trying to remove from friends."],
                400
            );
        }

        if ($friendToRemove->id === $loggedUser->id) {
            return response()->json([ 'error' => "You can't remove yourself from friends."], 400);
        }

        if (!$loggedUser->hasFriendWithId($friendToRemove->id)) {
            return response()->json([ 'error' => "You can't remove friend you don't have."], 400);
        }

        $loggedUser->removeFriendById($friendToRemove->id);

        return response()->json([
            'success' => true
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return response()->json($user);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
}
