// Checks if the coins current sprite not collected
if (sprite_index == spr_coin_idle)
{
	//// Changes the sprite to the collected animation
	//sprite_index = spr_coin_colleting;
	//// Sets the sprite for the collecting animation to a random angle
	//image_angle = random(360);
	
	// Creates a new gui coin object
	var _gui_coin = instance_create_layer(x, y, "StageFront", obj_coin_gui);
	
	// Creates a new coin particle object
	var _coin_particle = instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager);
	// Sets the gui coin as the particle objects owner
	_coin_particle.owner = _gui_coin;
	// Sets the particle object to use the coin particle effect on the layer specified
	_coin_particle.set_particle(ps_coin, "StageFrontEffects");
	
	// Sets the gui coin object to store the particle object it is attached to
	_gui_coin.child_particle = _coin_particle;
	
	instance_destroy();
}