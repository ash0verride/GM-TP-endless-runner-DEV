// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Reduces the x position by the current speed and move rate
	x -= obj_game_manager.current_speed * background_move_rate;

	// Checks if the x coordinate is less than the origin
	if (x < 0)
	{
		// Sets the before sprite to the indexed (current) one
		before_sprite = sprite_index;
		// Sets the current sprite to the one after
		sprite_index = after_sprite;
	
		// Check what sprite the last one was set to and then set up the appropriate sprite to follow
		switch(after_sprite)
		{
			case sprites[0]:
				after_sprite = sprites[1];
				break;
			case sprites[1]:
				after_sprite = sprites[2];
				break;
			case sprites[2]:
				after_sprite = sprites[0];
				break;
		}
	
		// Move the x position forward the sprite width to move the sprites draw positions
		x += sprite_width;
	}
}