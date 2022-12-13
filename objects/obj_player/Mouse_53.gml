flash = 1;

if(global.arrows != 0) {
	audio_play_sound(snd_arrow_shoot,0,0)
	global.arrows--
	arrow = instance_create_layer(x, y-10, layer_get_id("Arrows"), obj_arrow);
	var dir = point_direction(x, y-10, mouse_x, mouse_y)
	arrow.direction = dir;
	arrow.image_angle = dir;
	arrow.speed = 8;
	arrow.travelTime = 30;
}