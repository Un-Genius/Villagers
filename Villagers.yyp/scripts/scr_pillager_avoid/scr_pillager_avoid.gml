function scr_pillager_avoid() {
	//Behaviour
	if (instance_exists(obj_player)) && (!place_meeting(x, y, obj_house0)) {
		move_towards_point(obj_player.x, obj_player.y, -0.5);
	}
	
	//Transition Triggers
	if (!collision_circle(x,y, 8, obj_player, false, true)) {
		speed = 0;
		state = prevState;
	}


}
