%% PS5 Question 2a

x0 = [-1 -2];

options = optimset('Maxiter',10,'TolFun',1e-6,'Display','Iter');

[x, fval, exitflag, output, jacobian] = fsolve(@equations, x0, options);

iterations = output.iterations;

solution1 = struct('converged_x',x(1),'converged_y',x(2),'first_function_value',fval(1),'second_function_value',fval(2),'jacobian_convergence_value',jacobian,'exit_flag',exitflag,'number_of_iterations',iterations);

function F = equations(x)
    F(1) = 2*exp(x(1)) + x(2);
    F(2) = 3*(x(1))^2 + 4*(x(2))^2 - 8;
end
