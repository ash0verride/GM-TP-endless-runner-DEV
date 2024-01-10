x -= obj_game_manager.current_speed * 1.0;

if (!has_dropped)
{
	if (y < 950)
	{
		fall_speed += 90 * delta_time * 0.000001;
		
		y += fall_speed;
		
		if (y > 950)
		{
			y = 950;
			
			image_yscale = 0.8;
			// FIREWORK EFFECT

			// DROP SMOKE

			// CONFETTI WHEN PASSED
			
			has_dropped = true;
		}
	}
}
else
{
	image_yscale = lerp(image_yscale, 1.0, 0.1);
}