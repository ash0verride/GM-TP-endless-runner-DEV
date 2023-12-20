owner = noone;

y_offset = 0;

can_fade = false;
fade_time = 0;
fade_level = 1.0;

set_y_offset = function(_y_offset)
{
	y_offset = _y_offset;
	y += y_offset;
}

fade_out = function (_time)
{
	can_fade = true;
	fade_time = _time;
}