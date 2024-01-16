switch (tip_type)
{
	case 0:
	
		//obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.0;
		obj_player.image_speed = 0;

		if (keyboard_check_direct(vk_anykey))
		{
			tip_type = 1;
			can_jump = true;
		}
		
		break;
		
	case 1:
		
		obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.333;
		
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		
		tip_message = "Lets play the game\nPress B key to continue!";
		
		if (keyboard_check_direct(ord("B")))
		{
			tip_type = 5;	
		}
		
		break;
		
	case 5:
	
		obj_game_manager.current_game_state = GAME_STATE.PLAYING;
		
		layer_sequence_create("Stage", 0, 0, seq_gm_layout);
		
		if (global.highscore != 0)
		{
			var _flag = instance_create_layer(640 / 60 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker);
			_flag.has_dropped = true;
			_flag.flag_distance = global.highscore;
		}
		
		instance_destroy();
		break;
}