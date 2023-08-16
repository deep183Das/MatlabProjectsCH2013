%% Temperature of a well mixed reactor (2_c)

% The given function : f(x) = x - (del)*exp(x/(1 + epsilon*x))
% (del) -> heat of the reaction
del = 0.53;
epsilon = 0.245;

func = @(x) (x - (del)*exp(x/(1 + epsilon*x)));
func_derivative = @(x) 1 - ((del)*exp(x/(1 + epsilon*x)))/((1 + epsilon*x)^2);

% Setting initial values and parameters
x0 = 0;     % initial guess value for the first root
tol = 1e-4;
max_iteration = 100;

roots = [0, 0, 0];
% loop for fnding the root
x = x0;
for iter = 1:max_iteration
    f_x = func(x);
    f_prime_x = func_derivative(x);

    x = x - (f_x / f_prime_x);
    if(abs(f_x) < tol)
        roots(1) = x;
    end
end
%% for the second root, new guess value
x = 4;
for iter = 1:max_iteration
    f_x = func(x);
    f_prime_x = func_derivative(x);

    x = x - (f_x / f_prime_x);
    if(abs(f_x) < tol)
        roots(2) = x;
    end
end
%% for the third root, new guess value
x = 6;
for iter = 1:max_iteration
    f_x = func(x);
    f_prime_x = func_derivative(x);

    x = x - (f_x / f_prime_x);
    if(abs(f_x) < tol)
        roots(3) = x;
    end
end