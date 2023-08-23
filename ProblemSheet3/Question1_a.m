%% PS3 - question 1a

%% solving using Regula Falsi method
del = 0.2;
func = @(x) x - del*(exp(x));   % given function
ea = 100; % initial error
tol = 10^(-4);  % tolerance value
x0 = [0, 1];    % initial guess values (the ranges)
xr = 0; % initial guess

iter = 0;
max_iteration = 3;

while (ea >= tol) && (iter < max_iteration)
    iter = iter + 1;
    x = x0(1) - ((func(x0(1)))*(x0(2) - x0(1)))/(func(x0(2)) - func(x0(1)));

    arr(iter) = x;
    val_sign = (func(x))*(func(x0(1)));
    if val_sign < 0
        x0(2) = x;
    elseif val_sign > 0
        x0(1) = x;
    else
        xr = x;
    end

    ea = ((x - xr)/x);
    ea = abs(ea);
    if ea < tol
        root = x;
    end
    xr = x;
end

root = x;

x0 = 0;