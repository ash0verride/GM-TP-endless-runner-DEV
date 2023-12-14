// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

// Change logic depending on the current game state.
switch (current_game_state)
{
	case GAME_STATE.IDLE:
	break;
	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
		
		// Checks the current speed is less than the max speed allowed.
		if (current_speed < max_speed)
		{
			// Limit lowest possible speed so not zero.
			current_speed = max(current_speed, 0.01);
			
			// Increment the current speed over time.
			current_speed += current_speed * speed_up_rate * _delta_time
		}
		
		// Limit to maximum speed;
		current_speed = min(current_speed, max_speed);
		
		//smoothstep();
		
		// Add current speed to distance traveled
		current_distance += current_speed;
		
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

