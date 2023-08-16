%% Temperature of a well mixed reactor (2_d)

tol = 10^(-4);
del = 0.53;
epsilon = 0.245;
arr = [];
%xl = round(2.4526, 2, "significant");
%xu = round(6.6043, 2, "significant");
xl = 3;
xu = 6;
% as 3 > lowest root , 6 < biggest root 

% initial guess 
xr = 0;
% initial approximated error
ea = 1;
% no. of iterations
iter = 0;

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
    arr = [arr, xr];

end
roots = [xr];