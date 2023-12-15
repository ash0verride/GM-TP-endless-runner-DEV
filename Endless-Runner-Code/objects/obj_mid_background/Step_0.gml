var _delta_time = delta_time * 0.000001;

x -= obj_game_manager.current_speed * background_move_rate * _delta_time;

if (x < 0)
{
	before_sprite = sprite_index;
	sprite_index = after_sprite;
	after_sprite = choose(sprite_1, sprite_2, sprite_3, sprite_4);
	
	x += sprite_width;
}