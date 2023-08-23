%% PS3 - question 2c

%% solving using Fixed Point Iteration method
% The given function : f(x) = x - (del)*exp(x/(1 + epsilon*x))
% (del) -> heat of the reaction

del = 0.525;
epsilon = 0.243;
gfunc = @(x) ((del)*exp(x/(1 + epsilon*x)));

ea = 100; % initial error
tol = 1e-4; % tolerance value
iter = 0;
max_iteration = 1000;

roots = [0, 0, 0];

%% loop for fnding the root
x0 = 0;     % initial guess value for the first root
while (ea >= tol) && (iter < max_iteration)
    iter = iter + 1;
    x_old = x0;
    x0 = gfunc(x_old);

    ea = ((x0 - x_old)/x0);
    ea = abs(ea);
end
roots(1) = x0;
%% for the second root, new guess value
x = 4.33;
iter = 0;
ea = 100;
while (ea >= tol) && (iter < max_iteration)
    iter = iter + 1;
    x_old = x;
    x = gfunc(x_old);

    ea = ((x - x_old)/x);
    ea = abs(ea);
end
roots(2) = x;
%% for the third root, new guess value
x = 7.22;
iter = 0;
ea = 100;
while (ea >= tol) && (iter < max_iteration)
    iter = iter + 1;
    x_old = x;
    x = gfunc(x_old);

    ea = ((x - x_old)/x);
    ea = abs(ea);
end
roots(3) = x;