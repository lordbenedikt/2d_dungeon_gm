/// @desc Follow mouse

light[| eLight.X] = obj_player.x;
light[| eLight.Y] = obj_player.y-4;
light[| eLight.Flags] |= eLightFlags.Dirty; // rebuild static shadow casters