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
	
	mag = function() {
		return sqrt(power(x,2) + power(y,2));
	}
}