$fn = 70;

module opencube(size) {
    difference() {
        cube(size, center=true);
        sphere(size*2/3);
    }
}

module box(size) {
    cube([2*size, 2*size, size], center = true); 
}

module octahedron(size) {
    rotate([125,0,135]) {
        dihedral = 109.47122;
        n = 3;
        intersection(){
            box(size);
            intersection_for(i=[1:n])  { 
                rotate([dihedral, 0, 360 /n * i])  box(size); 
           }
        }
    }
}

module openoctahedron(size) {
    difference() {
        octahedron(size);
        sphere(size*0.57);
    }
}

opencube(10);
openoctahedron(5.8);
opencube(3.4);