
global.ds_flash = ds_map_create()
global.ds_depthsort = ds_grid_create(2,1)

function fallToFloor() {
	if(travelTime > 0) {
		travelTime = 0;
		fallTime = 20;
		turnDirection = (random(1) < 0.5 ? -1 : 1) * random(4);
		speed = 3;
		if(other.object_index==obj_wall) {
			direction = point_direction(other.x+16,other.y+16,x,y);
		} else {
			direction = direction+180;
		}
	}
}
function hitEnemy(enemy){
	return collision_rectangle(
		enemy.x - enemy.sprite_xoffset, enemy.y - enemy.sprite_height,
		enemy.x + enemy.sprite_xoffset, enemy.y + enemy.sprite_height - enemy.sprite_yoffset,
		other, true, false)
}
function flash(obj) {
	global.ds_flash[? obj] = 1
	obj.flashColor = c_white
}
function flashColor(obj, color) {
	global.ds_flash[? obj] = 1
	obj.flashColor = color
}
function depthsort(parentObj) {
	var dgrid = global.ds_depthsort
	var inst_num = instance_number(par_depthsort)
	ds_grid_resize(dgrid, 2, inst_num)
	
	var i = 0; with(parentObj) {
		dgrid[# 0, i] = id
		dgrid[# 1, i] = y
		i++
	}
	
	ds_grid_sort(dgrid, 1, true)
}
function drawSorted(parentObj) {
	//sort instances by y-coordinate
	depthsort(parentObj)
	var dgrid = global.ds_depthsort
	var inst

	var i = 0; repeat(ds_grid_height(dgrid)) {
		//pull out id
		inst = dgrid[# 0, i]
		//draw each instance
		with(inst) {
			draw_self()
			drawFlashEffect()
		}
		i++
	}
}
function drawFlashEffect() {
	//draw flash effect when hit
	if(global.ds_flash[? self] != undefined) {
		gpu_set_fog(true, id.flashColor, 0, 1)
		if(global.ds_flash[? self] > 0) {
			draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_white, global.ds_flash[? self])
			global.ds_flash[? self] -= 0.1;
		}
		gpu_set_fog(false, c_white, 0, 0)
	}
}