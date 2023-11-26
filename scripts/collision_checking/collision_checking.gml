// solve collision overlaps

function solve_overlap_circle() {
	with (obj_enemy_parent) {
		show_debug_message(radius);
		var _min_dist = other.radius + radius;
		var _lacking_dist = _min_dist - point_distance(x, y, other.x, other.y);
		if _lacking_dist > 0 {
			var _dir = point_direction(x,y,other.x,other.y);
			x -= lengthdir_x(_lacking_dist/2, _dir);
			y -= lengthdir_y(_lacking_dist/2, _dir);
			other.x += lengthdir_x(_lacking_dist/2, _dir);
			other.y += lengthdir_y(_lacking_dist/2, _dir);
		}
	}
}