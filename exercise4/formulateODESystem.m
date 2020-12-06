function xdot = formulateODESystem(x, params)
    % Based on template provided by Yarpiz
    % https://yarpiz.com/523/yptdeq190515-runge-kutta-rk4-in-python-and-matlab
    
    % parameters
    b0 = params.b0;
    delta = params.delta;
    gamma = params.gamma; 
    c = params.c;
    m = params.m;
    k = params.k;
    
    % x(1) is prey population N
    % x(2) is pradator population P
    % x(3) is boundary (birth/renewal) condition B
    % x(4) is additional variable H obtained from method of moments
    
    % N' = max(B - kBP, 0) - mN
    % P' = -delta P + cBP
    % B' = -(m + gamma)B + b_0H
    % H' = max(B - kBP, 0) - (m + gamma)H

    xdot = [max([x(3) - k*x(3)*x(2), 0]) - m*x(1);
            -delta*x(2) + c*x(3)*x(2); 
            -(m + gamma)*x(3) + b0*x(4);
            max([x(3) - k*x(3)*x(2), 0]) - (m + gamma)*x(4)]; 
        
    
end