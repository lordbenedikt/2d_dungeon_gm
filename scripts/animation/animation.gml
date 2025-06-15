global.animation_frames = ds_map_create();

global.animation_frames[? obj_spider] = ds_map_create();
global.animation_frames[? obj_spider][? ACTOR_STATE.IDLE] = [0,1];
global.animation_frames[? obj_spider][? ACTOR_STATE.ATTACK] = [0,4];
global.animation_frames[? obj_spider][? ACTOR_STATE.WALK] = [4,10];
global.animation_frames[? obj_spider][? ACTOR_STATE.DIE] = [0,4];
global.animation_frames[? obj_spider_small] = global.animation_frames[? obj_spider];

global.animation_frames[? obj_bat] = ds_map_create();
global.animation_frames[? obj_bat][? ACTOR_STATE.IDLE] = [1,4];
global.animation_frames[? obj_bat][? ACTOR_STATE.ATTACK] = [1,4];
global.animation_frames[? obj_bat][? ACTOR_STATE.WALK] = [1,4];
global.animation_frames[? obj_bat][? ACTOR_STATE.DIE] = [0,1];

enum ACTOR_STATE {
	IDLE,
	WALK,
	ATTACK,
	DIE,
}

function init_animation(_cols, _anim_speed) {
	image_speed = 0;
	dir = 0;
	anim_cols = _cols;
	anim_speed = _anim_speed;
	state = ACTOR_STATE.IDLE;
	anim_frame = 0;
}

function set_state(_state) {
	if (state != _state) {
		state = _state;
		anim_frame = global.animation_frames[? object_index][? state][0];
	}
}

function set_direction(_dir) {
	dir = _dir;
}

function animate() {
	var _start_end = global.animation_frames[? object_index][? state];
	var _anim_frame_count = _start_end[1] - _start_end[0];
	anim_frame = (anim_frame + anim_speed) % _anim_frame_count;
	var _col_start_frame = anim_cols * dir;
	image_index = _col_start_frame + _start_end[0] + floor(anim_frame);
}
