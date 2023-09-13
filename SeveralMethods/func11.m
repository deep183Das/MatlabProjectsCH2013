% "fzero" function uses bisection(two guess values),secant(2 guess values) & inverse quadratic interpolation , so f(l)*f(r) < 0 
% for other l & r values it won't be able to produce answer , besides "fzero" also works with one initial guess value.

x0 = [-1 2];     % initial interval
func = @cos;    % anonymous function
x = fzero(func, x0);

root = fzero(@f, x0);
function y = f(x)       % defined function
   % y = cos(x);
   % y = x^2;   % doesn't work as f(-1)*f(2) > 0
   y = x^3;
end

% "roots" is also an inbuilt function in matlab => r = roots(p) ; where p is the row/column vector of the coefficients of polynomial p
