if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	draw_self();
	
	draw_set_font(fnt_rowdies_28);
	
	draw_set_color(c_white);
	draw_set_alpha(1.0);
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	
	draw_text(x + 145, y - 8, parse_value(obj_game_manager.current_distance) + "M");
	
	draw_sprite(spr_gold_icon, 0, x - 5, y + 50);
	
	var _colour_coin_text = make_color_rgb(255, 218, 55);
	
	draw_set_color(_colour_coin_text);
	
	draw_set_halign(fa_left);
	
	draw_text(x + 52, y + 60, parse_value(obj_game_manager.current_gold));
	
	draw_set_color(c_white);
	draw_set_alpha(1.0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}