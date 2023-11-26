/// @description

if(travelTime > 0) {
	audio_play_sound(snd_hit_wood,0,0,getGain(other, obj_player, 200) * 0.3)
	fallToFloor();
	other.hp -= 20;
	flash(other);
}

