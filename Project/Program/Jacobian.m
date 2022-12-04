function J = Jacobian(X,Y,Z,q1,q2,q3,q4,q5)

% % Computing the Jacobian Matrix and its inverse
% X = T(1,4);
% Y = T(2,4);
% Z = T(3,4);
% syms q1 q2 q3 q4 q5
J = jacobian([X,Y,Z],[q1;q2;q3;q4;q5]);
% J_inv = pinv(J);

end