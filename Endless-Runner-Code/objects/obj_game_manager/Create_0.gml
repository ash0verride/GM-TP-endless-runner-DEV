//// Game Manager Object.
// This object is used to control the main game loop and stores information for use in other objects.

// Sets new random seed
randomise();

// Game states.
enum GAME_STATE
{
	PLAYING,
	DYING,	
	ENDED,
	PAUSED,
	TUTORIAL,
	SIZE
}

// Variables.
current_level = 1;
current_level_gold = 0;

current_distance = 0;
current_gold = 0;

current_game_state = GAME_STATE.PLAYING;

min_speed = 0.0;
max_speed = 24.0;
new_max_speed = max_speed;
true_max_speed = 72.0;

current_speed = 0.0;
current_speed_percentage = 0.0;
target_speed_percentage = 0.5;

speed_up_rate = 0.2;
speed_down_rate = 0.5;

background_cooldown = random_range(5, 15);

has_prefetched = false;

// Game objects for room
instance_create_layer(0, 0, "Farground", obj_far_background);
instance_create_layer(0, 0, "Midground", obj_interior_background);
instance_create_layer(0, 0, "Midground", obj_mid_background);
instance_create_layer(0, 0, "Foreground", obj_front_floor);
instance_create_layer(0, 0, "Foreground", obj_front_ceiling);

if (global.highscore != 0)
{
	var _flag = instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker);
	_flag.has_dropped = true;
}

instance_create_layer(0, 0, "Stage", obj_player);

update_speed = function(_delta_time)
{
	if (current_level_gold >= 50)
	{
		current_level_gold -= 50;
		current_level++;
		new_max_speed = max_speed * 1.05;
	}
	
	if (new_max_speed > true_max_speed)
	{
		new_max_speed = true_max_speed;	
	}
	
	// Checks if new max speed has changed.
	if (new_max_speed != max_speed)
	{	
		// Adjusts the percentage.
		current_speed_percentage *= max_speed / new_max_speed;
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
}