//Setup Voronoi splitscreen
global.voron_number_of_players = min(instance_number(parent_player),voron_OBJECTS_MAX)
for(var c = 0; c < global.voron_number_of_players; c++){
	//Set up views and surfaces
	view_visible[c]		= true;
	view_surface_id[c]	= surface_create(VIEW_W,VIEW_H)
	view_wport[c]		= VIEW_W
	view_hport[c]		= VIEW_H
	var cam = camera_create_view(0,0,VIEW_W,VIEW_H)
	view_set_camera(c,cam)
	
	//Move the view to the player right away (so it doesn't zoom across half the level if the players spawn far away)
	var obj = voron_player_get_id(c);
	with(obj){
		global.voron_worldpos_x[c]		= x
		global.voron_worldpos_y[c]		= y
	}
}

//Assume direct control of the application surface
application_surface_draw_enable(false)

//Grab the uniforms
u_voron_t1 = shader_get_sampler_index(	sh_voronoimerger,	"tex1"			)
u_voron_t2 = shader_get_sampler_index(	sh_voronoimerger,	"tex2"			)
u_voron_t3 = shader_get_sampler_index(	sh_voronoimerger,	"tex3"			)
u_voron_num= shader_get_uniform(		sh_voronoimerger,	"num_players"	)
u_voron_pos= shader_get_uniform(		sh_voronoimerger,	"screenpos"		)