if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x = obj_player.x;
	y = obj_player.y;

	if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
	{
		life -= delta_time * 0.000001;
	
		image_alpha = lerp(image_alpha, 1.0, 0.1);
	}

	if (life > 0 && life < 2)
	{
		can_pulse = true;
	}
	else
	{
		can_pulse = false;
	}

	if (life <= 0 && sprite_index != spr_shield_off)
	{
		sprite_index = spr_shield_off;
		image_index = 0;
	}

	image_speed = 1;	
}
else
{
	image_speed = 0;
}