if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	switch(current_interior_state)
	{
		case INTERIOR_STATE.ENTER:
			current_wall_state = INTERIOR_STATE.ENTER;
			current_pipe_state = INTERIOR_STATE.ENTER;
			current_interior_state = INTERIOR_STATE.INSIDE;
			break;
		case INTERIOR_STATE.EXIT:
			has_wall_changed = true;
			current_wall_state = INTERIOR_STATE.EXIT;
			current_interior_state = INTERIOR_STATE.OUTSIDE;
			break;
	}

	for (var _i = 0; _i < wall_segment_count; _i++)
	{
		wall_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate;
	}

	for (var _i = 0; _i < wall_segment_count; _i++)
	{	
		var _width = 0;
	
		if (set_wall_sprites[_i] != -1)
		{
			_width = sprite_get_width(set_wall_sprites[_i]);
		}
	
		if (wall_x_coords[_i] < -_width)
		{
			switch(current_wall_state)
			{
				case INTERIOR_STATE.ENTER:
					set_wall_sprites[_i] = wall_sprite[3];
					current_wall_state = INTERIOR_STATE.INSIDE;
					current_ground_state = INTERIOR_STATE.ENTER;
					break;
				case INTERIOR_STATE.INSIDE:
					set_wall_sprites[_i] = choose(wall_sprite[0], wall_sprite[1], wall_sprite[2]);
					break;
				case INTERIOR_STATE.EXIT:
					set_wall_sprites[_i] = wall_sprite[4];
					current_wall_state = INTERIOR_STATE.OUTSIDE;
					break;
				case INTERIOR_STATE.OUTSIDE:
					if (has_wall_changed)
					{
						current_ground_state = INTERIOR_STATE.EXIT;
						has_wall_changed = false;
					}
					set_wall_sprites[_i] = -1;
					break;
			}
		
			var _min_x = room_width;
		
			for (var _j = 0; _j < wall_segment_count; _j++)
			{
				if (_i != _j && set_wall_sprites[_j] != -1)
				{
					_min_x = max(_min_x, wall_x_coords[_j] + sprite_get_width(set_wall_sprites[_j]));
				}
			}
		
			wall_x_coords[_i] = _min_x;
		}
	}

	for (var _i = 0; _i < pipe_segment_count; _i++)
	{
		pipe_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate;
	}

	for (var _i = 0; _i < pipe_segment_count; _i++)
	{	
		var _width = 0;
	
		if (set_pipe_sprites[_i] != -1)
		{
			_width = sprite_get_width(set_pipe_sprites[_i]);
		}
	
		if (pipe_x_coords[_i] < -_width)
		{
			switch(current_pipe_state)
			{
				case INTERIOR_STATE.ENTER:
					set_pipe_sprites[_i] = pipe_sprite[0];
					current_pipe_state = INTERIOR_STATE.INSIDE;
					break;
				case INTERIOR_STATE.INSIDE:
					set_pipe_sprites[_i] = pipe_sprite[1];
					break;
				case INTERIOR_STATE.EXIT:
					set_pipe_sprites[_i] = pipe_sprite[2];
					current_pipe_state = INTERIOR_STATE.OUTSIDE;
					break;
				case INTERIOR_STATE.OUTSIDE:
					set_pipe_sprites[_i] = -1;
					break;
			}
		
			var _min_x = room_width;
		
			for (var _j = 0; _j < pipe_segment_count; _j++)
			{
				if (_i != _j && set_pipe_sprites[_j] != -1)
				{
					_min_x = max(_min_x, pipe_x_coords[_j] + sprite_get_width(set_pipe_sprites[_j]));
				}
			}
		
			pipe_x_coords[_i] = _min_x;
		}
	}

	for (var _i = 0; _i < ground_segment_count; _i++)
	{
		ground_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate;
	}

	for (var _i = 0; _i < ground_segment_count; _i++)
	{		
		if (ground_x_coords[_i] < -512)
		{
			switch(current_ground_state)
			{
				case INTERIOR_STATE.ENTER:
					set_ground_sprites[_i] = ground_sprite[0];
					current_ground_state = INTERIOR_STATE.INSIDE;
					break;
				case INTERIOR_STATE.INSIDE:
					set_ground_sprites[_i] = ground_sprite[1];
					break;
				case INTERIOR_STATE.EXIT:
					set_ground_sprites[_i] = ground_sprite[2];
					current_ground_state = INTERIOR_STATE.OUTSIDE;
					current_pipe_state = INTERIOR_STATE.EXIT;
					break;
				case INTERIOR_STATE.OUTSIDE:
					set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];
					break;
			}
		
			ground_x_coords[_i] += 512 * ground_segment_count;
		}
	}
}