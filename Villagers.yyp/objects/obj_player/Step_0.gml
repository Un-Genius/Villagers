// MOVEMENT
hsp			=	keyboard_check(global.rightK)	-	keyboard_check(global.leftK);
vsp			=	keyboard_check(global.downK)	-	keyboard_check(global.upK);

runK		=	keyboard_check(global.runK);
moveCam		=	keyboard_check(global.camK);
attackK		=	keyboard_check(global.attackK);

hsp *= moveSpd;
vsp *= moveSpd;

moving		=	hsp!=0 || vsp!=0;

// STATE TRANSITIONS
// Its basically a priority list

if(attackK)					{	script_execute(states_array[player_states.attack]);	} // 1. Attack
else if(moveCam)			{	script_execute(states_array[player_states.camera]);	} // 2. Camera
else if(runK && moving)		{	script_execute(states_array[player_states.run]);	} // 3. Run
else if(moving)				{	script_execute(states_array[player_states.move]);	} // 4. Move
else						{	script_execute(states_array[player_states.idle]);	} // 5. Idle

//Clamp Player's position to be inside the (tiled) room space
var xbuf = 37;
var ybuf = 34;

x = clamp(x, xbuf, room_width - xbuf); 
y = clamp(y, ybuf, room_height - ybuf + 2);

x += hsp
y += vsp