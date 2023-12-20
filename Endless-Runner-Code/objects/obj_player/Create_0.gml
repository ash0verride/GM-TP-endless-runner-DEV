x = 640;
y = 840;

ystart = y;

jump_strength = 100;
jump_threshold = 10;
gravity_strength = 0.9;
y_velo = 0.0;

is_boosting = false;

var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);
_shadow.owner = self;
_shadow.set_y_offset(100);