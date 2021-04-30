with(obj_wall) {
	if (!ignored) {
		// Ignore for mouse light
		light_ignore_shadow_caster(other.light, id);
		ignored = true;
	}
	else {
		// Acknowledge for mouse light
		light_acknowledge_shadow_caster(other.light, id);
		ignored = false;
	}
}