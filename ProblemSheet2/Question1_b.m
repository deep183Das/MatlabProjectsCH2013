%% Temperature of a well mixed reactor (1_b)

% The given function : f(x) = x - (delta)*e^x
% (delta) -> heat of the reaction
del = 2;
func = @(x) (x - (del)*exp(x));
func_derivative = @(x) 1 - (del)*exp(x);

% Setting initial values and parameters
x0 = 0;
tol = 1e-4;
max_iteration = 10;

% loop for fnding the root
x = x0;
for iter = 1:max_iteration
    

    f_x = func(x);
    f_prime_x = func_derivative(x);

    x = x - (f_x / f_prime_x);
    arrb(iter) = x; 
    if(abs(f_x) < tol)
        roots = x;
    end
end