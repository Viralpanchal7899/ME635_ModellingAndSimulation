function K = global_stiff(l,E,I)

K = ((E*I)/(l^3))* [12      6*l     -12     6*l
                    6*l     4*l^2   -6*l    2*l^2
                    -12     -6*l     12      -6*l
                    6*l     2*l^2   -6*l    4*l^2];

end
