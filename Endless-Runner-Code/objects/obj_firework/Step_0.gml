x -= obj_game_manager.current_speed;
speed *= 1.005;

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