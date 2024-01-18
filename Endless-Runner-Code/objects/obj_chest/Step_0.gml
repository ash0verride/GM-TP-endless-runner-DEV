// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the chest at the games current move speed
	x -= obj_game_manager.current_speed * 1.0;

	// Checks if the chest has gone off screen
	if (x < 0 - 169)
	{
		// Sets self as a temporary variable 
		var _chest = self;
		
		// Loops though the shadow objects within the room
		with (obj_shadow)
		{
			// Checks if the shadows owner matches the chest
			if (owner == _chest)
			{
				// Destroys the shadow as no longer needed
				instance_destroy();
			}
		}
		
		// Destroys the chest as no longer needed
		instance_destroy();
	}
	
	// Animates the chest
	image_speed = 1;	
}
else
{
	// Pauses the chests animation
	image_speed = 0;
}