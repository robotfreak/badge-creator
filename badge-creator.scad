use <qrcode.scad>

/* [global] */
basemodel="square"; // [square: Square, circle: Circle] 
length=85.0; 
width=55.0; 
height=2.0;  // .1
diameter=23.0;     // .1
edges=50;  // [3:100]
upper_left_edge_diameter=16; 
upper_right_edge_diameter=4; 
lower_right_edge_diameter=4; 
lower_left_edge_diameter=16; 

textheight=1.0;  // .1
engrave=false;
magnets=false;

/* [1. text line] */
txt1="<Organization>";
fnt1="Ubuntu";
fnt1size=8;
x1ofs=0.0;   // .1
y1ofs=15.0;  // .1

/* [2. text line] */
txt2="<Name>";
fnt2="Ubuntu";
fnt2size=8;
x2ofs=-17.0;  // .1
y2ofs=-3.0; // .1

/* [3. text line] */
txt3="<Info>";
fnt3="Ubuntu";
fnt3size=8;
x3ofs=-10.0;  // .1
y3ofs=-19.0; // .1

/* [4. text line] */
txt4="";
fnt4="font awesome 6 brands";
fnt4size=8;
x4ofs=-32.0;  // .1
y4ofs=-19.0; // .1

/* [Logo] */
logofile="svg"; // [svg:SVG File, qrcode:QR Code File]
logo="oshw.svg";
xlogoofs=5.0;  // .1
ylogoofs=-20.0; // .1
logoscale=0.7;  // .02

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

module labeling() {
    if (txt1 != "") {
        translate([x1ofs,y1ofs,0]) color("black") linear_extrude(textheight) text(txt1, font=fnt1, size=fnt1size, halign = "center", valign="center");
    }
    if (txt2 != "") {
        translate([x2ofs,y2ofs,0]) color("black") linear_extrude(textheight) text(txt2, font=fnt2, size=fnt2size, halign = "center", valign="center");
    }
    if (txt3!="") {
        translate([x3ofs,y3ofs,0]) color("black") linear_extrude(textheight) text(txt3, font=fnt3, size=fnt3size, halign = "center", valign="center");
    }
    if (txt4 != "") {
        translate([x4ofs,y4ofs,0]) color("black") linear_extrude(textheight) text(txt4, font=fnt4, size=fnt4size, halign = "center", valign="center");
    }
    if (logo != "") {
        if (logofile == "svg") {
            translate([xlogoofs,ylogoofs,0]) color("black") linear_extrude(textheight) scale([logoscale,logoscale,logoscale]) import(file=logo); 
        }
        else if (logofile == "qrcode") {
            translate([xlogoofs,ylogoofs,0]) color("black") scale([logoscale,logoscale,logoscale]) qr_render(); 
        }
    }
}


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
