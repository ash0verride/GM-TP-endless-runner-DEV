var _new_particle = -1;

switch (sprite_index)
{
	case spr_character_fly_big:
		
		_new_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_particle.move_rate = 0.0;
		_new_particle.drag_rate = 0.04;
		_new_particle.set_particle(ps_long_press, "StageFrontEffects");
		_new_particle.set_angle(180);
		_new_particle.set_offset(0, 100);
		
	break;
	
	case spr_character_fly_small:
		
		_new_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_particle.move_rate = 0.0;
		_new_particle.drag_rate = 0.04;
		_new_particle.set_particle(ps_short_press, "StageFrontEffects");
		_new_particle.set_angle(180);
		_new_particle.set_offset(0, 100);
		
	break;
	
	case spr_character_boost:
	
		_new_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		//_new_particle.owner = self;
		_new_particle.move_rate = 0.0;
		_new_particle.drag_rate = 0.04;
		_new_particle.set_particle(ps_speed_booster, "StageFrontEffects");
		_new_particle.set_angle(90);
		_new_particle.set_offset(-100, 30);
		
		var _new_particle_2 = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_particle_2.owner = self;
		_new_particle_2.set_particle(ps_speed_booster, "StageFrontEffects");
		_new_particle_2.set_angle(90);
		_new_particle_2.set_offset(-100, 30);
		
	break;
}