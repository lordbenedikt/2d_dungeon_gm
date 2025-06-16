move_to_center(camera_target, objects_of_type(obj_player));

for (var i = 0; i<20; i++) {
	var val = gamepad_button_check(4, i);
	if (val != 0) {
		show_debug_message("gp press(" + string(i) + "): " + string(gamepad_button_check(4, i)));
	}
}

for (var i = 0; i<20; i++) {
	for (var j =0; j<20; j++) {
		var val = gamepad_axis_value(i, j);
		if (val != 0) {
			show_debug_message("gp axis(" + string(i) + "," + string(j) + "): " + string(val));
		}
	}
}

global.blackScreen = false

check_game_over();
