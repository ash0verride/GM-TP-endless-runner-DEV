draw_self();

draw_set_font(fnt_rowdies_56);

var _text_colour = make_color_rgb(142, 214, 67);
draw_set_color(_text_colour);
	
draw_set_alpha(obj_button_retry.image_alpha);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width * 0.5, room_height * 0.28, "GAME OVER");

draw_set_font(fnt_rowdies_34);
draw_set_color(c_white);
draw_set_alpha(obj_button_retry.image_alpha);

if (obj_game_manager.current_distance == global.highscore)
{
	draw_text(room_width * 0.5, room_height * 0.45, "New Best Distance!\n" + string(floor(obj_game_manager.current_distance)) + "M!");
}
else
{
	draw_text(room_width * 0.5, room_height * 0.45, "You reached " + string(floor(obj_game_manager.current_distance)) + "M!\nCurrent Highscore " + string(floor(global.highscore)) + "M");
}

_text_colour = make_color_rgb(255, 199, 5);
draw_set_color(_text_colour);
draw_set_alpha(obj_button_retry.image_alpha);

draw_text(room_width * 0.5, room_height * 0.55, "WELL DONE!");

draw_set_color(c_white);
draw_set_alpha(1.0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);