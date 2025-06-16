/// @description 

if (other.hp<100) {
	other.hp = min(other.hp+40, 100);
	audio_play_sound(snd_potion_drink,0,false, 0.5 * global.masterVolume);
	instance_destroy();
}