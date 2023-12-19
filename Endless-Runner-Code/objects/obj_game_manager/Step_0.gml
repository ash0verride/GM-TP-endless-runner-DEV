// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

// Change logic depending on the current game state.
switch (current_game_state)
{
	case GAME_STATE.IDLE:
	break;
	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
	
		// PLEASE REWORK THIS LATER!!!!
		// Checks if new max speed has changed.
		if (new_max_speed != "" && real(new_max_speed) != max_speed)
		{	
			// Adjusts the percentage.
			current_speed_percentage = 0;
			// Sets max speed to new value.
			max_speed = new_max_speed;
		}
		
		// Check if speed is less than target.
		if (current_speed_percentage < target_speed_percentage)
		{
			// Speed up at rate.
			current_speed_percentage += speed_up_rate * _delta_time;
			
			// Limit speed to target.
			current_speed_percentage = min(current_speed_percentage, target_speed_percentage);
		
			// Interpolate speed using smoothstep curve.
			current_speed = smoothstep(min_speed, max_speed, current_speed_percentage);
		}
		// Check if speed is greater than target.
		else if (current_speed_percentage > target_speed_percentage)
		{
			// Slow down at rate.
			current_speed_percentage -= speed_down_rate * _delta_time;
			
			// Limit speed to target.
			current_speed_percentage = max(current_speed_percentage, target_speed_percentage);
		
			// Interpolate speed using smoothstep curve.
			current_speed = smoothstep(min_speed, max_speed, current_speed_percentage);
		}
		
		// Add current speed to distance traveled.
		current_distance += current_speed * _delta_time;
		
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

