/// @description 

event_inherited();

walkSpeed = random_range(0.7,0.8);
onTakeDamage = function() {};

image_xscale = 0.75;
image_yscale = 0.75;
radius = sprite_width / 3;
init_animation(10, 0.08);
set_state(ACTOR_STATE.WALK);
