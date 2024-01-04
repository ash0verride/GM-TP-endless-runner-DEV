event_inherited();
has_panel = true;

if (!variable_global_exists("is_muted"))
{
    global.is_muted = false;
}

if (global.is_muted)
{
	audio_master_gain(0);
	image_index = 1;
}
else
{
	audio_master_gain(1);
	image_index = 0;
}

target_function = function()
{
	global.is_muted = !global.is_muted;
	
	if (global.is_muted)
	{
		audio_master_gain(0);
		image_index = 1;
	}
	else
	{
		audio_master_gain(1);
		image_index = 0;
	}
}