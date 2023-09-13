% uses bisection , so f(l)*f(r) < 0

x0 = [-1 2];     % initial interval
func = @cos;    % anonymous function

x = fzero(func, x0);

root = fzero(@f, x0);
function y = f(x)       % defined function
   % y = cos(x);
   % y = x^2;   % doesn't work
   y = x^3;
end

% roots is also an inbuilt function in matlab