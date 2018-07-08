module box() {
    cube([2, 2, 1], center = true); 
}


module dodecahedron() {
      dihedral = 116.565;
      intersection(){
            box();
            intersection_for(i=[1:5])  { 
                rotate([dihedral, 0, 360 / 5 * i])  box(); 
           }
      }
}

module opendodecahedron() {
    difference() {
        dodecahedron();
        sphere(0.56);
    }
}

module icosahedron(a = 2) {
    rotate([0,31.5,17]) scale(0.1) {
        phi = a * ((1 + sqrt(5)) / 2);
        polyhedron(
            points = [
                [0,-phi, a], [0, phi, a], [0, phi, -a], [0, -phi, -a], [a, 0, phi], [-a, 0, phi], [-a, 0, -phi], 
                [a, 0, -phi], [phi, a, 0], [-phi, a, 0], [-phi, -a, 0], [phi, -a, 0]    
            ],
            faces = [
                [0,5,4], [0,4,11], [11,4,8], [11,8,7], [4,5,1], [4,1,8], [8,1,2], [8,2,7], [1,5,9], [1,9,2], [2,9,6], [2,6,7], [9,5,10], [9,10,6], [6,10,3], [6,3,7], [10,5,0], [10,0,3], [3,0,11], [3,11,7]
            ]
        
        );
    }
}

module openicosahedron() {
    difference() {
        icosahedron();
        sphere(0.316);
    }
}

module mesh_star(size, n, offset=0.333) {
    scale(size/10) {
        for( i = [0 : n] ) {
            rotate([(offset + i) * 360 / n,0,0]) { 
                translate([0,0,0])
                cylinder(5, 0.1, 0.1);
            }
        }
    }
}


module dodecamesh(cnt) {
    size=1;
    intersection() {
        for( rot = [[0,90,0],
                    [0,-26,18], [0,-26,18+72], [0,-26,18+2*72],
                    [0,-26,18+3*72], [0,-26,18+4*72], 
        ]) {
            rotate(rot) {
                translate([size/2,0,0]) mesh_star(size*0.6, cnt);
                translate([-size/2,0,0]) mesh_star(size*0.6, cnt);
            }
        }
        dodecahedron(center=true);
    }
}

$fn = 50;

scale(5) opendodecahedron();
scale(5) dodecamesh(5);
color([1.0,0.7,0.1]) scale(6.57) icosahedron();