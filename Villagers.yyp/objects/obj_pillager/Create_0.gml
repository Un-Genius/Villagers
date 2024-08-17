// DEFAULT VARIABLES

healthPillager	= 100 * global.healthEnmy;
staminaPillager	= 100 * global.staminaEnmy;
move_speed		= 0.5 * global.speedEnmy;

dir = 0;
path = path_add();

image_xscale = 2; // FIX THIS------------------------------------------
image_yscale = 2; // Change the sprite itself

// DIRECTION
my_dir = irandom_range(0, 359);
hsp = lengthdir_x(move_speed, my_dir);
vsp = lengthdir_y(move_speed, my_dir);


// BEHAVIOUR

enum enemy_states {
	idle,			// 0
	flee,			// 1
	stumble,		// 2
	avoid,			// 3
	collision,		// 4
	find,			// 5
	chase,			// 6
	battleReady,	// 7
	kick,			// 8
	slash,			// 9
	stab,			// 10
	shield,			// 11
	dodgeSlash,		// 12
	dodgeStab		// 13
}

states_array = array_create(14)

state = states_array[enemy_states.idle];
prevState = states_array[enemy_states.idle];

states_array[enemy_states.idle]			= scr_pillager_idle;
states_array[enemy_states.flee]			= scr_pillager_flee;
states_array[enemy_states.stumble]		= scr_pillager_stumble;
states_array[enemy_states.avoid]		= scr_pillager_avoid;
states_array[enemy_states.collision]	= scr_pillager_collision;
states_array[enemy_states.find]			= scr_pillager_find;
states_array[enemy_states.chase]		= scr_pillager_chase;
states_array[enemy_states.battleReady]	= scr_pillager_battleReady;
states_array[enemy_states.kick]			= scr_pillager_kick;
states_array[enemy_states.slash]		= scr_pillager_slash;
states_array[enemy_states.stab]			= scr_pillager_stab;
states_array[enemy_states.shield]		= scr_pillager_shield;
states_array[enemy_states.dodgeSlash]	= scr_pillager_dodgeSlash;
states_array[enemy_states.dodgeStab]	= scr_pillager_dodgeStab;