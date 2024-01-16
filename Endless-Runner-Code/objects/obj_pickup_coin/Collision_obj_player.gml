if (sprite_index == spr_coin_idle)
{
	sprite_index = spr_coin_colleting;
	image_angle = random(360);
	
	var _gui_coin = instance_create_layer(x, y, "StageFront", obj_coin_gui);
	
	var _coin_particle = instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager);
	_coin_particle.owner = _gui_coin;
	_coin_particle.set_particle(ps_coin, "StageBackEffects");
	
	_gui_coin.child_particle = _coin_particle;
}