function Vec2(_x, _y) constructor {
	x = _x;
	y = _y;

	add = function(_other) {
		return new Vec2(x + _other.x, y + _other.y);
	};
	
	sub = function(_other) {
		return new Vec2(x - _other.x, y - _other.y);
	};

	mult = function(_scalar) {
		return new Vec2(x * _scalar, y * _scalar);
	};
	
	divide = function(_divisor) {
		return new Vec2(x / _divisor, y / _divisor);
	};
	
	mag = function() {
		return sqrt(power(x,2) + power(y,2));
	};
}

function get_center(_obj_arr) {
	var _x = 0;
	var _y = 0;
	var _count = 0;
	for (var _i = 0; _i< array_length(_obj_arr); _i++) {
		_x += _obj_arr[_i].x;
		_y += _obj_arr[_i].y;
		_count += 1;
	}
	return new Vec2(_x, _y).divide(_count);
}

function move_to_center(_obj, _others_arr) {
	var _target_pos = get_center(_others_arr);
	_obj.x = _target_pos.x;
	_obj.y = _target_pos.y;
}
