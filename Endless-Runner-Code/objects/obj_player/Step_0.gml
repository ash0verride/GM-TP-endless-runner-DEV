// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

// Change logic depending on the current game state.
switch (obj_game_manager.current_game_state)
{	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
	
		if (keyboard_check_direct(vk_space) || mouse_check_button(mb_left))
		{
			has_jumped = true;
			y_velo += jump_strength * _delta_time;
			
			if (sprite_index == spr_character_run || sprite_index == spr_character_idle)
			{
				if (sprite_index != spr_character_idle)
				{
					sprite_index = spr_character_idle;
					image_index = 0;
					
					var _dust_particle = instance_create_layer(x, y + 80, "Stage", obj_particle_manager);
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.05;
				}
			}
			else if (y_velo > jump_threshold)
			{
				sprite_index = spr_character_fly_big;
			}
			else
			{
				sprite_index = spr_character_fly_small;
			}
		}
		else
		{
			sprite_index = spr_character_fly_release;
		}
		
		if (is_boosting)
		{
			obj_game_manager.target_speed_percentage = 1.0;
			boost_cooldown -= _delta_time;
			
			if (boost_cooldown <= 0)
			{
				is_boosting = false;
				boost_cooldown = 0;
			}
		}
		else
		{
			obj_game_manager.target_speed_percentage = 0.5;
		}
	
		break;
		
	case GAME_STATE.DYING:
	
		if (sprite_index != spr_character_death)
		{
			sprite_index = spr_character_death;
			image_index = 0;
			obj_game_manager.target_speed_percentage = 0.0;
		}
	
		break;
		
	case GAME_STATE.ENDED:
	break;
	case GAME_STATE.PAUSED:
	break;
	case GAME_STATE.TUTORIAL:
	break;
}

// Adjust velocity by gravity
y_velo -= gravity_strength;

y -= y_velo;

if (y > ystart)
{
	y = ystart;
	y_velo = 0.0;
	
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		sprite_index = spr_character_run;
		
		if (has_jumped && !is_boosting)
		{
			var _dust_particle = instance_create_layer(x, y + 90, "Stage", obj_particle_manager);
			_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
			_dust_particle.move_rate = 0;
			_dust_particle.drag_rate = 0.01;
		
			has_jumped = false;
		}
	}
}
else if (y < 0)
{
	y = 0;
	y_velo = 0.0;
}

if (is_boosting && obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	sprite_index = spr_character_boost;	
}

