function scr_pillager_chase() {
	// Path
	var mx = (obj_player.x div 32) * 32 + 16;
	var my = (obj_player.y div 32) * 32 + 16;

	if (mp_grid_path(global.grid, path, x, y, mx, my, 1)) {
			path_start(path, move_speed, path_action_stop, false);
		}
	
	// Behaviour
	x += hsp;
	y += vsp;



}
