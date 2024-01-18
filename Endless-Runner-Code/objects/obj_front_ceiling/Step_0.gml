if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	for (var _i = 0; _i < fauna_count; _i++)
	{
		x_coords[_i] -= obj_game_manager.current_speed * move_rate;

		if (x_coords[_i] + sprite_get_width(set_sprites[_i]) < 0)
		{
			set_sprites[_i] = choose(sprite[0]);
		
			var _pos_set = false;
			var _attempts = 0;
	
			while (!_pos_set)
			{
				x_coords[_i] = room_width + sprite_get_width(set_sprites[_i]) + room_width * (1 + 1 * _attempts);
				_pos_set = true;
				_attempts++;
		
				for (var _j = 0; _j < fauna_count; _j++)
				{
					if (_i != _j)
					{
						if (x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
						{
							_pos_set = false;	
						}
					}
				}
			}
		}
	
		if (x_coords[_i] > room_width)
		{	
			if (obj_interior_background.current_pipe_state == INTERIOR_STATE.OUTSIDE)
			{
				set_alphas[_i] = 1.0;	
			}
			else
			{
				set_alphas[_i] = 0.0;	
			}
		}
	}
}