%% Question 2

f1 = @(x) exp(-x);
f2 = @(x) x.^2;

% defining interval and number of grid points
a = 0;
b = 1;
N1 = 11;
N2 = 21;

% calculate the grid spacing 
h1 = (b-a)/(N1-1);
h2 = (b-a)/(N2-1);

% generating discrete data for the functions
x1 = linspace(a,b,N1);
y11 = f1(x1);
y12 = f2(x1);

x2 = linspace(a,b,N2);
y21 = f1(x2);
y22 = f2(x2);

f1_der1 = [0,0,0,0];
f1_der2 = [0,0,0,0];

f2_der1 = [0,0,0,0];
f2_der2 = [0,0,0,0];

% finding the index for the midpoint 0.5
midpoint_index1 = find(x1 == 0.5); 
midpoint_index2 = find(x2 == 0.5);

%% a>  Forward difference of first order accuracy   
f1_der1(1) = (y11(midpoint_index1 + 1) - y11(midpoint_index1)) / (h1);
f1_der2(1) = (y21(midpoint_index2 + 1) - y21(midpoint_index2)) / (h2);

f2_der1(1) = (y12(midpoint_index1 + 1) - y12(midpoint_index1)) / (h1);
f2_der2(1) = (y22(midpoint_index2 + 1) - y22(midpoint_index2)) / (h2);

%% b>  Central difference second order accuracy         
f1_der1(2) = (y11(midpoint_index1 + 1) - y11(midpoint_index1 - 1)) / (2*h1);
f1_der2(2) = (y21(midpoint_index2 + 1) - y21(midpoint_index2 - 1)) / (2*h2);

f2_der1(2) = (y12(midpoint_index1 + 1) - y12(midpoint_index1 - 1)) / (2*h1);
f2_der2(2) = (y22(midpoint_index2 + 1) - y22(midpoint_index2 - 1)) / (2*h2);

%% c>  Forward difference second order accuracy
f1_der1(3) = ((-3)*(y11(midpoint_index1)) + 4*(y11(midpoint_index1 + 1)) - (y11(midpoint_index1 + 2))) / (2*h1);
f1_der2(3) = ((-3)*(y21(midpoint_index2)) + 4*(y21(midpoint_index2 + 1)) - (y21(midpoint_index2 + 2))) / (2*h2);

f2_der1(3) = ((-3)*(y12(midpoint_index1)) + 4*(y12(midpoint_index1 + 1)) - (y12(midpoint_index1 + 2))) / (2*h1);
f2_der2(3) = ((-3)*(y22(midpoint_index2)) + 4*(y22(midpoint_index2 + 1)) - (y22(midpoint_index2 + 2))) / (2*h2);

%% d>  Backward difference second order accuracy
f1_der1(4) = (3*(y11(midpoint_index1)) - 4*(y11(midpoint_index1 - 1)) + (y11(midpoint_index1 - 2))) / (2*h1);
f1_der2(4) = (3*(y21(midpoint_index2)) - 4*(y21(midpoint_index2 - 1)) + (y21(midpoint_index2 - 2))) / (2*h2);

f2_der1(4) = (3*(y12(midpoint_index1)) - 4*(y12(midpoint_index1 - 1)) + (y12(midpoint_index1 - 2))) / (2*h1);
f2_der2(4) = (3*(y22(midpoint_index2)) - 4*(y22(midpoint_index2 - 1)) + (y22(midpoint_index2 - 2))) / (2*h2);
