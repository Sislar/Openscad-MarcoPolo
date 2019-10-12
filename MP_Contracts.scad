include <Boardgames.scad>

gWidth = 84;
gLength = 115;
gHeight = 46;
gThick = 2;


// Orient 0 = x plane, 1 = Y plane
module Opening(ipX=0,ipY=0, ipH=gHeight, ipR1 = 20, ipR2 = 40, Orient = 0)
{
  if (Orient == 0){  
      translate([ipX,ipY,2])  
      union () {  
      translate([-ipR1/2,0,0]) cube([ipR1,3,ipH]);
      translate([-ipR2/1.4,0,ipH]) difference() {
       rotate([0,45,0]) cube([ipR2,3,ipR2]);   
       cube([ipR2*2,3,ipR2]);
       }
      }
  }
  else{
      translate([ipX-0.5,ipY,2]) rotate([0,0,-90])  
      union () {  
      translate([-ipR1/2,0,0]) cube([ipR1,3,ipH]);
      translate([-ipR2/1.4,0,ipH]) difference() {
       rotate([0,45,0]) cube([ipR2,3,ipR2]);   
       cube([ipR2*2,3,ipR2]);
       }
      }
  }
  
}
  

// row 1   width 45
// contracts 46 92mm - 100 mm
// Characters = 19,  40mm x 70mm length
// city bonus = 54mm x 35 length

//row 2  width only needs to be 30
// starter contracts = 12mmT  44mm L
// Cards 68 length
        // Cards - city actions  11mm  (total 11+5, 7+5, 5+5 = 38) 
        // cards destinations  7 mm
        // cards other 5mm
// compainions 16mm thick,  85mm length  30mm width
        // income spaces 45 mm


difference() {
tray(h=gHeight, y=[45,49,0], x2=[99,75,35,0,0], x1=[48,73,88,0,0]);
// remove one wall for city bonus
tCube(99+75,45,2,35,2,gHeight);
    
    //starter
Opening(ipX=25,ipY=0, ipR1 = 17, ipR2 = 30, Orient = 0);
   // cards
Opening(ipX=48+73/2,ipY=0, ipR1 = 17, ipR2 = 30, Orient = 0);
    //income and companions
Opening(ipX=48+73+44,ipY=0, ipR1 = 17, ipR2 = 30, Orient = 0);
    //Character opening
Opening(ipX=48+73+16,ipY=94, ipR1 = 17, ipR2 = 30, Orient = 0); 
    
Opening(ipX=48+73+88,ipY=65, ipR1 = 17, ipR2 = 30, Orient = 1);
Opening(ipX=0,ipY=70, ipR1 = 17, ipR2 = 30, Orient = 1);

}

//spacer for starter contracts
tCube(gThick,30,0,47,15,gHeight);

// Fix up the area for the city bonus tiles
tCube(49+72,36,0,88,2,gHeight);
tCube(49+72,36,0,55,11,gHeight);
difference() {
        tCube(176,36,0,35,60,gHeight);
        translate([210,66,10]) cylinder (h=gHeight, r1=35,r2=35);
}


// add spacers for the cards
difference() {
    tCube(49,11,0,72,2,gHeight);
    Opening(ipX=48+73/2,ipY=11, ipR1 = 15, ipR2 = 30, Orient = 0);
}
difference() {
    tCube(49,11+14,0,72,2,gHeight);
    Opening(ipX=48+73/2,ipY=11+14, ipR1 = 15, ipR2 = 30, Orient = 0);
}

// create space for the income tiles
tCube(49+72,0,0,19,36,25);
tCube(49+72+70,0,0,19,36,25);
tCube(49+72+19,30,0,52,7,25);

    
    
    
