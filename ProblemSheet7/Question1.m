%% PS7B Q1 CH22B020

%% a> linear simultaneous equations (mass-balanced equations)
% 6c1 - c3 = 50
% 3c1 - 3c2 = 0
% -c2 + 9c3 = 160
% c2 + 8c3 - 11c4 + 2c5 = 0
% 3c1 + c2 - 4c5 = 0

%% b> I: Gauss-Jordan Method
A = [6,0,-1,0,0; 3,-3,0,0,0; 0,-1,9,0,0; 0,1,8,-11,2; 3,1,0,0,-4];
B = [50; 0; 160; 0; 0];

% Creating the augmented matrix [A|B]
augmented_matrix = [A, B];

% Applying Gauss-Jordan elimination to get RREF
T = rref(augmented_matrix);
% The values of the coefficients : values 
c1 = T(1,6);
c2 = T(2,6);
c3 = T(3,6);
c4 = T(4,6);
c5 = T(5,6);

disp('Solutions obtained using Gauss-Jordan method :');
disp(['c1 = ' num2str(c1),', c2 = ' num2str(c2), ', c3 = ' num2str(c3), ', c4 = ' num2str(c4), ', c5 = ' num2str(c5)]);

%% b> II: Jacobi-Iterative Method

% Defining the maximum number of iterations and tolerance
max_iterations = 1000;
tolerance = 1e-6;
% Initializing the solution vector xII with zeros
xII = zeros(size(B));

for iter1 = 1:max_iterations
    x_newII = xII;
    
    for i = 1:length(B)
        sum_rowII = (A(i, :) * x_newII) - (A(i, i) * x_newII(i));
        
        % Updating the solution for the current element in the old solution 
        xII(i) = (B(i) - sum_rowII) / A(i, i);
    end
    
    % Checking for convergence
    checkVal2 = 0;
    for i = 1:length(B)
        if(abs(x_newII(i) - xII(i)) < tolerance)
            checkVal2 = checkVal2 + 1;
        end
    end
    if(checkVal2 == length(B))
        break;
    end
end

%% b> II: Gauss-Seidel Method

% Defining the maximum number of iterations and tolerance
max_iterations = 1000;
tolerance = 1e-6;
% Initializing the solution vector xII with zeros
xIII = zeros(size(B));

for iter2 = 1:max_iterations
    x_newIII = xIII;
    
    for i = 1:length(B)
        sum_rowIII = (A(i, :) * xIII) - (A(i, i) * xIII(i));
        
        % Updating the solution for the current element in the NEW solution
        xIII(i) = (B(i) - sum_rowIII) / A(i, i);
    end
    
    % Checking for convergence
    checkVal3 = 0;
    for i = 1:length(B)
        if(abs(x_newIII(i) - xIII(i)) < tolerance)
            checkVal3 = checkVal3 + 1;
        end
    end
    if(checkVal3 == length(B))
        break;
    end
end

%% c>
fprintf("\n");
disp('Solutions obtained using Jacobi-Iterative method :');
disp(['c1 = ' num2str(xII(1)),', c2 = ' num2str(xII(2)), ', c3 = ' num2str(xII(3)), ', c4 = ' num2str(xII(4)), ', c5 = ' num2str(xII(5))]);
disp(['Number of iterations taken = ' num2str(iter1)]);
fprintf("\n");
disp('Solutions obtained using Gauss-Seidel method :');
disp(['c1 = ' num2str(xIII(1)),', c2 = ' num2str(xIII(2)), ', c3 = ' num2str(xIII(3)), ', c4 = ' num2str(xIII(4)), ', c5 = ' num2str(xIII(5))]);
disp(['Number of iterations taken = ' num2str(iter2)]);