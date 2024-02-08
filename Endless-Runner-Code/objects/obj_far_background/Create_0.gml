// Creates an array and stores background sprites to it
sprites[0] = spr_farground_1;
sprites[1] = spr_farground_2;
sprites[2] = spr_farground_3;

// Fetches the sprite array to load them into the system resources
sprite_prefetch_multi(sprites);

// Sets sprite variables to the sprites from the array
before_sprite = sprites[0];
sprite_index = sprites[1];
after_sprite = sprites[2];

// Sets coordinates to a random x value less than the sprite width moving it along
x = random_range(0, sprite_width);
y = 0;

// Sets the move rate for parallaxing effect
background_move_rate = 0.4;