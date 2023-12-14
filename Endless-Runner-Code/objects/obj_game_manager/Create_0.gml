//// Game Manager Object.
// This object is used to control the main game loop and stores information for use in other objects.

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
max_speed = 4.0;
current_speed = 0.0;
current_speed_percentage = 0.0;

speed_up_rate = 0.1;