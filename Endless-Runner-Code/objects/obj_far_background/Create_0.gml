sprites[0] = spr_farground_1;
sprites[1] = spr_farground_2;
sprites[2] = spr_farground_3;

sprite_prefetch_multi(sprites);

before_sprite = sprites[0];
sprite_index = sprites[1];
after_sprite = sprites[2];

x = random_range(0, sprite_width);
y = 0;

background_move_rate = 0.4;