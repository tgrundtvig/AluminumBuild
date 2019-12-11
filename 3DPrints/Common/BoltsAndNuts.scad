
_SuperTight = 0.4;
_Tight = 0.6;
_Loose = 1.0;

BoltWashersAndNut(10,3.5,16,0.5,6,50);
cube([10,10,50]);


module M3Loose(length, center=false)
{
    cylinder(d=3 + _Loose, h=length, $fn=64, center=center);
}

module M3Tight(length, center=false)
{
    cylinder(d=3 + _Tight, h=length, $fn=64, center=center);
}

module M3SuperTight(length, center=false)
{
    cylinder(d=3 + _SuperTight, h=length, $fn=64, center=center);
}

module M4Loose(length, center=false)
{
    cylinder(d=4 + _Loose, h=length, $fn=64, center=center);
}

module M4Tight(length, center=false)
{
    cylinder(d=4 + _Tight, h=length, $fn=64, center=center);
}

module M4SuperTight(length, center=false)
{
    cylinder(d=4 + _SuperTight, h=length, $fn=64, center=center);
}

module M5Loose(length, center=false)
{
    cylinder(d=5 + _Loose, h=length, $fn=64, center=center);
}

module M5Tight(length, center=false)
{
    cylinder(d=5 + _Tight, h=length, $fn=64, center=center);
}

module M5SuperTight(length, center=false)
{
    cylinder(d=5 + _SuperTight, h=length, $fn=64, center=center);
}


module M6Loose(length, center=false)
{
    cylinder(d=6 + _Loose, h=length, $fn=64, center=center);
}

module M6Tight(length, center=false)
{
    cylinder(d=6 + _Tight, h=length, $fn=64, center=center);
}

module M6SuperTight(length, center=false)
{
    cylinder(d=6 + _SuperTight, h=length, $fn=64, center=center);
}

module M8Loose(length, center=false)
{
    cylinder(d=8 + _Loose, h=length, $fn=64, center=center);
}

module M8Tight(length, center=false)
{
    cylinder(d=8 + _Tight, h=length, $fn=64, center=center);
}

module M8SuperTight(length, center=false)
{
    cylinder(d=8 + _SuperTight, h=length, $fn=64, center=center);
}

module M10Loose(length, center=false)
{
    cylinder(d=10 + _Loose, h=length, $fn=64, center=center);
}

module M10Tight(length, center=false)
{
    cylinder(d=10 + _Tight, h=length, $fn=64, center=center);
}

module M10SuperTight(length, center=false)
{
    cylinder(d=10 + _SuperTight, h=length, $fn=64, center=center);
}

module M3SquareNut(center=false)
{
    if(center)
    {
        cube([5.8,5.8,2.8], center=true);
    }
    else
    {
        translate([0,0,1.4])
        cube([5.8,5.8,2.8], center=true);
    }
}

module M3Nut(center = false)
{
    Hexagon(5.5+_Tight,2.4, center);
}

module M4Nut(center = false)
{
    Hexagon(7+_Tight,3.2,center);
}

module M5Nut(center = false)
{
    Hexagon(8+_Tight,4,center);
}

module M6Nut(center = false)
{
    Hexagon(10+_Tight,5,center); 
}

module M8Nut(center = false)
{
    Hexagon(13+_Tight,6.5,center);
}

module M10Nut(center = false)
{
    Hexagon(17+_Tight,8,center);
}


module Washer(Diameter, Width)
{
	cylinder(d=Diameter,h=Width);	
}

module Hexagon(width, height, center=false)
{
	cylinder(d=width*1.15473,h=height,$fn=6, center=center);
}

module HexBolt(HeadWidth, HeadHeight, Diameter, Length)
{
	translate([0,0,-HeadHeight])
	Hexagon(HeadWidth, HeadHeight);
	cylinder(d=Diameter,h=Length,$fn=64);
}

module BoltWashersAndNut(	HeadWidth,
                            HeadHeight,
                            WasherDiameter,
                            WasherWidth,
                            Diameter,
                            Span	)
{
	union()
	{
		translate([0,0,-WasherWidth])
		Washer(WasherDiameter, WasherWidth);
		translate([0,0,-WasherWidth])
		HexBolt(HeadWidth, HeadHeight, Diameter, Span + 2*HeadHeight);
		translate([0,0,Span])
		Washer(WasherDiameter, WasherWidth);
		translate([0,0,Span + WasherWidth])
		Hexagon(HeadWidth,HeadHeight);
	}
}