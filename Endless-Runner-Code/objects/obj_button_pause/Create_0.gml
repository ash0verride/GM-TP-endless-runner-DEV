if (global.is_touch)
{
	sprite_index = spr_button_pause_mobile;
}

event_inherited();

target_function = function()
{
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		obj_game_manager.current_game_state = GAME_STATE.PAUSED;
		
		// Play pause sequence for menu UI
		var _pause_seq = layer_sequence_create("GUI", 0, 0, seq_pause);
	}
}