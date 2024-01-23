if (current_player_state == PLAYER_STATE.DEATH)
{
	image_alpha = 0;
}
else if (current_player_state == PLAYER_STATE.IDLE)
{
	current_player_state = PLAYER_STATE.FLY_SMALL;
	sprite_index = spr_character_idle;
}