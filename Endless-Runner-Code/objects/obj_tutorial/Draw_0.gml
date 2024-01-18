draw_self();

draw_set_font(fnt_rowdies_56);

var _text_colour = make_color_rgb(142, 214, 67);
draw_set_color(_text_colour);
	
draw_set_alpha(image_alpha);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width * 0.5, room_height * 0.28, "HOW TO PLAY");

draw_set_font(fnt_rowdies_34);
draw_set_color(c_white);
draw_set_alpha(image_alpha);

draw_text(room_width * 0.5, room_height * 0.56, tip_message);

draw_set_halign(fa_left);
draw_set_valign(fa_top);