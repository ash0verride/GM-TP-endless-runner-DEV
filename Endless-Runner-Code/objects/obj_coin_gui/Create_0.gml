image_adjust = random_range(-30, 30);
direction = 180 + image_adjust;

current_speed = obj_game_manager.current_speed;
speed = current_speed;

image_alpha = 1;

image_xscale = 1;
image_yscale = 1;

child_particle = noone;

obj_game_manager.current_gold++;
obj_game_manager.current_level_gold++;
