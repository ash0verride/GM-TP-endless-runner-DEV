// Makes the project fullscreen
window_set_fullscreen(true);

// Play splash sequence for menu UI
var _splash_seq = layer_sequence_create("Instances", 0, 0, seq_splash);

// Stops all previous running audio
audio_stop_all();

// Play audio for main menu
//music = audio_play_sound(snd_music_menu_main, 100, true);

// Check for highscore variable
if (!variable_global_exists("is_muted"))
{
    // Create empty variable for highscore
	global.highscore = 0;
	
	// Loads buffer for highscore
	highscore_buffer = buffer_load("ENDLESS_RUNNER_HS.sav");
	
	// Checks if buffer exists
	if(buffer_exists(highscore_buffer))
	{
		// Goes to the start of the buffer
		buffer_seek(highscore_buffer, buffer_seek_start, 0);
	
		// Sets the highscore to value from the buffer
		global.highscore = buffer_read(highscore_buffer, buffer_u64);
	}
	else
	{
		// Creates highscore buffer
		highscore_buffer = buffer_create(16384, buffer_fixed, 2);
		
		// Goes to the start of the buffer
		buffer_seek(highscore_buffer, buffer_seek_start, 0);

		// Writes highscore value to the buffer
		buffer_write(highscore_buffer, buffer_u64, global.highscore);
	
		// Saves the new empty highscore buffer
		buffer_save(highscore_buffer, "ENDLESS_RUNNER_HS.sav");
	}
}