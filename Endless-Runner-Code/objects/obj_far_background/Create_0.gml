sprite_1 = spr_farground_1;
sprite_2 = spr_farground_2;
sprite_3 = spr_farground_3;

before_sprite = choose(sprite_1, sprite_2, sprite_3);
sprite_index = choose(sprite_1, sprite_2, sprite_3);
after_sprite = choose(sprite_1, sprite_2, sprite_3);

x = random_range(0, sprite_width);
y = 0;

background_move_rate = 0.4;