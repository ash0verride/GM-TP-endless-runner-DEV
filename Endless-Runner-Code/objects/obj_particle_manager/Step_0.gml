if (owner == noone)
{
	if (move_rate != move_rate_target)
	{
		move_rate = lerp(move_rate, move_rate_target, drag_rate);
	}
	
	if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
	{
		x -= obj_game_manager.current_speed * move_rate;
	}
}
else
{
	x = owner.x + x_offset;
	y = owner.y + y_offset;
}

part_system_position(particle_sys, x, y);

// Checks if the game state is paused
if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	// Stops updating the particle systems
	part_system_automatic_update(particle_sys, false)
}
else
{
	// Resumes updating the particle systems
	part_system_automatic_update(particle_sys, true)
}

// Checks if the particle system has finished
if (part_particles_count(particle_sys) == 0)
{
	// Destroys the object
	instance_destroy();
}