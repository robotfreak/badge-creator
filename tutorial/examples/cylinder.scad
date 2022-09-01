// Basiskurs OpenSCAD
// cylinder.scad
// (c) berlincreators.de

parts="cylinder"; //[cylinder:Zylinder, cylinder_center:Zylinder zentriert,cone:Kegel,cylinder_xyz:Zylinder an Position X-Y-Z,cylinder_rotate ]
height=40; // [2:1:100]
radius1=10;// [1:1:20]
radius2=1; // [0:1:10]
rotation=[45,0,0]; // [-180:1:180]

if (parts == "cylinder") {
    // Cylinder 
    cylinder(h=height, r=radius1);
}
else if (parts == "cylinder_center") {
    // Cylinder (zentriert)
    cylinder(h=height, r=radius1, center=true);
}
else if (parts == "cone") {
    // Kegel (zentriert)
    cylinder(h=height, r1=radius1, r2=radius2, center=true);
}
else if (parts == "cylinder_xyz") {
    // Cylinder an Position 10,0,5
    translate([10,0,5]) cylinder(h=height, r=10);
}
else if (parts == "cylinder_rotate") {
    // Cylinder rotiert um 45° x-Achse (zentriert)
    rotate([45,0,0]) cylinder(h=height, r=10, center=true);
}
