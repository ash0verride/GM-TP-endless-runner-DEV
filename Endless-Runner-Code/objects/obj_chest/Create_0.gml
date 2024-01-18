// Creates new shadow object instance
var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);

// Sets the shadow instance to chest parameters and targets self as owner of it
_shadow.sprite_index = spr_chest_shadow;
_shadow.owner = self;
_shadow.set_y_offset(40);