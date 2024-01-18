if (can_scale_at_rate)
{
	if (image_xscale < target_scale)
	{
		image_xscale = lerp(image_xscale, target_scale, scale_up_rate);
		image_yscale = lerp(image_yscale, target_scale, scale_up_rate);
	}
	else
	{
		image_xscale = lerp(image_xscale, target_scale, scale_down_rate);
		image_yscale = lerp(image_yscale, target_scale, scale_down_rate);
	}
}
else
{
	image_xscale = target_scale;
	image_yscale = target_scale;
}

if (position_meeting(mouse_x, mouse_y, self))
{
	is_hovered = true;

	if (!is_pushed)
	{
		target_scale = scale_highlighted;	
	}
}