function J_inv = Jacobian_inverse(J,a1,a2,a3,a4,a5,q1,q2,q3,q4,q5)
    
rho = 1;
I = eye(3);

J_inv = (J*J' + rho*I)
end