%% Question 1 

f1 = @(x) x^2;
f2 = @(x) sin(x);
f3 = @(x) exp(x);

num_grid1 = 10;
num_grid2 = 100;

a = 0; % lower limit
b = 1; % upper limit

% calculating grid spacing
h1 = (b - a)/num_grid1;
h2 = (b - a)/num_grid2;

val1 = [0,0,0];
val2 = [0,0,0];

%% performing the integration using Trapezoidal Rule

% for 10 grid points
for i = 1:num_grid1
    x0 = a + (i-1)*h1;
    x1 = a + i*h1;
    val1(1) = val1(1) + ((f1(x0) + f1(x1))/2)*h1;
    val1(2) = val1(2) + ((f2(x0) + f2(x1))/2)*h1;
    val1(3) = val1(3) + ((f3(x0) + f3(x1))/2)*h1;
end

% for 100 grid points
for j = 1:num_grid2
    y0 = a + (j-1)*h2;
    y1 = a + j*h2;
    val2(1) = val2(1) + ((f1(y0) + f1(y1))/2)*h2;
    val2(2) = val2(2) + ((f2(y0) + f2(y1))/2)*h2;
    val2(3) = val2(3) + ((f3(y0) + f3(y1))/2)*h2;
end

%% Analytical integration using inbuilt "int" function & symbolic expression "x"
syms x;
a1 = int(f1(x), 0, 1);
a2 = int(f2(x), 0, 1);
a3 = int(f3(x), 0, 1);

%% Printing Solutions

fprintf('The integral of the functions between %.2f and %.2f using %d grids :\n', a,b,num_grid1);
fprintf('for x^2 -> %.4f\n', val1(1));
fprintf('for sin(x) -> %.4f\n', val1(2));
fprintf('for exp(x) -> %.4f\n', val1(3));

fprintf('\nThe integral of the functions between %.2f and %.2f using %d grids :\n', a,b,num_grid2);
fprintf('for x^2 -> %.4f\n', val2(1));
fprintf('for sin(x) -> %.4f\n', val2(2));
fprintf('for exp(x) -> %.4f\n', val2(3));

fprintf('\nThe analytical integral of the functions between %.2f and %.2f :\n', a,b);
fprintf('for x^2 -> '); a1
fprintf('for sin(x) -> '); a2 
fprintf('for exp(x) -> '); a3

%% While using higher number of grids, it gives more precise solutions.