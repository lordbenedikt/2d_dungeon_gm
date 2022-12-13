if(global.keyFound) {
	draw_tooltip(spr_pressE, other.x+16, other.y-10);
	if(keyboard_check_pressed(ord("E"))) {
		nextLevel();
		audio_play_sound(snd_trapdoor,0,0)
	}
}