// Checks if the shield still has life
if (other.life > 0)
{
	// Adds life to the shield so it lasts longer
	other.life += 10.0;
	
	// Creates and sets up powerup particles to follow player
	var _new_aura_particle = instance_create_layer(obj_player.x, obj_player.y, "Stage", obj_particle_manager);
	_new_aura_particle.owner = obj_player;
	_new_aura_particle.set_particle(ps_powerup_in, "StageFrontEffects");

	// Destroys the pickup
	instance_destroy();	
}