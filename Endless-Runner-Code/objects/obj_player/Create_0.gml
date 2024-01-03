x = 640;
y = 840;

ystart = y;

jump_strength = 100;
jump_threshold = 10;
gravity_strength = 0.9;
y_velo = 0.0;

is_boosting = false;
boost_cooldown = 0;

var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);
_shadow.owner = self;
_shadow.set_y_offset(100);

kill_player = function()
{
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		if (instance_exists(obj_shield))
		{
			obj_shield.life = 0;
		}
		else if (!is_boosting)
		{
			obj_game_manager.current_game_state = GAME_STATE.DYING;
		
			var _player = self;
			with (obj_shadow)
			{
				if (owner == _player)
				{
					fade_out(1.83);	
				}
			}
		}
	}
}