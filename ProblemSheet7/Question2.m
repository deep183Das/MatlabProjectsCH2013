%% PS7B Q2 CH22B020

global iter1 iter2 iter3 dx1 dx2 dx3

% Defining equation as a function
f = @(x) (x^3 - 6*(x^2) + 11*x - 6);    % this equation has 3 roots

% initial guess values 
x0 = 2.5;
x1 = 12;
x2 = 50;
tolerance = 1e-6;
maxIterations = 100;

%% a> roots of the function
roots = MullerMethod(f, x0, x1, x2, tolerance, maxIterations);
disp(['Roots : x1 = ', num2str(roots(1)), ', x2 = ',num2str(roots(2)), ', x3 = ',num2str(roots(3))]);

%% estimated errors corresponding each root's evaluation
dy1 = abs(dx1);     % for 1st root
dy2 = abs(dx2);     % for 2nd root
dy3 = abs(dx3);     % for 3rd root

%% number of iterations taken 
iteration1 = iter1;     % for 1st root
iteration2 = iter2;     % for 2nd root
iteration3 = iter3;     % for 3rd root

%% b> Advantage of using Muller's method
%% Muller's method is particularly useful when dealing with complex roots 
% of a polynomial equation. It can handle both real and complex roots without 
% any modification, making it versatile for a wide range of problems.
%% Polynomial deflation, on the other hand, is primarily suited for finding 
% real roots and may require additional techniques or modifications to 
% handle complex roots.

%% Implementing Muller's method
function roots = MullerMethod(f, x0, x1, x2, tol, maxIter)
    global iter1 iter2 iter3 dx1 dx2 dx3
    
    % Initializing iterations
    iter1 = 0;
    iter2 = 0;
    iter3 = 0;
    
% evaluating the 1st root
    while iter1 < maxIter
        h1 = x1 - x0;
        h2 = x2 - x1;
      
        f0 = f(x0);
        f1 = f(x1);
        f2 = f(x2);
         
        d1 = (f1 - f0) / h1;
        d2 = (f2 - f1) / h2;
        
        a = (d2 - d1) / (h2 + h1);
        b = d2 + h2 * a;
        c = f2;
        
        % Calculating discriminant
        disc = sqrt(b^2 - 4*a*c);
        
        % Choosing the root closer to x2
        if abs(b + disc) < abs(b - disc)
            denom = b - disc;
        else
            denom = b + disc;
        end
        
        dx1 = -2 * c / denom;
        x3 = x2 + dx1;
        
        % Checking for convergence
        if abs(dx1) < tol
            root1 = x3;
            break;
        end
        
        % Updating values for the next iteration
        x0 = x1;
        x1 = x2;
        x2 = x3;
        iter1 = iter1 + 1;
    end

% evaluating the 2nd root
    x0 = 2.5;
    x1 = 12;
    x2 = 50;
    while iter2 < maxIter
        h1 = x1 - x0;
        h2 = x2 - x1;
      
        f0 = f(x0);
        f1 = f(x1);
        f2 = f(x2);
         
        d1 = (f1 - f0) / h1;
        d2 = (f2 - f1) / h2;
        
        a = (d2 - d1) / (h2 + h1);
        b = d2 + h2 * a;
        c = f2;
        
        % Calculating discriminant
        disc = sqrt(b^2 - 4*a*c);
        
        % Choosing the root closer to x2
        denom = b - disc;
        
        dx2 = -2 * c / denom;
        x3 = x2 + dx2;
        
        % Checking for convergence
        if abs(dx2) < tol
            root2 = x3;
            break;
        end
        
        % Updating values for the next iteration
        x0 = x1;
        x1 = x2;
        x2 = x3;
        iter2 = iter2 + 1;
    end

% evaluating the 3rd root
    x0 = 2.5;
    x1 = 12;
    x2 = 50;
    while iter3 < maxIter
        h1 = x1 - x0;
        h2 = x2 - x1;
      
        f0 = f(x0);
        f1 = f(x1);
        f2 = f(x2);
         
        d1 = (f1 - f0) / h1;
        d2 = (f2 - f1) / h2;
        
        a = (d2 - d1) / (h2 + h1);
        b = d2 + h2 * a;
        c = f2;
        
        % Calculating discriminant
        disc = sqrt(b^2 - 4*a*c);
        
        % Choosing the root closer to x2
        denom = b + disc;
        
        dx3 = -2 * c / denom;
        x3 = x2 + dx3;
        
        % Checking for convergence
        if abs(dx3) < tol
            root3 = x3;
            break;
        end
        
        % Updating values for the next iteration
        x0 = x1;
        x1 = x2;
        x2 = x3;
        iter3 = iter3 + 1;
    end
    roots = [root1, root2, root3];
end