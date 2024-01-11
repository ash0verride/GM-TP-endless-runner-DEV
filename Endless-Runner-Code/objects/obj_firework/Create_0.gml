life = 0;
delay = 0.25;
speed = 1;
tilt = random_range(-10, 10);
direction = 90 + tilt;

trail_ps = ps_firework_trail;
head_ps = ps_firework;

create_ps = function(_type)
{
	var _new_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_new_particle.set_particle(_type, "StageFrontEffects");
	_new_particle.set_angle(tilt);
}