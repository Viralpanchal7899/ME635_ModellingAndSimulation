close all
clear all
clc

% Solving to get the starting matrices for 5R manipulator
[T, J_gen] = manipulator();
fprintf('Generalized transformation matrices and Jacobian martix is achieved \n');

% Solving to determine the starting position of the end-effector
% Defining link lengths
a1 = 1;
a2 = 1;
a3 = 1;
a4 = 1;
a5 = 1;

% Defining initial position joint coordinates
q1 = 0;
q2 = 0;
q3 = 0;
q4 = 0;
q5 = 0;

% Calling current_position function which gives the coordinates of current
% position as output
p_c = current_position(T,a1,a2,a3,a4,a5,q1,q2,q3,q4,q4);

% Defining the desired position of the end effector irrespective of its
% orientation
p_d = [2;1;4];

% Calling RRA function to get the joint coordinates for the desired
% position
q = [q1;q2;q3;q4;q5];
[q_new, p_achieved] = RRA(p_d,q,J_gen,T);

figure
plot3(p_c(1,1),p_c(2,1),p_c(3,1),'<');
hold on 
plot3(p_d(1,1),p_d(2,1),p_d(3,1),'v');
hold on 
plot3(p_achieved(1,1),p_achieved(2,1),p_achieved(3,1),'diamond');
grid on 
legend('Starting position','Desired Position','Achieved Position');
title('Position coordinates in 3D space');
axis padded

