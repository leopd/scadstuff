use <solidlib.scad>

$fn = 70;

scale(5) {
    opendodecahedron();
    dodecamesh(5);
}
color([1.0,0.7,0.1]) scale(6.57) {
    openicosahedron();
    icosamesh(5);
}
scale(3.2) dodecahedron();
