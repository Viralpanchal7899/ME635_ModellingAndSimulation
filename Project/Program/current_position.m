function p_c = current_position(T,a1,a2,a3,a4,a5,q1,q2,q3,q4,q5)

q = [q1;q2;q3;q4;q5];
% Forward kinematics
X = T(1,4);
Y = T(2,4);
Z = T(3,4);

% Getting the current position coordinates for the above joint coordinates
p_c = [subs(X); subs(Y); subs(Z)]
end