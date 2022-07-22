use <qrcode.scad>

/* [global] */
model="namebadge"; // [namebadge: Name badge, keychain: Key Chain, shoppingcoin: Shopping coin] 
length=85.0; // .1
width=55.0;  // .1
height=2.0;  // .1
dia=4.0;     // .1
textheight=1.0;  // .1
engrave=false;

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

/* [Icon] */
icon="";
iconfnt="font awesome 6 brands";
iconsize=8;
xiconofs=-32.0;  // .1
yiconofs=-19.0; // .1

/* [Logo] */
logo="oshw.svg";
xlogoofs=5.0;  // .1
ylogoofs=-20.0; // .1
logoscale=0.7;  // .02

/* [options] */
magnets=false;
qrcode=false;

/* [Hidden] */
$fn=30;


module shoppingCoin(l=23.0, ht=2.4) {
    difference(){
        union(){
                difference(){
                    cylinder(r=l/2, h=ht+textheight, $fn=50);
                    translate([0,0,ht]) cylinder(r=l/2-1.5, h=textheight, $fn=50);
                }
        }
    }
}

module keyChain(l=95.0, w=16.0, h=2.0) {
 difference() {
    hull() {
        translate([-l/2.0,0,0]) cylinder(d=w,h=2);
        translate([l/2.0,w/2.0-2.0,0]) cylinder(d=4,h=2);  
        translate([l/2.0,-(w/2.0-2),0]) cylinder(d=4,h=2);  
    }
    translate([-(l/2.0+w/2.0-4.0),0,0]) cylinder(d=4,h=3);
    }
    difference() {
        translate([-(l/2.0+w/2.0-4.0),0,2.0]) cylinder(d=6,h=1);
        translate([-(l/2.0+w/2.0-4.0),0,2.0]) cylinder(d=4,h=3);
    }
}

module nameBadge(l=85.0, w=55.0, ht=2.0, edge=4.0) {
 difference() {
    hull(){
        translate([l/2.0-edge/2.0,w/2.0-edge/2.0,0]) cylinder(d=edge,h=ht);  
        translate([-(l/2.0-edge/2.0),-(w/2.0-edge/2.0),0]) cylinder(d=edge,h=ht);  
        translate([-(l/2.0-edge/2.0),w/2.0-edge/2.0,0]) cylinder(d=edge,h=ht);  
        translate([l/2.0-edge/2.0,-(w/2.0-edge/2.0),0]) cylinder(d=edge,h=ht);  
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
    if (icon != "") {
        translate([xiconofs,yiconofs,0]) color("black") linear_extrude(textheight) text(icon, font=iconfnt, size=iconsize, halign = "center", valign="center");
    }
    if (logo != "") {
        translate([xlogoofs,ylogoofs,0]) color("black") linear_extrude(textheight) scale([logoscale,logoscale,logoscale]) import(file=logo); 
    }
    if (qrcode == true) {
        translate([xlogoofs,ylogoofs,0]) color("black") scale([logoscale,logoscale,logoscale]) qr_render(); 
    }
}


if (model == "namebadge") {
    if (engrave == true) {
        difference() {
            nameBadge(length,width,height,dia);
            translate([0,0,height]) labeling();
            translate([0,0,height-textheight]) labeling();
        }
            
    }
    else {
        nameBadge(length,width,height,dia);
        translate([0,0,height]) labeling();
    }
}
else if (model == "keychain") {
    if (engrave == true) {
        difference() {
            keyChain(length,width,height);
            translate([0,0,height]) labeling();
            translate([0,0,height-textheight]) labeling();
        }
            
    }
    else {
        keyChain(length,width,height);
        translate([0,0,height]) labeling();
    }
}
else if (model == "shoppingcoin") {
    if (engrave == true) {
        difference() {
            shoppingCoin(length,height);
            translate([0,0,height]) labeling();
            translate([0,0,height-textheight]) labeling();
        }
            
    }
    else {
        shoppingCoin(length,height);
        translate([0,0,height]) labeling();
    }
}
