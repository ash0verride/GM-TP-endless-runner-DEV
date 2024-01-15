if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	var _gamepad_pause = false;
			
	if (gamepad_is_connected(0))
	{
		if (gamepad_button_check_pressed(0, gp_start))
		{
			_gamepad_pause = true;	
		}
	}
	
	if ((keyboard_check_pressed(vk_escape) || _gamepad_pause) && !was_paused)
	{
		is_hovered = false;
		is_pushed = false;
		
		target_scale = 1.0;
		target_function();
		
		was_paused = true;
	}
	else
	{
		was_paused = false;	
	}
}

// Inherit the parent event
event_inherited();