enum INTERIOR_STATE
{
	OUTSIDE,
	ENTER,
	INSIDE,
	EXIT,
	SIZE
}

current_interior_state = INTERIOR_STATE.OUTSIDE;

wall_segment_count = 3;

wall_sprite[0] = spr_wall_1;
wall_sprite[1] = spr_wall_2;
wall_sprite[2] = spr_wall_3;
wall_sprite[3] = spr_wall_start;
wall_sprite[4] = spr_wall_end;

sprite_prefetch_multi(wall_sprite);

set_wall_sprites = array_create(wall_segment_count, -1);
wall_x_coords = array_create(wall_segment_count, 0);

wall_y_coords = 0;

pipe_segment_count = 3;

pipe_sprite[0] = spr_pipe_start;
pipe_sprite[1] = spr_pipe_mid;
pipe_sprite[2] = spr_pipe_end;

sprite_prefetch_multi(pipe_sprite);

set_pipe_sprites = array_create(wall_segment_count, -1);
pipe_x_coords = array_create(wall_segment_count, 0);

pipe_y_coords = 0;

has_pipe_exited = true;
has_pipe_entered = true;
is_pipe_exit_ready = false;

ground_segment_count = 5;

ground_sprite[0] = spr_runway_inside_start;
ground_sprite[1] = spr_runway_inside_mid;
ground_sprite[2] = spr_runway_inside_end;
ground_sprite[3] = spr_runway_outside_1;
ground_sprite[4] = spr_runway_outside_2;
ground_sprite[5] = spr_runway_outside_3;

sprite_prefetch_multi(ground_sprite);

set_ground_sprites = array_create(ground_segment_count, -1);
ground_x_coords = array_create(ground_segment_count, 0);

for (var _i = 0; _i < ground_segment_count; _i++)
{	
	set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];
	ground_x_coords[_i] = 0 + 512 * _i;
}

ground_y_coords = 610;

has_ground_entered = true;
has_ground_exited = true;
is_ground_exit_ready = false;

background_move_rate = 1.0;

interior_state_switch = function()
{
	switch (current_interior_state)
	{
		case INTERIOR_STATE.ENTER:
			current_interior_state = INTERIOR_STATE.INSIDE;
			break;
		case INTERIOR_STATE.INSIDE:
			current_interior_state = INTERIOR_STATE.EXIT;
			break;
		case INTERIOR_STATE.EXIT:
			current_interior_state = INTERIOR_STATE.OUTSIDE;
			break;
		case INTERIOR_STATE.OUTSIDE:
			current_interior_state = INTERIOR_STATE.ENTER;
			break;
	}
}