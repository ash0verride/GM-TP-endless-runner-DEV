var _new_flame_particle = -1;
var _new_shimmer_particle = -1;

switch (sprite_index)
{
	case spr_character_fly_big:
		
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.move_rate = 0.0;
		_new_flame_particle.drag_rate = 0.04;
		_new_flame_particle.set_particle(ps_long_press, "StageFrontEffects");
		_new_flame_particle.set_angle(180);
		_new_flame_particle.set_offset(0, 100);
		
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
	
	case spr_character_fly_small:
		
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.move_rate = 0.0;
		_new_flame_particle.drag_rate = 0.04;
		_new_flame_particle.set_particle(ps_short_press, "StageFrontEffects");
		_new_flame_particle.set_angle(180);
		_new_flame_particle.set_offset(0, 100);
		
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
	
	case spr_character_boost:
	
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.owner = self;
		_new_flame_particle.set_particle(ps_speed_booster, "StageFrontEffects");
		_new_flame_particle.set_angle(90);
		_new_flame_particle.set_offset(-100, 30);
		
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers_intense, "StageFrontEffects");
		
	break;
	
	case spr_character_idle:
	
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
	
	break;
	
	case spr_character_run:
	
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
}