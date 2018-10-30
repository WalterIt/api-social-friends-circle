<?php

namespace App\Listeners;

use App\Events\FriendAdded;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class FriendAddedListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  FriendAdded  $event
     * @return void
     */
    public function handle(FriendAdded $event)
    {
        //
    }
}
