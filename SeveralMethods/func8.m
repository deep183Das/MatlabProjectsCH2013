% Define the anonymous function to solve 
fun = @(x) x^2 - 4*x + 4;
% fun = @(x) x^2 + 2;

% initial guess
x0 = 1;

% options for fsolve with iteration display
options = optimset('Display', 'iter-detailed');

% solve using fsolve
solution = fsolve(fun, x0, options);

% Display the result
fprintf('The solution is x = %.4f\n', solution);