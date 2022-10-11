% ME635 HW04 - Q4
% Viral Panchal

close all
clear all
clc

i = 1;
N = zeros();
for x = 0:0.01:1
N_1 = ((x-1)*(x-0.5)*(x-0.25)*(x-0.75))/0.09375;
N(i,1) = N_1;
N_2 = ((x-0.5)*(x-0.25)*(x-0.75)*(x))/0.09375;
N(i,2) = N_2;
N_3 = ((x - 1)*(x-0.25)*(x-0.75)*(x))/0.015625;
N(i,3) = N_3;
N_4 = -((x - 1)*(x - 0.5)*(x-0.75)*(x))/0.02344;
N(i,4) = N_4;
N_5 = -((x - 1)*(x-0.5)*(x-0.25)*(x))/0.02344;
N(i,5) = N_5;
N(i,6) = x;
i = i+1;
end

plot(N(:,6),N(:,1))
hold on
plot(N(:,6),N(:,2))
hold on 
plot(N(:,6),N(:,3))
hold on 
plot(N(:,6),N(:,4))
hold on 
plot(N(:,6),N(:,5))
legend('N_1(x)','N_2(x)','N_3(x)','N_4(x)','N_5(x)')
grid on  
ylim([-0.7 1.4])

T1 = 100;
T2 = 100;
T3 = 150;
T4 = 120;
T5 = 130;

j = 1;
T = zeros();
% p = size(N,6)
for j = 1:1:size(N,1)
    T(j,1) = T1*N(j,1) + T2*N(j,2) + T3*N(j,3) + T4*N(j,4) + T5*N(j,5);
    j = j+1;
end

figure
plot(N(:,6),T(:,1))
legend('T(x) = Sum(T(x)*N_i(x))')
grid on    