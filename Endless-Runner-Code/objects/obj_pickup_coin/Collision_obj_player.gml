if (sprite_index == spr_coin_idle)
{
	obj_game_manager.current_gold++;
	sprite_index = spr_coin_colleting;
	image_angle = random(360);
	
	var _coin_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	//_coin_particle.owner = self;
	_coin_particle.set_particle(ps_coin, "StageBackEffects");
}