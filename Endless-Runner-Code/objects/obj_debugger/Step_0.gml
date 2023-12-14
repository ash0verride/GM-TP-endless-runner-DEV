if (keyboard_check_direct(vk_shift) && keyboard_check_pressed(ord("1")))
{
    global.show_debug_menu = !global.show_debug_menu;
    show_debug_overlay(global.show_debug_menu);
}

if (keyboard_check_direct(vk_shift) && keyboard_check_pressed(vk_tab))
{
	global.show_debug_log = !global.show_debug_log;
	show_debug_log(global.show_debug_log);
}