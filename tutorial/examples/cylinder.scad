// Basiskurs OpenSCAD
// cylinder.scad
// (c) berlincreators.de

// Cylinder h=40mm r=10mm
cylinder(h=40, r=10);
// Cylinder h=40mm r=10mm (zentriert)
cylinder(h=40, r=10, center=true);
// Kegel h=40mm r1=10mm, r2=0 (zentriert)
cylinder(h=40, r1=10, r2=0, center=true);
// Kegel h=40mm r1=10mm, r2=10 (zentriert)
!cylinder(h=40, r1=10, r2=5, center=true);
// Cylinder h=40mm r=10mm an Position 10,0,5
translate([10,0,5]) cylinder(h=40, r=10);
// Cylinder h=40mm r=10mm rotiert um 45° x-Achse (zentriert)
rotate([45,0,0]) cylinder(h=40, r=10, center=true);
