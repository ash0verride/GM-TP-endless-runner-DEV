draw_sprite(before_sprite, 0, x - sprite_get_width(before_sprite), y);
draw_self();
draw_sprite(after_sprite, 0, x + sprite_width, y);