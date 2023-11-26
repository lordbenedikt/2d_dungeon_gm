/// @description 

if (hp<=0) {
	audio_play_sound(snd_wood_break,0,false,getGain(id,obj_player,200) * 0.25 * global.masterVolume);
	if (irandom(5)==5) {
		var _inst = instance_create_layer(x,y,layer_get_id("Stuff"),obj_arrow);
		_inst.direction = irandom(360);
		_inst.image_angle = irandom(360);
		_inst.speed = 1;
		_inst.travelTime = 1;
		with(_inst) {
			fallToFloor();
		}
	}
	instance_destroy();
}
