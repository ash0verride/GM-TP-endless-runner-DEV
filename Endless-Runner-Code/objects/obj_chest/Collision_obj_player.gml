if (sprite_index == spr_chest_idle)
{
	sprite_index = spr_chest_break;
	image_index = 0;
	
	obj_game_manager.current_gold += 10;
	obj_game_manager.current_level_gold += 10;
	
	var _chest = self;
	with (obj_shadow)
	{
		if (owner == _chest)
		{
			fade_out(0.33);
		}
	}
}