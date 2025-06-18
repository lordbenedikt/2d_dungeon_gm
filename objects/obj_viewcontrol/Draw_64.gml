/*//Draw debug stuff
if(voron_DEBUG_INFORMATION){
	//Anchor positions for the views
	draw_set_color(c_blue)
	for(var c = 0; c < global.voron_number_of_players; c++){
		draw_circle(VIEW_W*global.voron_screenpos_x[c],VIEW_H*global.voron_screenpos_y[c],12,true)
		draw_text(VIEW_W*global.voron_screenpos_x[c]-4,VIEW_H*global.voron_screenpos_y[c]-8,string(c+1))
	}
}


//Instructions
draw_set_font(font_placeholder)
draw_set_color(c_white)
draw_text(0,0,"Welcome to Yal's Voronoi Splitscreen System!\nUse arrow keys to move,\n1, 2, 3, 4 to switch player.\nPageUp/PageDown cycles number of players. (Currently: " + string(global.voron_number_of_players) + " players)")
if(voron_DEBUG_INFORMATION){
	//View sizes (percent of screen space)
	var st = ""
	for(c = 0; c < global.voron_number_of_players; c++){
		st += string(c+1) + ": " + string(global.voron_screenpos_x[c]) + " x " + string(global.voron_screenpos_y[c]) + "\n"
	}
	draw_text(0,80,st)
}

//Player positions map
var sz = 128;
draw_text(0,VIEW_H-sz-18,"Player positions")
draw_text(sz + 8,VIEW_H-sz*0.4,"Green = World space\nRed = Screen space")
draw_rectangle(0,VIEW_H-sz,sz,VIEW_H,true)
with(parent_player){
	draw_set_color(c_white)
	draw_line(lerp(0,sz,x/room_width),VIEW_H-sz+lerp(0,sz,y/room_height),lerp(0,sz,global.voron_screenpos_x[player_id]),VIEW_H-sz+lerp(0,sz,global.voron_screenpos_y[player_id]))
	draw_set_color(c_green)
	draw_circle(lerp(0,sz,x/room_width),VIEW_H-sz+lerp(0,sz,y/room_height),3,true)
	draw_set_color(c_red)
	draw_circle(lerp(0,sz,global.voron_screenpos_x[player_id]),VIEW_H-sz+lerp(0,sz,global.voron_screenpos_y[player_id]),3,true)
}

//Debug surfaces
var fac = 0.1;
var ssz = VIEW_W*fac;
draw_set_color(c_white)
draw_text(VIEW_W - 200,VIEW_H - VIEW_H*fac-20,"Individual Views")
for(c = 0; c < global.voron_number_of_players; c++){
	var s = view_surface_id[c];
	if(surface_exists(s)){
		draw_surface_ext(s,VIEW_W + (c-global.voron_number_of_players)*ssz,VIEW_H - VIEW_H*fac,fac,fac,0,c_white,1)
	}
}*/