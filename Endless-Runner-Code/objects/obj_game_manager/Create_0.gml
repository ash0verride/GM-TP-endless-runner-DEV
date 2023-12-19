//// Game Manager Object.
// This object is used to control the main game loop and stores information for use in other objects.

// Sets new random seed
randomise();

// Game states.
enum GAME_STATE
{
	IDLE,
	PLAYING,
	DYING,	
	ENDED,
	PAUSED,
	TUTORIAL,
	SIZE
}

// Variables.
current_level = 0;
current_distance = 0;

current_game_state = GAME_STATE.PLAYING;

min_speed = 0.0;
max_speed = 24.0;
new_max_speed = max_speed;

current_speed = 0.0;
current_speed_percentage = 0.0;
target_speed_percentage = 0.5;

speed_up_rate = 0.2;
speed_down_rate = 0.5;

// Game objects for room
instance_create_layer(0, 0, "Farground", obj_far_background);
instance_create_layer(0, 0, "Midground", obj_interior_background);
instance_create_layer(0, 0, "Midground", obj_mid_background);
instance_create_layer(0, 0, "Foreground", obj_front_floor);
instance_create_layer(0, 0, "Foreground", obj_front_ceiling);

instance_create_layer(0, 0, "Stage", obj_player);