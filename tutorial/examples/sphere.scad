// Basiskurs OpenSCAD
// spehre.scad
// (c) berlincreators.de

// Kugel r=10mm
!sphere(10, $fn=20);
// Kugel r=10mm, 8 Ecken
sphere(10, $fn=8);
// Kugel r=10mm, 100 Ecken
sphere(10, $fn=100) 
// Kugel r=10mm rotiert um 45° x-Achse
rotate([45,0,0]) sphere(10);