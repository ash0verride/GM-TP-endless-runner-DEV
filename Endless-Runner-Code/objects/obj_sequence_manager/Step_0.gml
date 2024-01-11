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