<?php

namespace App\Events;

use \App\Post;
use \App\User;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;



class PostCreated implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    /**
     * @var Post
     */
    public $post;

    /**
     * @var User
     */
    public $author;

    public function getPost() : Post {
        return $this->post;
    }

    public function setPost(Post $post) {
        $this->post = $post;
    }

    public function getAuthor() : User {
        return $this->author;
    }

    public function setAuthor(User $author) {
        $this->author = $author;
    }

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Post $post, User $author)
    {
        $this->setPost($post);
        $this->setAuthor($author);
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        $channels = [];
        $receivers = [];  // Array of users

        $post = $this->getPost();
        $author = $this->getAuthor();

        if ($post->isPublic()) {
            $receivers = User::where('id', '!=', $author->id)->get();
        } else {
            $receivers = $author->friends;  // Getting collection of all friends
        }

        foreach ($receivers as $user) {
            $channels[] = new PrivateChannel('App.User.' . $user->id);
        }

        return $channels;
    }
}
