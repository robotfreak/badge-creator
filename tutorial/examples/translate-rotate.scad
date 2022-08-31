tr_x = 0; // [-180:10:180]
tr_y = 0; // [-180:10:180]
tr_z = 0; // [-180:10:180]
rot_x = 0; // [-180:15:180]
rot_y = 0; // [-180:15:180]
rot_z = 0;  // [-180:15:180]

translate( [tr_x,tr_y,tr_z] ) 
rotate( [rot_x,rot_y,rot_z] ) 
cube(10,true);