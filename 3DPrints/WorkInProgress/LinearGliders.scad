use <BallBearingCutAways.scad>;

difference()
{
    translate([0,0,-2.5])
    cube([50,50,5],center=true);
    RectangularDoubleBallBearingGlideCutAway(cutOuterD = 9,
                                             cutCenterHeight = 3.4,
                                             mountD = 4,
                                             mountHeight = 0.5,
                                             axleD = 3.4,
                                             axleXLength = 25,
                                             axleYLength = 25,
                                             axleXBallBearingDist = 17,
                                             axleYBallBearingDist = 17,
                                             axleDistX = 32.8,
                                             axleDistY = 32.8);
    cube([27,27,30], center=true);
    translate([20,20,0])
    cylinder(d=3.4, h=30, center=true, $fn=64);
    translate([20,-20,0])
    cylinder(d=3.4, h=30, center=true, $fn=64);
    translate([-20,20,0])
    cylinder(d=3.4, h=30, center=true, $fn=64);
    translate([-20,-20,0])
    cylinder(d=3.4, h=30, center=true, $fn=64);
}