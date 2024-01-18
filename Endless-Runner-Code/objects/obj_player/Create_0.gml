x = 640;
y = 840;

ystart = y;

jump_strength = 100;
jump_threshold = 10;
gravity_strength = 0.9;
y_velo = 0.0;

is_boosting = false;
boost_cooldown = 0;

has_jumped = false;

var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);
_shadow.owner = self;
_shadow.set_y_offset(100);

kill_player = function()
{
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		if (instance_exists(obj_shield))
		{
			with (obj_shield)
			{
				life = 0;
				exit;
			}
		}
		else // RE ADD HERE IF PLAYER SHOULD BE SAFE WHEN BOOSTING
		{
			obj_game_manager.current_game_state = GAME_STATE.DYING;
			
			audio_sound_gain(global.music, 0.1, 3000);
			
			var _boom_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
			_boom_particle.owner = self;
			_boom_particle.set_particle(ps_defeat, "StageBackEffects");
		
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