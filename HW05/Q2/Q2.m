close all 
clear all
clc

L = 3048e-3;
x =  0:0.001:L;
E = 200e9;
I = (50.8e-3)*((100e-3)^3)/12;
L1 = 914e-3;
L3 = 914e-3;
L2 = L - L1 - L3;

q = -1640;
P2 = q*L2/2;
M2 = q*L2^2/12;
P3 = q*L2/2;
M3 = -q*L2^2/12;

K = @(LL) E*I/LL^3 * [12 6*LL -12 6*LL; 6*LL 4*LL^2 -6*LL 2*LL^2; -12 -6*LL 12 -6*LL; 6*LL 2*LL^2 -6*LL 4*LL^2]
K1 = K(L1)
K2 = K(L2)
K3 = K(L3)

MainK = zeros(8);
MainK(1:4,1:4) = K1;
MainK(3:6,3:6) = MainK(3:6,3:6) + K2;
MainK(5:8,5:8) = MainK(5:8,5:8) + K3

Force_vec = [P2 M2 P3 M3]';
Displacement_vec = [0; 0; MainK(3:6,3:6)\Force_vec; 0;0]

Force_vec = MainK*Displacement_vec

V = @(V1,tet1,V2,tet2,Lin,zet)(1-3*zet.*zet+2*zet.*zet.*zet)*V1 + Lin*(zet-2*zet.*zet+zet.*zet.*zet)*tet1+(3*zet.*zet-2*zet.*zet.*zet)*V2+Lin*(zet.*zet.*zet-zet.*zet)*tet2;

eq1 = V(Displacement_vec(1),Displacement_vec(2),Displacement_vec(3),Displacement_vec(4),L1,0:0.01:1);
eq2 = V(Displacement_vec(3),Displacement_vec(4),Displacement_vec(5),Displacement_vec(6),L2,0:0.01:1);
eq3 = V(Displacement_vec(5),Displacement_vec(6),Displacement_vec(7),Displacement_vec(8),L3,0:0.01:1);
plot(linspace(0,L1,101),eq1)
hold on
plot(linspace(L1,L1+L2,101),eq2)
hold on
plot(linspace(L1+L2,L1+L2+L3,101),eq3)
