if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	image_speed = 0;	
}
else
{
	image_speed = 1;
}

draw_self();