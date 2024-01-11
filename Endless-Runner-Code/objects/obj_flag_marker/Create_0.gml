has_dropped = false;
has_passed = false;

fall_speed = 0;

is_warping = false;
warp_curve = animcurve_get_channel(ac_flag_warp, "warp");
warp_curve_percent = 0;

handle_request = -1;

create_firework = function()
{
	if (instance_exists(self))
	{
		var _firework= instance_create_layer(x, y - 100, "Stage", obj_firework);
		_firework.delay = 0.02;
		_firework.death = 0.55;
		_firework.speed = 15;
	}
	else
	{
		call_cancel(handle_request);	
	}
}