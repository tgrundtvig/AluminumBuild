_ScrewLength = 5;
_ScrewDiameter = 3.8;
_AluWidth = 25;
_WheelDiameter = 96;
_BoltDiameter = 6.8;
_Tolerance = 0.2;

//EncoderMount2();
//Concept();
//BallBearingMount();
Encoder();
module Encoder()
{
	translate([0,0,-30])
	union()
	{
		cylinder(d=38.8, h=30, $fn=64);
		translate([0,0,29.9])
		cylinder(d=20.8, h=5.1, $fn=64);
		translate([0,0,34.9])
		cylinder(d=6.8, h=13.1, $fn=32);

		rotate([0,0,120])
		translate([15.0111,0,29.9])
		cylinder(d=_ScrewDiameter, h=_ScrewLength, $fn=32);
		rotate([0,0,240])
		translate([15.0111,0,29.9])
		cylinder(d=_ScrewDiameter, h=_ScrewLength, $fn=32);
		translate([15.0111,0,29.9])
		cylinder(d=_ScrewDiameter, h=_ScrewLength, $fn=32);
	}
}

module Wheel()
{
	cylinder(d=_WheelDiameter, h=15, $fn=64);
}

module Concept()
{
	rotate([90,0,-90])
	union()
	{
		EncoderMount();
		translate([0,0,3])
		rotate([180,0,0])
		Encoder();
		translate([0,0,-18])
		Wheel();
	}
}

module BallBearingMount()
{
	translate([0,0,4.5])
	difference()
	{
		union()
		{
			cube([3*_AluWidth, _AluWidth, 9], center=true);
			cylinder(d=30, h=9, $fn=64, center=true);
		}
		union()
		{
			translate([0,0,1+0.5*_Tolerance])
			cylinder(d=22.4, h=7+_Tolerance, $fn=64, center=true);
			cylinder(d=13, h=0.5*_AluWidth-_Tolerance+0.2, $fn=64, center=true);
			translate([_AluWidth,0,0])
			cylinder(d=_BoltDiameter, h=0.5*_AluWidth-_Tolerance+0.2, $fn=64, center=true);
			translate([-_AluWidth,0,0])
			cylinder(d=_BoltDiameter, h=0.5*_AluWidth-_Tolerance+0.2, $fn=64, center=true);
		}		
	}
}

module Concept2()
{
	rotate([90,0,-90])
	union()
	{
		EncoderMount2();
		translate([0,0,3])
		rotate([180,0,0])
		Encoder();
		translate([0,0,-18])
		Wheel();
	}
}


module EncoderMount()
{
	difference()
	{
		hull()
		{
			cylinder(d=45, h=14, $fn=64);
			//translate([0,-22.5,0])
			//cube([70,45,14]);
			translate([55,0,0])
			cylinder(d=30, h=14, $fn=64);
		}
		union()
		{
			translate([55,0,-0.1])
			cylinder(d=22.4, h=14.2, $fn=64);
			translate([0,0,3])
			rotate([180,0,0])
			Encoder();
		}
	}
}

module EncoderMount2()
{
	difference()
	{
		hull()
		{
			cylinder(d=45, h=10, $fn=64);
			//translate([0,-22.5,0])
			//cube([70,45,14]);
			translate([4*_AluWidth-(_WheelDiameter*0.5),-_AluWidth,0])
			cube([_AluWidth,2*_AluWidth,10]);
		}
		union()
		{
			translate([4.5*_AluWidth-(_WheelDiameter*0.5),0.5*_AluWidth,-0.1])
			cylinder(d=_BoltDiameter, h=10.2, $fn=64);
			translate([4.5*_AluWidth-(_WheelDiameter*0.5),-0.5*_AluWidth,-0.1])
			cylinder(d=_BoltDiameter, h=10.2, $fn=64);
			translate([0,0,3])
			rotate([180,0,0])
			Encoder();
		}
	}
}