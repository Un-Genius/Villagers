// Moving
var moving = hsp!=0 || vsp!=0;

// Path
var mx = (obj_player.x div 32) * 32 + 16;
var my = (obj_player.y div 32) * 32 + 16;

// States
// Idle, Wander, Avoid, Chase, 
switch(state) {
case "idle" :
	#region Idle

	//Behaviour
	if (speed != 0) speed = 0;
	
	//Transition Triggers
	if (collision_circle(x,y, 8, obj_player, false, true)) {
		state = "avoid";
	}
	
	if (collision_circle(x, y, 64, obj_player, false, true)) {
		state = "chase";
	}
	
	#endregion
break;

case "chase" :
	#region Chase
	
	if (mp_grid_path(global.grid, path, x, y, mx, my, 1)) {
		path_start(path, move_speed, path_action_stop, false)
	}
	
	// Behaviour
	x += hsp;
	y += vsp;

	/*/ Transition Triggers
	if (collision_circle(x,y, 8, obj_player, false, true)) {
		state = "avoid";
	}
	
	if !(collision_circle(x, y, 64, obj_player, false, true)) {
		state = "idle";
	}*/
	
	#endregion
break;

case "avoid" :
	#region Avoid
	//Behaviour
	if (instance_exists(obj_player)) && (!place_meeting(x, y, obj_house0)) {
		move_towards_point(obj_player.x, obj_player.y, -0.5);
	}
	
	//Transition Triggers
	if (!collision_circle(x,y, 8, obj_player, false, true)) {
		speed = 0;
		state = "idle";
	}

	//X Collision
	if place_meeting(x + hsp, y, obj_house0) {
		state = "collision";
	}

	//Y Collision
	if place_meeting(x, y + vsp, obj_house0) {
		state = "collision";
	}

#endregion
break;

case "collision" :
	#region collision
	
	if place_meeting(x + hsp, y, obj_house0) {
		while !place_meeting(x + sign(hsp), y, obj_house0) {
			x += sign(hsp);
		}
		if(sign(hsp) = 1) x -= 5;
		if(sign(hsp) = -1) x += 5;
	} else {
		if !place_empty(x + hsp, y, obj_house0) {
			speed = 0;
			state = "idle";
		}
	}

	//Y Collision
	if place_meeting(x, y + vsp, obj_house0) {
		while !place_meeting(x, y + sign(vsp), obj_house0) {
			y += sign(vsp);
		}
		if(sign(vsp) = -1) y += 5;
		if(sign(vsp) = 1) y -= 5;
	} else {
		if place_empty(x, y + vsp, obj_house0) {
			speed = 0;
			state = "idle";
		}
	}
	
	#endregion
}

// Direction
if (moving){ 
    var _dir = point_direction(0, 0, hsp, vsp); 
    dir = floor(_dir/90);
}
/*
if(sign(hsp) = 1) dir = ;
if(sign(hsp) = -1) x += 5;
if(sign(vsp) = -1) y += 5;
if(sign(vsp) = 1) y -= 5;
*/
// Collision
#region Collision

//X Collision
if place_meeting(x + hsp, y, obj_house0) {
	state = "collision";
}

//Y Collision
if place_meeting(x, y + vsp, obj_house0) {
	state = "collision";
}
#endregion

// Sprites
sprite_index = asset_get_index("spr_pillager_" + state + string(dir));

// Clamp NPC's position to be inside the (tiled) room space
var xbuf=37; var ybuf = 34;
x = clamp(x, xbuf, room_width-xbuf); 
y = clamp(y, ybuf, room_height-ybuf+2);
