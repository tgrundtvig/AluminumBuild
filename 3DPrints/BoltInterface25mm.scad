
boltInterface(40);

module boltInterface(length)
{
    translate([20,20,0])
    cylinder(d=3.6, h=length, center=true, $fn=32);
    translate([20,-20,0])
    cylinder(d=3.6, h=length, center=true, $fn=32);
    translate([-20,20,0])
    cylinder(d=3.6, h=length, center=true, $fn=32);
    translate([-20,-20,0])
    cylinder(d=3.6, h=length, center=true, $fn=32); 
}
    