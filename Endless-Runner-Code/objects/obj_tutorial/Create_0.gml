tip_type = 0;
tip_message = "Welcome to Chicken Run!\nPress any key to Continue";
is_gamepad = false;

action_timer = 0;
can_jump = false;

var _gamepad_count = gamepad_get_device_count();
for (var _i = 0; _i < _gamepad_count; _i++;)
{
    if gamepad_is_connected(_i)
    {
        is_gamepad = true;
		
		tip_message = "Welcome to Chicken Run!\nPress A or Cross button to Continue";
    }
}

if (global.is_touch)
{
	tip_type = 5;	
}