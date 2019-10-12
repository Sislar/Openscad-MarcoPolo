include <Hexlibs.scad>

gBoxHeight = 35;  //(does not include lid)
gLidHeight = 7;   // Total height is gLigHeight + gBoxHeigth
gBoxWidth = 48;
gBoxLength = 70;
gWallThickness = 2.5;
gLidHeight = 7;


module tCube(tX,tY,tZ,sX,sY,sZ){
    translate([tX,tY,tZ]) cube([sX,sY,sZ]);
}


//  Main Box
difference() {    
   cube([gBoxLength,gBoxWidth,gBoxHeight]);
   tCube(gWallThickness,gWallThickness,gWallThickness, gBoxLength-2*gWallThickness,gBoxWidth-2*gWallThickness,gBoxHeight);
} 

// lip of box
difference () {
    tCube (gWallThickness/2,gWallThickness/2,gBoxHeight, gBoxLength-gWallThickness,gBoxWidth-gWallThickness,1.5);
    tCube (gWallThickness, gWallThickness, gBoxHeight, gBoxLength-gWallThickness*2,gBoxWidth-gWallThickness*2,1.5);
}

//tab 1
difference() {
    tCube(gBoxLength/2-5, gWallThickness, gBoxHeight - 3, 10, 2, 8); 
    tCube(gBoxLength/2-5, gWallThickness, gBoxHeight + 1.5, 10, 0.5, 2);
}
translate ([gBoxLength/2-5,gWallThickness,gBoxHeight+4]) rotate([0, 90, 0])  {cylinder(h=10, r1 = 1, r2 = 1,, $fn=30);}
//tab 2
difference() {
    tCube(gBoxLength/2-5, gBoxWidth-gWallThickness-2, gBoxHeight - 3, 10, 2, 8); 
    tCube(gBoxLength/2-5, gBoxWidth-gWallThickness-0.5, gBoxHeight+1.5, 10, 0.5, 2);
}
translate ([gBoxLength/2-5,gBoxWidth-gWallThickness,gBoxHeight+4]) rotate([0, 90, 0])  {cylinder(h=10, r1 = 1, r2 = 1, $fn=30);}


// The Lid

difference() {
    tCube(0, gBoxWidth+10, 0, gBoxLength, gBoxWidth, gLidHeight);
    // remove the main part
    tCube(gWallThickness, gBoxWidth+10+gWallThickness, 0, gBoxLength-2*gWallThickness, gBoxWidth-2*gWallThickness, gLidHeight);
    //Create the lip 1 mm lip
    tCube(0.9, gBoxWidth+10+0.9, gLidHeight-1.5, gBoxLength-1.8, gBoxWidth-1.8, 2);
    //Create the indent for the latch
    translate ([gBoxLength/2-5.5,gBoxWidth+10+gWallThickness,3]) rotate([0, 90, 0])  {cylinder(h=11, r1 = 1.1, r2 = 1.1, $fn=30);}
    translate ([gBoxLength/2-5.5,gBoxWidth*2+10-gWallThickness,3]) rotate([0, 90, 0])  {cylinder(h=11, r1 = 1.1, r2 = 1.1, $fn=30);}

}


translate ([0, gBoxWidth+10, 0]) linear_extrude(height = 1.5) {honeycomb(gBoxLength,gBoxWidth,7,2);}
