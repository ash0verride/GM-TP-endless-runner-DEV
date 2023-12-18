var _delta_time = delta_time * 0.000001;

x -= obj_game_manager.current_speed * background_move_rate * _delta_time;

if (x < 0)
{
	before_sprite = sprite_index;
	sprite_index = after_sprite;
	
	switch(after_sprite)
	{
		case sprites[0]:
			after_sprite = sprites[1];
			break;
		case sprites[1]:
			after_sprite = sprites[2];
			break;
		case sprites[2]:
			after_sprite = sprites[0];
			break;
	}
	
	x += sprite_width;
}