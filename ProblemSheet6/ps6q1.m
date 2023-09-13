%% ProblemSheet6 q1

% a>
p1 = @(x) 4*(x^4) + (3.2)*(x^2) - 4;
p2 = @(x) (4.6)*(x^3) - 12*(x^2) + 10;
p3 = @(x) (x-1)*((x-3)^2);      % p3 = x^3 - 7x^2 + 15x - 9

% b> values of p1,p2,p3 at x = 4.5
value1 = p1(4.5);
value2 = p2(4.5);
value3 = p3(4.5);

% c>
p1_coeff = [4 0 3.2 0 -4];
r1 = roots(p1_coeff);   % roots of p1

p2_coeff = [4.6 -12 0 10];
r2 = roots(p2_coeff);   % roots of p2

p3_coeff = [1 -7 15 -9];
r3 = roots(p3_coeff);   % roots of p3