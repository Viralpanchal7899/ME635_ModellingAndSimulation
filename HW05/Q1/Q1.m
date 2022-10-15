close all
clear all
clc

l = 3048*(10^-3);
x = 0:0.001:l;
e = 200*(10^9);
I = (50.8*(10^-3))*((100*(10^-3))^3)/12;
l1 = 914*(10^-3);
l3 = 914*(10^-3);
l2 = l-l1-l3;

p2 = -1000;
m2 = 0;
p3 = -1000;
m3 = 0;

k1 = global_stiff(l1,e,I);
fprintf('k1 = \n');
disp(k1)
k2 = global_stiff(l2,e,I);
fprintf('k2 = \n');
disp(k2)
k3 = global_stiff(l3,e,I);
fprintf('k3 = \n');
disp(k3)

fprintf('K = k1 + k2 + k3 \n\n');
k_final = zeros(8);
k_final(1:4,1:4) = k1;
k_final(3:6,3:6) = k_final(3:6,3:6) + k2;
k_final(5:8,5:8) = k_final(5:8,5:8) + k3;
fprintf('K =\n');
disp(k_final)

% Calculation forces and displacements
force_vec = [p2 m2 p3 m3]';
displacement_vec = [0; 0; k_final(3:6,3:6)\force_vec; 0;0];
force_vec = k_final*displacement_vec;
fprintf('Force = \n');
disp(force_vec)

% Caculating the points on the equation
eq_1 = displacement(displacement_vec(1),displacement_vec(2),displacement_vec(3),displacement_vec(4),l1,0:0.01:1);
eq_2 = displacement(displacement_vec(3),displacement_vec(4),displacement_vec(5),displacement_vec(6),l2,0:0.01:1);
eq_3 = displacement(displacement_vec(5),displacement_vec(6),displacement_vec(7),displacement_vec(8),l3,0:0.01:1);
plot(linspace(0,l1,101),eq_1)
hold on
plot(linspace(l1,l1+l2,101),eq_2)
hold on
plot(linspace(l1+l2,l1+l2+l3,101),eq_3)
legend('Eq_1','Eq_2','Eq_3')
grid on
