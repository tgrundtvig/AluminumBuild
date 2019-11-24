
number_of_teeth = 60;
toothed_part_length = 6;
additional_tooth_width=0.0;
additional_tooth_depth=0.0;


GT2_2mm_teeth_cutout(number_of_teeth, toothed_part_length);

module GT2_2mm_teeth_cutout(num_teeth, teeth_height)
{
    tooth_depth = 0.764;
    tooth_width = 1.494;
    pulley_OD = tooth_spacing (num_teeth, 2, 0.254);
	echo (str("Number of teeth = ",number_of_teeth,"; Pulley Outside Diameter = ",pulley_OD,"mm "));
	tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
	tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
	tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth) ;
    for(i=[1:number_of_teeth]) 
    rotate([0,0,i*(360/number_of_teeth)])
    translate([0,-tooth_distance_from_centre,0]) 
    scale ([ tooth_width_scale , tooth_depth_scale , 1 ]) 
    {
        GT2_2mm(teeth_height);
    }
}

module GT2_2mm(tooth_height)
{
	linear_extrude(height=tooth_height) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
}

function tooth_spacing(num_teeth, tooth_pitch,pitch_line_offset)
	= (2*((num_teeth*tooth_pitch)/(3.14159265*2)-pitch_line_offset)) ;