function menu_change_resolution(argument0) {
	switch(argument0) {
		case 0: window_set_size(512,384); break;
		case 1: window_set_size(1024,768); break;
		case 2: window_set_size(1366,768); break;
		case 3: window_set_size(1920,1080); break;
		case 4: window_set_size(2048,1536); break;
	}


}
