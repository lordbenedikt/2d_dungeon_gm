// When dead tint screen black
if global.blackScreen {
	draw_rectangle_color(0,0,view_wport[0], view_hport[0],0,0,0,1,0)
}

draw_text(10, 10, "HP: " + string(global.hp));
draw_text(90, 10, "Arrows: " + string(global.arrows));
draw_text(200, 10, "Level: " + string(global.currentLevel));
draw_text(290, 10, string(global.keyFound ? "You found the key!" : "You will need a key."));