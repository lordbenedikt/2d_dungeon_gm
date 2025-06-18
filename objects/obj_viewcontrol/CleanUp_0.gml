//Destroy all the random assets we used
for(var c = 0; c < global.voron_number_of_players; c++){
	if(surface_exists(view_surface_id[c])){
		surface_free(view_surface_id[c])
	}
	var cam = view_get_camera(c);
	view_camera[c] = -1
	camera_destroy(cam)
}

//Okay, you can have the app surface back now
application_surface_draw_enable(true)