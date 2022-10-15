function V = displacement(V1,tet1,V2,tet2,Lin,zet)

V = (1-3*zet.*zet+2*zet.*zet.*zet)*V1 + Lin*(zet-2*zet.*zet+zet.*zet.*zet)*tet1+(3*zet.*zet-2*zet.*zet.*zet)*V2+Lin*(zet.*zet.*zet-zet.*zet)*tet2;

end
