include <Boardgames.scad>

gLength = 210;
gWidth = 120;
gHeight = 37;
gRound = 2;
gThicklid = 3;
$fn = 50;

gTrayRound = 5;
gTrayWidth = gWidth/2 - 8 - 2*gTrayRound;
gTraySpacing = gTrayRound + gRound + 2;
echo(gTraySpacing);

//tray(h = 40, y=[50,50,0], x1=[100,50,50,0,0], x2 = [100,50,50,0,0]);

difference() {
    translate([gRound,gRound,0]) minkowski() {cube([gLength-2*gRound,gWidth-2*gRound,gHeight-gRound]);sphere(gRound); }
// cut off the rounded bottom
    translate([-500,-500,-100]) cube([1000,1000,100]); 
    
  // Create cups with rounded sides  
   translate ([gTraySpacing,gTraySpacing+2,15]) minkowski() {cube([80,gTrayWidth,gHeight]);sphere(gTrayRound); } 
   translate ([gTraySpacing,gWidth-gTraySpacing-gTrayWidth-2,15]) minkowski() {cube([80,gTrayWidth,gHeight]);sphere(gTrayRound); } 
   
  translate ([105,gTraySpacing+2,14]) minkowski() {cube([40,gTrayWidth,gHeight]);sphere(gTrayRound); } 
   translate ([105,gWidth-gTraySpacing-gTrayWidth-2,15]) minkowski() {cube([40,gTrayWidth,gHeight]);sphere(gTrayRound); } 

   translate ([160,gTraySpacing+2,15]) minkowski() {cube([40,gTrayWidth,gHeight]);sphere(gTrayRound); } 
   translate ([160,gWidth-gTraySpacing-gTrayWidth-2,15]) minkowski() {cube([40,gTrayWidth,gHeight]);sphere(gTrayRound); } 
   
// remove the lid rails
   translate([0,0,gHeight+ 0.2])
    union() {
       difference() {
       tCube(0,0,-8,gLength,5,8);
       translate([gLength/2,6,-4]) rotate([45,0,0]) cube([gLength,5.5,5.5], center=true);
       }
       
       difference() {
       tCube(0,gWidth-5,-8,gLength,5,8);
       translate([gLength/2,gWidth-6,-4]) rotate([45,0,0]) cube([gLength,5.5,5.5], center=true);
       }
    }

}


