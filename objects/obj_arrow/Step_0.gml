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

with (obj_enemy_parent) {
	if(other.travelTime > 0) {
		if(hitEnemy(self)) {
			audio_play_sound(snd_arrow_hit_hall,0,0,getGain(other, obj_player, 200) * 0.5)
			with(other) {
				fallToFloor();
			}
			hp -= 20;
			onTakeDamage();
			flash(self);
		}
	}
}