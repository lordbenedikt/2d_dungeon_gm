ds_list_destroy(ds_path);
if(instance_number(obj_enemy_parent)==1 
&& object_index!=obj_spider 
&& !global.gameOver) {
	audio_play_sound(snd_drop_key_hall,0,0,getGain(self,obj_player,200))
	instance_create_layer(x,y,layer_get_id("Stuff"),obj_key);
} else {
	if (irandom(14)==0) {
		audio_play_sound(snd_potion_drop,0,false,getGain(self,obj_player,200) * 0.4);
		instance_create_layer(x,y,layer_get_id("Stuff"),obj_health_potion)
	}
}
