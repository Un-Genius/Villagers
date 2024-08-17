function scr_pillager_flee() {
	//Behaviour
	if (instance_exists(obj_player)) && (!place_meeting(x, y, obj_house0)) {
		move_towards_point(obj_player.x, obj_player.y, -0.5);
	}


}
