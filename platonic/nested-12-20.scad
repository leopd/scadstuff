use <solidlib.scad>

$fn = 40;

scale(5) {
    opendodecahedron();
}
color([1.0,0.7,0.1]) scale(6.57) {
    openicosahedron();
}

scale(3.2) dodecahedron();
