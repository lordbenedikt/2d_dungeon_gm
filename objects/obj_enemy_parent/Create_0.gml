hp = 100;
aggro = false;
ds_path = ds_list_create();

image_speed = 0;
originalWalkSpeed = random_range(0.4,0.55) * global.speedMultiplier;
walkSpeed = originalWalkSpeed;
wanderXSpeed = 0;
wanderYSpeed = 0;
seesPlayer = false;
radius = sprite_width / 2;

onTakeDamage = function() {
	if (!aggro) {
		aggro = true;
		image_index = 1;
	}
}