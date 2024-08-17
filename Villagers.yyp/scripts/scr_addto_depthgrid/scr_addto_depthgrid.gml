///@description scr_addto_depthgrid
function scr_addto_depthgrid() {

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


}
