/// @function (string, vel)
/// @param {real} string_variable
/// @param {real} Velocity_of_text
function scr_dialogue_use() {

	//Hi there! Thank you for getting this package
	//The instructions are simple:

	//1st- Make sure you have a font named as dos_ce

	//2nd- Write the name of this script in a draw Event "scr_dialogue_use(..., ...);"

	//3rd- write any local variable to save scripts as shown below (you can name it as you want)
	//DRAW
	//var salsa;
	//salsa[0] = string("ADD ANY TEXT IN THIS SPACE")
	//salsa[1] = string("ADD ANY TEXT IN THIS SPACE")
	//salsa[...] = ...
	//Make sure the last string variable is empty
	//salsa[100] = string("")

	//4th- Add it to the script in the draw event "scr_dialogue_use(salsa,...)"

	//5th- write any number in the second spot of the script (make sure this numbre is bigger than 0)

	//scr_dialogue_use(salsa,1)

	//Note: If you want to create an extra event that would activate when the dialogue is over write a code as shown below
	//if str_n = -1 {
	//	EVENT_1
	//	EVENT_2
	//	EVE...
	//}
	/*---------------------------------------------------------------------------------------------------------------------
	if str_n != -1{
		var vel = 0.1 * argument1;
		var acel = + keyboard_check(vk_space) * (vel * 4);
		if string_length(argument0[str_n]) + (vel + acel) * 1.2  > spd {
			spd += vel + acel;
			wrt += vel + acel;
			if wrt >= 1{
				wrt -= 1;
			}
		}
		if string_length(argument0[str_n]) + (vel + acel) * 1.2 <= spd and keyboard_check_pressed(vk_space){
			spd = 0;
			str_n += 1;
		}
		if string_length(argument0[str_n]) <= 1{
			str_n = -1;
		}
		draw_set_color(c_white);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_font(dos_ce);

		var x_a = camera_get_view_x(view_camera[0]);
		var x_b = camera_get_view_width(view_camera[0]);
		var y_a = camera_get_view_y(view_camera[0]);
		var y_b = camera_get_view_height(view_camera[0]);
		draw_set_alpha(0.75);
		draw_rectangle_color( x_a +	(x_b * 0.09), y_a + y_b - ((y_b) * 0.2), x_a + x_b - (x_b * 0.09), y_a + y_b, c_black, c_black,c_black,c_black, false);
		draw_set_alpha(1);
		draw_text_ext_transformed(x_a +	(x_b * 0.1), y_a + y_b - (y_b * 0.19), string_copy(argument0[str_n], 1, spd), 1.8 * font_get_size(dos_ce), x_a + x_b - ((x_b * 0.1) * 2), 1, 1, 0);
		depth = -1000;
	}

/* end scr_dialogue_use */
}
