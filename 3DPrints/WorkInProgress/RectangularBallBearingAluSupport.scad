SizeX = 30;
SizeY = 30;
SizeZ = 10;
BearingAxleD = 3;
BearingOuterD = 8;
BearingWidth = 3;
BearingClearance = 0.5;
BearingSideClearance = BearingClearance;
BearingMountD = 4;
AluSizeX = 10;
AluSizeY = 10;
AluClearance = 1;
AxleXLength = 14;
AxleYLength = 14;
AxleXBallBearingDist = 6;
AxleYBallBearingDist = 6;
AxleXDistAdjust = -0.1;
AxleYDistAdjust = -0.1;
BoltXDist = 20;
BoltYDist = 20;
BoltDiameter = 3;
PrintSizeAdjust = 0.4;




RectangularAluSupport(  SizeX,
                        SizeY,
                        SizeZ,
                        BearingAxleD,
                        BearingOuterD,
                        BearingWidth,
                        BearingClearance,
                        BearingSideClearance,
                        BearingMountD,
                        AluSizeX,
                        AluSizeY,
                        AluClearance,
                        AxleXLength,
                        AxleYLength,
                        AxleXBallBearingDist,
                        AxleYBallBearingDist,
                        AxleXDistAdjust,
                        AxleYDistAdjust,
                        BoltXDist,
                        BoltYDist,
                        BoltDiameter,
                        PrintSizeAdjust  );

use <BallBearingCutAways.scad>;

module RectangularAluSupport(   sizeX,
                                sizeY,
                                sizeZ,
                                bearingAxleD,
                                bearingOuterD,
                                bearingWidth,
                                bearingClearance,
                                bearingSideClearance,
                                bearingMountD,
                                aluSizeX,
                                aluSizeY,
                                aluClearance,
                                axleXLength,
                                axleYLength,
                                axleXBallBearingDist,
                                axleYBallBearingDist,
                                axleXDistAdjust,
                                axleYDistAdjust,
                                boltXDist,
                                boltYDist,
                                boltDiameter,
                                printSizeAdjust  )
{
    difference()
    {
        translate([0,0,-0.25*sizeZ])
        cube([sizeX-printSizeAdjust, sizeY-printSizeAdjust, 0.5*sizeZ],center=true);
        cube([  AluSizeX+2*AluClearance+printSizeAdjust,
                AluSizeY+2*AluClearance+printSizeAdjust,
                sizeZ+2], center = true);
        RectangularDoubleBallBearingGlideCutAway(bearingOuterD+bearingClearance+printSizeAdjust,
                                                 bearingWidth+printSizeAdjust,
                                                 bearingMountD,
                                                 bearingSideClearance+0.5*printSizeAdjust,
                                                 bearingAxleD+printSizeAdjust,
                                                 axleXLength+printSizeAdjust,
                                                 axleYLength+printSizeAdjust,
                                                 axleXBallBearingDist,
                                                 axleYBallBearingDist,
                                                 aluSizeX + bearingOuterD + axleXDistAdjust,
                                                 aluSizeY + bearingOuterD + axleYDistAdjust );
        BoltCut(0.5*boltXDist, 0.5*boltYDist, boltDiameter+printSizeAdjust, sizeZ);
        BoltCut(0.5*boltXDist, -0.5*boltYDist, boltDiameter+printSizeAdjust, sizeZ);
        BoltCut(-0.5*boltXDist, 0.5*boltYDist, boltDiameter+printSizeAdjust, sizeZ);
        BoltCut(-0.5*boltXDist, -0.5*boltYDist, boltDiameter+printSizeAdjust, sizeZ);
    }
}

module BoltCut(xPos, yPos, cutDiameter, sizeZ)
{
    translate([xPos, yPos, -0.5*sizeZ-1])
    cylinder(d=cutDiameter, h=0.5*sizeZ+2, $fn=64);
}