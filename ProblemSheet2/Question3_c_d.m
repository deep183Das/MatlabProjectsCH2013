%% Question 3_c_d

f_prev = linspace(0.0376, 0.0305, 10);
epsilon = 0.5/1000; % all in meters
Dh = 0.1;

% initial guess value for Re
re_initial = 1000;
% no. of iterations
iter = 0;
max_iteration = 1000;
% tolerance value
tol = 10^-4;
error = 1;

while((error > tol) & (iter < max_iteration))

    iter = iter + 1;
    Re = re_initial;
    re_initial = Re - ((((-2).*log10((epsilon./(3.71.*Dh)) + (2.51./(Re.*sqrt(f_prev))))) - (1./sqrt(f_prev))) ./ (f_prev.*(-1.5)).*(0.5 + (2.51./(Re.*log(10).*((epsilon./(3.71.*Dh)) + (2.51./(Re.*sqrt(f_prev))))))));

    error = abs(re_initial - Re);
end

rearr = re_initial;

%% corresponding plot for friction_factor vs reynold number 
plot(rearr, f_prev, LineStyle="-", Color='r', Marker='o', MarkerFaceColor='b');