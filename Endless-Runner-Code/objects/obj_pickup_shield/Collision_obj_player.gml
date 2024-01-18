// Creates a shield object that surrounds the player
var _shield = instance_create_layer(x, y, "StageFront", obj_shield);
// Gives the shield life
_shield.life = 5.0;

// Destroys the pickup
instance_destroy();