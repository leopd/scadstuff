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


module mesh_star(size, n) {
    scale(size/10) {
        for( i = [0 : n] ) {
            rotate([i * 180 / n,0,0]) cylinder(10, 0.1, 0.1, center=true);
        }
    }
}

module cubemesh(size, cnt) {
    intersection() {
        for( rot = [[0,0,0],[0,90,0], [0,0,90]]) {
            rotate(rot) {
                translate([size/2,0,0]) mesh_star(size, cnt);
                translate([-size/2,0,0]) mesh_star(size, cnt);
            }
        }
        cube(size, center=true);
    }
}


module octamesh(size) {
}


opencube(100);
cubemesh(100, 4);
octahedron(58);
//openoctahedron(58);
//opencube(34);
//openoctahedron(20);
//opencubenomesh(12);


