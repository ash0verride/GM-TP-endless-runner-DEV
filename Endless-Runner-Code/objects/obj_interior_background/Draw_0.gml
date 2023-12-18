for (var _i = 0; _i < wall_segment_count; _i++)
{
	if (set_wall_sprites[_i] != -1)
	{
		draw_sprite(set_wall_sprites[_i], 0, wall_x_coords[_i], wall_y_coords);	
	}
}

for (var _i = 0; _i < pipe_segment_count; _i++)
{
	if (set_pipe_sprites[_i] != -1)
	{
		draw_sprite(set_pipe_sprites[_i], 0, pipe_x_coords[_i], pipe_y_coords);	
	}
}

for (var _i = 0; _i < ground_segment_count; _i++)
{
	draw_sprite(set_ground_sprites[_i], 0, ground_x_coords[_i], ground_y_coords);	
}