if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x -= obj_game_manager.current_speed;
	fire_speed *= 1.005;
	speed = fire_speed;

	life += delta_time * 0.000001;

	if (life > delay)
	{
		create_ps(trail_ps);
	}

	if (life > death)
	{
		create_ps(head_ps);
		instance_destroy();	
	}
}
else
{
	speed = 0;	
}