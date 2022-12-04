function q_new = RRA(p_d,q,J_gen,X,Y,Z)

v_max = 0.5;
v_min = 0.1; 
lambda_p = 5;
delta_t = 1;
p_c = [subs(X);subs(Y);subs(Z)]
position_eps = 0.2;
position_err = (sqrt((p_d - p_c)'*(p_d-p_c)));
% Computing Jacobian
J = subs(J_gen);
J_inv = pinv(J);
% q_old = q; 
iter = 0;

while position_err > position_eps
    % for desired position velocity p_d_dot = ||v||*n_hat
    n_hat = ((p_d-p_c)./(p_d-p_c));
    if (position_err/position_eps)<=lambda_p
        v_tilde = v_min + (((v_max-v_min)*(position_err-position_eps))/(position_eps*(lambda_p-1)));
    else
        v_tilde = v_max;
    end
    p_d_dot = v_tilde .* n_hat;
    q_d_dot = J_inv*p_d_dot;
    q = q + q_d_dot*delta_t
    
    q1 = q(1,1);
    q2 = q(2,1);
    q3 = q(3,1);
    q4 = q(4,1);
    q5 = q(5,1);
    
    % getting the new coordinates
    p_c = [subs(X);subs(Y);subs(Z)];
    
    % recomputing the position error
    position_err = (sqrt((p_d - p_c)'*(p_d-p_c)))
    
    
    iter = iter + 1
end

disp(q_new)
fprintf('done')
end
