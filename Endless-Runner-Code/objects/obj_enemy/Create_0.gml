walking_speed = 3;

var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);
_shadow.sprite_index = spr_enemy_shadow;
_shadow.owner = self;
_shadow.set_y_offset(150);