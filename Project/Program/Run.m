close all 
clear all
clc

% Defining symbolic variables
syms q1 q2 q3 q4 q5 a1 a2 a3 a4 a5 
assume(q1,'real')
assume(q2,'real')
assume(q3,'real')
assume(q4,'real')
assume(q5,'real')

assume(a1,'real')
assume(a2,'real')
assume(a3,'real')
assume(a4,'real')
assume(a5,'real')


% Making individual link homogenous matrices
A1 = tf_mat(q1,a1,0,90);
A2 = tf_mat(q2,0,a2,0);
A3 = tf_mat(q3,0,a3,0);
A4 = tf_mat(q4,0,a4,0);
A5 = tf_mat(q5,0,a5,0);


% Computing final homogenous transformation matrix
T = A1*A2*A3*A4*A5;

% % Forward kinematics
% X = T(1,4);
% Y = T(2,4);
% Z = T(3,4);
% 
% % Defing variables for RRA
% p_d = [5 5 5];
% p_c = [2,2,2];
% 
% % Getting pose for initial joint coordinates



% Computing Jacobian - generalized equation
J_gen = Jacobian(T(1,4),T(2,4),T(3,4),q1,q2,q3,q4,q5)

% Computing inverse of Jacobian Matrix
% rho = 1;
% I = eye(3);
% J_inv = inv(J*J' + rho*I)

% J_inv = pinv(J);

% % Computing the Jacobian Matrix and its inverse
% X = T(1,4);
% Y = T(2,4);
% Z = T(3,4);
% 
% J = jacobian([X,Y,Z],[q1;q2;q3;q4;q5]);
% J_inv = pinv(J);