if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	image_speed = 0;
}
else
{
	image_speed = 1;
}

var _blend_rate = 1.0;

if (can_pulse)
{
	_blend_rate = cos(pi / (life % 8));
	
}

var _warn_colour = make_color_rgb(255, 220, 220);
image_blend = merge_color(_warn_colour, c_white, _blend_rate);

draw_self();