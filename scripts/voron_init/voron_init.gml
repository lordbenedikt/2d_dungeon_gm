///voron_init()
function voron_init() {
	//Set up the Voronoi Split-Screen System.
	gml_pragma("global","voron_init()") //Set up these global variables before the first room (since we only have one room in this demo)
										//Feel free to call this manually and remove this pragma if you want more control.

	//Number of players
#macro voron_DEBUG_INFORMATION false
#macro voron_OBJECTS_MAX 4
	global.voron_number_of_players = 1

#macro VIEW_W camera_get_view_width(view_camera[0])
#macro VIEW_H camera_get_view_height(view_camera[0])

//#macro VIEW_W 1280
//#macro VIEW_H 708

	//Lerping factor when smoothly moving positions
	global.voron_lerp_world  = 0.1
	global.voron_lerp_view   = 0.05

	//Distance where views are merged together
	global.voron_combination_distance = 200

	//Positions for all players
	for(var c = 0; c < voron_OBJECTS_MAX; c++){
		global.voron_worldpos_x[c]		= 0		//GM position in the room
		global.voron_worldpos_y[c]		= 0
		global.voron_rawscreenpos_x[c]	= 0.5	//Screen position as-is
		global.voron_rawscreenpos_y[c]	= 0.5
		global.voron_screenpos_x[c]		= 0.5	//Normalized and balanced screen position
		global.voron_screenpos_y[c]		= 0.5
		global.voron_tlc_x[c]			= 0		//Top Left Corner (view position)
		global.voron_tlc_y[c]			= 0
	}


}
