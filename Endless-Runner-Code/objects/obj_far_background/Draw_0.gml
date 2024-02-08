// Draw the before sprite at an offset of minus its width
draw_sprite(before_sprite, 0, x - sprite_get_width(before_sprite), y);
// Draw the main/middle sprite
draw_self();
// Draw the final sprite at an offset of its width
draw_sprite(after_sprite, 0, x + sprite_width, y);