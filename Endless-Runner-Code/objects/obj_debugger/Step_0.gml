if (keyboard_check_direct(vk_shift) && keyboard_check_pressed(vk_tab))
{
	global.active_debug_menu = !global.active_debug_menu;
	show_debug_log(global.active_debug_menu);
}

if (global.active_debug_menu)
{
	game_state = get_gamestate();
}