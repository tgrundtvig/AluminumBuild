//Adjustments
AluWidth = 10;
HoleAdjust = 0.4;
CutAdjust = 0.0;
WallExtraHeight = 10;
CutWidth = 1;
WallWidth = 20;
BottomHeight = 10;

CuttingBox(20);

module CuttingBox(maxSize)
{
    difference()
    {
        //Box
        cube([AluWidth*maxSize+2*WallWidth,
              AluWidth + 2*WallWidth,
              BottomHeight + AluWidth + WallExtraHeight]);
        translate([WallWidth-0.5*HoleAdjust, WallWidth-0.5*HoleAdjust,BottomHeight])
        cube([AluWidth*maxSize+2*WallWidth,
              AluWidth+HoleAdjust,
              BottomHeight + AluWidth + WallExtraHeight]);
        for(units = [1:maxSize])   
            //CutSlit
            translate([ AluWidth*units+WallWidth+CutAdjust,
                        -1,
                        0.5*BottomHeight])
            cube([  CutWidth,
                    AluWidth + 2*WallWidth + 2,
                    BottomHeight + AluWidth + WallExtraHeight]);
    }
}