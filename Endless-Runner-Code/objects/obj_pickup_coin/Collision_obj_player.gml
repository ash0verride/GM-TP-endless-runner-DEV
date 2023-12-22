if (sprite_index == spr_coin_idle)
{
	obj_game_manager.current_gold++;
	sprite_index = spr_coin_colleting;
}