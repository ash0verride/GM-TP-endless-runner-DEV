// Sets the player to boosting
obj_player.is_boosting = true;
// Adds time to the player booter cooldown
obj_player.boost_cooldown += 5;

// Destroys this pickup instance
instance_destroy();