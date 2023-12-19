// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

// Change logic depending on the current game state.
switch (obj_game_manager.current_game_state)
{
	case GAME_STATE.IDLE:
	break;
	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
	
		if (keyboard_check_direct(vk_space))
		{
			y_velo += jump_strength * _delta_time;
			
			if (y_velo > jump_threshold)
			{
				sprite_index = spr_character_fly_big;
			}
			else
			{
				sprite_index = spr_character_fly_small;
			}
		}
		else
		{
			sprite_index = spr_character_fly_release;
		}
	
		break;
		
	case GAME_STATE.DYING:
	break;
	case GAME_STATE.ENDED:
	break;
	case GAME_STATE.PAUSED:
	break;
	case GAME_STATE.TUTORIAL:
	break;
}

// Adjust velocity by gravity
y_velo -= gravity_strength;

y -= y_velo;

if (y > ystart)
{
	y = ystart;
	y_velo = 0.0;
	
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		sprite_index = spr_character_run;
	}
}

