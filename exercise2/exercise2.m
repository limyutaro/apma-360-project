
beta = 1;       % maternity rate
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

B_symbol = isolve(renewal_h, renewal_f, renewal_ker);
global B;
B = matlabFunction(B_symbol);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% create age axis (start, end, number of steps)
A=linspace(0,6,50); 
% create time axis
T=linspace(0,6,50); 
% generate the 2D coordinates according to the partition in the above
[AA,TT]=meshgrid(A,T); 

% compute the function values on those coordinates and store them in the matrix UU
UU = u(AA, TT, delta, u_0, gamma, beta);

% plot surface using mesh
mesh(AA,TT,UU) 
xlabel('age') 
ylabel('time') 
zlabel('population')

% color legend for u axis
colormap('winter');
colorbar

function output = u(A,T, delta, u_0, gamma, beta)
global B;

% new population
output1 = B() .* exp((beta-gamma).*T) .* exp(-beta.*A);
output1 = output1 .* (A < T );

% initial population
output2 = u_0 .* exp(-gamma.*T);
output2 = output2 .* ((T < A) .* (A < T + delta));

output = output1 + output2;
end