%% Root for 4th order polynomial : Question_4_b

% Defining the polynomial function and its derivative
func = @(x) x.^4 - 6*x.^3 + 12*x.^2 - 10*x + 3;
func_derivative = @(x) 4*x.^3 - 18*x.^2 + 24*x - 10;

% Initial guess for root
initial_guess = 1.5;    
% in no root_num this value gets equal to the root values
% otherwise derivative will be equal to zero and 
% operation will be indeterminate

tolerance = 1e-4;   % Tolerance for convergence
max_iterations = 1000000; % Maximum number of iterations

% Initializing an array to store roots
roots = [];

for root_num = 1:4
    x = initial_guess;
    
    % Performing (modified)Newton-Raphson iteration
    for iter = 1:max_iterations
        fx = func(x);
        f_prime_x = func_derivative(x);
        
        if abs(f_prime_x) < eps % "eps" : floating point relative accuracy
            error('Derivative is close to zero. Cannot continue Newton-Raphson method.');
        end
        
        x = x - 3*(fx / f_prime_x);
        
        if abs(fx) < tolerance
            % adding the roots into the array "roots"
            roots = [roots, x];
            break;
        end
    end
    
    if iter == max_iterations
        disp(['Maximum number of iterations reached for root ', num2str(root_num)]);
    end
    
    % Updating the initial guess for the next root
    initial_guess = initial_guess + 0.4;
end

disp('Found roots:');
disp(roots);
