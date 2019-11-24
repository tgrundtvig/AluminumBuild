ModuleD = 60;
ModuleZSize = 15;
AluSizeX = 25;
AluSizeY = 25;
DrillGuideD = 8;
AluClearance = 0.5;
BoltXDist = 35;
BoltYDist = 35;
BoltDiameter = 3;
PrintSizeAdjust = 0.4;


/*
ModuleD = 40;
ModuleZSize = 10;
AluSizeX = 10;
AluSizeY = 10;
DrillGuideD = 4.8;
AluClearance = 0.5;
BoltXDist = 20;
BoltYDist = 20;
BoltDiameter = 3;
PrintSizeAdjust = 0.4;
*/


DrillGuideModule(  ModuleD,
                   ModuleZSize,
                   AluSizeX,
                   AluSizeY,
                   DrillGuideD,
                   AluClearance,
                   BoltXDist,
                   BoltYDist,
                   BoltDiameter,
                   PrintSizeAdjust  );

module DrillGuideModule(moduleD,
                        moduleZSize,
                        aluSizeX,
                        aluSizeY,
                        drillGuideD,
                        aluClearance,
                        boltXDist,
                        boltYDist,
                        boltDiameter,
                        printSizeAdjust  )
{
    difference()
    {
        translate([0,0,-0.5*moduleZSize])
        cylinder(d=moduleD-printSizeAdjust, h=0.5*moduleZSize,$fn=128);
        cube([  AluSizeX+2*AluClearance+printSizeAdjust,
                AluSizeY+2*AluClearance+printSizeAdjust,
                moduleZSize+2], center=true);
        rotate([90,0,0])
        cylinder(d=drillGuideD, h=1.1*moduleD, center=true, $fn=64);
        rotate([0,90,0])
        cylinder(d=drillGuideD, h=1.1*moduleD, center=true, $fn=64);
        BoltCut(0.5*boltXDist, 0.5*boltYDist, boltDiameter+printSizeAdjust, moduleZSize);
        BoltCut(0.5*boltXDist, -0.5*boltYDist, boltDiameter+printSizeAdjust, moduleZSize);
        BoltCut(-0.5*boltXDist, 0.5*boltYDist, boltDiameter+printSizeAdjust, moduleZSize);
        BoltCut(-0.5*boltXDist, -0.5*boltYDist, boltDiameter+printSizeAdjust, moduleZSize);
        
    }
}

module BoltCut(xPos, yPos, cutDiameter, sizeZ)
{
    translate([xPos, yPos, -0.5*sizeZ-1])
    cylinder(d=cutDiameter, h=0.5*sizeZ+2, $fn=64);
}