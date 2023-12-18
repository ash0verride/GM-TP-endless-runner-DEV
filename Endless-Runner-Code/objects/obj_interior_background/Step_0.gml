var _delta_time = delta_time * 0.000001;

for (var _i = 0; _i < wall_segment_count; _i++)
{
	wall_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate * _delta_time;
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
		switch(current_interior_state)
		{
			case INTERIOR_STATE.ENTER:
				set_wall_sprites[_i] = wall_sprite[3];
				current_interior_state = INTERIOR_STATE.INSIDE;
				has_ground_entered = false;
				has_pipe_entered = false;
				break;
			case INTERIOR_STATE.EXIT:
				set_wall_sprites[_i] = wall_sprite[4];
				current_interior_state = INTERIOR_STATE.OUTSIDE;
				has_ground_exited = false;
				has_pipe_exited = false;
				break;
			case INTERIOR_STATE.INSIDE:
				set_wall_sprites[_i] = choose(wall_sprite[0], wall_sprite[1], wall_sprite[2]);
				break;
			case INTERIOR_STATE.OUTSIDE:
				set_wall_sprites[_i] = -1;
				if (!has_ground_exited)
				{
					has_ground_exited = true;
					is_ground_exit_ready = true;
				}
				if (!has_pipe_exited)
				{
					has_pipe_exited = true;
					is_pipe_exit_ready = true;
				}
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
	pipe_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate * _delta_time;
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
		switch(current_interior_state)
		{
			case INTERIOR_STATE.ENTER:
				if (has_pipe_entered)
				{
					set_pipe_sprites[_i] = pipe_sprite[1];
				}
				else
				{
					set_pipe_sprites[_i] = pipe_sprite[0];
					has_pipe_entered = true;
				}
				break;
			case INTERIOR_STATE.INSIDE:
				set_pipe_sprites[_i] = pipe_sprite[1];
				break;
			case INTERIOR_STATE.EXIT:
				if (has_pipe_exited)
				{
					set_pipe_sprites[_i] = -1;
				}
				else
				{
					set_pipe_sprites[_i] = pipe_sprite[2];
					has_pipe_exited = true;
				}
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
	ground_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate * _delta_time;
}

for (var _i = 0; _i < ground_segment_count; _i++)
{		
	if (ground_x_coords[_i] < -512)
	{
		switch(current_interior_state)
		{
			case INTERIOR_STATE.ENTER:
				set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];
				break;
			case INTERIOR_STATE.INSIDE:
				if (has_ground_entered)
				{
					set_ground_sprites[_i] = ground_sprite[1];
				}
				else
				{
					set_ground_sprites[_i] = ground_sprite[0];
					has_ground_entered = true;	
				}
				break;
			case INTERIOR_STATE.EXIT:
				set_ground_sprites[_i] = ground_sprite[1];
				break;
			case INTERIOR_STATE.OUTSIDE:
				if (!has_ground_exited)
				{
					set_ground_sprites[_i] = ground_sprite[1];
				}
				else if (!is_ground_exit_ready)
				{
					set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];
				}
				else
				{
					set_ground_sprites[_i] = ground_sprite[2];
					is_ground_exit_ready = false;
				}
				break;
		}
		
		ground_x_coords[_i] += 512 * ground_segment_count;
	}
}