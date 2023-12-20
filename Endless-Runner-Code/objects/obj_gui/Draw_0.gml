if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	draw_self();
	draw_text(x, y, string(round(obj_game_manager.current_distance)));
}