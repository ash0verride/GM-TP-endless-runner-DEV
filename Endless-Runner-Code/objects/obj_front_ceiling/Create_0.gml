fauna_count = 2;

x_coords = array_create(fauna_count, 0);
set_sprites = array_create(fauna_count, -1);
set_alphas = array_create(fauna_count, 0.8);

sprite[0] = spr_foreground_celing_1;

for (var _i = 0; _i < fauna_count; _i++)
{
	set_sprites[_i] = choose(sprite[0]);
	
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

y = 0;
move_rate = 1.0;