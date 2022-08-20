// Basiskurs OpenSCAD
// uebung5.scad
// (c) berlincreators.de

house_side = 60;
house_offset = [0,0,0];
tower_height = 1000;
tower_offset = [400,0,0];
bridge_scale= 3.0;
bridge_offset = [0,400,0];
// Haus
module house(side=60) {
    cube(side);
    translate([0, 30, 30]) rotate([45,0,0]) cube([side,side*0.7,side*0.7]); 
    translate([10, 10, side*0.7]) cube([5,5,side*0.7]); 
}

// Turm
module tower(height=100) {
    cylinder(h=height, r1=height/20, r2=0);
    translate([0, 0,height * 0.7]) sphere(height/20); 
}

// Brücke
module bridge() {
    // Fahrbahn
    translate([0,0,50]) cube([300,30,10]);
    // Träger
    translate([80,-2.5,0]) cube([5,5,120]);
    translate([220,-2.5,0]) cube([5,5,120]);
    translate([80,27.5,0]) cube([5,5,120]);
    translate([220,27.5,0]) cube([5,5,120]);
    // Tragseile
    translate([80,0,120]) rotate([0,-135,0]) cylinder(d=1,h=90);
    translate([80,30,120]) rotate([0,-135,0]) cylinder(d=1,h=90);
    translate([85,0,120]) rotate([0,135,0]) cylinder(d=1,h=90);
    translate([85,30,120]) rotate([0,135,0]) cylinder(d=1,h=90);
    translate([220,0,120]) rotate([0,-135,0]) cylinder(d=1,h=90);
    translate([220,30,120]) rotate([0,-135,0]) cylinder(d=1,h=90);
    translate([225,0,120]) rotate([0,135,0]) cylinder(d=1,h=90);
    translate([225,30,120]) rotate([0,135,0]) cylinder(d=1,h=90);
}

translate(house_offset) house(house_side);
translate(tower_offset) tower(tower_height);
translate(bridge_offset) scale([bridge_scale,bridge_scale,bridge_scale]) bridge(bridge_side);
