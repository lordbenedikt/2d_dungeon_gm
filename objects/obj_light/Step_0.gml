/// @description Follow Target

if (obj_to_follow_id != undefined) {
	light[| eLight.X] = obj_to_follow_id.x;
	light[| eLight.Y] = obj_to_follow_id.y-4;
	light[| eLight.Flags] |= eLightFlags.Dirty; // rebuild static shadow casters
}