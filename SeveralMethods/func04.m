%% difference between element by element operation and operation on whole

A = [1,2,3; 4,5,6; 7,8,9];

% element by element operation 
C = A.^(-1);
% operation as a whole
D = A^(-1);
E = inv(A);
% D and E are identical
