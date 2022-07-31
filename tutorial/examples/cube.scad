// Basiskurs OpenSCAD
// cube.scad
// (c) berlincreators.de

// Cube 10x10x10mm
cube(10);
// Cube 10x10x10mm (zentriert)
cube(10,true);
// Quader 30x20x10mm (zentriert)
cube([30,20,10],true);
// Cube 10x10x10mm an Position 10,0,5
translate([10,0,5]) cube(10);
// Cube 10x10x10mm rotiert um 45° x-Achse (zentriert)
!rotate([45,0,0]) cube(10,true);
