for (var _i = 0; _i < fauna_count; _i++)
{
	draw_set_alpha(set_alphas[_i]);
	draw_sprite(set_sprites[_i], 0, x_coords[_i], y);
}

draw_set_alpha(1.0);