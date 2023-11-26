global.blackScreen = false

if(global.hp <= 0) {
	global.gameOver = true;
	restart();
}