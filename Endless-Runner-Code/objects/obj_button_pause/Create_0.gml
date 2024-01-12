if (global.is_touch)
{
	sprite_index = spr_button_pause_mobile;
}

event_inherited();

target_function = function()
{
	if (obj_game_manager.current_game_state != GAME_STATE.PAUSED && obj_game_manager.current_game_state != GAME_STATE.ENDED)
	{
		obj_game_manager.current_game_state = GAME_STATE.PAUSED;
		// Create pause menu UI
	}
}