// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{	
	// MAYBE WE CHANGE THIS?
	_delta_time *= obj_game_manager.current_speed_percentage * 2;
	
	powerup_cooldown -= _delta_time;
	spawn_cooldown -= _delta_time;
	enemy_cooldown -= _delta_time;
	
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
			spawn_reward(irandom(5));
		}
	}	
}