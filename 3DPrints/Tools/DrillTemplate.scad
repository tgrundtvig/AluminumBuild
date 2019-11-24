//Adjustments
AluWidth = 15;
HoleDiameter = 5.4;
HoleAdjust = 0.4;
WallWidth = 2;
WallHeight = 0.5*AluWidth;
BottomHeight = 20;

DrillTemplate(10);

module DrillTemplate(maxSize)
{
    difference()
    {
        //Box
        cube([AluWidth*maxSize+2*WallWidth,
              AluWidth + 2*WallWidth,
              BottomHeight + WallHeight]);
        translate([WallWidth-0.5*HoleAdjust, WallWidth-0.5*HoleAdjust,BottomHeight])
        cube([AluWidth*maxSize+HoleAdjust,
              AluWidth+HoleAdjust,
              WallHeight+1]);
        
        for(units = [1:maxSize])   
            //CutSlit
            translate([WallWidth + AluWidth*units - 0.5*AluWidth,
                       WallWidth + 0.5*AluWidth,
                       -1])
            cylinder(d=HoleDiameter, h= 1 + AluWidth + BottomHeight, $fn=64);
    }
}