x -= obj_game_manager.current_speed * 1.0;

if (!has_dropped)
{
	if (y < 950)
	{
		fall_speed += 90 * delta_time * 0.000001;
		
		y += fall_speed;
		
		if (y > 950)
		{
			y = 950;
			
			image_yscale = 0.8;
			
			create_firework();
			
			call_later(45, time_source_units_frames, create_firework, true);

			var _smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
			_smoke_particle.owner = self;
			_smoke_particle.set_particle(ps_smoke, "StageShadowsEffects");
			
			has_dropped = true;
		}
	}
}
else
{
	image_yscale = lerp(image_yscale, 1.0, 0.1);
}

if (!has_passed && obj_game_manager.current_distance > global.highscore)
{	
	var _confetti_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_confetti_particle.owner = self;
	_confetti_particle.set_particle(ps_confetti, "StageBackEffects");
	
	create_firework();
	
	has_passed = true;
}
