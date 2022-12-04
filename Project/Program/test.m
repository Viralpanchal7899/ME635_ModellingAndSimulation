% Inverse of 2R manipulator
close all 
clear all
clc

% link lengths
a1 = 2;
a2 = 2;

% Coordinates
y = 3;
x = 2;

q1 = atand(y/x);
q2 = acosd((x^2+y^2-a1^2-a2^2)/(2*a1*a2));

% plot()