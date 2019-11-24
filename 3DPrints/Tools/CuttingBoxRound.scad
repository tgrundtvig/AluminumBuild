//Adjustments
UnitWidth = 10;
Diameter = 5.6;
HoleAdjust = 0.4;
CutAdjust = 0.0;
WallExtraHeight = 5;
CutWidth = 1;
WallWidth = 10;
BottomHeight = 5;

CuttingBoxRound(5);

module CuttingBoxRound(maxSize)
{
    difference()
    {
        //Box
        cube([UnitWidth*maxSize+2*WallWidth,
              Diameter + 2*WallWidth,
              BottomHeight + Diameter + WallExtraHeight]);
        translate([ WallWidth-0.5*HoleAdjust,
                    WallWidth +0.5*Diameter,
                    BottomHeight+0.5*Diameter])
        rotate([0,90,0])
        cylinder(d=Diameter, h=2*WallWidth + maxSize*UnitWidth, $fn=128);
        for(units = [1:maxSize])   
            //CutSlit
            translate([ UnitWidth*units+WallWidth+CutAdjust,
                        -1,
                        0.5*BottomHeight])
            cube([  CutWidth,
                    Diameter + 2*WallWidth + 2,
                    BottomHeight + UnitWidth + WallExtraHeight]);
    }
}