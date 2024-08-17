function scr_pillager_dodgeSlash() {
	if(enemy.state = slash) {
		// Sprites
		sprite_index = asset_get_index("spr_pillager_" + dodgeSlash + string(dir));
	
		if(dir = 0) x += 5;
		if(dir = 2) x -= 5;
		if(dir = 1) y += 5;
		if(dir = 3) y -= 5;
	
		//Transition Triggers
		if(image_index > image_number - 1) {
			pillagerStamina -= 20;
			state = prevState;
		}
	} else {
		// Sprites
		sprite_index = asset_get_index("spr_pillager_" + dodgeStab + string(dir));
	
		if(dir = (0 or 2)) {
			x = choose(5, -5);
		} else {
			y = choose(5, -5);
		}
	
		//Transition Triggers
		if(image_index > image_number - 1) {
			staminaPillager -= 20;
			state = prevState;
		}
	}


}
