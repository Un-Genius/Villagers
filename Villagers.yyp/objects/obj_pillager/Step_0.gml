// Moving
var moving = hsp!=0 || vsp!=0;

// Direction
if (moving){ 
    var _dir = point_direction(0, 0, hsp, vsp); 
    dir = floor(_dir/90);
}

// Sprites
show_debug_message("spr_pillager_" + string(state) + "_" + string(dir));
sprite_index = asset_get_index("spr_pillager_" + string(state) + "_" + string(dir));

// Clamp Position in room
var xbuf=37; var ybuf = 34;
x = clamp(x, xbuf, room_width-xbuf); 
y = clamp(y, ybuf, room_height-ybuf+2);

// Defining Enemy
if(obj_player.x < obj_villager.x) && (obj_player.y < obj_villager.y) {
	enemy = obj_player;
} else {
	enemy = obj_villager;
}

// STATE TRANSITIONS
// Collision
if	(place_meeting(x + hsp, y, obj_house0)) or (place_meeting(x, y + vsp, obj_house0)) {
	state = states_array[enemy_states.collision];
} else {
	// Avoid
	if	(collision_circle(x,y, 8, obj_player or obj_pillager or obj_villager, false, true))		{
		state = states_array[enemy_states.avoid];
	} else {
		// Chase
		if	(collision_circle(x, y, 64, obj_player, false, true)) {
			state = states_array[enemy_states.chase]; 
			show_debug_message("Chasing")
		} else {
			// BattleReady
			if	(collision_circle(x,y, 16, enemy, false, true)) {
				state = states_array[enemy_states.battleReady]; 
			} else {
				state = states_array[enemy_states.idle]; 
			}
		}
	}
}
// Update prevState
if	(state != states_array[enemy_states.collision] or states_array[enemy_states.avoid])	{	prevState = state; }

script_execute(state);