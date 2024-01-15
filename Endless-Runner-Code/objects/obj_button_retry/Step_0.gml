var _gamepad_press = false;
			
if (gamepad_is_connected(0))
{
	if (gamepad_button_check_pressed(0, gp_face2))
	{
		_gamepad_press = true;	
	}
}

if (keyboard_check_pressed(vk_return)|| _gamepad_press)
{
	is_hovered = false;
	is_pushed = false;
	
	target_scale = 1.0;
	target_function();
}

// Inherit the parent event
event_inherited();

