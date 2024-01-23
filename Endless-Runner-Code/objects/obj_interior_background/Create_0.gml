enum INTERIOR_STATE
{
	OUTSIDE,
	ENTER,
	INSIDE,
	EXIT,
	SIZE
}

current_interior_state = INTERIOR_STATE.OUTSIDE;

current_wall_state = INTERIOR_STATE.OUTSIDE;
current_ground_state = INTERIOR_STATE.OUTSIDE;
current_pipe_state = INTERIOR_STATE.OUTSIDE;

has_wall_changed = false;

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

background_move_rate = 1.0;

change_interior_state = function()
{
	switch (current_interior_state)
	{
		case INTERIOR_STATE.INSIDE:
			if (current_wall_state == INTERIOR_STATE.INSIDE &&
				current_ground_state == INTERIOR_STATE.INSIDE &&
				current_pipe_state == INTERIOR_STATE.INSIDE)
			{
				current_interior_state = INTERIOR_STATE.EXIT;
			}
		break;
		
		case INTERIOR_STATE.OUTSIDE:
			if (current_wall_state == INTERIOR_STATE.OUTSIDE &&
				current_ground_state == INTERIOR_STATE.OUTSIDE &&
				current_pipe_state == INTERIOR_STATE.OUTSIDE)
			{
				current_interior_state = INTERIOR_STATE.ENTER;
			}
		break;
	}
}

flower_set_1 = function(_x, _y)
{
	var _flower_1 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 230), "Flowers", obj_flower);
	_flower_1.sprite_index = spr_flower_1;
	
	var _flower_2 = instance_create_layer(_x + random_range(12, 246), _y + random_range(220, 250), "Flowers", obj_flower);
	_flower_2.sprite_index = spr_flower_2;
}

flower_set_2 = function(_x, _y)
{
	var _flower_1 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 230), "Flowers", obj_flower);
	_flower_1.sprite_index = spr_flower_1;
	
	var _flower_3 = instance_create_layer(_x + random_range(12, 246), _y + random_range(200, 250), "Flowers", obj_flower);
	_flower_3.sprite_index = spr_flower_3;
}

flower_set_3 = function(_x, _y)
{
	var _flower_2 = instance_create_layer(_x + random_range(12, 246), _y + random_range(220, 250), "Flowers", obj_flower);
	_flower_2.sprite_index = spr_flower_2;
	
	var _flower_3 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 250), "Flowers", obj_flower);
	_flower_3.sprite_index = spr_flower_3;
}

flower_set_4 = function(_x, _y)
{
	var _flower_2 = instance_create_layer(_x + random_range(268, 500), _y + random_range(220, 250), "Flowers", obj_flower);
	_flower_2.sprite_index = spr_flower_2;
	
	var _flower_3 = instance_create_layer(_x + random_range(12, 246), _y + random_range(200, 250), "Flowers", obj_flower);
	_flower_3.sprite_index = spr_flower_3;
}

for (var _i = 0; _i < ground_segment_count; _i++)
{
	var _handle = choose(flower_set_1, flower_set_2, flower_set_3, flower_set_4);
	_handle(ground_x_coords[_i], ground_y_coords);
}

obj_game_manager.has_prefetched = true;