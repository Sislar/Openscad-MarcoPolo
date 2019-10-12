include <Boardgames.scad>

gLength = 210;
gWidth = 120;
gThick = 3;
$fn = 50;


// top of lid
translate ([0,gWidth,gThick]) rotate([180, 0, 0])
difference() {
    union() {
       hull() {
        translate([gThick/2, 0, gThick/2]) rotate([-90,0,0]) cylinder(h=gWidth, r1=gThick/2, r2=gThick/2);
        translate([gLength-4, 0, gThick/2]) rotate([-90,0,0]) cylinder(h=gWidth, r1=gThick/2, r2=gThick/2);
       }
       
       //rail 1
       difference() {
       tCube(2,0,-7.5,gLength-8,4.5,7.5);
       translate([gLength/2,6,-4]) rotate([45,0,0]) cube([gLength,6,6], center=true);
       }
       // rail 2
       difference() {
       tCube(2,gWidth-4.5,-7.5,gLength-8,4.5,7.5);
       translate([gLength/2,gWidth-6,-4]) rotate([45,0,0]) cube([gLength,6,6], center=true);
       }
    }

//translate([gLength/2-70,gWidth/2-10,0]) linear_extrude(height = gThick*2) text(text = "Marco Polo", font = "Stencil", size = 16);
}



