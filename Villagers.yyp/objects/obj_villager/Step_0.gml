//moving
var moving = hsp!=0 || vsp!=0;

//States
//Idle, Wander, Avoid, Collision
switch(state) {
case "idle" :
	#region Idle

	//Behaviour
	counter += 1;
	
	if (speed != 0) speed = 0;
	
	//Transition Triggers
	if (collision_circle(x,y, 8, obj_player, false, true)) {
		state = "avoid";
	}
	
	if (counter >= room_speed * 3) {
		var change = choose (0, 1);
		switch(change) {
			case 0: state = "wander";
			case 1: counter = 0; break;
		}
	}
	#endregion
break;

case "wander" :
	#region Wander
	
	//Behaviour
	counter += 1;
	x += hsp;
	y += vsp;

	//Transition Triggers
	if (collision_circle(x,y, 8, obj_player, false, true)) {
		state = "avoid";
	}
	
	if (counter >= room_speed * 3) {
		var change = choose(0, 1);
		switch(change) {
		case 0: state = "idle";
		case 1:
			my_dir = irandom_range(0, 359);
			hsp = lengthdir_x(move_speed, my_dir);
			vsp = lengthdir_y(move_speed, my_dir);
			counter = 0;
		}
	}
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

//direction
if (moving){ 
    var _dir = point_direction(0, 0, hsp, vsp); 
    dir = floor(_dir/90);
}

//Collision
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

//Sprites
sprite_index = asset_get_index("spr_villager_" + state + string(dir));

//Clamp NPC's position to be inside the (tiled) room space
var xbuf=37; var ybuf = 34;
x = clamp(x, xbuf, room_width-xbuf); 
y = clamp(y, ybuf, room_height-ybuf+2);

/*
var mx = (mouse_x div 32) * 32 + 16;
var my = (mouse_y div 32) * 32 + 16;

if (mp_grid_path(global.grid, path, x, y, mx, my, 1)) {
	path_start(path, 4, path_action_stop, false)
}
*/