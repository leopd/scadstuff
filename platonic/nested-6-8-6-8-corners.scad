use <solidlib.scad>

$fn = 25;

opencube(100);
cubecorners(100, 58);
cubemesh(100,4, 0.5);
openoctahedron(58);
opencube(34);
octahedron(20);

