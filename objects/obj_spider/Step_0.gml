/// @description Animate

event_inherited();

var _dir;
if (seesPlayer) {
	_dir = point_direction(x,y,obj_player.x,obj_player.y);
} else {
	_dir = point_direction(0,0,wanderXSpeed,wanderYSpeed);
}
_dir = floor(((_dir+315) % 360) / 90);
set_direction(_dir);

animate();
