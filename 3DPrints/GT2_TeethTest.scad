use <GT2_2mm_Teeth_cut_out.scad>

number_of_teeth = 64;
toothed_part_length = 7;

difference()
{ 
    union()
    {
        cylinder(d=42, h=1, $fn=256);
        translate([0,0,0.5])
        cylinder(d=40.23, h=8, $fn=256);
        translate([0,0,8])
        cylinder(d=42, h=1, $fn=256);
    
    }
    translate([0,0,1])
    GT2_2mm_teeth_cutout(number_of_teeth, toothed_part_length);
}