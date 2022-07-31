// Basiskurs OpenSCAD
// berlincreators.scad
// (c) berlincreators.de

diameter = 30;

module logo_2d() {
     translate([0,25,0])
        for(i = [-2 : 2])
           rotate(i * 30)
                translate([0, diameter / 2])
                    square([1.5,10], center=true);
    translate([0, 20, 0]) text(text = "", font="Font Awesome 6 free", size = 14, halign =  "center", valign = "center");
    text(text = "berlinCreators", font="Baumans", size = 12, halign = "center", valign =   "center");
    translate([0,-14, 0]) text(text = "think.build.share", font="Baumans", size = 10, halign = "center", valign = "center");
}

color("black") logo_2d();    