if (owner != noone)
{
	if (owner.bbox_left > room_width + buffer)
	{
		target_alpha = 1;
	}
	else if (owner.bbox_left > room_width)
	{
		target_alpha = clamp(buffer / (room_width - owner.bbox_left), 0, 1);
	}
	else
	{
		target_alpha = 0;
	}

	if (target_alpha > image_alpha)
	{
		image_alpha = lerp(image_alpha, target_alpha, fade_in_rate);
	}
	else
	{
		image_alpha = lerp(image_alpha, target_alpha, fade_out_rate);
	}
	
	if (target_alpha == 0 && image_alpha == 0)
	{
		instance_destroy();	
	}
}
else
{
	instance_destroy();	
}