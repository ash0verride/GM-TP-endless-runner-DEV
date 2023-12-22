// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

// Change logic depending on the current game state.
switch (current_game_state)
{
	case GAME_STATE.IDLE:
	break;
	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
		update_speed(_delta_time);
		
		background_cooldown -= _delta_time;
		if (background_cooldown <= 0)
		{
			obj_interior_background.change_interior_state();
			background_cooldown = random_range(5, 15);
		}
		
		coin_cooldown -= _delta_time;
		if (coin_cooldown <= 0)
		{
			instance_create_layer(room_width + 244, random_range(100, 896), "Stage", obj_pickup_coin);
			coin_cooldown = random_range(5, 10);
		}
		
		chest_cooldown -= _delta_time;
		if (chest_cooldown <= 0)
		{
			instance_create_layer(room_width + 244, 896, "Stage", obj_chest);
			chest_cooldown = random_range(10, 20);
		}
		
		booster_cooldown -= _delta_time;
		if (booster_cooldown <= 0)
		{
			instance_create_layer(room_width + 244, random_range(100, 896), "Stage", obj_pickup_boost);
			booster_cooldown = random_range(20, 40);
		}
		
		shield_cooldown -= _delta_time;
		if (shield_cooldown <= 0)
		{
			instance_create_layer(room_width + 244, random_range(100, 896), "Stage", obj_pickup_shield);
			shield_cooldown = random_range(30, 60);
		}
		
	break;
	case GAME_STATE.DYING:
		update_speed(_delta_time);
		
		if (current_speed == 0 && obj_player.image_alpha == 0)
		{
			current_game_state = GAME_STATE.ENDED;	
		}
	break;
	case GAME_STATE.ENDED:
	break;
	case GAME_STATE.PAUSED:
	break;
	case GAME_STATE.TUTORIAL:
		update_speed(_delta_time);
	break;
}

