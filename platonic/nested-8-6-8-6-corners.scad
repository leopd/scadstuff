use <solidlib.scad>

$fn = 25;

rotate([135,35,0]) {
    openoctahedron(58);
    opencube(34);
    openoctahedron(20);
    octacorners(48);
    cubecorners(34, 11.7);
    cube(11.7, center=true);
}