/// @description 

event_inherited();

hp = 50;
walkSpeed = random_range(0.3,0.4);
onTakeDamage = function() {};

image_xscale = 0.35;
image_yscale = 0.35;
radius = sprite_width / 3;
init_animation(10, 0.08);
set_state(ACTOR_STATE.WALK);
