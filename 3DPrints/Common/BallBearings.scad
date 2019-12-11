

LM8UU();


module LM8UU()
{
	_LinearBallBearing(15.6,24.6,0.8,0.4, 16.25);
}

module _LinearBallBearing(	diameter,
                            height,
                            groove_width,
                            groove_depth,
                            groove_distance)
{
	difference()
	{
		cylinder(d=diameter, h=height, $fn=64, center=true);
		union()
		{
			translate([0,0,-groove_distance*0.5])
			_Ring(diameter+0.1, diameter-2*groove_depth, groove_width);
			translate([0,0,groove_distance*0.5])
			_Ring(diameter+0.1, diameter-2*groove_depth, groove_width);
		}
	}
}

module _Ring(outer, inner, height)
{
	difference()
	{
		cylinder(d=outer, h=height, $fn=64, center=true);
		cylinder(d=inner, h=height+0.1, $fn=64, center=true);
	}
}