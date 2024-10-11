/// @description Camera coordinates
var moveCam = keyboard_check(global.camK);

if(moveCam) {
	x += (keyboard_check(global.rightK) - keyboard_check(global.leftK)) * 6;
	y += (keyboard_check(global.downK) - keyboard_check(global.upK)) * 6;
} else {
	x = clamp(x, following.x - h_border, following.x + h_border);
	y = clamp(y, following.y - v_border, following.y + v_border);
}