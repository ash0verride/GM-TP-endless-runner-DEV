//// Spawn Manager Object.
// This object is used to control spawning objects when needed.

// Cooldown variables
spawn_cooldown = 0;
powerup_cooldown = 50;
enemy_cooldown = 100;

// Spawns random enemy
spawn_enemy = function()
{
	var _spawn_x = room_width * 2;
	var _type = irandom(2);
	
	switch (_type)
	{
		case 0: // Beam high
			instance_create_layer(_spawn_x + 59, 230, "Stage", obj_beam);
			spawn_cooldown = 10 + 1.8;
		break;
		
		case 1: // Beam low
			instance_create_layer(_spawn_x + 59, 720, "Stage", obj_beam);
			spawn_cooldown = 10 + 1.8;
		break;
			
		case 2: // Normal enemy
			instance_create_layer(_spawn_x + 204, 800, "Stage", obj_enemy);
			spawn_cooldown = 0; // 10 + 6.3
	}

	enemy_cooldown = 250 - (50 * clamp((obj_game_manager.current_level / 2), 1, 3.5));
}

// Spawns random powerup
spawn_powerup = function()
{
	var _spawn_x = room_width * 2;
	var _new_y = choose(140, 315, 490, 665, 840);//random_range(100, 896);
	
	instance_create_layer(_spawn_x + 92, _new_y, "Stage", choose(obj_pickup_boost, obj_pickup_shield));
	
	spawn_cooldown = 10 + 1.7;
	
	powerup_cooldown = 100 * min(obj_game_manager.current_level, 5);
}

spawn_reward = function(_reward_type)
{
	var _spawn_x = room_width * 2;
	var _new_x = _spawn_x + 34;
	var _new_y = random_range(100, 896);
	
	switch(_reward_type)
	{
		case 0: // Single Coin
		
			_new_y = 896;
			
			instance_create_layer(_new_x, _new_y, "Stage", obj_pickup_coin);
			spawn_cooldown = 10 + 1;
			
		break;
		
		case 1: // 3x3 Set Coins
	
			_new_y = choose(100, 438, 776);
			
			for (var _i = 0; _i < 3; _i++)
			{
				for (var _j = 0; _j < 3; _j++)
				{
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			spawn_cooldown = 10 + 3.2;
			
		break;
		
		case 2: // 9x2 Set Coins
			
			_new_y = choose(100, 340, 580, 820)
			
			for (var _i = 0; _i < 9; _i++)
			{
				for (var _j = 0; _j < 2; _j++)
				{
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			spawn_cooldown = 10 + 9.9;
			
		break;
		
		case 3: // 2x9 Set Coins
		
			_new_y = 180;
			
			for (var _i = 0; _i < 2; _i++)
			{
				for (var _j = 0; _j < 9; _j++)
				{
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			spawn_cooldown = 10 + 2.1;
			
		break;
		
		case 4: // 9x1 Wave Coins up curve
		
			_new_y = random_range(100 + 160, 896);
			_new_y = choose(300, 550, 800)
			
			for (var _i = 0; _i < 9; _i++)
			{
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			spawn_cooldown = 10 + 9.9;
			
		break;
		
		case 5: // 9x1 Wave Coins down curve
		
			_new_y = choose(350, 600);
			
			for (var _i = 0; _i < 9; _i++)
			{
				instance_create_layer(_new_x + _i * 70, _new_y + sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			spawn_cooldown = 10 + 9.9;
			
		break;
		
		case 6: // 18x2 Wave Coins down curve
		
			_new_y = 500;
			
			for (var _i = 0; _i < 17; _i++)
			{
				instance_create_layer(_new_x + _i * 70, _new_y + sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			for (var _i = 0; _i < 17; _i++)
			{
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			spawn_cooldown = 10 + 18.9;
			
		break;
		
		case 7: // Chest
			_new_x = _spawn_x + 206;
			_new_y = 896;
	
			instance_create_layer(_new_x, _new_y, "Stage", obj_chest);
	
			spawn_cooldown = 10 + 3.7;
		break;
	}
}