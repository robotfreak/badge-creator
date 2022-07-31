// Basiskurs OpenSCAD
// pokal.scad
// (c) berlincreators.de

difference() {
    union() {
        translate([0,0,30]) cylinder(d2=10, d1=30, h=100);
        translate([0,0,150]) sphere(d=60);
    }
    translate([0,0,152]) sphere(d=56);
    translate([0,0,180]) cube(60, center=true);
}

intersection() {
    translate([0,0,15]) cube([50,50,30], center=true);
    translate([0,0,15]) sphere(d=60);
}    
