if(alarm[0]==-1) {
	flashColor(other, c_red)
	audio_play_random([snd_player_hit_0, snd_player_hit_1, snd_player_hit_2], 0,0)
	other.hp -= variable_instance_exists(other, "helmet") ? 10 : 20
	alarm[0] = 20
}