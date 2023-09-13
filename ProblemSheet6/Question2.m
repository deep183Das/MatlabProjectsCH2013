%% ProblemSheet6 q2

%% a>
p = @(x) x^3 - 10*(x^2) + 33*x - 36;
p_coeff = [1 -10 33 -36];
rootsofp = roots(p_coeff);  % all the roots of p = p(x)

%% b> solving using "fzero" for given tolerance values
x0 = 0; % initial guess value
options_fzero = optimset('TolX',1e-2, 'TolFun',1e-2, 'Display', 'iter');
[x1, fval1, exitflag1, output1] = fzero(p, x0, options_fzero);
xfinal1 = x1;
ffinal1 = fval1;
iter1 = output1.iterations;

%% c> solving using "fzero" for given tolerance values
options_fsolve = optimset('TolX',1e-2, 'TolFun',1e-2, 'Display', 'iter');
[x2, fval2, exitflag2, output2] = fsolve(p, x0, options_fsolve);
xfinal2 = x2;
ffinal2 = fval2;
iter2 = output2.iterations;

%% d> using MATLAB's default tolerances
% for "fzero"
[x3, fval3, exitflag3, output3] = fzero(p, x0);
xfinal3 = x3;
ffinal3 = fval3;
iter3 = output3.iterations;
% for "fsolve"
[x4, fval4, exitflag4, output4] = fsolve(p, x0);
xfinal4 = x4;
ffinal4 = fval4;
iter4 = output4.iterations;

% roots values are changing in precision, here using MATLAB's default tolerance, the roots are more precise.
