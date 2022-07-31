// Basiskurs OpenSCAD
//  badge-creator.scad
// (c) berlincreators.de

// Zusammenfasssen
module Zusammenfassen() {
    union() {
        cube(30, center=true);
        sphere(20);
    }
}

// Differenz
module Differenz() {
    difference() {
        cube(30, center=true);
        sphere(20);
    }
}

// Schnittmenge
module Schnittmenge() {
    intersection() {
        cube(30, center=true);
        sphere(20);
    }
}

!Zusammenfassen();
Differenz();
Schnittmenge();
