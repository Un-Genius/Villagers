function menu_change_difficulty(argument0) {
	var type = menu_option[page];

	//Enemies
	if (type == 0) {
		switch(argument0) {
			case 0:
				//easy
				global.playerDamage = 1;
				global.playerHealth = 100;
				global.pawnDamage = 0.2;
				global.pawnHealth = 50;
				level = 0;
			break;
		
			case 1:
				//medium
				global.playerDamage = 0.8;
				global.playerHealth = 60;
				global.pawnDamage = 0.5;
				global.pawnHealth = 40;
				level = 1;
			break;
		
			case 2:
				//hard
				global.playerDamage = 0.7;
				global.playerHealth = 50;
				global.pawnDamage = 0.8;
				global.pawnHealth = 50;
				level = 2;
			break;
		}
	}


}
