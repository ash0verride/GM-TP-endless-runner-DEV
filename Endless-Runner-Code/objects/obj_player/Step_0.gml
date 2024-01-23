if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Set delta time for movements that are time based.
	var _delta_time = delta_time * 0.000001;

	// Change logic depending on the current game state.
	switch (obj_game_manager.current_game_state)
	{	
		// Logic for while the game is playing.
		case GAME_STATE.PLAYING:
	
			var _gamepad_jump = false;
			
			if (gamepad_is_connected(0))
			{
				if (gamepad_button_check(0, gp_face1))
				{
					_gamepad_jump = true;	
				}
			}
	
			if (keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump)
			{
				has_jumped = true;
				y_velo += jump_strength * _delta_time;
			
				if (current_player_state == PLAYER_STATE.RUN)
				{
					current_player_state = PLAYER_STATE.IDLE;
					sprite_index = spr_character_idle;
					image_index = 0;
					
					var _new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
					//_new_flame_particle.owner = self;
					_new_flame_particle.set_particle(ps_inital_jump_flame, "StageBackEffects");
					_new_flame_particle.set_offset(0, 100);
					_new_flame_particle.move_rate = 0;
					_new_flame_particle.drag_rate = 0.05;
					
					var _dust_particle = instance_create_layer(x, y + 80, "Stage", obj_particle_manager);
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.05;
				}
				else if (y_velo > jump_threshold)
				{
					current_player_state = PLAYER_STATE.FLY_BIG;
					sprite_index = spr_character_idle;
				}
				else
				{
					current_player_state = PLAYER_STATE.FLY_SMALL;
					sprite_index = spr_character_idle;
				}
			}
			else if (y < ystart)
			{
				current_player_state = PLAYER_STATE.FLY_RELEASED;
				sprite_index = spr_character_idle;
			}
		
			if (is_boosting)
			{
				obj_game_manager.target_speed_percentage = 1.0;
				boost_cooldown -= _delta_time;
			
				if (boost_cooldown <= 0)
				{
					var _new_aura_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
					_new_aura_particle.owner = self;
					_new_aura_particle.set_particle(ps_powerup_out, "StageFrontEffects");
					
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
	
			if (current_player_state != PLAYER_STATE.DEATH)
			{
				current_player_state = PLAYER_STATE.DEATH;
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
		
			if (!obj_tutorial.can_jump)
			{
				if (y < ystart)
				{
					current_player_state = PLAYER_STATE.FLY_RELEASED;
					sprite_index = spr_character_idle;
				}
				
				break;
			}
			
			var _gamepad_jump_tutorial = false;
			
			if (gamepad_is_connected(0))
			{
				if (gamepad_button_check(0, gp_face1))
				{
					_gamepad_jump_tutorial = true;	
				}
			}
	
			if (keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump_tutorial)
			{
				has_jumped = true;
				y_velo += jump_strength * _delta_time;
			
				if (current_player_state == PLAYER_STATE.RUN || current_player_state == PLAYER_STATE.IDLE)
				{
					if (current_player_state != PLAYER_STATE.IDLE)
					{
						current_player_state = PLAYER_STATE.IDLE;
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
					current_player_state = PLAYER_STATE.FLY_BIG;
					sprite_index = spr_character_idle;
				}
				else
				{
					current_player_state = PLAYER_STATE.FLY_SMALL;
					sprite_index = spr_character_idle;
				}
			}
			else if (y < ystart)
			{
				current_player_state = PLAYER_STATE.FLY_RELEASED;
				sprite_index = spr_character_idle;
			}
			
		break;
	}


	if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
	{
		// Adjust velocity by gravity
		y_velo -= gravity_strength;

		y -= y_velo;

		if (y > ystart)
		{
			y = ystart;
			y_velo = 0.0;
	
			if (obj_game_manager.current_game_state == GAME_STATE.PLAYING || obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
			{
				if (current_player_state != PLAYER_STATE.RUN)
				{
					current_player_state = PLAYER_STATE.RUN;
					sprite_index = spr_character_run;
				}
		
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
			current_player_state = PLAYER_STATE.BOOST;
			sprite_index = spr_character_boost;	
		}
	}
}