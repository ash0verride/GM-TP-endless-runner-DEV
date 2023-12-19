if (owner != noone)
{
	x = owner.x;
	
	var _delta_y = abs(y - owner.y) - y_offset;
	var _scale = 1;
	
	if (_delta_y > 0)
	{
		var _calc = clamp(100 / (_delta_y) , 1, 0.5);
		_scale = _calc;
	}
	
	image_xscale = _scale;
	image_yscale = _scale;
}
else
{
	instance_destroy();	
}