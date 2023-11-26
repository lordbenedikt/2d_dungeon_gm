/// @description

event_inherited();

if (hp <= 0) {
	for (var _i = 0; _i<3; _i++) {
		var _inst = instance_create_layer(x,y,layer_get_id("Characters"),obj_spider_small);
		_inst.speed = random_range(1,2);
		_inst.direction = random(360);
	}
}
