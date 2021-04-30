draw_text(10, 10, "HP: " + string(global.hp));
draw_text(90, 10, "Arrows: " + string(global.arrows));
draw_text(200, 10, "Level: " + string(global.currentLevel));
draw_text(290, 10, string(global.keyFound ? "You found the key!" : "You will need a key."));