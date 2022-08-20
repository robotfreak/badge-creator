// Basiskurs OpenSCAD
//  badge-creator.scad
// (c) berlincreators.de

use <qrcode.scad>

/* [global] */
basemodel="square"; // [square:Square, circle:Circle, svg:SVG] 
height=2.0;  // [1:.1:4]
textheight=1.0;  // [0.5:.1:2.5]
engrave=false;
magnets=false;
keychainhole=false;
/* [Round options] */
diameter=23.0; // [10:.1:120]
edges=50;  // [3:1:100]
/* [Square options] */
length=85.0; // [10:1:150]
width=55.0;  // [10:1:150] 
upper_left_edge_diameter=4; 
upper_right_edge_diameter=4; 
lower_right_edge_diameter=4; 
lower_left_edge_diameter=4; 
/* [SVG options] */
svgfile="bone.svg";
svg_scale=1.0;  // .02
svg_offset=[-60, -35, 0];  // [-120:.1:100]
svg_rotate=0; // [-180:1:180]
/* [Keychain hole options] */
keychainhole_mode="round"; // [round:Round, slot:Slot]
keychainhole_offset=[0,0,0];  // [-100:.1:100]
keychainhole_height=2;  // .1
/* [1. text line] */
txt1="<Organization>";
txt1_font="Ubuntu";
txt1_fontsize=8;
txt1_offset=[0.0,15.0,0];  // [-120:.1:120]
txt1_rotate=0; // [-180:1:180]

/* [2. text line] */
txt2="<Name>";
txt2_font="Ubuntu";
txt2_fontsize=8;
txt2_offset=[-17.0,3.0,0];   // [-120:.1:120]
txt2_rotate=0; // [-180:1:180]

/* [3. text line] */
txt3="<Info>";
txt3_font="Ubuntu";
txt3_fontsize=8;
txt3_offset=[-10.0,-19.0,0];   // [-120:.1:120]
txt3_rotate=0; // [-180:1:180]

/* [4. text line] */
txt4="";
txt4_font="font awesome 6 brands";
txt4_fontsize=8;
txt4_offset=[-32.0,-19.0,0];  // [-120:.1:120]
txt4_rotate=0; // [-180:1:180]

/* [5. text line] */
txt5="";
txt5_font="Ubuntu";
txt5_fontsize=8;
txt5_offset=[-10.0,-19.0,0];   // [-120:.1:120]
txt5_rotate=0; // [-180:1:180]

/* [Logo] */
logo_mode="svg"; // [svg:SVG File, qrcode:QR Code File]
logo_file="oshw.svg";
logo_offset=[5.0,-55.0,0];   // [-100:.1:100]
logo_rotate=0; // [-180:1:180]
logo_scale=3.0;  // .02

/* [Hidden] */
$fn=30;


module roundBadge(l=23.0, ht=2.4) {
    difference(){
        union(){
                difference(){
                    cylinder(r=l/2, h=ht+textheight, $fn=edges);
                    translate([0,0,ht]) cylinder(r=l/2-1.5, h=textheight, $fn=edges);
                }
        }
    }
}

module squareBadge(l=85.0, w=55.0, ht=2.0) {
 difference() {
    hull(){
        translate([-(l/2.0-upper_left_edge_diameter/2.0) ,   w/2.0-upper_left_edge_diameter/2.0,0])   cylinder(d=upper_left_edge_diameter,h=ht);  
        translate([ (l/2.0-upper_right_edge_diameter/2.0),   w/2.0-upper_right_edge_diameter/2.0,0])  cylinder(d=upper_right_edge_diameter,h=ht);  
        translate([ (l/2.0-lower_right_edge_diameter/2.0), -(w/2.0-lower_right_edge_diameter/2.0),0]) cylinder(d=lower_right_edge_diameter,h=ht);  
        translate([-(l/2.0-lower_left_edge_diameter/2.0) , -(w/2.0-lower_left_edge_diameter/2.0),0])  cylinder(d=lower_left_edge_diameter,h=ht);  
    }
    if (magnets == true) {
        translate([0,0,0]) cylinder(d=8.3,h=ht/2);
        translate([-15,0,0]) cylinder(d=8.3,h=ht/2);
        translate([15,0,0]) cylinder(d=8.3,h=ht/2);
    }
   }
}

module svgBadge(ht=2.4) {
 difference() {
   union() {
    translate(svg_offset) rotate([0,0,svg_rotate]) linear_extrude(ht) scale(svg_scale) import(file=svgfile, center=true); 
   }
    if (magnets == true) {
        translate([0,0,0]) cylinder(d=8.3,h=ht/2);
        translate([-15,0,0]) cylinder(d=8.3,h=ht/2);
        translate([15,0,0]) cylinder(d=8.3,h=ht/2);
    }
  }
}

module labeling() {
    if (txt1 != "") {
        translate(txt1_offset) rotate([0,0,txt1_rotate]) color("black") linear_extrude(textheight) text(txt1, font=txt1_font, size=txt1_fontsize, halign = "center", valign="center");
    }
    if (txt2 != "") {
        translate(txt2_offset) rotate([0,0,txt2_rotate]) color("black") linear_extrude(textheight) text(txt2, font=txt2_font, size=txt2_fontsize, halign = "center", valign="center");
    }
    if (txt3!="") {
        translate(txt3_offset) rotate([0,0,txt3_rotate]) color("black") linear_extrude(textheight) text(txt3, font=txt3_font, size=txt3_fontsize, halign = "center", valign="center");
    }
    if (txt4 != "") {
        translate(txt4_offset) rotate([0,0,txt4_rotate]) color("black") linear_extrude(textheight) text(txt4, font=txt4_font, size=txt4_fontsize, halign = "center", valign="center");
    }
    if (txt5 != "") {
        translate(txt5_offset) rotate([0,0,txt5_rotate]) color("black") linear_extrude(textheight) text(txt5, font=txt5_font, size=txt5_fontsize, halign = "center", valign="center");
    }
    if (logo_file != "") {
        if (logo_mode == "svg") {
            translate(logo_offset) color("black") linear_extrude(textheight) scale(logo_scale) import(file=logo_file); 
        }
        else if (logo_mode == "qrcode") {
            translate(logo_offset) rotate([0,0,logo_rotate]) color("black") scale(logo_scale) qr_render(); 
        }
    }
}

module badge() {
if (basemodel == "square") {
    if (engrave == true) {
        difference() {
            squareBadge(length,width,height);
            translate([0,0,height]) labeling();
            translate([0,0,height-textheight]) labeling();
        }
            
    }
    else {
        squareBadge(length,width,height);
        translate([0,0,height]) labeling();
    }
}
else if (basemodel == "circle") {
    if (engrave == true) {
        difference() {
            roundBadge(diameter,height);
            translate([0,0,height]) labeling();
            translate([0,0,height-textheight]) labeling();
        }
            
    }
    else {
        roundBadge(diameter,height);
        translate([0,0,height]) labeling();
    }
}
else if (basemodel == "svg") {
    if (engrave == true) {
        difference() {
            svgBadge(height);
            translate([0,0,height]) labeling();
            translate([0,0,height-textheight]) labeling();
        }
            
    }
    else {
        svgBadge(height);
        translate([0,0,height]) labeling();
    }
}
}

module keychainhole_hole() {
    if (keychainhole == true) {
        translate(keychainhole_offset) {
            if (keychainhole_mode == "round") {
                cylinder(h=keychainhole_height, d=3.5);
            }
            else if (keychainhole_mode == "slot") { 
                hull() {
                    translate([7,0,0]) cylinder(h=keychainhole_height, d=3.5);
                    translate([-7,0,0]) cylinder(h=keychainhole_height, d=3.5);
                }
                translate([0,1,0]) cylinder(h=keychainhole_height, d=3.5);
            }
        }
    }
}

module keychainhole_body() {
    if (keychainhole == true) {
        translate(keychainhole_offset) {
            if (keychainhole_mode == "round") {
                cylinder(h=keychainhole_height, d=6);
            }
            else if (keychainhole_mode == "slot") {
                hull() {
                    translate([8,0,0]) cylinder(h=keychainhole_height, d=6);
                    translate([-8,0,0]) cylinder(h=keychainhole_height, d=6);
                }
            }
        }
    }
}

difference() { 
    union() {
        badge();
        keychainhole_body();
    }  
    keychainhole_hole();
}   
