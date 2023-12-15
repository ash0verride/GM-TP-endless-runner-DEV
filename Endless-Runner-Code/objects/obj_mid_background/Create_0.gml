sprite_1 = spr_midground_1;
sprite_2 = spr_midground_2;
sprite_3 = spr_midground_3;
sprite_4 = spr_midground_4;

before_sprite = choose(sprite_1, sprite_2, sprite_3, sprite_4);
sprite_index = choose(sprite_1, sprite_2, sprite_3, sprite_4);
after_sprite = choose(sprite_1, sprite_2, sprite_3, sprite_4);

x = random_range(0, sprite_width);
y = 0;

background_move_rate = 0.8;