// Smoothstep interpolation function
function smoothstep(_start, _end, _value)
{
	return lerp(_start, _end, _value * _value * (3 - 2 * _value));
}

// Function that returns the current gamestate as a string
function get_gamestate()
{
	switch(obj_game_manager.current_game_state)
	{
		case GAME_STATE.DYING:
			return "Dying";
		case GAME_STATE.ENDED:
			return "Ended";
		case GAME_STATE.IDLE:
			return "Idle";
		case GAME_STATE.PAUSED:
			return "Paused";
		case GAME_STATE.PLAYING:
			return "Playing";
		case GAME_STATE.TUTORIAL:
			return "Tutorial";
	}
	
	return "Unset";
}