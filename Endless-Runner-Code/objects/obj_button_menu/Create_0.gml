event_inherited();
has_panel = true;

target_function = function()
{
	if window_get_fullscreen()
    {
        window_set_fullscreen(false);
    }
    else
    {
        window_set_fullscreen(true);
    }
}