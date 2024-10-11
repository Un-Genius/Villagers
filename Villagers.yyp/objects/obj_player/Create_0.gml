// MOVEMENT
hsp		= 0;
vsp		= 0;

moveS	= 0;
moveN	= global.speedPlyr * 1;
moveR	= global.speedPlyr * 2;
moveSpd	= moveN;

// ANIMATION
x_frame = 1;
y_frame = 8;

anim_speed = 12;
anim_length = 9;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base	= spr_male_base_1;
spr_torso	= spr_male_torso_shirt_white;
spr_legs	= spr_male_legs_pants_green;
spr_hair	= spr_male_hair_bedhead_pink;
spr_feet	= spr_male_feet_shoes_brown;

// DAMAGE
damagePlyr = global.damagePlyr;

// BEHAVIOUR
enum player_states {
	idle,
	move,
	run,
	attack,
	camera,
	collision
}

states_array = array_create(5)

states_array[player_states.idle]		= scr_player_idle;
states_array[player_states.move]		= scr_player_move;
states_array[player_states.run]			= scr_player_run;
states_array[player_states.attack]		= scr_player_attack;
states_array[player_states.camera]		= scr_player_camera;
states_array[player_states.collision]	= scr_player_collision;

// INTERACTION
interaction_object = instance_create_layer(0,0,layer,obj_interaction);