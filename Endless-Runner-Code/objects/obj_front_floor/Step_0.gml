for (var _i = 0; _i < fauna_count; _i++)
{
	x_coords[_i] -= obj_game_manager.current_speed * move_rate;

	if (x_coords[_i] + sprite_get_width(set_sprites[_i]) < 0)
	{	
		set_sprites[_i] = choose(sprite[0], sprite[1], sprite[2], sprite[3]);
		
		var _pos_set = false;
		var _attempts = 0;
	
		while (!_pos_set)
		{
			x_coords[_i] = room_width + sprite_get_width(set_sprites[_i]) + random_range(0, room_width * (1 + 1 * _attempts));
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
		if (obj_interior_background.current_ground_state == INTERIOR_STATE.OUTSIDE)
		{
			set_alphas[_i] = 0.8;	
		}
		else
		{
			set_alphas[_i] = 0.0;	
		}
	}
}