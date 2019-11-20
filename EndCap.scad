include <XYZPrinter_config.scad>

EndCap_Print();

_WallLength = AluWidth-2*AluThickness-2*EndCapWallThickness;   
_Height = (EndCapGraps+1)*2*EndCapWallThickness;

module EndCap()
{
	translate([0,0,-EndCapThickness])
	EndCap_Print();
}


module EndCap_Print()
{
	difference()
	{
		union()
		{
			//Bottom
			translate([0,0,0.5*EndCapThickness])
			cube([AluWidth, AluWidth, EndCapThickness], center=true);
			//Walls
			for ( i = [0 : 3] )
			{
				rotate([0,0,i*90]) _wall(); 
			}
		}
		union()
		{
			_EndCapCut();
			rotate([0,0,90])
			_EndCapCut();
		}
	}
}

module _wall()
{
	translate([	0,
					0.5*AluWidth-2*EndCapWallThickness-AluThickness,
					EndCapThickness])
	union()
	{
		translate([-0.5*_WallLength,0,0])
		cube([_WallLength, EndCapWallThickness, _Height]);
		_support();
		for ( i = [0 : EndCapGraps-1] )
		{
			  translate([0,0,i*2*EndCapWallThickness]) _wedge(); 
		}
	}
}

module _wedge()
{
	translate([_WallLength*0.5,EndCapWallThickness,0])
	rotate([0,-90,0])
	linear_extrude(height=_WallLength)
	polygon(points=[[0,0],
					[EndCapWallThickness,EndCapWallThickness],
					[2*EndCapWallThickness,0]],paths=[ [0,1,2] ]);
}

module _support()
{
	rotate([0,0,180])
	translate([_WallLength*0.5-EndCapWallThickness+0.1,0,0])
	rotate([0,-90,0])
	linear_extrude(height=_WallLength-2*EndCapWallThickness+0.2)
	polygon(points=[[0,0],
					[EndCapWallThickness*2,0],
					[0,EndCapWallThickness*2]],paths=[ [0,1,2] ]);
}

module _EndCapCut()
{
	translate([0,0,EndCapThickness+2*EndCapWallThickness])
	rotate([90,0,0])
	translate([0,0,-0.5*_WallLength-EndCapWallThickness-0.1])
	linear_extrude(height=_WallLength+2*EndCapWallThickness+0.2)
	polygon(points=[[0,0],
					[-0.5*_WallLength,_Height],
					[0.5*_WallLength,_Height]],paths=[ [0,1,2] ]);
}


