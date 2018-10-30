<?php

namespace App\Http\Controllers;

use App\Post;
use App\Events\PostCreated;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // event(new \App\Events\Event());

        $loggedUser = Auth::user();


        // Return Post of Logged users friends
        $friendsPosts = $loggedUser->friends()
            ->join('posts', 'posts.author_id', '=', 'users.id')
            ->orderBy('posts.created_at', 'desc')
            ->get(['posts.*']);


        // Return posts created by logged users or public posts
        $publicAndOwnPosts = Post::where('visibility', '=', Post::VISIBILITY_STATUS_PUBLIC)
            ->orWhere('author_id', $loggedUser->id)
            ->orderBy('created_at', 'desc')
            ->get();

        $result = $friendsPosts->merge($publicAndOwnPosts)->sortByDesc('created_at')->values()->all();

        return response()->json($result);
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
        // POST /api/posts
        $post = new Post($request->all());

        $author = Auth::user();

        $author->posts()->save($post);

        event(new PostCreated($post, $author));

        return response()->json($post);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        //
    }
}
