if (sprite_index == spr_chest_idle)
{
	sprite_index = spr_chest_break;
	image_index = 0;
	
	var _blast_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_blast_particle.set_particle(ps_chest_blast, "StageBackEffects");
	
	for (var _i = 0; _i < 5; _i++)
	{
		for (var _j = 0; _j < 2; _j++)
		{
			var _gui_coin = instance_create_layer(x - 75 + (150 / 4) * (_i), y - 25 + _j * 50, "StageFront", obj_coin_gui);
	
			var _coin_particle = instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager);
			_coin_particle.owner = _gui_coin;
			_coin_particle.set_particle(ps_coin, "StageBackEffects");
	
			_gui_coin.child_particle = _coin_particle;
		}
	}
	
	var _chest = self;
	with (obj_shadow)
	{
		if (owner == _chest)
		{
			fade_out(0.33);
		}
	}
}