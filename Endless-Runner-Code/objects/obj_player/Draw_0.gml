// Change logic depending on the current game state.
switch (obj_game_manager.current_game_state)
{
	case GAME_STATE.IDLE:
		sprite_set_speed(sprite_index, 18, spritespeed_framespersecond);
	break;
	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
		sprite_set_speed(sprite_index, 24 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0), spritespeed_framespersecond);
	break;
		
	case GAME_STATE.DYING:
		sprite_set_speed(sprite_index, 18, spritespeed_framespersecond);
	break;
	case GAME_STATE.ENDED:
		sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
	break;
	case GAME_STATE.PAUSED:
		sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
	break;
	case GAME_STATE.TUTORIAL:
		sprite_set_speed(sprite_index, 24 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0), spritespeed_framespersecond);
	break;
}

draw_self();