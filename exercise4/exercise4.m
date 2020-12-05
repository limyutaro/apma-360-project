clc;                                              
clear;

% % parameters
params.m = 1;           % prey mortality rate
params.b0 = 5;          % constant for maternity function
params.gamma = 1;       % constant for maternity function

params.delta = 1;       % predator mortality rate
params.c = 1;           % predator yield


% % initial conditions
% definition of f(a), B(a) and H(a)
f_a = @(a) 1./cosh(a);
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
t_end = 125;        % end time
h = 0.05;            % time step size

% function describing the ODE system
f = @(t,x) StructuredPredatorPreyModel(x, params);

[x, t] = RungeKutta4(f, x0, t_start, t_end, h); % numerically computed values

% % Plotting predator-prey population in seperate figures
figure;

plot(x(1,:), x(2,:));
set(gca,'color',uint8([250 250 250]));
xlabel('Prey');
ylabel('Predator');
grid on;

figure;
plot(t, log(x(1,:)));
set(gca,'color',uint8([250 250 250]));
xlabel('time');
ylabel('prey (log scale)');
grid on;

figure;
plot(t, log(x(2,:)));
set(gca,'color',uint8([250 250 250]));
xlabel('time');
ylabel('predator (log scale)');
grid on;