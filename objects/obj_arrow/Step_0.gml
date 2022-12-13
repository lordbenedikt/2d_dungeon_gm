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
			audio_play_sound(snd_arrow_hit_hall,0,0,getGain(other, obj_player, 200))
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