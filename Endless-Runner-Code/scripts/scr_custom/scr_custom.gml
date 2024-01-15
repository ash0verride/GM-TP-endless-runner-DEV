// Smoothstep interpolation function
function smoothstep(_start, _end, _value)
{
	return lerp(_start, _end, _value * _value * (3 - 2 * _value));
}

function parse_value(_value)
{
	var _read_value = string(floor(_value));
	
	if (_value < power(10, 3))
	{
		return _read_value + "";	
	}
	else if (_value < power(10, 6))
	{
		_read_value = string(_value / power(10, 3));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "K";	
	}
	else if (_value < power(10, 9))
	{
		_read_value = string(_value / power(10, 6));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "M";	
	}
	else if (_value < power(10, 12))
	{
		_read_value = string(_value / power(10, 9));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "B";	
	}
	else if (_value < power(10, 15))
	{
		_read_value = string(_value / power(10, 12));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "T";	
	}
	else if (_value < power(10, 18))
	{
		_read_value = string(_value / power(10, 15));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Qa";	
	}
	else if (_value < power(10, 21))
	{
		_read_value = string(_value / power(10, 18));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Qi";	
	}
	else if (_value < power(10, 24))
	{
		_read_value = string(_value / power(10, 21));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Sx";	
	}
	else if (_value < power(10, 27))
	{
		_read_value = string(_value / power(10, 24));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Sp";	
	}
	else if (_value < power(10, 30))
	{
		_read_value = string(_value / power(10, 27));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Oc";	
	}
	else if (_value < power(10, 33))
	{
		_read_value = string(_value / power(10, 30));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "No";	
	}
	else if (_value < power(10, 36))
	{
		_read_value = string(_value / power(10, 33));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Dc";	
	}
}

// Function that returns the current gamestate as a string
function get_gamestate()
{
	switch(obj_game_manager.current_game_state)
	{
		case GAME_STATE.DYING:
			return "Dying";
		case GAME_STATE.ENDED:
			return "Ended";
		case GAME_STATE.PAUSED:
			return "Paused";
		case GAME_STATE.PLAYING:
			return "Playing";
		case GAME_STATE.TUTORIAL:
			return "Tutorial";
	}
	
	return "Unset";
}

// Function that returns the current wallstate as a string
function get_interiorstate()
{
	switch(obj_interior_background.current_interior_state)
	{
		case INTERIOR_STATE.ENTER:
			return "Enter";
		case INTERIOR_STATE.EXIT:
			return "Exit";
		case INTERIOR_STATE.INSIDE:
			return "Inside";
		case INTERIOR_STATE.OUTSIDE:
			return "Outside";
	}
	
	return "Unset";
}