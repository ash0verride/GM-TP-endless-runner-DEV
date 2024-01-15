var _gamepad_press = false;
			
if (gamepad_is_connected(0))
{
	if (gamepad_button_check_pressed(0, gp_face1))
	{
		_gamepad_press = true;	
	}
	if (gamepad_button_check_pressed(0, gp_start))
	{
		_gamepad_press = true;	
	}
}

if ((keyboard_check_pressed(vk_escape)|| _gamepad_press) && !was_paused)
{
	is_hovered = false;
	is_pushed = false;
	
	target_scale = 1.0;
	target_function();
	
	was_paused = true;
}
else
{
	was_paused = false;	
}

// Inherit the parent event
event_inherited();

