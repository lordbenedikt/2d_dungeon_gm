ds_list_destroy(ds_path);
if(instance_number(obj_enemy)==1 && global.hp > 0) {
	audio_play_sound(snd_drop_key_hall,0,0,getGain(self,obj_player,200))
	instance_create_layer(x,y,layer_get_id("Stuff"),obj_key);
}