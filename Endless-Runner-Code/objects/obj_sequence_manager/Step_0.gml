if (owner != noone)
{
	x = owner.x;
	y = owner.y;
}

if (set_sequence != -1)
{
	if (layer_sequence_is_finished(set_sequence))
	{
		layer_sequence_destroy(set_sequence);
		
		if (has_death)
		{
			stored_function();	
		}
		
		instance_destroy();
	}
}

if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	layer_sequence_pause(set_sequence);
}
else
{
	if (layer_sequence_is_paused(set_sequence))
	{
	    layer_sequence_play(set_sequence);
	}
}