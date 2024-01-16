if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	var _target_direction = point_direction(x, y, obj_gui.x - 5, obj_gui.y + 50)
	var _dir_difference = angle_difference(_target_direction, direction);
	direction += _dir_difference * 0.05;
	
	current_speed = lerp(current_speed, 10, 0.05);
	speed = current_speed;
	
	image_angle = direction - image_adjust + 180;
	
	image_alpha = lerp(image_alpha, 0, 0.05);
	image_xscale = lerp(image_xscale, 0, 0.025);
	image_yscale = lerp(image_yscale, 0, 0.025);
	
	if (image_alpha <= 0.1)
	{
		instance_destroy();	
	}
}
else
{
	speed = 0;
}