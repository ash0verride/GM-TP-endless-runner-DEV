sprite[0] = spr_midground_1;
sprite[1] = spr_midground_2;
sprite[2] = spr_midground_3;
sprite[3] = spr_midground_4;

sprite_prefetch_multi(sprite);

before_sprite = sprite[0];
sprite_index = sprite[1];
after_sprite =sprite[2];

x = random_range(0, sprite_width);
y = 0;

background_move_rate = 0.8;