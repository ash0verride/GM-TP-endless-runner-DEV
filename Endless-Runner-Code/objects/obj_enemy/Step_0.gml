x -= obj_game_manager.current_speed * 1.0;

if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x -= walking_speed;	
}

if (x < 0 - 204)
{	
	instance_destroy();
}
