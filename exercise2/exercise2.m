% % Parameters
beta = 1.1;       % maternity rate
gamma = 1;      % mortality rate
u_0 = 10;       % constant initial age distribution
delta = 5;      % age-limit, max age organism can be

% % % % % % using isolve to solve Volterra Renewal Equation % % % % % % % 
% The general form is :
%  
% h(x)y(x) = f(x) + int( ker(x-t)*y(t) ,0,x)dt
%
% 1 * B(t) = beta * u_0 * delta * exp(-gamma*t) + 
%              int( beta * exp(-gamma * (t-s)) * B(s) , 0, t)ds
% 
% Rewrite above by t->x, s->t, 
% 1 * B(x) = beta * u_0 * delta * exp(-gamma*x) + 
%              int( beta * exp(-gamma * (x-t)) * B(t) , 0, x)dt
%
% Hence,exercise 2's functions are: 
% h(x) = 1, y(x) = B(x), f(x) = beta * u_0 * delta * exp(-gamma*x),
% ker(x-t) = beta * exp(-gamma * (x-t))

syms x t s;
renewal_h = 1;
renewal_f = beta * u_0 * delta * exp(-gamma*x);
renewal_ker = beta * exp(-gamma * (x-t));

renewal_symbol = isolve(renewal_h, renewal_f, renewal_ker);
renewalEqn = matlabFunction(renewal_symbol);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% % Creating axes by matrices
A = linspace(0,6,50);     % create age axis (start, end, number of steps)
T = linspace(0,6,50);     % create time axis
[AA,TT] = meshgrid(A,T); 

% % Compute population at each coordinate
UU = computePopulation(AA, TT, renewalEqn, beta, gamma, u_0, delta);

% % Plot
% plot surface using mesh
mesh(AA,TT,UU) 
xlabel('age') 
ylabel('time') 
zlabel('population')

% color legend for u axis
colormap('winter');
colorbar