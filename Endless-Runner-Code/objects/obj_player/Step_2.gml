if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	exit;	
}

var _new_flame_particle = -1;
var _new_smoke_particle = -1;
var _new_shimmer_particle = -1;

switch (current_player_state)
{
	case PLAYER_STATE.FLY_BIG:
		
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.owner = self;
		_new_flame_particle.set_particle(ps_long_press_flame, "StageBackEffects");
		_new_flame_particle.set_offset(5, 95);
		
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_smoke_particle.move_rate = 0.0;
		_new_smoke_particle.drag_rate = 0.04;
		_new_smoke_particle.set_particle(ps_long_press_smoke, "StageFrontEffects");
		_new_smoke_particle.set_angle(180);
		_new_smoke_particle.set_offset(0, 100);
		
		if (obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
		{
			break;	
		}
		
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
	
	case PLAYER_STATE.FLY_SMALL:
	
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.owner = self;
		_new_flame_particle.set_particle(ps_short_press_flame, "StageBackEffects");
		_new_flame_particle.set_offset(5, 95);
		
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_smoke_particle.move_rate = 0.0;
		_new_smoke_particle.drag_rate = 0.04;
		_new_smoke_particle.set_particle(ps_short_press_smoke, "StageFrontEffects");
		_new_smoke_particle.set_angle(180);
		_new_smoke_particle.set_offset(0, 100);
		
		if (obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
		{
			break;	
		}
		
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
	
	case PLAYER_STATE.BOOST:
	
		var _new_aura_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_aura_particle.owner = self;
		_new_aura_particle.set_particle(ps_speed_booster_aura, "StageFrontEffects");
		_new_aura_particle.set_angle(270);
		_new_aura_particle.set_offset(-140, 10);
	
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.owner = self;
		_new_flame_particle.set_particle(ps_speed_booster_flame, "StageBackEffects");
		_new_flame_particle.set_angle(270);
		_new_flame_particle.set_offset(-100, 30);
	
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_smoke_particle.owner = self;
		_new_smoke_particle.set_particle(ps_speed_booster_smoke, "StageFrontEffects");
		_new_smoke_particle.set_angle(90);
		_new_smoke_particle.set_offset(-100, 30);
		
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers_intense, "StageFrontEffects");
		
	break;
	
	case PLAYER_STATE.IDLE:
	
		if (obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
		{
			break;	
		}
	
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
	
	break;
	
	case PLAYER_STATE.DEATH:
	
		if (obj_game_manager.current_game_state == GAME_STATE.ENDED)
		{
			break;	
		}
	
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
}