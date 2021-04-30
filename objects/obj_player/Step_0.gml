moveSpeed = 1.5

xAxis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
yAxis = keyboard_check(ord("S")) - keyboard_check(ord("W"));

dir = point_direction(0,0,xAxis,yAxis);
len = sqrt(power(xAxis,2) + power(yAxis,2));

if(len != 0) {
	if(!place_meeting(x+lengthdir_x(moveSpeed, dir), y, obj_wall)) {
		x += lengthdir_x(moveSpeed, dir);
	}
	if(!place_meeting(x,y+lengthdir_y(moveSpeed, dir), obj_wall)) {
		y += lengthdir_y(moveSpeed, dir);
	}
}

with(obj_arrow) {
	if(travelTime <= 0) {
		if(point_distance(other.x, other.y, x+lengthdir_x(8,image_angle), y+lengthdir_y(8,image_angle)) < 12) {
			instance_destroy();
			global.arrows++;
		}
	}
}