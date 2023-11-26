xAxis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
yAxis = keyboard_check(ord("S")) - keyboard_check(ord("W"));

dir = point_direction(0,0,xAxis,yAxis);
len = sqrt(power(xAxis,2) + power(yAxis,2));

if xAxis != 0 || yAxis != 0 {
	if !is_walking {
		audio_play_sound(snd_footsteps_hall,0,1, 0.6 * global.masterVolume)
		is_walking = true
	}
} else {
	if is_walking {
		audio_stop_sound(snd_footsteps_hall)
		is_walking = false
	}
}

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
			audio_play_sound(snd_pick_up_arrow_2,0,0, global.masterVolume);
			instance_destroy(self);
			global.arrows++;
		}
	}
}

// Make helmet follow player
if (variable_instance_exists(id, "helmet")) {
	helmet.x = x
	helmet.y = y + 1
}