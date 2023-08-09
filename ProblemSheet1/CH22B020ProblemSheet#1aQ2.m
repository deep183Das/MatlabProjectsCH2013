%% ProblemSheet#1a _ qustion 2
%% a>
% "a" is a column vector
a = [1; 4.5; 9.6];

%% b>
% "b" is  a row vector
b = [1.6, 8, 7.3];

%% c>
% a column vector "c" using ":"
c_initial = [1:5];
c = transpose(c_initial);

%% d>
d = transpose(a) + a;

%% e>
e = a(2);

%% f>
f = a(3) + b(2);

%% g>
% defining a matrix
G = [7, 2, -3; 2, 5, -3; 1, -1, 6];


%% h>
H = inv(G);

%% i>
z = [-12; -20; -26];
x = (inv(G))*z;

%% j>
P = [2, 5, -3; 2, 5, -3; 1, -1, 6];
Inv_P = inv(P);
% Warning message : "Matrix is singular to working precision."
% The determinant of matrix P is zero, so it's inverse doesn't exist.

%% k>
Q = G.*P;
R = G*P;
% no, usually these two operations yield different answers
% here also, Q and R are different matrixes

%% l>
% S is a 4x4 identity matrix
S = eye(4);

%% m>
t = diag(S);

%% n>
% 3rd column of matrix P is the column vactor u
u = P(:,3);