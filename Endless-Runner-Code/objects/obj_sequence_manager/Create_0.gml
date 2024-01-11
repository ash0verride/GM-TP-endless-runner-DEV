set_sequence = -1;

// Variable used for if follows owner
owner = noone;

has_death = false;
stored_function = function(){}

set_death = function(_new_function)
{
	has_death = true;
	stored_function = _new_function;
}

create_seq = function(_new_seq, _new_layer)
{
	set_sequence = layer_sequence_create(_new_layer, x, y, _new_seq);
}
