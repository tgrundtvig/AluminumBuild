
/*
RectangularSingleBallBearingGlideCutAway(   cutOuterD = 11,
                                         cutCenterHeight = 4.4,
                                         mountD = 5.4,
                                         mountHeight = 0.5,
                                         axleD = 3.4,
                                         axleXLength = 25,
                                         axleYLength = 20,
                                         axleDistX = 25,
                                         axleDistY = 35);
*/

RoundBallBearingGlideCutAway(   cutOuterD = 11,
                                 cutCenterHeight = 4.4,
                                 mountD = 5.4,
                                 mountHeight = 0.5,
                                 axleD = 3.4,
                                 axleLength = 15,
                                 axleDist = 50,
                                 numberOfSupports = 8);

//TwoAxleDoubleBallBearingGlideCutAway(12,5,7,0.5,5,30,15,37);

module BallBearingCutAway(cutOuterD, cutCenterHeight, mountD, mountHeight)
{
    cutHeight = cutCenterHeight+2*mountHeight;
    difference()
    {
        cylinder(   d=cutOuterD,
                    h=cutHeight,
                    center=true,
                    $fn=128 );
        
        //Mounts
        translate([0,0,0.5*cutHeight-mountHeight])
        hull()
        {
            cylinder(   d=mountD,
                        h=0.1,
                        $fn=128);
            translate([0,0,mountHeight+0.1])
            cylinder(   d=mountD+2*(mountHeight+0.1),
                        h=0.1,
                        $fn=128);
        }
        translate([0,0,-0.5*cutHeight-0.2])
        hull()
        {
            cylinder(   d=mountD+2*(mountHeight+0.1),
                        h=0.1,
                        $fn=128);
            translate([0,0,mountHeight+0.1])
            cylinder(   d=mountD,
                        h=0.1,
                        $fn=128);
        }
    }
}

module SingleBallBearingOnAxleCutAway(  cutOuterD,
                                        cutCenterHeight,
                                        mountD,
                                        mountHeight,
                                        axleD,
                                        axleLength)
{
    BallBearingCutAway(cutOuterD, cutCenterHeight, mountD, mountHeight);
    cylinder(d=axleD,h=axleLength, center=true, $fn=128);
}

module DoubleBallBearingOnAxleCutAway(  cutOuterD,
                                        cutCenterHeight,
                                        mountD,
                                        mountHeight,
                                        axleD,
                                        axleLength,
                                        ballBearingDist)
{
    translate([0,0,0.5*ballBearingDist])
    BallBearingCutAway(cutOuterD, cutCenterHeight, mountD, mountHeight);
    translate([0,0,-0.5*ballBearingDist])
    BallBearingCutAway(cutOuterD, cutCenterHeight, mountD, mountHeight);
    cylinder(d=axleD,h=axleLength, center=true, $fn=128);
}

module TwoAxleSingleBallBearingGlideCutAway(cutOuterD,
                                            cutCenterHeight,
                                            mountD,
                                            mountHeight,
                                            axleD,
                                            axleLength,
                                            axleDist)
{
    translate([0,0.5*axleDist,0])
    rotate([0,90,0])
    SingleBallBearingOnAxleCutAway( cutOuterD,
                                    cutCenterHeight,
                                    mountD,
                                    mountHeight,
                                    axleD,
                                    axleLength);
    
    translate([0,-0.5*axleDist,0])
    rotate([0,90,0])
    SingleBallBearingOnAxleCutAway( cutOuterD,
                                    cutCenterHeight,
                                    mountD,
                                    mountHeight,
                                    axleD,
                                    axleLength);
}

module TwoAxleDoubleBallBearingGlideCutAway(cutOuterD,
                                            cutCenterHeight,
                                            mountD,
                                            mountHeight,
                                            axleD,
                                            axleLength,
                                            ballBearingDist,
                                            axleDist)
{
    translate([0,0.5*axleDist,0])
    rotate([0,90,0])
    DoubleBallBearingOnAxleCutAway( cutOuterD,
                                    cutCenterHeight,
                                    mountD,
                                    mountHeight,
                                    axleD,
                                    axleLength,
                                    ballBearingDist,
                                    axleDist);
    
    translate([0,-0.5*axleDist,0])
    rotate([0,90,0])
    DoubleBallBearingOnAxleCutAway( cutOuterD,
                                    cutCenterHeight,
                                    mountD,
                                    mountHeight,
                                    axleD,
                                    axleLength,
                                    ballBearingDist,
                                    axleDist);
}

module RectangularSingleBallBearingGlideCutAway( cutOuterD,
                                                 cutCenterHeight,
                                                 mountD,
                                                 mountHeight,
                                                 axleD,
                                                 axleXLength,
                                                 axleYLength,
                                                 axleDistX,
                                                 axleDistY )
{
    
    TwoAxleSingleBallBearingGlideCutAway(   cutOuterD,
                                            cutCenterHeight,
                                            mountD,
                                            mountHeight,
                                            axleD,
                                            axleXLength,
                                            axleDistX);
    
    rotate([0,0,90])
    TwoAxleSingleBallBearingGlideCutAway(   cutOuterD,
                                            cutCenterHeight,
                                            mountD,
                                            mountHeight,
                                            axleD,
                                            axleYLength,
                                            axleDistY);                                  
}


module RectangularDoubleBallBearingGlideCutAway( cutOuterD,
                                                 cutCenterHeight,
                                                 mountD,
                                                 mountHeight,
                                                 axleD,
                                                 axleXLength,
                                                 axleYLength,
                                                 axleXBallBearingDist,
                                                 axleYBallBearingDist,
                                                 axleDistX,
                                                 axleDistY )
{
    
    TwoAxleDoubleBallBearingGlideCutAway(   cutOuterD,
                                            cutCenterHeight,
                                            mountD,
                                            mountHeight,
                                            axleD,
                                            axleXLength,
                                            axleXBallBearingDist,
                                            axleDistX);
    
    rotate([0,0,90])
    TwoAxleDoubleBallBearingGlideCutAway(   cutOuterD,
                                            cutCenterHeight,
                                            mountD,
                                            mountHeight,
                                            axleD,
                                            axleYLength,
                                            axleYBallBearingDist,
                                            axleDistY);                                  
}

module RoundBallBearingGlideCutAway(cutOuterD,
                                    cutCenterHeight,
                                    mountD,
                                    mountHeight,
                                    axleD,
                                    axleLength,
                                    axleDist,
                                    numberOfSupports)
{
    for(i=[0:numberOfSupports-1])
    {
        rotate([0,0,i*(360/numberOfSupports)])
        translate([0,0.5*axleDist,0])
        rotate([0,90,0])
        SingleBallBearingOnAxleCutAway( cutOuterD,
                                        cutCenterHeight,
                                        mountD,
                                        mountHeight,
                                        axleD,
                                        axleLength);
    } 
}

module BallBearingConnector(ballBearingInnerD,
                            ballBearingHight,
                            mountD,
                            axleD,
                            boltD,
                            boltHeadD,
                            boltHeadHeight,
                            boltDist)
{
}
                            