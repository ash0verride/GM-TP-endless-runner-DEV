event_inherited();

target_function = function()
{
	obj_game_manager.current_game_state = GAME_STATE.PLAYING;
	
	instance_destroy(obj_banner_paused);
}