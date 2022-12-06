function [q_new,p_achieved] = RRA(p_d,q,J_gen,T)

X = T(1,4);
Y = T(2,4);
Z = T(3,4);

v_max = 0.5;
v_min = 0.1; 
lambda_p = 5;
delta_t = 1;
p_c = [subs(X);subs(Y);subs(Z)];
position_eps = 1e-3;
position_err = (sqrt((p_d - p_c)'*(p_d-p_c)));

%Computing Jacobian
% J = subs(J_gen);
% J_inv = pinv(J);
% q_old = q; 
iter = 1;
plot(iter,position_err,'ro');

tic
while position_err > position_eps
    
    % Computing Jacobian
    J = subs(J_gen);
    J_inv = pinv(J);
    hold on
    plot(iter,position_err,'ro');
    legend('Position Error')
    title('Position error w.r.t iteration')
    grid on
    axis padded
    
    % for desired position velocity p_d_dot = ||v||*n_hat
    n_hat = ((p_d-p_c)./norm(p_d-p_c));
    if (position_err/position_eps)<=lambda_p
        v_tilde = v_min + (((v_max-v_min)*(position_err-position_eps))/(position_eps*(lambda_p-1)));
    else
        v_tilde = v_max;
    end
    p_d_dot = v_tilde * n_hat;
    q_d_dot = J_inv*p_d_dot;
    q = q + q_d_dot*delta_t;
    
    q1 = feval('round',q(1,1),2);
    q2 = feval('round',q(2,1),2);
    q3 = feval('round',q(3,1),2);
    q4 = feval('round',q(4,1),2);
    q5 = feval('round',q(5,1),2);
    
    % getting the new coordinates
    p_c = feval('round',[subs(X);subs(Y);subs(Z)],2)
    
    % recomputing the position error
    position_err = feval('round',(sqrt((p_d - p_c)'*(p_d-p_c))),2)    
    
    iter = iter + 1
end
toc
% Printing the achieved joing coordinates
q1 = feval('round',q(1,1),2);
q2 = feval('round',q(2,1),2);
q3 = feval('round',q(3,1),2);
q4 = feval('round',q(4,1),2);
q5 = feval('round',q(5,1),2);
q_new = [q1;q2;q3;q4;q5];

X_new = feval('round',subs(X),2);
Y_new = feval('round',subs(Y),2);
Z_new = feval('round',subs(Z),2);
p_achieved = [X_new;Y_new;Z_new]

end
