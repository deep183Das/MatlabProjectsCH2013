%% Temperature of a well mixed reactor (2_d)

tol = 10^(-4);
del = 0.53;
epsilon = 0.245;
arr = [];

% xl = round(2.4526, 2, "significant");
% xu = round(6.6043, 2, "significant");
%% or can use any values as follows : 
xl = 3;    % as (lowest root < 3)
xu = 6;    % as (6 < biggest root) 

xr = 0;    % initial guess 
ea = 1;    % initial approximated error
iter = 0;  % no. of iterations

while(ea > tol)

    iter = iter+1;
    x = (xl + xu)/2;
    func_val = (x - (del*exp(x/(1 + epsilon*x))))*(xl - ((del*exp(xl/(1 + epsilon*xl)))));

    if func_val < 0
        xu = x;
    elseif func_val > 0
        xl = x;
    else 
        xr = x;
    end

    ea = abs(x - xr);
    xr = x;
    
    % adding the roots into the array
    arr = [arr, xr];

end
roots = [xr];
