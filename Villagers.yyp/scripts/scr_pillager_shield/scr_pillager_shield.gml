function scr_pillager_shield() {
	//Transition Triggers
	if(image_index > image_number - 1) {
		staminaPillager -= 20
		state = prevState;
	}


}
