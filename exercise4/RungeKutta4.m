function [x,t] = RungeKutta4(f, x0, t_start, t_end, h)
    % Based on template provided by Yarpiz
    % https://yarpiz.com/523/yptdeq190515-runge-kutta-rk4-in-python-and-matlab
    
    t = t_start : h : t_end;            % time interval, in vector form
    numOfIntervals =  numel(t);
    numOfVars = numel(x0);
    x = nan(numOfVars, numOfIntervals); % array that is to be filled by RK4
    
    x(:,1) = x0;                        % first column contains the initial values
    
    % calculation loop, formulae according to wikipedia
    for n = 1 : (numOfIntervals - 1)    
        k_1 = f(t(n), x(:,n));
        k_2 = f(t(n) + h/2, x(:,n) + h*k_1/2);
        k_3 = f(t(n) + h/2, x(:,n) + h*k_2/2);
        k_4 = f(t(n) + h, x(:,n) + h*k_3);

        x(:, n+1) = x(:, n) + (h/6)*(k_1 + 2*k_2 + 2*k_3 + k_4);  % main equation
    end
end