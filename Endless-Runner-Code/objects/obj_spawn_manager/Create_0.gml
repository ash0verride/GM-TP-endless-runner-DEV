//// Spawn Manager Object.
// This object is used to control spawning objects when needed.

// Cooldown variables
spawn_cooldown = 2;
powerup_cooldown = 5;
enemy_cooldown = 15;

// Spawns random enemy
spawn_enemy = function()
{
	var _type = irandom(1);
	
	switch (_type)
	{
		case 0: // BEAM	
			instance_create_layer(room_width + 59, random_range(192, 736), "Stage", obj_beam);
			spawn_cooldown = 0.8;
		break;
			
		case 1: // Normal enemy
			instance_create_layer(room_width + 204, 800, "Stage", obj_enemy);
			spawn_cooldown = 1.2;
	}

	enemy_cooldown = random_range(4, 10);
}

// Spawns random powerup
spawn_powerup = function()
{
	instance_create_layer(room_width + 92, random_range(100, 896), "Stage", choose(obj_pickup_boost, obj_pickup_shield));
	
	spawn_cooldown = 0.8;
	powerup_cooldown = 10;
}

spawn_reward = function(_reward_type)
{
	var _new_x = room_width + 34;
	var _new_y = random_range(100, 896);
	
	switch(_reward_type)
	{
		case 0: // Single Coin
			instance_create_layer(_new_x, _new_y, "Stage", obj_pickup_coin);
			
			spawn_cooldown = 0.8;
		break;
		
		case 1: // 3x3 Set Coins
			_new_y = random_range(100, 896 - 160);
			
			for (var _i = 0; _i < 3; _i++)
			{
				for (var _j = 0; _j < 3; _j++)
				{
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			spawn_cooldown = 1.0;
		break;
		
		case 2: // 9x2 Set Coins
			_new_y = random_range(100, 896 - 80);
			
			for (var _i = 0; _i < 9; _i++)
			{
				for (var _j = 0; _j < 2; _j++)
				{
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			spawn_cooldown = 1.5;
		break;
		
		case 3: // 2x9 Set Coins
			_new_y = random_range(100, 896 - 640);
			
			for (var _i = 0; _i < 2; _i++)
			{
				for (var _j = 0; _j < 9; _j++)
				{
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			spawn_cooldown = 0.85;
		break;
		
		case 4: // 9x1 Wave Coins
			_new_y = random_range(100 + 160, 896);
			
			for (var _i = 0; _i < 9; _i++)
			{
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			spawn_cooldown = 1.5;
		break;
		
		case 5: // Chest
			_new_x = room_width + 206;
			_new_y = 896;
			
			instance_create_layer(_new_x, _new_y, "Stage", obj_chest);
			
			spawn_cooldown = 1.0;
		break;
	}
}