function population = computePopulation(A, T, B, beta, gamma, u_0, delta)
% initial population (a < t)
initialpop = u_0 .* exp(-gamma.*T);
initialpop = initialpop .* ((T < A) .* (A < T + delta));

% new population (a > t)
newbirths = B(T) .* exp((beta-gamma).*T) .* exp(-beta.*A); % args for B may have to be adjusted, depending on what the volterra solver gives
newbirths = newbirths .* (A < T);

population = initialpop + newbirths;
end