function xdot = StructuredPredatorPreyModel(x, params)
    %     parameters
    b0 = params.b0;
    delta = params.delta;
    gamma = params.gamma; 
    c = params.c;
    m = params.m;

    % x(1) is prey population N
    % x(2) is pradator population P
    % x(3) is boundary (birth/renewal) condition B
    % x(4) is additional variable H obtained from method of moments

    xdot = [max([x(3), x(2)]) - (m + gamma)*x(1);
            -delta*x(2) + c*x(3)*x(4); 
            -(m + gamma)*x(3) + b0*x(4);
            max([x(3), x(2)]) - (m + gamma)*x(4)]; 
end