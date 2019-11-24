/*
Leg(StartHole=2,
    NumberOfHoles=3,
    UnitSize=10,
    PrintSizeAdjust=0.4,
    BoltHoleD=3.4);
*/
BallBearingHinge(   HingeD=16,
                    BallBearingOuterD=10,
                    BallBearingInnerD=8,
                    BallBearingHeight=4.2,
                    FirstLegHole = 2,
                    LegLengthN = 3,
                    LegLengthE = 2,
                    LegLengthS = 4,
                    LegLengthW = 5,
                    UnitSize=10,
                    BoltHoleD=3.4,
                    PrintSizeAdjust=0.4);


module BallBearingHinge(HingeD,
                        BallBearingOuterD,
                        BallBearingInnerD,
                        BallBearingHeight,
                        FirstLegHole,
                        LegLengthN,
                        LegLengthE,
                        LegLengthS,
                        LegLengthW,
                        UnitSize,
                        BoltHoleD,
                        PrintSizeAdjust)
{
    difference()
    {
        union()
        {
            cylinder(d=HingeD, h=UnitSize-PrintSizeAdjust,$fn=64);
            Leg(FirstLegHole,LegLengthE,UnitSize,PrintSizeAdjust, BoltHoleD);
            rotate([0,0,90])
            Leg(FirstLegHole,LegLengthN,UnitSize,PrintSizeAdjust, BoltHoleD);
            rotate([0,0,180])
            Leg(FirstLegHole,LegLengthW,UnitSize,PrintSizeAdjust, BoltHoleD);
            rotate([0,0,270])
            Leg(FirstLegHole,LegLengthS,UnitSize,PrintSizeAdjust, BoltHoleD);
        }
        cylinder(d=BallBearingInnerD, h=UnitSize*3, center=true, $fn=64);
        translate([0,0,UnitSize-BallBearingHeight-0.5*PrintSizeAdjust])
        cylinder(d=BallBearingOuterD, h=BallBearingHeight+2, $fn=64);
    }
}

module Leg( StartHole,
            NumberOfHoles,
            UnitSize,
            PrintSizeAdjust,
            BoltHoleD)
{
    difference()
    {
        Size = StartHole+NumberOfHoles-1;
        translate([ 0.5*(Size*UnitSize-PrintSizeAdjust),
                    0,
                    0.5*(UnitSize-PrintSizeAdjust)])
        cube([  Size*UnitSize-PrintSizeAdjust,
                UnitSize-PrintSizeAdjust,
                UnitSize-PrintSizeAdjust],  center=true);
        for(i=[StartHole:StartHole+NumberOfHoles-1])
        {
            translate([(i-0.5)*UnitSize,0,0])
            cylinder(d=BoltHoleD, h=3*UnitSize, center=true, $fn=32);
            translate([(i-0.5)*UnitSize,0,0.5*UnitSize])
            rotate([90,0,0])
            cylinder(d=BoltHoleD, h=3*UnitSize, center=true, $fn=32);
        } 
    }
}

module DoubleBallBearingHinge(  HingeD,
                                BallBearingOuterD,
                                BallBearingInnerD,
                                BallBearingHeight,
                                UnitSize,
                                BoltHoleD,
                                PrintSizeAdjust)
{
    difference()
    {
        union()
        {
            translate([0,3*UnitSize,0])
            cube([3*UnitSize-PrintSizeAdjust, 7*UnitSize-PrintSizeAdjust, UnitSize],center=true);
            translate([0.5*UnitSize,0,0])
            rotate([0,90,0])
            cylinder(d=HingeD, h= UnitSize-0.5*PrintSizeAdjust,$fn=64);
            translate([-0.5*UnitSize,0,0])
            rotate([0,-90,0])
            cylinder(d=HingeD, h= UnitSize-0.5*PrintSizeAdjust,$fn=64);
        }
        cube([UnitSize+PrintSizeAdjust,5*UnitSize+PrintSizeAdjust,2*UnitSize],center=true);
        translate([0,6*UnitSize,0])
        cube([UnitSize+PrintSizeAdjust,5*UnitSize+PrintSizeAdjust,2*UnitSize],center=true);
        for(i=[1:6])
        {
            translate([0,i*UnitSize,0])
            rotate([0,90,0])
            cylinder(d=BoltHoleD,h=4*UnitSize,center=true,$fn=64);
        }
        for(i=[1:6])
        {
            translate([UnitSize,i*UnitSize,0])
            cylinder(d=BoltHoleD,h=4*UnitSize,center=true,$fn=64);
        }
        for(i=[1:6])
        {
            translate([-UnitSize,i*UnitSize,0])
            cylinder(d=BoltHoleD,h=4*UnitSize,center=true,$fn=64);
        }
        translate([0,3*UnitSize,0])
        cylinder(d=BoltHoleD,h=4*UnitSize,center=true,$fn=64);
    }
}