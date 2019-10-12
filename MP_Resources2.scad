Length = 210;
Width = 120;
Height = 37;
Lid = "Yes";
Rows = 2;
Cells = [33,64,49,49,0];
CellDepth = [12,12,15,15,15];

// internal fixed
Thicklid = 3;
BoxRound = 2;
TrayRound = 5;

$fn = 50;

EdgeBuffer = 3;
RailBuffer = 7;

TraySpacing = 3;

if (Lid == "Yes") 
   {RailBuffer = 5;}
else
  {RailBuffer = EdgeBuffer;}

TrayWidth = (Width-2*RailBuffer-(TraySpacing*(Rows-1)))/Rows;
echo(TrayWidth);

// Recursive call to sum the array
function SumOffset(ipPos) = 
  (ipPos==0) ? EdgeBuffer : (Cells[ipPos-1] + TraySpacing + SumOffset(ipPos-1));


difference() {
    // Create the main box
    translate([BoxRound,BoxRound,0]) minkowski() {cube([Length-2*BoxRound,Width-2*BoxRound,Height-BoxRound]);sphere(BoxRound); }
    // cut off the rounded bottom
    translate([-500,-500,-100]) cube([1000,1000,100]); 

   // Subtract out the cups with rounded sides      
    union ()
    {
        for (x = [0 : 4])
        {          
          if (Cells[x] > 0) for (y = [0 : Rows-1])
          {
             translate ([SumOffset(x), RailBuffer + (TraySpacing+TrayWidth)*y, CellDepth[x]]) 
             translate([TrayRound,TrayRound,0]) minkowski()
             {  
               cube([Cells[x]-(2*TrayRound),TrayWidth-(2*TrayRound),Height]); 
               sphere(TrayRound); 
             } 
          }
        }
    }
    
    
// remove the lid rails
   translate([0,0,Height+ 0.2])
    union() {
       difference() {
       translate ([0,0,-8]) cube([Length,5,8]);
       translate([Length/2,6,-4]) rotate([45,0,0]) cube([Length,5.5,5.5], center=true);
       }
       
       difference() {
       translate([0,Width-5,-8]) cube([Length,5,8]);
       translate([Length/2,Width-6,-4]) rotate([45,0,0]) cube([Length,5.5,5.5], center=true);
       }
    }
}


