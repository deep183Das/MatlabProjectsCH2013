%% ProblemSheet#1a _ qustion 1
%% Defining two variables a & b and assigning them with given values

a = 4.556789;
b = 5.678342;

% defining the varibale sum1
sum1 = a + b;
% defining the varibale difference1
difference1 = a - b;
% defining the varibale product1
product1 = a*b;
% defining the varibale power1
power1 = a^b;


% defining the same type of operations, 
% but now rounding off to 3 significant digits
sum2 = round(sum1, 3, "significant");
difference2 = round(difference1, 3, "significant");
product2 = round(product1, 3, "significant");
power2 = round(power1, 3, "significant");

%% Now trying the given two commands
fprintf('%.3f\n', 1.4986)
% output = 1.499

fprintf('%.2e\n', 1.4986)
% output = 1.50e+00
