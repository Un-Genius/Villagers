function scr_pillager_battleReady() {
	a1 = enemy.x;
	b1 = enemy.y;
	a2 = sign(a1);
	b2 = sign(b1);

	if (enemy.attackers <= 3) {
		if(a2 = 1 && b2 = 1) {
			if(a1 > b1) {
				//move to direction 0 of enemy
			} else {
				//move to direction 270 of enemy
			}
		}
		if(a2 = -1 && b2 = -1) {
			if(a1 < b1) {
				//move to direction 90 of enemy
			} else {
				//move to direction 180 of enemy
			}
		}
		if(a2 = 1 && b2 = -1) {
			if(a1 > b1) {
				//move to direction 0 of enemy
			} else {
				//move to direction 90 of enemy
			}
		}
		if(a2 = b2) {
			if(a1 > b1) {
				//move to direction 0 of enemy
			} else {
				//move to direction 170 of enemy
			}
		}
		if(a2 = -1 && b2 = 1) {
			if(a1 > b1) {
				//move to direction 180 of enemy
			} else {
				//move to direction 270 of enemy
			}
		}
	}


}
