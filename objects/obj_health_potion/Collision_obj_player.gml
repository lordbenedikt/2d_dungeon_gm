/// @description 

if (global.hp<100) {
	global.hp = min(global.hp+40, 100);
	audio_play_sound(snd_potion_drink,0,false);
	instance_destroy();
}