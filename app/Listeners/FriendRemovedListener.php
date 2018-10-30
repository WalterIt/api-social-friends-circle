<?php

namespace App\Listeners;

use App\Events\FriendRemoved;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class FriendRemovedListener
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
     * @param  FriendRemoved  $event
     * @return void
     */
    public function handle(FriendRemoved $event)
    {
        //
    }
}
