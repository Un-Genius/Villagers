with(obj_draw){
	//the first instance creates the grid
	if(!ds_exists(ds_depthgrid, ds_type_grid)){
		//create the depthgrid datastructure
		ds_depthgrid = ds_grid_create(2,1);

		//add its ID to the grid
		ds_depthgrid[# 0,0] = other;

		//add its Y value to the grid
		ds_depthgrid[# 1,0] = other.y;
	} else {
	
		//resize the current grid (increment +1)
		var heightOfGrid = ds_grid_height(ds_depthgrid);
		ds_grid_resize(ds_depthgrid, 2, heightOfGrid +1);
		
		//add ourselves to grid
		ds_depthgrid[# 0,heightOfGrid] = other;
		
		//add our Y value
		ds_depthgrid[# 1,heightOfGrid] = other.y;
	}
}
if sprite_exists(spr_character_mask) { sprite_assign(spr_character_mask, spr_character_invisible) }

var frame_size = 64;

if			(hsp < 0)	{	y_frame = 9;	}
else if		(hsp > 0)	{	y_frame = 11;	}
else if		(vsp < 0)	{	y_frame = 8;	}
else if		(vsp > 0)	{	y_frame = 10;	}
else					{	x_frame = 0;	}

var xoff = x-x_offset;
var yoff = y-y_offset;

// INCREMENT FRAME FOR ANIMATION
if(x_frame + (anim_speed/60) < anim_length)	{	x_frame += anim_speed/60;	}
else										{	x_frame = 1;	}

// DRAW CHARACTER BASE
draw_sprite_part(spr_base, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xoff, yoff);

// DRAW CHARACTER FEET
draw_sprite_part(spr_feet, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xoff, yoff);

// DRAW CHARACTER LEGS
draw_sprite_part(spr_legs, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xoff, yoff);

// DRAW CHARACTER SHIRT
draw_sprite_part(spr_torso, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xoff, yoff);

// DRAW CHARACTER HAIR
draw_sprite_part(spr_hair, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xoff, yoff);