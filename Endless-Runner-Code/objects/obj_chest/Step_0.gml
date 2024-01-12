if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x -= obj_game_manager.current_speed * 1.0;

	if (x < 0 - 169)
	{
		var _chest = self;
		with (obj_shadow)
		{
			if (owner == _chest)
			{
				instance_destroy();
			}
		}
	
		instance_destroy();
	}
	
	image_speed = 1;	
}
else
{
	image_speed = 0;
}