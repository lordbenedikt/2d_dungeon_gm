for (var i = 0; i < 15; i++) {
    if (gamepad_is_connected(i)) {
        show_debug_message("Gamepad " + string(i) + " connected");
    }
}

global.gameOver = false;
global.keyFound = false;
global.arrows = 3;
global.hp = 100;
global.currentLevel = 0;
global.masterVolume= 1;

nextLevel();