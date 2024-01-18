switch (tip_type)
{
	case 0:
	
		obj_game_manager.target_speed_percentage = 0.0;
		obj_player.image_speed = 0;
		obj_player.y = 810;
		obj_player.sprite_index = spr_character_idle;

		if (is_gamepad && gamepad_button_check(0, gp_face1))
		{
			tip_type = 1;
			can_jump = true;
		}		
		else if (global.is_touch && mouse_check_button(mb_left))
		{
			tip_type = 1;
			can_jump = true;
		}
		else if (keyboard_check_direct(vk_anykey))
		{
			tip_type = 1;
			can_jump = true;
		}
		
		break;
		
	case 1:
		
		obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.333;
		
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		
		if (is_gamepad)
		{
			tip_message = "Use the A or Cross button to jump!";
			
			if (gamepad_button_check(0, gp_face1))
			{
				action_timer += delta_time * 0.000001;
			}
		}		
		else if (global.is_touch)
		{
			tip_message = "Tap or hold the screen to jump!";
			
			if (mouse_check_button(mb_left))
			{
				action_timer += delta_time * 0.000001;
			}
		}
		else
		{
			tip_message = "Use space or left mouse\nbutton to jump!";
			
			if (mouse_check_button(mb_left) || keyboard_check_direct(vk_space))
			{
				action_timer += delta_time * 0.000001;
			}
		}
		
		if (action_timer >= 1.5)
		{
			action_timer = 0;
			tip_type = 2;
		}
		
		break;
		
	case 2:
		
		obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.333;
		
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		
		if (is_gamepad)
		{
			tip_message = "Release the A or Cross button\nto drop down!";
		}		
		else if (global.is_touch)
		{
			tip_message = "Release the screen to drop down!";
		}
		else
		{
			tip_message = "Release space and left mouse\nbutton to drop down!";
		}
		
		if (obj_player.y >= obj_player.ystart)
		{
			action_timer += delta_time * 0.000001;
		}
		
		if (action_timer >= 3.0)
		{
			action_timer = 0;
			tip_type = 3;
		}
		
		break;
		
	case 3:
		
		obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.333;
		
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		
		tip_message = "Collect coins and avoid\nobstacles to see how far\nyou can get!\n\n GOOD LUCK!";
		
		action_timer += delta_time * 0.000001;
		
		if (action_timer >= 5.0)
		{
			action_timer = 0;
			tip_type = 4;
		}
		
		break;
		
	case 4:
	
		obj_game_manager.current_game_state = GAME_STATE.PLAYING;
		
		audio_sound_gain(global.music, 1.0, 2000);
		audio_sound_pitch(global.music, 1.0);
		
		layer_sequence_create("Stage", 0, 0, seq_gm_layout);
		
		if (global.highscore != 0)
		{
			var _flag = instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker);
			_flag.has_dropped = true;
			_flag.flag_distance = global.highscore;
		}
		
		instance_destroy();
		break;
}