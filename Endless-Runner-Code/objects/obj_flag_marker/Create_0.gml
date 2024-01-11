has_dropped = false;
has_passed = false;

fall_speed = 0;

create_firework = function()
{
	var _firework= instance_create_layer(x, y, "Stage", obj_firework);
	_firework.life = 0.75;
	_firework.speed = 15;
}