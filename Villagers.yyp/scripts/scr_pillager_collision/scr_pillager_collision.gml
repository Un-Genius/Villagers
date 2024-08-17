function scr_pillager_collision() {
	// X Collision
	if place_meeting(x + hsp, y, obj_house0) {
		while !place_meeting(x + sign(hsp), y, obj_house0) {
			x += sign(hsp);
		}
		if(sign(hsp) = 1) x -= 5;
		if(sign(hsp) = -1) x += 5;
	} else {
		if !place_empty(x + hsp, y, obj_house0) {
			speed = 0;
			state = prevState;
		}
	}

	// Y Collision
	if place_meeting(x, y + vsp, obj_house0) {
		while !place_meeting(x, y + sign(vsp), obj_house0) {
			y += sign(vsp);
		}
		if(sign(vsp) = -1) y += 5;
		if(sign(vsp) = 1) y -= 5;
	} else {
		if place_empty(x, y + vsp, obj_house0) {
			speed = 0;
			state = prevState;
		}
	}


}
