if travelTime > 0 {
	audio_play_sound(snd_arrow_impact_stone_hall,0,0,getGain(self, obj_player, 200))
	fallToFloor();
}