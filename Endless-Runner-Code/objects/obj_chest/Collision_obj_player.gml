// Checks if the chest is still in idle state and not collected
if (sprite_index == spr_chest_idle)
{
	// Sets the chests sprite to breaking animation
	sprite_index = spr_chest_break;
	// Starts the animation from the first frame
	image_index = 0;
	
	// Creates new chest blast particle object
	var _blast_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	// Sets objects particle effect and layer target
	_blast_particle.set_particle(ps_chest_blast, "StageBackEffects");
	
	// Loops through for loop for horizontal positions
	for (var _i = 0; _i < 5; _i++)
	{
		// Loops through for loop for virtical postions
		for (var _j = 0; _j < 2; _j++)
		{
			// Creates new coin gui object
			var _gui_coin = instance_create_layer(x - 75 + (150 / 4) * (_i), y - 25 + _j * 50, "StageFront", obj_coin_gui);
			
			// Creates new coin particle object
			var _coin_particle = instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager);
			// Sets the particle objects parent to the gui coin
			_coin_particle.owner = _gui_coin;
			// Sets objects particle effect and layer target
			_coin_particle.set_particle(ps_coin, "StageBackEffects");
			
			// Sets the gui coins child object as the new particle
			_gui_coin.child_particle = _coin_particle;
		}
	}
	
	// Sets self as a temporary variable
	var _chest = self;
	
	// Loops though the shadow objects within the room
	with (obj_shadow)
	{
		// Checks if the shadows owner is this chest
		if (owner == _chest)
		{
			// Creates a fade out for the shadow
			fade_out(0.33);
		}
	}
}