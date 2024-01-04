if(is_hovered && is_pushed)
{
	is_hovered = false;
	is_pushed = false;
	
	target_scale = 1.0;
	target_function();
}