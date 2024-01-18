if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x -= obj_game_manager.current_speed * 1.0;

	if (!has_dropped)
	{
		if (y < 950)
		{
			fall_speed += 120 * delta_time * 0.000001;
		
			y += fall_speed;
		
			if (y > 950)
			{
				y = 950;
			
				is_warping = true;
			
				create_firework();
			
				handle_request = call_later(random_range(90, 120), time_source_units_frames, create_firework, true);

				var _smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
				_smoke_particle.owner = self;
				_smoke_particle.set_particle(ps_smoke, "StageShadowsEffects");
			
				has_dropped = true;
			}
		}
	}

	if (is_warping)
	{
		var _warp_rate = 1.2;
		warp_curve_percent += delta_time * 0.000001 * _warp_rate;
	
		if (warp_curve_percent > 1.0)
		{
			warp_curve_percent = 1.0;
			is_warping = false;
			text_alpha = 0.0;
			
			var _new_gameover = function()
			{
				audio_stop_sound(global.music);
				global.music = audio_play_sound(snd_music_win, 100, false, 1.0);
				
				// Play game over sequence for menu UI
				var _gameover_seq = layer_sequence_create("GUI", 0, 0, seq_gameover);
			}
			
			var _go_handle = call_later(60, time_source_units_frames, _new_gameover, false);
		}
	
		var _adjust_val = animcurve_channel_evaluate(warp_curve, warp_curve_percent);
		image_yscale = 1.0 + _adjust_val;
	}

	if (!has_passed && obj_game_manager.current_distance > global.highscore)
	{	
		var _confetti_particle = instance_create_layer(x - 50, y - 20, "Stage", obj_particle_manager);
		_confetti_particle.owner = self;
		_confetti_particle.set_particle(ps_confetti, "StageShadowsEffects");
		_confetti_particle.set_offset(-50, -240);
	
		create_firework();
	
		has_passed = true;
	}
	
	if (!has_cooldown_adjusted)
	{
		if (x <= room_width * 2.33)
		{
			obj_spawn_manager.spawn_cooldown = (room_width * 0.66) / 60;
			
			with (obj_pickup_coin)
			{
				if (x >= room_width * 2)
				{
					instance_destroy();	
				}
			}
			
			has_cooldown_adjusted = true;	
		}
	}

	image_speed = 1;	
}
else
{
	image_speed = 0;
}