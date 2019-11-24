//EndCap_Print();
AluX = 40;
AluY = 20;
AluThickness = 1.8;
EndCapGraps = 3;
EndCapWallThickness = 2;
EndCapThickness = 3;



_WallLengthX = AluX-2*AluThickness-2*EndCapWallThickness;
_WallLengthY = AluY-2*AluThickness-2*EndCapWallThickness;


_Height = (EndCapGraps+1)*2*EndCapWallThickness;

EndCap_Print();

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
			cube([AluX, AluY, EndCapThickness], center=true);
			//Walls
            
			rotate([0,0,0*90])
            translate([	0,
                        0.5*AluY-2*EndCapWallThickness-AluThickness,
                        EndCapThickness])
            _wall(_WallLengthX);
            rotate([0,0,1*90])
            translate([	0,
                        0.5*AluX-2*EndCapWallThickness-AluThickness,
                        EndCapThickness])
            _wall(_WallLengthY);
            rotate([0,0,2*90])
            translate([	0,
                        0.5*AluY-2*EndCapWallThickness-AluThickness,
                        EndCapThickness])
            _wall(_WallLengthX);
            rotate([0,0,3*90])
            translate([	0,
                        0.5*AluX-2*EndCapWallThickness-AluThickness,
                        EndCapThickness])
            _wall(_WallLengthY); 
		}/*
		union()
		{
			_EndCapCut(AluX,AluY);
			rotate([0,0,90])
			_EndCapCut(AluY,AluX);
		}*/
	}
}

module _wall(length)
{
	//translate([	0,
	//				0.5*AluWidth-2*EndCapWallThickness-AluThickness,
	//				EndCapThickness])
	union()
	{
		translate([-0.5*length,0,0])
		cube([length, EndCapWallThickness, _Height]);
		_support(length);
		for ( i = [0 : EndCapGraps-1] )
		{
			  translate([0,0,i*2*EndCapWallThickness]) _wedge(length); 
		}
	}
}

module _wedge(length)
{
	translate([length*0.5,EndCapWallThickness,0])
	rotate([0,-90,0])
	linear_extrude(height=length)
	polygon(points=[[0,0],
					[EndCapWallThickness,EndCapWallThickness],
					[2*EndCapWallThickness,0]],paths=[ [0,1,2] ]);
}

module _support(length)
{
	rotate([0,0,180])
	translate([length*0.5-EndCapWallThickness+0.1,0,0])
	rotate([0,-90,0])
	linear_extrude(height=length-2*EndCapWallThickness+0.2)
	polygon(points=[[0,0],
					[EndCapWallThickness*2,0],
					[0,EndCapWallThickness*2]],paths=[ [0,1,2] ]);
}

module _EndCapCut(length, dist)
{
	translate([0,0,EndCapThickness+2*EndCapWallThickness])
	rotate([90,0,0])
	translate([0,0,-0.5*dist-EndCapWallThickness-0.1])
	linear_extrude(height=dist+2*EndCapWallThickness+0.2)
	polygon(points=[[0,0],
					[-0.5*length,_Height],
					[0.5*length,_Height]],paths=[ [0,1,2] ]);
}


