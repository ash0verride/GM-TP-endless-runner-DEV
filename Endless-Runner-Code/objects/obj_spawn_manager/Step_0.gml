if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{	
	// Set delta time for movements that are time based.
	var _delta_time = delta_time * 0.000001;
	

	var _delta_distance = obj_game_manager.current_speed * _delta_time;
	
	powerup_cooldown -= _delta_distance;
	spawn_cooldown -= _delta_distance;
	enemy_cooldown -= _delta_distance;
	
	if (spawn_cooldown <= 0)
	{
		if (enemy_cooldown <= 0)
		{
			spawn_enemy();
		}
		else if (powerup_cooldown <= 0)
		{
			spawn_powerup();
		}
		else
		{
			//spawn_reward(irandom(4) + 1);
			spawn_reward(2);
		}
	}	
}