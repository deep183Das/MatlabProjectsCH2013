%% The Colebrook and White equation : Question 3_b

% Given parameters
friction_factor = 0.0335;
epsilon = 0.5e-3;  % Converting mm to meters
hydraulic_diameter = 0.1;

% Initial guess for Reynolds number
reynolds_initial = 10000;

% Setting options for fsolve
options = optimset('fsolve');
options.Display = 'off';  % Turning off display for fsolve

% Defining the function for fsolve
func = @(reynolds) 1 / sqrt(friction_factor) + 2 * log10(epsilon / (3.71 * hydraulic_diameter) + 2.51 / (reynolds * sqrt(friction_factor)));

% Solving for Reynolds number using fsolve
resol = fsolve(func, reynolds_initial, options);

disp(['Reynolds number corresponding to friction factor ', num2str(friction_factor), ': ', num2str(resol)]);
