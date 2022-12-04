function [T,J_gen] = manipulator()
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
T = A1*A2*A3*A4*A5 

% Computing Jacobian - generalized equation
J_gen = Jacobian(T(1,4),T(2,4),T(3,4),q1,q2,q3,q4,q5)

end
