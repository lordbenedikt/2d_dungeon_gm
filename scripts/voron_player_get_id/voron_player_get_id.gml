///voron_player_get_id(playerid)
function voron_player_get_id(argument0) {
	with(parent_player){
		if(player_id == argument0){
			return id
		}
	}
	return noone


}
