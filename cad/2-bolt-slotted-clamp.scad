$fn=100;

q20_bolt_diam = 6.5;
material_z = 9.6;
bit_width = 3.175;

base_x = 160;
base_y = 30;
base_z = material_z;

hole_r = q20_bolt_diam / 2;
hole_y_off = base_y / 2;
hole_z_off = base_z / 2;

nut_face_sep = 10.85;
nut_point_sep = 12.35;
nut_z = 5.5;

nut_ctr_x_off = (hole_r *2)+ (nut_face_sep / 2);
nut_ctr_y_off = hole_r + (nut_point_sep / 2);
nut_z_off = base_z - (nut_z/2);

slot_x = base_x * 2/3;
slot_x1_off = hole_r + (base_x - slot_x)/2;
slot_x2_off = slot_x1_off + slot_x - hole_r;
slot_z = base_z;

module knurls(){
	cuts = [0:16];
	increment = 6;
	depth= bit_width/2;
	start=base_x/3;

	union(){
		for(cut=cuts){
			translate([(cut*increment) + (start), -.1, base_z-depth])
				cube([bit_width, base_y, depth]);
		}
	}
}

module hex(d,z){
  passes = [0:2];
  chord=d*1/tan(60);

  union(){
     for(pass=passes){
       rotate([0,0,pass*60]) cube(size=[d,chord,z],center=true);
     }
  }
}

module fastenerCuts(){
	union(){
   		translate([nut_ctr_x_off,hole_y_off,nut_z_off])
			hex(nut_face_sep,nut_z);

   		translate([nut_ctr_x_off,hole_y_off,hole_z_off])
			cylinder(r=hole_r,h=base_z, center=true);

		hull(){
			translate([slot_x1_off,hole_y_off,hole_z_off]) 
				cylinder(r=hole_r,h=slot_z, center=true);
			translate([slot_x2_off,hole_y_off,hole_z_off]) 
				cylinder(r=hole_r,h=slot_z, center=true);
		}
	}
}

module block(){
	union(){
		translate([base_z/2,0,base_z/2])
		rotate([-90,0,0])
			hull(){
				cylinder(d=base_z*.99,h=base_y*.99, center=false);
				translate([base_x - base_z,0,0])
					cylinder(d=base_z*.99,h=base_y*.99, center=false);
			}
		cube([base_x,base_y,base_z/2]);
	}
}

module clamp(){
  difference(){
		block();
		fastenerCuts();
		knurls();
  }
}

module clamps(){
	increment = base_y + bit_width;
	parts = [0:3];
	union(){
		for(part=parts){
			translate([0, (increment*part), 0]) clamp();
		}
	}
}

module index(){
	ctr=bit_width*1.01/2;
	difference(){
		translate([0, 0, base_z/2])
			cylinder(r=ctr, h=base_z, center=true);
		translate([0, 0, base_z/2])
			cylinder(r=bit_width/2, h=base_z, center=true);
	}
}

module sheet(){
	union(){
		index();
		translate([bit_width*5/2, bit_width*5/2, 0]) clamps();
	}
}

sheet();




