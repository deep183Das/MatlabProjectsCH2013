%% ch22b020 Q1
clear; clc;
%% Equations are rearranged according to their diagonal dominance
% 6x1 - 2x2 + x3 = 5
% 5x1 + 10x2 + x3 = 28
% -3x1 + x2 + 15x3 = 44

A = [6,-2,1; 5,10,1; -3,1,15];
B = [5; 28; 44];

%% a> without relaxation

max_iterations = 1000;
tolerance = 0.05;
% Initializing the solution vector x1 with zeros
x1 = zeros(size(B));

for iter1 = 1:max_iterations
    x_prev1 = x1;
    
    for i = 1:length(B)
        sum_row = (A(i, :) * x1) - (A(i, i) * x1(i));
        
        % Updating the solution for the current element in the NEW solution
        x1(i) = (B(i) - sum_row) / A(i, i);
    end
    
    % Checking for convergence
    if norm(x1 - x_prev1, inf) < tolerance
        fprintf('Converged after %d iterations.\n', iter1);
        break;
    end
end

% Displaying the final solution
fprintf('Solution (without using Relaxation):\n');
disp(x1);


%% b> with relaxation (w = 0.95)

% relaxation factor
w = 0.95; 
% Initializing the solution vector x2 with zeros
x2 = zeros(size(B));

for iter2 = 1:max_iterations
    x_prev2 = x2;
    
    for i = 1:length(B)
        sum_row = (A(i, :) * x2) - (A(i, i) * x2(i));
        
        % Updating the solution for the current element in the NEW solution
        x2(i) = (1 - w)*(x2(i)) + w*((B(i) - sum_row) / A(i,i));
    end
    
    % Checking for convergence
    if norm(x2 - x_prev2, inf) < tolerance
        fprintf('Converged after %d iterations.\n', iter2);
        break;
    end
end

% Displaying the final solution
fprintf('Solutions (using Relaxation):\n');
disp(x2);


%% From both of the above approach, the solutions I am getting is :
% x1 = 1, x2 = 2, x3 = 3

% for ("relaxation factor" < 1) , after rearranging the given system of
% equations according to the diagonal dominance, equations are convergent,
% but for ("relaxation factor" > 1) :=
% => for (w > 1 & < 1.39068), equations are still converging to the expected ans
% => for (w > 1.39068), equations are divergent

%% Plotting for "relaxation factor" vs no. of iterations
w_x = linspace(0,2,5000);
iter_y = [];
for k = 1 : (length(w_x))
    w_val = w_x(k);

    x3 = zeros(size(B));

    for iter3 = 1:max_iterations
        x_prev3 = x3;
    
        for i = 1:length(B)
            sum_row = (A(i, :) * x3) - (A(i, i) * x3(i));
        
            x3(i) = (1 - w_val)*(x3(i)) + w_val*((B(i) - sum_row) / A(i,i));
        end
    
        if norm(x3 - x_prev3, inf) < tolerance
            iter_y(k) = iter3;
            break;
        else
            iter_y(k) = max_iterations;
        end
    end
end

plot(w_x,iter_y,LineStyle="-",Color='cyan',LineWidth=1.2);
hold on;
grid on;
title('relaxation factor vs no. of iterations');
xlabel('relaxation factor');
ylabel('Number of iterations');
hold off;