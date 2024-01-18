// Checks if the shield still has life
if (other.life > 0)
{
	// Adds life to the shield so it lasts longer
	other.life += 5.0;

	// Destroys the pickup
	instance_destroy();	
}