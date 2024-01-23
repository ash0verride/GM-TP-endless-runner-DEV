if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x -= obj_game_manager.current_speed * 1.0;

	if (x < 0 - 59)
	{	
		instance_destroy();
	}
}