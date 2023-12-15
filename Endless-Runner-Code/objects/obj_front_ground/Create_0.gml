sprite_1 = spr_foreground_floor_1;
sprite_2 = spr_foreground_floor_2;
sprite_3 = spr_foreground_floor_3;
sprite_4 = spr_foreground_floor_4;

before_sprite = choose(sprite_1, sprite_2, sprite_3, sprite_4);
sprite_index = choose(sprite_1, sprite_2, sprite_3, sprite_4);
after_sprite = choose(sprite_1, sprite_2, sprite_3, sprite_4);

x = random_range(0, sprite_width);
y = room_height;

move_rate = 1.0;