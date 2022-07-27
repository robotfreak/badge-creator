// Zusammenfasssen

module Zusammenfassen() {
    union() {
        cube(30, center=true);
        sphere(20);
    }
}

module Differenz() {
    difference() {
        cube(30, center=true);
        sphere(20);
    }
}

module Schnittmenge() {
    intersection() {
        cube(30, center=true);
        sphere(20);
    }
}

!Zusammenfassen();
Differenz();
Schnittmenge();
