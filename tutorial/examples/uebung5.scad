// Basiskurs OpenSCAD
// uebung5.scad
// (c) berlincreators.de



// Haus
module house() {
    cube([60,60,60]);
    translate([0, 30, 30]) rotate([45,0,0]) cube([60,50,50]); 
    translate([10, 10, 50]) cube([5,5,50]); 
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

for(i = [3:1:10]) {
 translate([i*100,0,0]) house();
 translate([i*100,i*100,0]) house();
 translate([0,i*100,0]) house();
 translate([-i*100,0,0]) house();
 translate([-i*100,i*100,0]) house();
 translate([0,-i*100,0]) house();
 translate([-i*100,-i*100,0]) house();
 translate([i*100,-i*100,0]) house();
}

tower(1200);
translate([400,1200,0]) scale(3) bridge();