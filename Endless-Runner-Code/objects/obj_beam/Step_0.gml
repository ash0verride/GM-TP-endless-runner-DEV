if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	x -= obj_game_manager.current_speed * 1.0;

	var _beam_top_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_beam_top_particle.owner = self;
	_beam_top_particle.set_particle(ps_enemy_laser, "StageFrontEffects");
	_beam_top_particle.set_angle(180);
	_beam_top_particle.set_offset(0, -128);

	var _beam_bottom_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_beam_bottom_particle.owner = self;
	_beam_bottom_particle.set_particle(ps_enemy_laser, "StageFrontEffects");
	_beam_bottom_particle.set_angle(0);
	_beam_bottom_particle.set_offset(0, +128);

	if (x < 0 - 59)
	{	
		instance_destroy();
	}
	
	image_speed = 1;
}
else
{
	image_speed = 0;	
}
