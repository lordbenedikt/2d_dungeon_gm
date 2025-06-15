/// @description 

event_inherited();

flying = true;
walkSpeed = random_range(0.9,1.0);
onTakeDamage = function() {};

image_xscale = 1.0;
image_yscale = 1.0;
radius = sprite_width / 4;
init_animation(4, 0.08);
set_state(ACTOR_STATE.WALK);
