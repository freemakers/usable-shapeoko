$fn=100;

mm=1;

switch_z=10*mm;

base_x=32*mm;
base_y=28*mm;
base_z=3.25*mm;

layer2_z=7.6*mm-base_z;

riser_x=22*mm;
riser_y=base_y;
riser_z=layer2_z;

riser_x_off=0;
riser_y_off=0;
riser_z_off=base_z;

hole_r=2.9*mm/2;
hole_z=base_z + layer2_z;

hole_y_off=1.4*mm + hole_r;

hole1_x_off=11.6*mm + hole_r;
hole1_y_off=base_y-hole_y_off;

hole2_x_off=hole_y_off;
hole2_y_off=hole_y_off;

tab_x=2.8*mm;
tab_y=12.5*mm;
tab_z=layer2_z + 3;

tab_x_off=riser_x+3.6*mm + (tab_x/2);
tab_y_off=(base_y-tab_y)/2;
tab_z_off=base_z;

module base(){
   cube([base_x, base_y, base_z]);
}

module tab(x_off, y_off, z_off, x, y, z){
	hull(){
		translate([x_off, y_off, z_off])
			cylinder(d=x, h=z);
		translate([x_off, y_off+(y), z_off])
			cylinder(d=x, h=z);
	}
}

module layer2(){
	translate([riser_x_off, riser_y_off, riser_z_off])
		cube([riser_x, riser_y, riser_z]);
}

module bottom_holes(){
	union(){
		translate([hole1_x_off, hole1_y_off, 0])
			cylinder(r=hole_r, h=hole_z);
		translate([hole2_x_off, hole2_y_off, 0])
			cylinder(r=hole_r, h=hole_z);
		translate([tab_x_off, tab_y_off, 0])
			cylinder(r=hole_r,h=base_z);
		translate([tab_x_off, tab_y_off+tab_y-hole_r, 0])
			cylinder(r=hole_r,h=base_z);
	}
}

module bottom(){
	difference(){
		union(){
		   	base();
   			layer2();
		}
		bottom_holes();
	}
}

bottom();

