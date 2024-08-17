function scr_pillager_kick() {
	//Hitbox var
	var hitbox;
	hitbox = instance_create_layer(x,y,"instances", obj_pillager_kick_hitbox);

	//Spawn Hitbox
	if (image_index >= 1) && (image_index <= 3) {
		with (hitbox) {
			image_xscale = other.image_xscale;
			with (instance_place(x,y,enemy)) {
				//Deal damage
				spd = 0;
				enemy.pillagerHealth -= obj_player.playerDamage * 20;
			}
		}
	}

	//Transition Triggers
	if(image_index > image_number - 1) {
		pillagerStamina -= 25
		state = prevState;
	}


}
