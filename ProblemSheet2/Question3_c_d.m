%% The Colebrook and White equation : Question 3_c_d

f_prev = linspace(0.0376, 0.0305, 10);
% all in meters
epsilon = 0.5/1000; 
Dh = 0.1;

re_initial = 1000;    % initial guess value for Re
iter = 0;    % no. of iterations
max_iteration = 1000; 
tol = 10^-4;    % tolerance value
error = 1;

while((error > tol) & (iter < max_iteration))

    iter = iter + 1;
    Re = re_initial;
    % using Newton-Raphson formula here
    re_initial = Re - ((((-2).*log10((epsilon./(3.71.*Dh)) + (2.51./(Re.*sqrt(f_prev))))) - (1./sqrt(f_prev))) ./ (f_prev.*(-1.5)).*(0.5 + (2.51./(Re.*log(10).*((epsilon./(3.71.*Dh)) + (2.51./(Re.*sqrt(f_prev))))))));

    error = abs(re_initial - Re);
end

rearr = re_initial;


%% corresponding plot for friction_factor vs reynold number 
plot(rearr, f_prev, LineStyle="-", Color='r', Marker='o', MarkerFaceColor='b');
