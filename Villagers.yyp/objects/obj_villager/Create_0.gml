// State
state = "idle";

image_xscale = 2; // FIX THIS------------------------------------------
image_yscale = 2; // Change the sprite itself

// variables
counter		= 0;
move_speed	= .5;
dir			= 0;

// Direction
my_dir = irandom_range(0, 359);
hsp = lengthdir_x(move_speed, my_dir);
vsp = lengthdir_y(move_speed, my_dir);

// Create the path
//path = path_add();