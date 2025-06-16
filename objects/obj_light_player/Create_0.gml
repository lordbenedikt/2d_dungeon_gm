/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben

event_inherited();

with (obj_player) {
	if (other.Follow_Player == player_number) {
		other.obj_to_follow_id = id;
	}
}