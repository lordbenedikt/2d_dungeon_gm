global.Drawable = function(_sprite, _x, _y) constructor {
	sprite = _sprite;
	x = _x;
	y = _y;
}

global.ds_flash = ds_map_create()
global.ds_depthsort = ds_grid_create(2,1)
global.ds_tooltip = ds_queue_create();
global.blackScreen = false
global.speedMultiplier = 1.0;

function draw_tooltip(sprite, x, y) {
	ds_queue_enqueue(global.ds_tooltip, new global.Drawable(sprite, x, y));
}

function wander() {
	if(!place_meeting(x+wanderXSpeed, y, obj_wall)) x += wanderXSpeed;
	if(!place_meeting(x, y+wanderYSpeed, obj_wall)) y += wanderYSpeed;
	wanderXSpeed = clamp(wanderXSpeed + random(0.1) - 0.05, -0.3, 0.3) * global.speedMultiplier;
	wanderYSpeed = clamp(wanderYSpeed + random(0.1) - 0.05, -0.3, 0.3) * global.speedMultiplier;
}

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
	flashColor(obj, c_white)
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
	var _objs_with_shadow = [obj_player, obj_enemy, obj_enemy_ram, obj_spider, 
		obj_spider_small, obj_barrel, obj_health_potion];

	var i = 0; repeat(ds_grid_height(dgrid)) {
		//pull out id
		inst = dgrid[# 0, i]
		//draw each instance
		with(inst) {
			if (array_contains(_objs_with_shadow, object_index)) {
				var _shadow_scale = 2.5 * radius / sprite_get_width(spr_shadow);
				draw_sprite_ext(spr_shadow,0,x,y,_shadow_scale,_shadow_scale,0,c_white,1);
			}
			draw_self();
			drawFlashEffect();
			if (variable_instance_exists(id, "drawables")) {
				for (j=0; j<ds_list_size(drawables); j++) {
					drawable = ds_list_find_value(drawables, j)
					draw_sprite_ext(drawable.sprite, 0, x + drawable.x, y + drawable.y, 1, 1, 0, c_white, 1)
				}
			}
		}
		i++
	}
}
function drawFlashEffect() {
	//draw flash effect when hit
	if(global.ds_flash[? self] != undefined) {
		gpu_set_fog(true, id.flashColor, 0, 1)
		if(global.ds_flash[? self] > 0) {
			show_debug_message("< flash: {0} >", image_index);
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, global.ds_flash[? self])
			global.ds_flash[? self] -= 0.1;
		}
		gpu_set_fog(false, c_white, 0, 0)
	}
}
function getGain(source, listener, max_distance) {
	_dist = point_distance(source.x,source.y, listener.x, listener.y)
	return clamp((max_distance - _dist) / max_distance,0,1) * global.masterVolume;
}
function audio_play_random(soundids, priority, loops, gain = 1) {
	_index = irandom_range(0,array_length(soundids) - 1);
	audio_play_sound(soundids[_index], priority, loops, gain)
}