// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

if (!has_prefetched)
{
	_delta_time = 0;	
}

// Change logic depending on the current game state.
switch (current_game_state)
{	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
	
		update_speed(_delta_time);
		
		background_cooldown -= _delta_time;
		if (background_cooldown <= 0)
		{
			obj_interior_background.change_interior_state();
			background_cooldown = random_range(5, 15);
		}
		
	break;
	
	case GAME_STATE.DYING:
		update_speed(_delta_time);
		
		if (current_speed == 0 && obj_player.image_alpha == 0)
		{
			current_game_state = GAME_STATE.ENDED;
			
			if (current_distance > global.highscore)
			{
				// MAKE NEW FLAG
				var _flag = instance_create_layer(obj_player.x, -200, "Stage", obj_flag_marker);
				_flag.has_dropped = false;
				_flag.has_passed = true;
				
				global.highscore = current_distance;
				
				// Loads buffer for highscore
				highscore_buffer = buffer_load("ENDLESS_RUNNER_HS.sav");
	
				// Checks if buffer exists
				if(!buffer_exists(highscore_buffer))
				{
					// Creates highscore buffer
					highscore_buffer = buffer_create(16384, buffer_fixed, 2);
				}
		
				// Goes to the start of the buffer
				buffer_seek(highscore_buffer, buffer_seek_start, 0);

				// Writes highscore value to the buffer
				buffer_write(highscore_buffer, buffer_u64, global.highscore);
	
				// Saves the new highscore buffer
				buffer_save(highscore_buffer, "ENDLESS_RUNNER_HS.sav");
				
				// CREATE UI
			}
			else
			{
				// CREATE UI
			}
		}
	break;
	
	case GAME_STATE.ENDED:
	break;
	case GAME_STATE.PAUSED:
	break;
	
	case GAME_STATE.TUTORIAL:
		update_speed(_delta_time);
	break;
}

