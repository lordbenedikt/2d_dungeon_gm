seesPlayer = false;

with(obj_player) {
	if (point_distance(x,y,other.x,other.y) < 500
	&& !collision_line(x,y,other.x,other.y, obj_wall, false, false)) {
		other.seesPlayer = true;
	}
	if (other.seesPlayer && point_distance(x,y,other.x,other.y) > 5) {
		var dir = point_direction(other.x,other.y,x,y);
		other.x += lengthdir_x(other.walkSpeed * (other.aggro ? 2 : 1),dir);
		other.y += lengthdir_y(other.walkSpeed * (other.aggro ? 2 : 1),dir);
	} else {
		other.seesPlayer = point_distance(x,y,other.x,other.y) > 5 && (!collision_line(x-16,y+3,other.x-16,other.y+3, obj_wall, false, false)
			|| !collision_line(x+16,y+3,other.x+16,other.y+3, obj_wall, false, false)
			|| !collision_line(x-13,y-sprite_height+3,other.x-13,other.y-sprite_height+3, obj_wall, false, false)
			|| !collision_line(x+13,y-sprite_height+3,other.x+13,other.y-sprite_height+3, obj_wall, false, false));
		if (other.seesPlayer || other.aggro) {
			if(other.alarm[1]==-1) {
				findPath(other, self, other.ds_path);
				other.alarm[1]=60;
			}
			if(!ds_list_empty(other.ds_path)) {
				var goto = ds_list_find_value(other.ds_path, ds_list_size(other.ds_path)-1);
				var xx = getXPos(goto)*32 + 16;
				var yy = getYPos(goto)*32 + 16;
				var dir = point_direction(other.x,other.y,xx,yy);
				other.x += lengthdir_x(other.walkSpeed * (other.aggro ? 2 : 1),dir);
				other.y += lengthdir_y(other.walkSpeed * (other.aggro ? 2 : 1),dir);
				if(point_distance(other.x, other.y, xx, yy) < 10) {
					ds_list_delete(other.ds_path, ds_list_size(other.ds_path)-1);
				}
			}
		} else {
			with(other) {
				wander();
			}
		}
	}
}

_inst = instance_place(x,y,obj_wall)
while (_inst != noone) {
//	yy = y - _inst.y
//	xx = x - _inst.x
//	y_abs = abs(yy)
//	x_abs = abs(xx)
//	if y_abs < x_abs {
//		y += sign(yy)
//	} else {
//		x += sign(xx)
//	}
	_dir = point_direction(_inst.x + _inst.sprite_width / 2, _inst.y + _inst.sprite_height/ 2, x, y)	
	x += lengthdir_x(1, _dir)
	y += lengthdir_y(1, _dir)
	_inst = instance_place(x,y,obj_wall)
}

if(hp <= 0) {
	instance_destroy();
}