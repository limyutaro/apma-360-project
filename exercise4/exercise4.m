clc;                                              
clear;

% Based on template provided by Yarpiz
% https://yarpiz.com/523/yptdeq190515-runge-kutta-rk4-in-python-and-matlab
    
% % parameters
params.m = 1;           % prey mortality rate
params.b0 = 4.01;          % constant for maternity function
params.gamma = 1;       % constant for maternity function

params.delta = 1;       % predator mortality rate
params.c = 1;           % predator growth rate
params.k = 1;           % predation rate

% % initial conditions
% definition of f(a), B(a) and H(a)
f_a = @(a) 1.5 ./ cosh(a);
B_initial_func = @(a) params.b0.*a.*exp(-params.gamma.*a).*f_a(a);
H_initial_func = @(a) exp(-params.gamma.*a).*f_a(a);

% computation of initial values
N0 = integral(f_a, 0, Inf);
P0 = 1;
B0 = integral(B_initial_func, 0, Inf);
H0 = integral(H_initial_func, 0, Inf);

x0 = [N0; P0; B0; H0];

% % solving the ODE system
t_start = 0;        % start time
t_end = 12500;        % end time
h = 0.05;            % time step size

% function describing the ODE system
f = @(t,x) formulateODESystem(x, params);

[x, t] = RungeKutta4(f, x0, t_start, t_end, h); % numerically computed values

% % Plotting predator-prey population in seperate figures
% Predator-prey
figure;
plot(x(1,:), x(2,:));
set(gca,'color',uint8([250 250 250]));
xlabel('Prey');
ylabel('Predator');
grid on;

% Population-time
figure;
hold on
plot(t, x(1,:));
plot(t, x(2,:));

legend('Prey','Predator')
xlabel('Time');
ylabel('Population');
grid on;
set(gca,'color',uint8([250 250 250]));
hold off

% initial population f_a
% figure;
% initialages = linspace(0,10,100);
% intialpopulation = f_a(initialages);
% plot(initialages, intialpopulation);