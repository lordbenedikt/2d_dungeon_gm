// When dead tint screen black
if global.blackScreen {
	draw_rectangle_color(0,0,view_wport[0], view_hport[0],0,0,0,1,0)
}

var _x_offset = 10;
var _y_offset = 5;
var _line_height = 15;
with (obj_player) {
	var _line = player_number - 1;
	var _line_y = _y_offset + _line_height * _line;
	draw_set_color(color);
	draw_rectangle(_x_offset, _line_y + 5,_x_offset + 10,_line_y + 15, false);
	draw_set_color(c_white);
	draw_text(_x_offset + 20, _line_y, "HP: " + string(hp));
	draw_text(_x_offset + 100, _line_y, "Arrows: " + string(arrows));
}

var _bottom = display_get_gui_height();
var _line_y = _bottom - 10 - _line_height;
draw_text(_x_offset, _line_y, "Level: " + string(global.currentLevel));
draw_text(_x_offset + 90, _line_y, string(global.keyFound ? "You found the key!" : "You will need a key."));
