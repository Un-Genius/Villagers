if(!global.pause) exit;

input_up_p		= keyboard_check_pressed(global.upK);
input_down_p	= keyboard_check_pressed(global.downK);
input_enter_p	= keyboard_check_pressed(global.enterK);

var ds_ = menu_pages[page], ds_height = ds_grid_height(ds_);



if(inputting){
	
	switch(ds_[# 1, menu_option[page]]){
		
		#region SHIFT
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(global.rightK) - keyboard_check_pressed(global.leftK);
			if(hinput != 0){
				//audio
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, array_length_1d(ds_[# 4, menu_option[page]])-1);
			}
		break;
		
		#endregion
		#region SLIDER
		
		case menu_element_type.slider:
			switch(menu_option[page]) {
				case 0:
					if(!audio_is_playing(snd_menuMusic)) {
						audio_play_sound(snd_menuMusic, 1, false);
					}
				break;
				
				case 1:
					/*if (global.oof = true) {
						if(!audio_is_playing(snd_OOF)) {
							audio_play_sound(snd_OOF, 1, false);
						}
					} else {
						*/if(!audio_is_playing(snd_death)) {
							audio_play_sound(snd_death, 1, false);
						}
					//}
				break;
				
				case 2:
					if(!audio_is_playing(snd_music)) {
						audio_play_sound(snd_music, 1, false);
					}
				break;
			}
			
			var hinput = keyboard_check(global.rightK) - keyboard_check(global.leftK);
			if(hinput != 0){
				ds_[# 3, menu_option[page]] += hinput*0.01;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, 1);
				script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]);
			}
			
		break;
		
		#endregion
		#region TOGGLE
		
		case menu_element_type.toggle:
		var hinput = keyboard_check_pressed(global.rightK) - keyboard_check_pressed(global.leftK);
			if(hinput != 0){
				//audio
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, 1);
			}
		break;
		
		#endregion
		#region INPUT
		
		case menu_element_type.input:
		var kk = keyboard_lastkey;
		if(kk != vk_enter){
			if(kk != ds_[# 3, menu_option[page]]) //audio
			ds_[# 3, menu_option[page]] = kk;
			variable_global_set(ds_[# 2, menu_option[page]], kk);
		}
		
		break;
		
		#endregion
	}
	
} else {
	var ochange = input_down_p - input_up_p;
	if(ochange != 0){
		menu_option[page] += ochange;
		if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if(menu_option[page] < 0) { menu_option[page] = ds_height-1; }
		//audio
	}
}

if(input_enter_p){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element_type.script_runner: script_execute(ds_[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer: page = ds_[# 2, menu_option[page]]; break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if(inputting){ script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]); }
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	
	//audio
}
