key_binding = snes_gp_default(5);

color = #0054A6;

arrows = 3;

hp = 100;

target = instance_create_layer(x,y,layer_get_id("Cursor"),obj_cursor);

radius = sprite_width / 2;

moveSpeed = 1.5 * global.speedMultiplier;

aim_speed = 5 * global.speedMultiplier;

arrow_rel_y = -10;

is_walking = false

helmet = instance_create_layer(x+1,y,layer_get_id("Player"),obj_helmet)