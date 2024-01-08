//if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	draw_self();
	draw_text(x, y, string(round(obj_game_manager.current_distance)));
	draw_text(x+40, y+20, string(round(obj_game_manager.current_gold)));
	
	draw_text(x+40, y+80, string(round(global.highscore)));
	draw_sprite(spr_gold_icon, 0, x, y+20);
}