if(travelTime > 0) {
	travelTime--;
}

if(fallTime > 0) {
	speed = 0.9*speed;
	image_angle += turnDirection;
	fallTime--;
}


if (travelTime <= 0 && fallTime <= 0) {
	speed = 0;
}

with (obj_enemy) {
	if(other.travelTime > 0) {
		if(hitEnemy(self)) {
			with(other) {
				fallToFloor();
			}
			hp -= 20;
			aggro = true;
			image_index = 1;
			flash(self);
		}
	}
}