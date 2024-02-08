// Keeps count of how many bushes can be created
fauna_count = 5;

x_coords = array_create(fauna_count, 0);
set_sprites = array_create(fauna_count, -1);
set_alphas = array_create(fauna_count, 1.0);

sprite[0] = spr_foreground_floor_1;
sprite[1] = spr_foreground_floor_2;
sprite[2] = spr_foreground_floor_3;
sprite[3] = spr_foreground_floor_4;

sprite_prefetch_multi(sprite);

for (var _i = 0; _i < fauna_count; _i++)
{
	set_sprites[_i] = choose(sprite[0], sprite[1], sprite[2], sprite[3]);
	
	var _pos_set = false;
	var _attempts = 0;
	
	while (!_pos_set)
	{
		x_coords[_i] = random_range(0, room_width * (2 + 1 * _attempts));
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

y = room_height;
move_rate = 1.0;