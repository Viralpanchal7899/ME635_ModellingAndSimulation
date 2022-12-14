% Final Exam - Q1
% Viral Panchal

close all
clear all
clc

% Global variables
q_dot = 1e+6;
L = 0.050;  % in meter
d = 0.005;  % in meter
k = 25;
T_b = 328.53; % in kelvin
T_inf = 293.15; % in kelvin

% Variables for -L to 0
x1 = linspace(0,0.05,50);
x_1 = linspace(-0.05,0,50);
T1 = zeros();

for i = 1:length(x1)
    T1(i,1)= ((q_dot * (L^2 - abs(x1(i))^2))/(2*k))+T_b;
end

% Variables for 0 to L
x2 = linspace(0.05,1,50);
x_2 = linspace(0,0.05,50);
T2 = zeros();

for i = 1:length(x2)
    T2(i,1) = exp(-x2(i)) * (T_b-T_inf) + T_inf;
end

% Plotting both outputs
plot(x_1,T1-273.15,'r*')
hold on
plot(x_2(2:length(x_2)),T2(2:length(T2),1)-273.15,'r*')
ylabel('T(x) (in degree celsius)')
xlabel('x (in meters)')
axis padded
grid on