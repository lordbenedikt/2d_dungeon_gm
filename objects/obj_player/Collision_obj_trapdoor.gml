if(global.keyFound) {
	draw_tooltip(spr_pressE, other.x+16, other.y-10);
	if(key_binding.interact()) {
		nextLevel();
		audio_play_sound(snd_trapdoor,0,0, 2 * global.masterVolume)
	}
}