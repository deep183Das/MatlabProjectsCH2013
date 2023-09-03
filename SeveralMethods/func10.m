%% solving for system of non-linear equations : by creating anonymous local function

% x^2 + y^2 = 25
% x*y - 6 = 0

% define a function that represents the system of equations

% use the fsolve function to find the solution to the system of equations
initialGuess = [3, 2];
% initial guess for variables [x, y]

options = optimset('Display', 'none');
solution = fsolve(@equations, initialGuess, options);

fprintf('Solution to the system of equations : x = %f, y = %f\n', solution);
% fprintf('Solution to the system of equations : x = %f, y = %f\n', solution(1), solution(2));

% The anonymous local function
function F = equations(x)
    equation1 = x(1)^2 + x(2)^2 - 25;
    equation2 = x(1)*x(2) - 6;
    
    F = [equation1, equation2];
end
