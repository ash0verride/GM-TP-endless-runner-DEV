//// Spawn Manager Object.
// This object is used to control spawning objects when needed.

// Cooldown variables
spawn_cooldown = 0;
powerup_cooldown = 1000000000000000000000000000000000000000000;
enemy_cooldown = 100000000000000000000000000000000000000000000;

// Spawns random enemy
spawn_enemy = function()
{
	var _spawn_x = room_width * 2;
	var _type = irandom(1);
	
	switch (_type)
	{
		case 0: // Beam
			instance_create_layer(_spawn_x + 59, random_range(192, 736), "Stage", obj_beam);
			spawn_cooldown = 0.8;
		break;
			
		case 1: // Normal enemy
			instance_create_layer(_spawn_x + 204, 800, "Stage", obj_enemy);
			spawn_cooldown = 0.2;
	}

	enemy_cooldown = random_range(4, 10);
}

// Spawns random powerup
spawn_powerup = function()
{
	var _spawn_x = room_width * 2;
	
	instance_create_layer(_spawn_x + 92, random_range(100, 896), "Stage", choose(obj_pickup_boost, obj_pickup_shield));
	
	spawn_cooldown = 0.8;
	
	powerup_cooldown = 3;
}

spawn_reward = function(_reward_type)
{
	var _spawn_x = room_width * 1.1;
	var _new_x = _spawn_x + 34;
	var _new_y = random_range(100, 896);
	
	switch(_reward_type)
	{
		case 0: // Single Coin
		
			_new_y = 896;
			
			instance_create_layer(_new_x, _new_y, "Stage", obj_pickup_coin);
			spawn_cooldown = 2;
			
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
			
			spawn_cooldown = 10;
			
		break;
		
		case 2: // 9x2 Set Coins
		
			_new_y = random_range(100, 896 - 80);
			_new_y = 100;
			_new_y = 340;
			_new_y = 580;
			_new_y = 820;
			
			_new_y = choose(100, 340, 580, 820)
			
			for (var _i = 0; _i < 9; _i++)
			{
				for (var _j = 0; _j < 2; _j++)
				{
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			spawn_cooldown = 15;
			
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
			
			spawn_cooldown = 85;
			
		break;
		
		case 4: // 9x1 Wave Coins
		
			_new_y = random_range(100 + 160, 896);
			
			for (var _i = 0; _i < 9; _i++)
			{
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			spawn_cooldown = 15;
			
		break;
		
		case 5: // Chest
		
			_new_x = _spawn_x + 206;
			_new_y = 896;
			
			instance_create_layer(_new_x, _new_y, "Stage", obj_chest);
			
			spawn_cooldown = 10;
		break;
		
	}
}