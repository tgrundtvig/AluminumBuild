BearingInner = 3.4;
BearingOuter = 10;
BearingHeight = 4.4;

BearingFreeRoom = 0.5;
BearingMountThickness = BearingFreeRoom;
BearingMountDiameter = 5;
AluX = 25;
AluY = 25;
FreeRoom = 0.5;
EdgeDist = 3.0;
BoltHoleDiameter = 3.4;
OuterWall = 1;
ModuleXSize = AluX+2*(BearingOuter+BearingFreeRoom+OuterWall);
ModuleYSize = AluY+2*(BearingOuter+BearingFreeRoom+OuterWall);
ModuleDiameter = 70;
ModuleThickness = 12;

AxisXDist = AluX + BearingOuter + 0.0; //Adjust axis dist here
AxisYDist = AluY + BearingOuter + 0.0; //Adjust axis dist here
BoltXDist = AxisXDist;
BoltYDist = AxisYDist;

ModuleBottom();
//cube([AluX, AluY, 30], center=true);
//BallBearingCutAway();

module ModuleBottom()
{
    difference()
    {
        translate([0,0,-0.25*ModuleThickness])
        //cylinder(d=ModuleDiameter, h=0.5*ModuleThickness, center=true, $fn=128);
        cube([ModuleXSize,ModuleYSize, 0.5*ModuleThickness], center=true);
        cube([AluX+2*FreeRoom, AluY+2*FreeRoom, ModuleThickness + 2], center = true);

        translate([0.5*BoltXDist,0.5*BoltYDist,0])
        cylinder(d=BoltHoleDiameter, h=ModuleThickness+1, center=true, $fn=128);
        translate([0.5*BoltXDist,-0.5*BoltYDist,0])
        cylinder(d=BoltHoleDiameter, h=ModuleThickness+1, center=true, $fn=128);
        translate([-0.5*BoltXDist,0.5*BoltYDist,0])
        cylinder(d=BoltHoleDiameter, h=ModuleThickness+1, center=true, $fn=128);
        translate([-0.5*BoltXDist,-0.5*BoltYDist,0])
        cylinder(d=BoltHoleDiameter, h=ModuleThickness+1, center=true, $fn=128);
        
        translate([0.5*AxisXDist,0.5*AluY-0.5*BearingHeight-EdgeDist,0])
        rotate([90,0,0])
        BallBearingCutAway();
        translate([0.5*AxisXDist,-0.5*AluY+0.5*BearingHeight+EdgeDist,0])
        rotate([90,0,0])
        BallBearingCutAway();
        rotate([90,0,0])
        translate([0.5*AxisXDist,0,0])
        cylinder( d=BearingInner,
                  h=AluY+2*FreeRoom,
                  center=true,
                  $fn=128 );
        
        translate([-0.5*AxisXDist,0.5*AluY-0.5*BearingHeight-EdgeDist,0])
        rotate([90,0,0])
        BallBearingCutAway();
        translate([-0.5*AxisXDist,-0.5*AluY+0.5*BearingHeight+EdgeDist,0])
        rotate([90,0,0])
        BallBearingCutAway();
        rotate([90,0,0])
        translate([-0.5*AxisXDist,0,0])
        cylinder( d=BearingInner,
                  h=AluY+2*FreeRoom,
                  center=true,
                  $fn=128 );
                  
        translate([0.5*AluX-0.5*BearingHeight-EdgeDist,0.5*AxisYDist,0])
        rotate([0,90,0])
        BallBearingCutAway();
        translate([-0.5*AluX+0.5*BearingHeight+EdgeDist,0.5*AxisYDist,0])
        rotate([0,90,0])
        BallBearingCutAway();
        translate([0,0.5*AxisYDist,0])
        rotate([0,90,0])
        cylinder( d=BearingInner,
                  h=AluX+2*FreeRoom,
                  center=true,
                  $fn=128 );
        
        translate([0.5*AluX-0.5*BearingHeight-EdgeDist,-0.5*AxisYDist,0])
        rotate([0,90,0])
        BallBearingCutAway();
        translate([-0.5*AluX+0.5*BearingHeight+EdgeDist,-0.5*AxisYDist,0])
        rotate([0,90,0])
        BallBearingCutAway();
        translate([0,-0.5*AxisYDist,0])
        rotate([0,90,0])
        cylinder( d=BearingInner,
                  h=AluX+2*FreeRoom,
                  center=true,
                  $fn=128 );         
    }
              
}

module BallBearingCutAway()
{
    dia = BearingOuter+2*BearingFreeRoom;
    height = BearingHeight+2*BearingMountThickness;
    difference()
    {
        cylinder(   d=dia,
                    h=height,
                    center=true,
                    $fn=128 );
        
        //Mounts
        translate([0,0,0.5*height-BearingMountThickness])
        hull()
        {
            cylinder(   d=BearingMountDiameter,
                        h=0.1,
                        $fn=128);
            translate([0,0,BearingMountThickness+1])
            cylinder(   d=BearingMountDiameter+2*(BearingMountThickness+1),
                        h=0.1,
                        $fn=128);
        }
        translate([0,0,-0.5*height-1.1])
        hull()
        {
            cylinder(   d=BearingMountDiameter+2*(BearingMountThickness+1),
                        h=0.1,
                        $fn=128);
            translate([0,0,BearingMountThickness+1])
            cylinder(   d=BearingMountDiameter,
                        h=0.1,
                        $fn=128);
        }
    }
}
