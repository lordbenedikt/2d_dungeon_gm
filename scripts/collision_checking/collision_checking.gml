// solve collision overlaps

function is_in_sight(_other) {
	return (point_distance(x,y,_other.x,_other.y) < 500
		&& !collision_line(x,y,_other.x,_other.y, obj_wall, false, false));
}

function solve_overlap_circle(_other) {
	with (_other) {
		if (flying != other.flying) {
			continue;
		}
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

function solve_overlap_rectangle(_other) {
	
}