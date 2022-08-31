// Basiskurs OpenSCAD
// uebung2.scad
// (c) berlincreators.de

building = "house"; // [house:Haus, tower:Turm, bridge:Bruecke] 
// Haus
module house() {
    cube([60,60,60]);
    translate([0, 30, 30]) rotate([45,0,0]) cube([60,50,50]); 
    translate([10, 10, 50]) cube([5,5,50]); 
}

// Turm
module tower() {
    cylinder(h=100, r1=5, r2=0);
    translate([0, 0, 70]) sphere(5); 
}

// Bruecke
module bridge() {
    // Fahrbahn
    translate([0,0,50]) cube([300,30,10]);
    // Traeger
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

if (building == "house") {
    house();
}
else if (building == "tower") { 
    tower();
}
else if (building == "bridge") {
    bridge();
}