if (owner != noone)
{
	x = owner.x;
	
	var _delta_y = abs(y - owner.y) - y_offset;
	var _scale = 1;
	var _shadow_height = 400;
	
	if (_delta_y > 0)
	{
		_scale = (_shadow_height - clamp(_delta_y, 0, _shadow_height)) * (1 / _shadow_height);
		
	}
	
	image_alpha = _scale;
	
	_scale = clamp(_scale, 0.6, 1.00);
	
	image_xscale = 1 / _scale;
	image_yscale = 1 / _scale;
}
else
{
	fade_out(0.1);
}

if (can_fade)
{
	fade_level -= (1 / fade_time) * delta_time * 0.000001;
	
	if (fade_level < 0)
	{
		fade_level = 0;
	}
	
	image_alpha *= 	fade_level;
	
	if (image_alpha == 0)
	{
		instance_destroy();	
	}
}