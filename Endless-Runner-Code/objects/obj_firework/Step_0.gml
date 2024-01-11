x -= obj_game_manager.current_speed;
speed *= 1.1;

if (life > 0)
{
	life -= delta_time * 0.000001;
	
	if (life > delay)
	{
		create_ps(trail_ps);
	}
}
else
{
	create_ps(head_ps);
	instance_destroy();	
}