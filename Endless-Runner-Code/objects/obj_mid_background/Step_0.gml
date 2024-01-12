if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x -= obj_game_manager.current_speed * background_move_rate;

	if (x < 0)
	{
		before_sprite = sprite_index;
		sprite_index = after_sprite;
	
		switch(after_sprite)
		{
			case sprite[0]:
				after_sprite = sprite[0];
				break;
			case sprite[1]:
				after_sprite = sprite[1];
				break;
			case sprite[2]:
				after_sprite = sprite[2];
				break;
			case sprite[3]:
				after_sprite = sprite[3];
				break;
		}
	
		x += sprite_width;
	}
}