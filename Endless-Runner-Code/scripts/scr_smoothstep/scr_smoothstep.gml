// Smoothstep interpolation function
function smoothstep(_start, _end, _percent)
{
	return lerp(_start, _end, _percent * _percent * (3 - 2 * _percent));
}