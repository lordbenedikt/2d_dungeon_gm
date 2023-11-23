event_inherited();

if (seesPlayer) {
	cooldown = max(0, cooldown-1);
} else {
	cooldown = cooldown_time / 2;
}
attack_timer = max(-1, attack_timer-1);
speed = speed * 0.9;

if (cooldown==0) {
	with(obj_player) {
		if (!other.aggro && !other.seesPlayer) {
			continue;
		}
		if (point_distance(other.x,other.y,x,y)<50) {
			other.walkSpeed = 0;
			other.attack_timer = round(other.attack_delay / global.speedMultiplier);
			other.cooldown = round(other.cooldown_time / global.speedMultiplier);
			other.direction = point_direction(other.x,other.y,x,y);
			flashColor(other,c_black);
		}
	}
}

if (attack_timer==0) {
	walkSpeed = originalWalkSpeed;
	speed = 6 * global.speedMultiplier;
}

