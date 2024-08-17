draw_set_font(fnt_menu);

#region GLOBAL VARIABLES

// DISPLAY
global.pause		= true;
global.view_width	= camera_get_view_width(view_camera[0]);
global.view_height	= camera_get_view_height(view_camera[0]);

display_set_gui_size(global.view_width, global.view_height);

// PLAYER
global.healthPlyr	= 1;
global.speedPlyr	= 1;
global.staminaPlyr	= 1;
global.damagePlyr	= 1;

global.leftK	= ord("A");
global.rightK	= ord("D");
global.upK		= ord("W");
global.downK	= ord("S");
global.runK		= vk_shift;

// ENEMY
global.healthEnmy	= 1;
global.speedEnmy	= 1;
global.staminaEnmy	= 1;
global.damageEnmy	= 1;

// UNIVERSAL KEYS
global.enterK	= vk_space;
global.camK		= ord("C");
global.attackK	= vk_space;

// MAP
level = 0;

#endregion

//defining pages
enum menu_page {
	main,
	singleplayer,
	settings,
	audio,
	difficulty,
	resolution, 
	height
}

//defining functions
enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//Create menu pages and menu buttons
ds_menu_main = menu_create_menu_page(
	["SINGLEPLAYER",menu_element_type.page_transfer,	menu_page.singleplayer], 
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	menu_exit_game]
);

ds_singleplayer = menu_create_menu_page(
	["PLAY",		menu_element_type.script_runner,	menu_resume_game], 
	["DIFFICULTY",	menu_element_type.shift,			menu_change_difficulty,		level,		["EASY","NORMAL", "HARD"]],
	["BACK",		menu_element_type.page_transfer,	menu_page.main],
);

ds_settings = menu_create_menu_page(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["WINDOW MODE",	menu_element_type.toggle,			menu_change_window_mode,		1,		["FULLSCREEN", "WINDOWED"]], 
	["BACK",		menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = menu_create_menu_page(
	["MASTER",		menu_element_type.slider,			menu_change_audio,			1,		[0,1]],
	["SOUNDS",		menu_element_type.slider,			menu_change_audio,			1,		[0,1]],
	["MUSIC",		menu_element_type.slider,			menu_change_audio,			1,		[0,1]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_difficulty = menu_create_menu_page(
	["ENEMIES",		menu_element_type.shift,			menu_change_difficulty,		level,		["EASY","NORMAL", "HARD"]], 
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

//Different Pages
page = 0;
menu_pages = [ds_menu_main, ds_singleplayer, ds_settings, ds_menu_audio, ds_menu_difficulty]

//Changing the page
var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false;

//audio_group_load(audiogroup_music);
//audio_group_load(audiogroup_soundeffects);