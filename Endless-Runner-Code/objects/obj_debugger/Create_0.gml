if (!variable_global_exists("active_debug_menu"))
{
	global.active_debug_menu = false;
}
else
{
	dbg_view_delete(global.debug_window);
}

global.debug_window = dbg_view("Game Info", global.active_debug_menu);

dbg_section("Game Manager");
game_state = "";
dbg_watch(ref_create(self, "game_state"), "Game State");
dbg_watch(ref_create(obj_game_manager, "current_distance"), "Distance Travelled");

dbg_section("Interior Mode");
interior_state = "";
dbg_watch(ref_create(self, "interior_state"), "Interior State");
button_interior = function()
{
	obj_interior_background.interior_state_switch();	
}
dbg_button("Change Interior", ref_create(self, "button_interior"), 240, 30);

dbg_section("Player Variables");
dbg_watch(ref_create(obj_game_manager, "current_speed"), "Speed");
dbg_watch(ref_create(obj_game_manager, "current_speed_percentage"), "Speed Percent");
dbg_slider(ref_create(obj_game_manager, "target_speed_percentage"), 0.0, 1.0, "Speed Target");
dbg_text_input(ref_create(obj_game_manager, "new_max_speed"), "Max Speed");

show_debug_overlay(global.active_debug_menu);