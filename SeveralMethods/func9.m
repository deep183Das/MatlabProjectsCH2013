%% solving for system of non-linear equations : by creating anonymous dependent variables

% x^2 + y^2 = 25
% x*y - 6 = 0

% define a function that represents the systrem of equations
equations = @(x) [x(1)^2 + x(2)^2 - 25; x(1)*x(2) - 6];

% use the fsolve function to find the solution to the system of equations
initialGuess = [3, 2];
% initial guess for variables [x, y]

solution = fsolve(equations, initialGuess);

fprintf('Solution to the system of equations : x = %f, y = %f\n', solution(1), solution(2));